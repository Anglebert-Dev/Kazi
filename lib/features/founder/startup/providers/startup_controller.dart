import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/startup.dart';
import 'startup_providers.dart';

part 'startup_controller.g.dart';

@riverpod
class StartupController extends _$StartupController {
  @override
  FutureOr<void> build() {}

  Future<void> save(Startup startup) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(startupRepositoryProvider).saveStartup(startup),
    );
  }

  Future<String?> uploadLogo(String filePath) async {
    state = const AsyncLoading();
    String? url;
    state = await AsyncValue.guard(() async {
      url = await ref.read(startupRepositoryProvider).uploadLogo(filePath);
    });
    return url;
  }

  Future<String?> uploadVerificationDocument(
    String founderId,
    String categoryId,
    String filePath,
  ) async {
    state = const AsyncLoading();
    String? url;
    state = await AsyncValue.guard(() async {
      url = await ref
          .read(startupRepositoryProvider)
          .uploadVerificationDocument(founderId, categoryId, filePath);
    });
    return url;
  }

  Future<void> submitForReview(String founderId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(startupRepositoryProvider).submitForReview(founderId),
    );
  }
}
