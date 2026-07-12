import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/index.dart';
import '../../../notifications/widgets/notification_bell_button.dart';
import '../../startup/models/verification_status.dart';
import '../../startup/providers/startup_providers.dart';
import '../widgets/founder_dashboard_summary.dart';

class FounderDashboardScreen extends ConsumerWidget {
  const FounderDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startup = ref.watch(currentStartupProvider).valueOrNull;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: const [NotificationBellButton()],
      ),
      body: (startup == null || startup.verificationStatus != VerificationStatus.approved)
          ? const EmptyState(
              icon: Icons.verified_outlined,
              title: 'Get your startup verified',
              message: 'Submit your startup for review from the Startup tab to unlock your dashboard.',
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: FounderDashboardSummary(startup: startup),
            ),
    );
  }
}
