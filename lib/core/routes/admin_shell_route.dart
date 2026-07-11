import 'package:go_router/go_router.dart';

import '../../features/admin/admin_shell_screen.dart';
import '../../features/admin/categories/screens/admin_categories_screen.dart';
import '../../features/admin/dashboard/screens/admin_dashboard_screen.dart';
import '../../features/admin/opportunities/screens/admin_opportunities_screen.dart';
import '../../features/admin/startups/screens/admin_startups_screen.dart';
import '../../features/admin/users/screens/admin_users_screen.dart';

final adminShellRoute = StatefulShellRoute.indexedStack(
  builder: (context, state, navigationShell) =>
      AdminShellScreen(navigationShell: navigationShell),
  branches: [
    StatefulShellBranch(
      routes: [
        GoRoute(path: '/admin/dashboard', builder: (c, s) => const AdminDashboardScreen()),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(path: '/admin/startups', builder: (c, s) => const AdminStartupsScreen()),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: '/admin/opportunities',
          builder: (c, s) => const AdminOpportunitiesScreen(),
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(path: '/admin/users', builder: (c, s) => const AdminUsersScreen()),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(path: '/admin/categories', builder: (c, s) => const AdminCategoriesScreen()),
      ],
    ),
  ],
);
