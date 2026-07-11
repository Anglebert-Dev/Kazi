import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'admin_startup_providers.dart';

part 'admin_startup_controller.g.dart';

@riverpod
class AdminStartupController extends _$AdminStartupController {
  @override
  FutureOr<void> build() {}

  Future<void> approve(String founderId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(adminStartupRepositoryProvider).approve(founderId),
    );
  }

  Future<void> reject(String founderId, String reason) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(adminStartupRepositoryProvider).reject(founderId, reason),
    );
  }
}
