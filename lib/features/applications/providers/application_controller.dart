import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../authentication/providers/auth_providers.dart';
import '../../notifications/models/notification_type.dart';
import '../../notifications/providers/notification_providers.dart';
import '../../opportunities/models/opportunity.dart';
import '../../student/profile/providers/student_profile_providers.dart';
import '../models/application.dart';
import '../models/application_status.dart';
import 'application_providers.dart';

part 'application_controller.g.dart';

@riverpod
class ApplicationController extends _$ApplicationController {
  @override
  FutureOr<void> build() {}

  Future<void> apply({
    required Opportunity opportunity,
    required String coverNote,
    required String cvUrl,
    String? portfolioLink,
  }) async {
    final userModel = ref.read(currentUserModelProvider).valueOrNull;
    if (userModel == null) return;

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final application = Application(
        id: '',
        opportunityId: opportunity.id,
        opportunityTitle: opportunity.title,
        startupId: opportunity.startupId,
        startupName: opportunity.startupName,
        startupLogoUrl: opportunity.startupLogoUrl,
        studentId: userModel.uid,
        studentName: userModel.displayName ?? 'Student',
        studentPhotoUrl: ref.read(currentStudentProfileProvider).valueOrNull?.photoUrl,
        coverNote: coverNote,
        cvUrl: cvUrl,
        portfolioLink: portfolioLink,
        createdAt: DateTime.now(),
      );

      await ref.read(applicationRepositoryProvider).create(application);
      await ref
          .read(notificationRepositoryProvider)
          .send(
            userId: opportunity.startupId,
            type: NotificationType.newApplicant,
            message: 'New applicant for ${opportunity.title}',
            relatedId: '${userModel.uid}_${opportunity.id}',
          );
    });
  }

  Future<void> updateStatus(Application application, ApplicationStatus status) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(applicationRepositoryProvider).updateStatus(application.id, status);
      await ref
          .read(notificationRepositoryProvider)
          .send(
            userId: application.studentId,
            type: NotificationType.applicationStatusChanged,
            message: 'Your application for ${application.opportunityTitle} is now ${status.label}',
            relatedId: application.id,
          );
    });
  }
}
