import 'package:flutter/foundation.dart';
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
  final refresh = ValueNotifier<int>(0);
  ref.onDispose(refresh.dispose);

  // Only re-run redirect() on auth/role changes — must not ref.watch() these,
  // or any users/{uid} write (e.g. saving the profile form) would rebuild a
  // brand-new GoRouter and reset navigation back to initialLocation.
  ref.listen(authStateChangesProvider, (_, _) => refresh.value++);
  ref.listen(currentUserModelProvider, (_, _) => refresh.value++);

  return GoRouter(
    initialLocation: '/',
    refreshListenable: refresh,
    redirect: (context, state) => computeAuthRedirect(
      authState: ref.read(authStateChangesProvider),
      userModelState: ref.read(currentUserModelProvider),
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
