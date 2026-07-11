import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/widgets/index.dart';

class FounderShellScreen extends StatelessWidget {
  const FounderShellScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  static const _items = [
    AppBottomNavItem(icon: Icons.dashboard_outlined, label: 'Dashboard'),
    AppBottomNavItem(icon: Icons.work_outline, label: 'Opportunities'),
    AppBottomNavItem(icon: Icons.people_outline, label: 'Applicants'),
    AppBottomNavItem(icon: Icons.chat_bubble_outline, label: 'Messages'),
    AppBottomNavItem(icon: Icons.storefront_outlined, label: 'Startup'),
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
