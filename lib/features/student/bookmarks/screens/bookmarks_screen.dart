import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/index.dart';
import '../../../opportunities/providers/opportunity_providers.dart';
import '../../../opportunities/screens/opportunity_detail_screen.dart';
import '../../../opportunities/utils/deadline_label.dart';
import '../providers/bookmark_controller.dart';
import '../providers/bookmark_providers.dart';

class BookmarksScreen extends ConsumerWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final opportunitiesAsync = ref.watch(allOpportunitiesProvider);
    final bookmarkedIdsAsync = ref.watch(bookmarkedOpportunityIdsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Bookmarks')),
      body: opportunitiesAsync.when(
        data: (opportunities) {
          final bookmarkedIds = bookmarkedIdsAsync.valueOrNull ?? const {};
          final bookmarked = opportunities
              .where((opportunity) => bookmarkedIds.contains(opportunity.id))
              .toList();

          return bookmarked.isEmpty
              ? const EmptyState(
                  icon: Icons.bookmark_border,
                  title: 'No bookmarks yet',
                  message: 'Opportunities you bookmark will show up here.',
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  itemCount: bookmarked.length,
                  itemBuilder: (context, index) {
                    final opportunity = bookmarked[index];
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
                        isBookmarked: true,
                        onBookmarkTap: () => ref
                            .read(bookmarkControllerProvider.notifier)
                            .toggle(opportunity.id, false),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                OpportunityDetailScreen(opportunity: opportunity),
                          ),
                        ),
                      ),
                    );
                  },
                );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Could not load bookmarks: $error')),
      ),
    );
  }
}
