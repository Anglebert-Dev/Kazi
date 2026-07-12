import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../authentication/providers/auth_providers.dart';
import '../models/rating.dart';
import 'rating_providers.dart';

part 'rating_controller.g.dart';

@riverpod
class RatingController extends _$RatingController {
  @override
  FutureOr<void> build() {}

  Future<void> rate({required String startupId, required int score, String? comment}) async {
    final userModel = ref.read(currentUserModelProvider).valueOrNull;
    if (userModel == null) return;

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final rating = Rating(
        id: '',
        startupId: startupId,
        studentId: userModel.uid,
        studentName: userModel.displayName ?? 'Student',
        score: score,
        comment: comment,
        createdAt: DateTime.now(),
      );
      await ref.read(ratingRepositoryProvider).create(rating);
    });
  }
}
