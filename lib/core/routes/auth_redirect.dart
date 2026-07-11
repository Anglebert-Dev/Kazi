import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/authentication/models/user_model.dart';
import '../../features/authentication/models/user_role.dart';
import '../../features/authentication/models/user_status.dart';

const authRoutes = {'/login', '/register', '/forgot-password'};
const onboardingRoute = '/onboarding';
const suspendedRoute = '/suspended';

String _homeLocationFor(UserRole? role) {
  return switch (role) {
    UserRole.founder => '/founder/dashboard',
    UserRole.admin => '/admin/dashboard',
    _ => '/student/home',
  };
}

String? computeAuthRedirect({
  required AsyncValue<User?> authState,
  required AsyncValue<UserModel?> userModelState,
  required String matchedLocation,
}) {
  if (authState.isLoading) return null;

  final isLoggedIn = authState.valueOrNull != null;
  final isAuthRoute = authRoutes.contains(matchedLocation);

  if (!isLoggedIn) {
    return isAuthRoute ? null : '/login';
  }

  if (userModelState.isLoading) return null;

  final userModel = userModelState.valueOrNull;
  final role = userModel?.role;
  final isOnboarding = matchedLocation == onboardingRoute;
  final isSuspended = matchedLocation == suspendedRoute;

  if (userModel?.status == UserStatus.suspended) {
    return isSuspended ? null : suspendedRoute;
  }
  if (isSuspended) {
    return role == null ? onboardingRoute : _homeLocationFor(role);
  }

  if (isAuthRoute) {
    return role == null ? onboardingRoute : _homeLocationFor(role);
  }

  if (role == null) {
    return isOnboarding ? null : onboardingRoute;
  }

  if (isOnboarding) return _homeLocationFor(role);

  final isStudentRoute = matchedLocation.startsWith('/student');
  final isFounderRoute = matchedLocation.startsWith('/founder');
  final isAdminRoute = matchedLocation.startsWith('/admin');

  if (role != UserRole.student && isStudentRoute) return _homeLocationFor(role);
  if (role != UserRole.founder && isFounderRoute) return _homeLocationFor(role);
  if (role != UserRole.admin && isAdminRoute) return _homeLocationFor(role);
  if (matchedLocation == '/') return _homeLocationFor(role);

  return null;
}
