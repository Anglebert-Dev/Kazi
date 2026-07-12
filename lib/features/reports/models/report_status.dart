enum ReportStatus { pending, resolved, dismissed }

extension ReportStatusLabel on ReportStatus {
  String get label => switch (this) {
    ReportStatus.pending => 'Pending',
    ReportStatus.resolved => 'Resolved',
    ReportStatus.dismissed => 'Dismissed',
  };
}
