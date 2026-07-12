import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/index.dart';
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
          child: ListView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: [
              const SectionHeader(title: 'Needs attention'),
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  Expanded(
                    child: StatCard(
                      icon: Icons.hourglass_top,
                      label: 'Pending Verification',
                      value: stats.pendingVerificationCount,
                      onTap: () => context.go('/admin/startups'),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: StatCard(
                      icon: Icons.flag_outlined,
                      label: 'Pending Reports',
                      value: stats.pendingReportCount,
                      onTap: () => context.go('/admin/reports'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              const SectionHeader(title: 'Platform overview'),
              const SizedBox(height: AppSpacing.sm),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: AppSpacing.md,
                crossAxisSpacing: AppSpacing.md,
                childAspectRatio: 1.3,
                children: [
                  StatCard(
                    icon: Icons.school_outlined,
                    label: 'Students',
                    value: stats.studentCount,
                  ),
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
                ],
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
