import 'package:go_router/go_router.dart';

import '../../features/student/applications/screens/student_applications_screen.dart';
import '../../features/student/chat/screens/student_messages_screen.dart';
import '../../features/student/home/screens/student_home_screen.dart';
import '../../features/student/profile/screens/student_profile_screen.dart';
import '../../features/student/search/screens/student_search_screen.dart';
import '../../features/student/student_shell_screen.dart';

final studentShellRoute = StatefulShellRoute.indexedStack(
  builder: (context, state, navigationShell) =>
      StudentShellScreen(navigationShell: navigationShell),
  branches: [
    StatefulShellBranch(
      routes: [GoRoute(path: '/student/home', builder: (c, s) => const StudentHomeScreen())],
    ),
    StatefulShellBranch(
      routes: [GoRoute(path: '/student/search', builder: (c, s) => const StudentSearchScreen())],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: '/student/applications',
          builder: (c, s) => const StudentApplicationsScreen(),
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(path: '/student/messages', builder: (c, s) => const StudentMessagesScreen()),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(path: '/student/profile', builder: (c, s) => const StudentProfileScreen()),
      ],
    ),
  ],
);
