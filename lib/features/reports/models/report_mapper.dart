import 'package:cloud_firestore/cloud_firestore.dart';

import 'report.dart';
import 'report_reason.dart';
import 'report_status.dart';

Report reportFromFirestore(String id, Map<String, dynamic> data) {
  return Report(
    id: id,
    reporterId: data['reporterId'] as String? ?? '',
    startupId: data['startupId'] as String? ?? '',
    startupName: data['startupName'] as String? ?? '',
    reason: ReportReason.values.byName(data['reason'] as String? ?? 'other'),
    details: data['details'] as String?,
    status: ReportStatus.values.byName(data['status'] as String? ?? 'pending'),
    createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
  );
}

Map<String, dynamic> reportToMap(Report report) {
  return {
    'reporterId': report.reporterId,
    'startupId': report.startupId,
    'startupName': report.startupName,
    'reason': report.reason.name,
    'details': report.details,
    'status': report.status.name,
    'createdAt': FieldValue.serverTimestamp(),
  };
}
