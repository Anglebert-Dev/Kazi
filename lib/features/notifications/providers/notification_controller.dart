import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'notification_providers.dart';

part 'notification_controller.g.dart';

@riverpod
class NotificationController extends _$NotificationController {
  @override
  FutureOr<void> build() {}

  Future<void> markAsRead(String notificationId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(notificationRepositoryProvider).markAsRead(notificationId),
    );
  }
}
