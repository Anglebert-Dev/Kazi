import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/chat_message.dart';
import '../models/conversation.dart';
import '../repository/chat_repository.dart';

part 'chat_providers.g.dart';

@riverpod
ChatRepository chatRepository(Ref ref) {
  return ChatRepository(FirebaseFirestore.instance);
}

@riverpod
Stream<List<Conversation>> conversations(Ref ref, String uid) {
  return ref.watch(chatRepositoryProvider).watchConversations(uid);
}

@riverpod
Stream<Conversation?> conversationById(Ref ref, String conversationId) {
  return ref.watch(chatRepositoryProvider).watchConversationById(conversationId);
}

@riverpod
Stream<List<ChatMessage>> messages(Ref ref, String conversationId) {
  return ref.watch(chatRepositoryProvider).watchMessages(conversationId);
}
