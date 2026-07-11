import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../authentication/providers/auth_providers.dart';

part 'settings_controller.g.dart';

@riverpod
class SettingsController extends _$SettingsController {
  @override
  FutureOr<void> build() {}

  Future<void> updateName(String name) async {
    final uid = ref.read(authRepositoryProvider).currentUserId;
    if (uid == null) return;

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).updateDisplayName(uid, name),
    );
  }

  Future<void> updatePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref
          .read(authRepositoryProvider)
          .updatePassword(currentPassword: currentPassword, newPassword: newPassword),
    );
  }
}
