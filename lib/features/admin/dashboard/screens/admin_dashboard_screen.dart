import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../settings/screens/settings_screen.dart';
import '../providers/dashboard_providers.dart';
import '../widgets/stat_card.dart';

class AdminDashboardScreen extends ConsumerWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(dashboardStatsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => const SettingsScreen())),
          ),
        ],
      ),
      body: statsAsync.when(
        data: (stats) => RefreshIndicator(
          onRefresh: () => ref.refresh(dashboardStatsProvider.future),
          child: GridView.count(
            padding: const EdgeInsets.all(AppSpacing.lg),
            crossAxisCount: 2,
            mainAxisSpacing: AppSpacing.md,
            crossAxisSpacing: AppSpacing.md,
            childAspectRatio: 1.3,
            children: [
              StatCard(icon: Icons.school_outlined, label: 'Students', value: stats.studentCount),
              StatCard(
                icon: Icons.rocket_launch_outlined,
                label: 'Founders',
                value: stats.founderCount,
              ),
              StatCard(
                icon: Icons.storefront_outlined,
                label: 'Startups',
                value: stats.totalStartupCount,
              ),
              StatCard(
                icon: Icons.hourglass_top,
                label: 'Pending Verification',
                value: stats.pendingVerificationCount,
              ),
              StatCard(
                icon: Icons.verified_outlined,
                label: 'Verified Startups',
                value: stats.approvedStartupCount,
              ),
              StatCard(
                icon: Icons.cancel_outlined,
                label: 'Rejected Startups',
                value: stats.rejectedStartupCount,
              ),
              StatCard(
                icon: Icons.work_outline,
                label: 'Opportunities',
                value: stats.opportunityCount,
              ),
              StatCard(
                icon: Icons.assignment_outlined,
                label: 'Applications',
                value: stats.applicationCount,
              ),
              StatCard(
                icon: Icons.flag_outlined,
                label: 'Pending Reports',
                value: stats.pendingReportCount,
              ),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Could not load stats: $error')),
      ),
    );
  }
}
