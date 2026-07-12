import 'package:cloud_firestore/cloud_firestore.dart';

import 'chat_message.dart';

ChatMessage chatMessageFromFirestore(String id, Map<String, dynamic> data) {
  return ChatMessage(
    id: id,
    senderId: data['senderId'] as String? ?? '',
    text: data['text'] as String? ?? '',
    createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
  );
}

Map<String, dynamic> chatMessageToMap(String senderId, String text) {
  return {'senderId': senderId, 'text': text, 'createdAt': FieldValue.serverTimestamp()};
}
