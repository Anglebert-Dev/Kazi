import 'package:go_router/go_router.dart';

import '../../features/founder/applicants/screens/founder_applicants_screen.dart';
import '../../features/founder/chat/screens/founder_messages_screen.dart';
import '../../features/founder/dashboard/screens/founder_dashboard_screen.dart';
import '../../features/founder/founder_shell_screen.dart';
import '../../features/founder/opportunities/screens/founder_opportunities_screen.dart';
import '../../features/founder/startup/screens/founder_startup_screen.dart';

final founderShellRoute = StatefulShellRoute.indexedStack(
  builder: (context, state, navigationShell) =>
      FounderShellScreen(navigationShell: navigationShell),
  branches: [
    StatefulShellBranch(
      routes: [
        GoRoute(path: '/founder/dashboard', builder: (c, s) => const FounderDashboardScreen()),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: '/founder/opportunities',
          builder: (c, s) => const FounderOpportunitiesScreen(),
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(path: '/founder/applicants', builder: (c, s) => const FounderApplicantsScreen()),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(path: '/founder/messages', builder: (c, s) => const FounderMessagesScreen()),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(path: '/founder/startup', builder: (c, s) => const FounderStartupScreen()),
      ],
    ),
  ],
);
