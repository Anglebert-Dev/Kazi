enum NotificationType { newApplicant, applicationStatusChanged, newMessage, verificationResult }

extension NotificationTypeLabel on NotificationType {
  String get label => switch (this) {
    NotificationType.newApplicant => 'New applicant',
    NotificationType.applicationStatusChanged => 'Application update',
    NotificationType.newMessage => 'New message',
    NotificationType.verificationResult => 'Verification result',
  };
}
