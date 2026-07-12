import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating.freezed.dart';

@freezed
class Rating with _$Rating {
  const factory Rating({
    required String id,
    required String startupId,
    required String studentId,
    required String studentName,
    required int score,
    String? comment,
    required DateTime createdAt,
  }) = _Rating;
}
