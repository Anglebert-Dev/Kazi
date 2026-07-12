import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/index.dart';
import '../../../authentication/providers/auth_providers.dart';
import '../../../opportunities/models/opportunity.dart';
import '../../../opportunities/providers/opportunity_providers.dart';
import '../../../opportunities/screens/opportunity_detail_screen.dart';
import '../../../opportunities/utils/deadline_label.dart';
import '../../../opportunities/utils/match_score.dart';
import '../../bookmarks/providers/bookmark_controller.dart';
import '../../bookmarks/providers/bookmark_providers.dart';
import '../../../notifications/widgets/notification_bell_button.dart';
import '../../bookmarks/screens/bookmarks_screen.dart';
import '../../profile/providers/student_profile_providers.dart';

class StudentHomeScreen extends ConsumerWidget {
  const StudentHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userModel = ref.watch(currentUserModelProvider).valueOrNull;
    final studentSkills = ref.watch(currentStudentProfileProvider).valueOrNull?.skills ?? const [];
    final opportunitiesAsync = ref.watch(allOpportunitiesProvider);
    final bookmarkedIds = ref.watch(bookmarkedOpportunityIdsProvider).valueOrNull ?? const {};

    return Scaffold(
      appBar: AppBar(
        title: Text('Hi, ${userModel?.displayName ?? 'there'}'),
        actions: [
          const NotificationBellButton(),
          IconButton(
            icon: const Icon(Icons.bookmark_outline),
            onPressed: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => const BookmarksScreen())),
          ),
        ],
      ),
      body: opportunitiesAsync.when(
        data: (opportunities) {
          if (opportunities.isEmpty) {
            return const EmptyState(
              icon: Icons.work_outline,
              title: 'No opportunities yet',
              message: 'Check back soon — startups are posting new internships regularly.',
            );
          }

          final scored = [
            for (final opportunity in opportunities)
              (opportunity, calculateMatchScore(opportunity.requiredSkills, studentSkills)),
          ];
          final recommended = scored.where((entry) => (entry.$2 ?? 0) >= 50).toList()
            ..sort((a, b) => (b.$2 ?? 0).compareTo(a.$2 ?? 0));

          Widget buildTile((Opportunity, int?) entry) {
            final opportunity = entry.$1;
            final matchScore = entry.$2;
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
                matchScorePercent: matchScore,
                deadlineLabel: deadlineLabel(opportunity.deadline),
                isBookmarked: bookmarkedIds.contains(opportunity.id),
                onBookmarkTap: () => ref
                    .read(bookmarkControllerProvider.notifier)
                    .toggle(opportunity.id, !bookmarkedIds.contains(opportunity.id)),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => OpportunityDetailScreen(opportunity: opportunity),
                  ),
                ),
              ),
            );
          }

          return ListView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: [
              if (recommended.isNotEmpty) ...[
                const SectionHeader(title: 'Recommended for you'),
                const SizedBox(height: AppSpacing.sm),
                for (final entry in recommended) buildTile(entry),
                const SizedBox(height: AppSpacing.md),
              ],
              const SectionHeader(title: 'All opportunities'),
              const SizedBox(height: AppSpacing.sm),
              for (final entry in scored) buildTile(entry),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Could not load opportunities: $error')),
      ),
    );
  }
}
