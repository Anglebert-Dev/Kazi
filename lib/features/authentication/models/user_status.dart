enum UserStatus { active, suspended }

extension UserStatusLabel on UserStatus {
  String get label => switch (this) {
    UserStatus.active => 'Active',
    UserStatus.suspended => 'Suspended',
  };
}
