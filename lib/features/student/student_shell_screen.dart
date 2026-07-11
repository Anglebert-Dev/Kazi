import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/widgets/index.dart';

class StudentShellScreen extends StatelessWidget {
  const StudentShellScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  static const _items = [
    AppBottomNavItem(icon: Icons.home_outlined, label: 'Home'),
    AppBottomNavItem(icon: Icons.search, label: 'Search'),
    AppBottomNavItem(icon: Icons.assignment_outlined, label: 'Applications'),
    AppBottomNavItem(icon: Icons.chat_bubble_outline, label: 'Messages'),
    AppBottomNavItem(icon: Icons.person_outline, label: 'Profile'),
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
