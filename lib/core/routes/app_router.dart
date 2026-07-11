import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/authentication/providers/auth_providers.dart';
import '../../features/authentication/screens/forgot_password_screen.dart';
import '../../features/authentication/screens/login_screen.dart';
import '../../features/authentication/screens/register_screen.dart';
import '../../features/onboarding/screens/onboarding_role_screen.dart';
import '../../features/shared/splash_screen.dart';
import 'auth_redirect.dart';
import 'founder_shell_route.dart';
import 'student_shell_route.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateChangesProvider);
  final userModelState = ref.watch(currentUserModelProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) => computeAuthRedirect(
      authState: authState,
      userModelState: userModelState,
      matchedLocation: state.matchedLocation,
    ),
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(path: '/register', builder: (context, state) => const RegisterScreen()),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingRoleScreen(),
      ),
      studentShellRoute,
      founderShellRoute,
    ],
  );
});
