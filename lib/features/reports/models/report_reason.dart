enum ReportReason { spam, fakeStartup, abuse, other }

extension ReportReasonLabel on ReportReason {
  String get label => switch (this) {
    ReportReason.spam => 'Spam',
    ReportReason.fakeStartup => 'Fake startup',
    ReportReason.abuse => 'Abuse',
    ReportReason.other => 'Other',
  };
}
