enum VerificationStatus { unverified, pending, approved, rejected }

extension VerificationStatusLabel on VerificationStatus {
  String get label => switch (this) {
    VerificationStatus.unverified => 'Not submitted',
    VerificationStatus.pending => 'Pending review',
    VerificationStatus.approved => 'Verified',
    VerificationStatus.rejected => 'Rejected',
  };
}
