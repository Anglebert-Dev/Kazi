import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/authentication/models/user_model.dart';
import '../../features/authentication/models/user_role.dart';

const authRoutes = {'/login', '/register', '/forgot-password'};
const onboardingRoute = '/onboarding';

String _homeLocationFor(UserRole? role) {
  return role == UserRole.founder ? '/founder/dashboard' : '/student/home';
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

  final role = userModelState.valueOrNull?.role;
  final isOnboarding = matchedLocation == onboardingRoute;

  if (isAuthRoute) {
    return role == null ? onboardingRoute : _homeLocationFor(role);
  }

  if (role == null) {
    return isOnboarding ? null : onboardingRoute;
  }

  if (isOnboarding) return _homeLocationFor(role);

  final isStudentRoute = matchedLocation.startsWith('/student');
  final isFounderRoute = matchedLocation.startsWith('/founder');

  if (role == UserRole.student && isFounderRoute) return _homeLocationFor(role);
  if (role == UserRole.founder && isStudentRoute) return _homeLocationFor(role);
  if (matchedLocation == '/') return _homeLocationFor(role);

  return null;
}
