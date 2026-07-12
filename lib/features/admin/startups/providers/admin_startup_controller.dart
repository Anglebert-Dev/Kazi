import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../notifications/models/notification_type.dart';
import '../../../notifications/providers/notification_providers.dart';
import 'admin_startup_providers.dart';

part 'admin_startup_controller.g.dart';

@riverpod
class AdminStartupController extends _$AdminStartupController {
  @override
  FutureOr<void> build() {}

  Future<void> approve(String founderId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(adminStartupRepositoryProvider).approve(founderId);
      await ref
          .read(notificationRepositoryProvider)
          .send(
            userId: founderId,
            type: NotificationType.verificationResult,
            message: 'Your startup has been verified',
          );
    });
  }

  Future<void> reject(String founderId, String reason) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(adminStartupRepositoryProvider).reject(founderId, reason);
      await ref
          .read(notificationRepositoryProvider)
          .send(
            userId: founderId,
            type: NotificationType.verificationResult,
            message: 'Your startup verification was rejected: $reason',
          );
    });
  }
}
