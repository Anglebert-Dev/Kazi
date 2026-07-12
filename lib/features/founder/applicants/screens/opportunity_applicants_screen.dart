import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/index.dart';
import '../../../applications/providers/application_providers.dart';
import '../../../applications/screens/application_detail_screen.dart';
import '../widgets/founder_applicant_list_tile.dart';

class OpportunityApplicantsScreen extends ConsumerWidget {
  const OpportunityApplicantsScreen({
    super.key,
    required this.startupId,
    required this.opportunityId,
    required this.opportunityTitle,
  });

  final String startupId;
  final String opportunityId;
  final String opportunityTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final applicationsAsync = ref.watch(startupApplicationsProvider(startupId));

    return Scaffold(
      appBar: AppBar(title: Text(opportunityTitle)),
      body: applicationsAsync.when(
        data: (applications) {
          final forThisOpportunity = applications
              .where((application) => application.opportunityId == opportunityId)
              .toList();

          return forThisOpportunity.isEmpty
              ? const EmptyState(
                  icon: Icons.people_outline,
                  title: 'No applicants yet',
                  message: 'Students who apply to this opportunity will show up here.',
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  itemCount: forThisOpportunity.length,
                  itemBuilder: (context, index) {
                    final application = forThisOpportunity[index];
                    return FounderApplicantListTile(
                      application: application,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ApplicationDetailScreen(
                            application: application,
                            isFounderView: true,
                          ),
                        ),
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
