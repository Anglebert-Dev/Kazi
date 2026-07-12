import 'package:freezed_annotation/freezed_annotation.dart';

import 'application_status.dart';

part 'application.freezed.dart';

@freezed
class Application with _$Application {
  const factory Application({
    required String id,
    required String opportunityId,
    required String opportunityTitle,
    required String startupId,
    required String startupName,
    String? startupLogoUrl,
    required String studentId,
    required String studentName,
    String? studentPhotoUrl,
    required String coverNote,
    required String cvUrl,
    String? portfolioLink,
    @Default(ApplicationStatus.applied) ApplicationStatus status,
    required DateTime createdAt,
  }) = _Application;
}
