import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../authentication/models/user_role.dart';
import '../../../authentication/models/user_status.dart';
import '../../../authentication/providers/auth_providers.dart';

part 'admin_user_controller.g.dart';

@riverpod
class AdminUserController extends _$AdminUserController {
  @override
  FutureOr<void> build() {}

  Future<void> changeRole(String uid, UserRole role) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).updateUserRole(uid, role),
    );
  }

  Future<void> changeStatus(String uid, UserStatus status) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).updateUserStatus(uid, status),
    );
  }
}
