import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../authentication/providers/auth_providers.dart';
import '../models/student_profile.dart';
import 'student_profile_providers.dart';

part 'student_profile_controller.g.dart';

@riverpod
class StudentProfileController extends _$StudentProfileController {
  @override
  FutureOr<void> build() {}

  Future<void> save(StudentProfile profile) async {
    final uid = ref.read(authRepositoryProvider).currentUserId;
    if (uid == null) return;

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(studentProfileRepositoryProvider).saveProfile(uid, profile),
    );
  }

  Future<String?> uploadAvatar(String filePath) async {
    state = const AsyncLoading();
    String? url;
    state = await AsyncValue.guard(() async {
      url = await ref.read(studentProfileRepositoryProvider).uploadAvatar(filePath);
    });
    return url;
  }

  Future<String?> uploadCv(String filePath) async {
    state = const AsyncLoading();
    String? url;
    state = await AsyncValue.guard(() async {
      url = await ref.read(studentProfileRepositoryProvider).uploadCv(filePath);
    });
    return url;
  }
}
