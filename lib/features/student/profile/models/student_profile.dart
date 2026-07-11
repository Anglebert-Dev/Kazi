import 'package:freezed_annotation/freezed_annotation.dart';

import 'availability_status.dart';

part 'student_profile.freezed.dart';

@freezed
class StudentProfile with _$StudentProfile {
  const factory StudentProfile({
    String? photoUrl,
    String? bio,
    String? degree,
    int? graduationYear,
    @Default(<String>[]) List<String> skills,
    @Default(<String>[]) List<String> interests,
    String? portfolioUrl,
    String? githubUrl,
    String? linkedinUrl,
    String? cvUrl,
    @Default(AvailabilityStatus.available) AvailabilityStatus availability,
  }) = _StudentProfile;
}
