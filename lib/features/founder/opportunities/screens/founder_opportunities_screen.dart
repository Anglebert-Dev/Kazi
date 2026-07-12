import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/index.dart';
import '../../../opportunities/providers/opportunity_providers.dart';
import '../../startup/models/verification_status.dart';
import '../../startup/providers/startup_providers.dart';
import '../widgets/founder_opportunity_list_tile.dart';
import 'opportunity_edit_screen.dart';

class FounderOpportunitiesScreen extends ConsumerWidget {
  const FounderOpportunitiesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startupAsync = ref.watch(currentStartupProvider);
    final startup = startupAsync.valueOrNull;

    if (startup == null || startup.verificationStatus != VerificationStatus.approved) {
      return Scaffold(
        appBar: AppBar(title: const Text('Opportunities')),
        body: const EmptyState(
          icon: Icons.verified_outlined,
          title: 'Get verified to post opportunities',
          message: 'Submit your startup for review from the Startup tab to unlock this feature.',
        ),
      );
    }

    if (startup.isSuspended) {
      return Scaffold(
        appBar: AppBar(title: const Text('Opportunities')),
        body: EmptyState(
          icon: Icons.block,
          title: 'Startup suspended',
          message:
              startup.suspensionReason ??
              'Your startup has been suspended and can no longer post opportunities.',
        ),
      );
    }

    final opportunitiesAsync = ref.watch(founderOpportunitiesProvider(startup.founderId));

    return Scaffold(
      appBar: AppBar(title: const Text('Opportunities')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => OpportunityEditScreen(startup: startup)),
        ),
        child: const Icon(Icons.add),
      ),
      body: opportunitiesAsync.when(
        data: (opportunities) => opportunities.isEmpty
            ? const EmptyState(
                icon: Icons.work_outline,
                title: 'No opportunities yet',
                message: 'Tap the + button to post your first internship opportunity.',
              )
            : ListView.builder(
                padding: const EdgeInsets.all(AppSpacing.lg),
                itemCount: opportunities.length,
                itemBuilder: (context, index) {
                  final opportunity = opportunities[index];
                  return FounderOpportunityListTile(
                    opportunity: opportunity,
                    onEdit: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            OpportunityEditScreen(startup: startup, opportunity: opportunity),
                      ),
                    ),
                  );
                },
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Could not load opportunities: $error')),
      ),
    );
  }
}
