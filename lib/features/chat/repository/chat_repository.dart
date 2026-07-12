import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/chat_message.dart';
import '../models/chat_message_mapper.dart';
import '../models/conversation.dart';
import '../models/conversation_mapper.dart';

class ChatRepository {
  ChatRepository(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _collection => _firestore.collection('messages');

  String _docId(String studentId, String founderId) => '${studentId}_$founderId';

  Stream<List<Conversation>> watchConversations(String uid) {
    return _collection.where('participantIds', arrayContains: uid).snapshots().map((snapshot) {
      final conversations = [
        for (final doc in snapshot.docs) conversationFromFirestore(doc.id, doc.data()),
      ];
      conversations.sort((a, b) => b.lastMessageAt.compareTo(a.lastMessageAt));
      return conversations;
    });
  }

  Stream<Conversation?> watchConversationById(String conversationId) {
    return _collection.doc(conversationId).snapshots().map((doc) {
      final data = doc.data();
      if (data == null) return null;
      return conversationFromFirestore(doc.id, data);
    });
  }

  Stream<List<ChatMessage>> watchMessages(String conversationId) {
    return _collection
        .doc(conversationId)
        .collection('thread')
        .orderBy('createdAt')
        .snapshots()
        .map(
          (snapshot) => [
            for (final doc in snapshot.docs) chatMessageFromFirestore(doc.id, doc.data()),
          ],
        );
  }

  Future<String> startConversation({
    required String studentId,
    required String studentName,
    String? studentPhotoUrl,
    required String founderId,
    required String founderName,
    String? founderPhotoUrl,
    String? opportunityId,
    String? opportunityTitle,
  }) async {
    final conversationId = _docId(studentId, founderId);

    await _collection.doc(conversationId).set({
      'participantIds': [studentId, founderId],
      'participantNames': {studentId: studentName, founderId: founderName},
      'participantPhotoUrls': {
        studentId: studentPhotoUrl ?? '',
        founderId: founderPhotoUrl ?? '',
      },
      'opportunityId': opportunityId,
      'opportunityTitle': opportunityTitle,
      'createdAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));

    return conversationId;
  }

  Future<void> sendMessage(String conversationId, String senderId, String text) {
    final conversationRef = _collection.doc(conversationId);
    final messageRef = conversationRef.collection('thread').doc();

    final batch = _firestore.batch();
    batch.set(messageRef, chatMessageToMap(senderId, text));
    batch.update(conversationRef, {
      'lastMessage': text,
      'lastMessageAt': FieldValue.serverTimestamp(),
      'lastSenderId': senderId,
    });

    return batch.commit();
  }
}
