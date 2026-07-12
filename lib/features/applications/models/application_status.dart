enum ApplicationStatus { applied, underReview, interview, accepted, rejected }

extension ApplicationStatusLabel on ApplicationStatus {
  String get label => switch (this) {
    ApplicationStatus.applied => 'Applied',
    ApplicationStatus.underReview => 'Under Review',
    ApplicationStatus.interview => 'Interview',
    ApplicationStatus.accepted => 'Accepted',
    ApplicationStatus.rejected => 'Rejected',
  };
}
