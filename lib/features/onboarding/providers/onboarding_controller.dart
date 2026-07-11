import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../authentication/models/user_role.dart';
import '../../authentication/providers/auth_providers.dart';

part 'onboarding_controller.g.dart';

@riverpod
class OnboardingController extends _$OnboardingController {
  @override
  FutureOr<void> build() {}

  Future<void> selectRole(UserRole role) async {
    final uid = ref.read(authRepositoryProvider).currentUserId;
    if (uid == null) return;

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).updateUserRole(uid, role),
    );
  }
}
