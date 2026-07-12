import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../authentication/providers/auth_providers.dart';
import '../models/report.dart';
import '../models/report_reason.dart';
import '../models/report_status.dart';
import 'report_providers.dart';

part 'report_controller.g.dart';

@riverpod
class ReportController extends _$ReportController {
  @override
  FutureOr<void> build() {}

  Future<void> submit({
    required String startupId,
    required String startupName,
    required ReportReason reason,
    String? details,
  }) async {
    final uid = ref.read(authRepositoryProvider).currentUserId;
    if (uid == null) return;

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final report = Report(
        id: '',
        reporterId: uid,
        startupId: startupId,
        startupName: startupName,
        reason: reason,
        details: details,
        createdAt: DateTime.now(),
      );
      await ref.read(reportRepositoryProvider).create(report);
    });
  }

  Future<void> resolve(String reportId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(reportRepositoryProvider).updateStatus(reportId, ReportStatus.resolved),
    );
  }

  Future<void> dismiss(String reportId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(reportRepositoryProvider).updateStatus(reportId, ReportStatus.dismissed),
    );
  }
}
