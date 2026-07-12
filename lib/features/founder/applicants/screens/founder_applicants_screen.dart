import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/index.dart';
import '../../../applications/models/application.dart';
import '../../../applications/providers/application_providers.dart';
import '../../startup/providers/startup_providers.dart';
import 'opportunity_applicants_screen.dart';

class FounderApplicantsScreen extends ConsumerWidget {
  const FounderApplicantsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startup = ref.watch(currentStartupProvider).valueOrNull;

    if (startup == null) {
      return Scaffold(appBar: AppBar(title: const Text('Applicants')));
    }

    final applicationsAsync = ref.watch(startupApplicationsProvider(startup.founderId));

    return Scaffold(
      appBar: AppBar(title: const Text('Applicants')),
      body: applicationsAsync.when(
        data: (applications) {
          final byOpportunity = <String, List<Application>>{};
          for (final application in applications) {
            byOpportunity.putIfAbsent(application.opportunityId, () => []).add(application);
          }

          if (byOpportunity.isEmpty) {
            return const EmptyState(
              icon: Icons.people_outline,
              title: 'No applicants yet',
              message: 'Students who apply to your opportunities will show up here.',
            );
          }

          final opportunityIds = byOpportunity.keys.toList();

          return ListView.builder(
            padding: const EdgeInsets.all(AppSpacing.lg),
            itemCount: opportunityIds.length,
            itemBuilder: (context, index) {
              final opportunityId = opportunityIds[index];
              final group = byOpportunity[opportunityId]!;
              return AppCard(
                margin: const EdgeInsets.only(bottom: AppSpacing.md),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => OpportunityApplicantsScreen(
                      startupId: startup.founderId,
                      opportunityId: opportunityId,
                      opportunityTitle: group.first.opportunityTitle,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        group.first.opportunityTitle,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    AppChip(label: '${group.length} applicant${group.length == 1 ? '' : 's'}'),
                  ],
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Could not load applicants: $error')),
      ),
    );
  }
}
