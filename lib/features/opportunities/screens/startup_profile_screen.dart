import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/widgets/index.dart';
import '../../authentication/models/user_role.dart';
import '../../authentication/providers/auth_providers.dart';
import '../../founder/startup/providers/startup_providers.dart';
import '../../founder/startup/widgets/startup_profile_view.dart';
import '../../reports/widgets/report_startup_dialog.dart';
import '../providers/opportunity_providers.dart';
import '../utils/deadline_label.dart';
import 'opportunity_detail_screen.dart';

class StartupProfileScreen extends ConsumerWidget {
  const StartupProfileScreen({super.key, required this.startupId});

  final String startupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startupAsync = ref.watch(startupByIdProvider(startupId));
    final opportunitiesAsync = ref.watch(founderOpportunitiesProvider(startupId));
    final userModel = ref.watch(currentUserModelProvider).valueOrNull;
    final canReport = userModel != null &&
        userModel.role != UserRole.admin &&
        userModel.uid != startupId;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup'),
        actions: [
          if (canReport)
            IconButton(
              icon: const Icon(Icons.flag_outlined),
              onPressed: () {
                final startup = startupAsync.valueOrNull;
                if (startup == null) return;
                ReportStartupDialog.show(
                  context,
                  startupId: startupId,
                  startupName: startup.name ?? 'Startup',
                );
              },
            ),
        ],
      ),
      body: startupAsync.when(
        data: (startup) => SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StartupProfileView(startup: startup),
              const SizedBox(height: AppSpacing.lg),
              const SectionHeader(title: 'Open opportunities'),
              const SizedBox(height: AppSpacing.sm),
              opportunitiesAsync.when(
                data: (opportunities) => opportunities.isEmpty
                    ? const Text('No open opportunities right now.')
                    : Column(
                        children: [
                          for (final opportunity in opportunities)
                            Padding(
                              padding: const EdgeInsets.only(bottom: AppSpacing.md),
                              child: OpportunityCard(
                                title: opportunity.title,
                                startupName: opportunity.startupName,
                                startupLogoUrl: opportunity.startupLogoUrl,
                                category: opportunity.category,
                                isRemote: opportunity.isRemote,
                                isPaid: opportunity.isPaid,
                                location: opportunity.location,
                                deadlineLabel: deadlineLabel(opportunity.deadline),
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        OpportunityDetailScreen(opportunity: opportunity),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) => Text('Could not load opportunities: $error'),
              ),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Could not load startup: $error')),
      ),
    );
  }
}
