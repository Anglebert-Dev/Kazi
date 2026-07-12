import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/widgets/index.dart';

class AdminShellScreen extends StatelessWidget {
  const AdminShellScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  static const _items = [
    AppBottomNavItem(icon: Icons.dashboard_outlined, label: 'Dashboard'),
    AppBottomNavItem(icon: Icons.verified_user_outlined, label: 'Startups'),
    AppBottomNavItem(icon: Icons.work_outline, label: 'Opportunities'),
    AppBottomNavItem(icon: Icons.people_outline, label: 'Users'),
    AppBottomNavItem(icon: Icons.category_outlined, label: 'Categories'),
    AppBottomNavItem(icon: Icons.flag_outlined, label: 'Reports'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: AppBottomNav(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) =>
            navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex),
        items: _items,
      ),
    );
  }
}
