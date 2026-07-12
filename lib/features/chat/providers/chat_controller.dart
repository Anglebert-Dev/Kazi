import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../notifications/providers/notification_providers.dart';
import 'chat_providers.dart';

part 'chat_controller.g.dart';

@riverpod
class ChatController extends _$ChatController {
  @override
  FutureOr<void> build() {}

  Future<String> startConversation({
    required String studentId,
    required String studentName,
    String? studentPhotoUrl,
    required String founderId,
    required String founderName,
    String? founderPhotoUrl,
    String? opportunityId,
    String? opportunityTitle,
  }) {
    return ref
        .read(chatRepositoryProvider)
        .startConversation(
          studentId: studentId,
          studentName: studentName,
          studentPhotoUrl: studentPhotoUrl,
          founderId: founderId,
          founderName: founderName,
          founderPhotoUrl: founderPhotoUrl,
          opportunityId: opportunityId,
          opportunityTitle: opportunityTitle,
        );
  }

  Future<void> send({
    required String conversationId,
    required String senderId,
    required String recipientId,
    required String text,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(chatRepositoryProvider).sendMessage(conversationId, senderId, text);
      await ref
          .read(notificationRepositoryProvider)
          .send(userId: recipientId, message: 'New message: $text');
    });
  }
}
