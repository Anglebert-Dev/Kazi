import 'package:cloud_firestore/cloud_firestore.dart';

import 'conversation.dart';

Conversation conversationFromFirestore(String id, Map<String, dynamic> data) {
  return Conversation(
    id: id,
    participantIds: List<String>.from(data['participantIds'] as List? ?? const []),
    participantNames: Map<String, String>.from(data['participantNames'] as Map? ?? const {}),
    participantPhotoUrls: Map<String, String>.from(
      data['participantPhotoUrls'] as Map? ?? const {},
    ),
    opportunityId: data['opportunityId'] as String?,
    opportunityTitle: data['opportunityTitle'] as String?,
    lastMessage: data['lastMessage'] as String? ?? '',
    lastMessageAt: (data['lastMessageAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    lastSenderId: data['lastSenderId'] as String?,
    createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
  );
}

Map<String, dynamic> conversationToMap(Conversation conversation) {
  return {
    'participantIds': conversation.participantIds,
    'participantNames': conversation.participantNames,
    'participantPhotoUrls': conversation.participantPhotoUrls,
    'opportunityId': conversation.opportunityId,
    'opportunityTitle': conversation.opportunityTitle,
    'lastMessage': conversation.lastMessage,
    'lastMessageAt': FieldValue.serverTimestamp(),
    'lastSenderId': conversation.lastSenderId,
    'createdAt': FieldValue.serverTimestamp(),
  };
}
