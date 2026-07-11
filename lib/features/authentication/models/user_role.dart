enum UserRole { student, founder, admin }

extension UserRoleLabel on UserRole {
  String get label => switch (this) {
    UserRole.student => 'Student',
    UserRole.founder => 'Founder',
    UserRole.admin => 'Admin',
  };
}
