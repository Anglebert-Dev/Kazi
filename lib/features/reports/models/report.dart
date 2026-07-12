import 'package:freezed_annotation/freezed_annotation.dart';

import 'report_reason.dart';
import 'report_status.dart';

part 'report.freezed.dart';

@freezed
class Report with _$Report {
  const factory Report({
    required String id,
    required String reporterId,
    required String startupId,
    required String startupName,
    required ReportReason reason,
    String? details,
    @Default(ReportStatus.pending) ReportStatus status,
    required DateTime createdAt,
  }) = _Report;
}
