import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/index.dart';
import '../../../opportunities/providers/opportunity_providers.dart';
import '../../../opportunities/screens/opportunity_detail_screen.dart';
import '../../../opportunities/utils/deadline_label.dart';

class AdminOpportunitiesScreen extends ConsumerWidget {
  const AdminOpportunitiesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final opportunitiesAsync = ref.watch(allOpportunitiesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Opportunities')),
      body: opportunitiesAsync.when(
        data: (opportunities) => opportunities.isEmpty
            ? const EmptyState(
                icon: Icons.work_outline,
                title: 'No opportunities yet',
                message: 'Opportunities posted by founders will show up here.',
              )
            : ListView.builder(
                padding: const EdgeInsets.all(AppSpacing.lg),
                itemCount: opportunities.length,
                itemBuilder: (context, index) {
                  final opportunity = opportunities[index];
                  return Padding(
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
                      statusLabel: opportunity.isAcceptingApplications
                          ? null
                          : opportunity.applicationStatusLabel,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => OpportunityDetailScreen(opportunity: opportunity),
                        ),
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
