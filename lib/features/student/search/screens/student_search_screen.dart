import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/index.dart';
import '../../../admin/categories/models/category_type.dart';
import '../../../admin/categories/providers/category_providers.dart';
import '../../../opportunities/providers/opportunity_providers.dart';
import '../../../opportunities/screens/opportunity_detail_screen.dart';
import '../../../opportunities/utils/deadline_label.dart';
import '../../bookmarks/providers/bookmark_controller.dart';
import '../../bookmarks/providers/bookmark_providers.dart';
import '../widgets/opportunity_filters.dart';

class StudentSearchScreen extends ConsumerStatefulWidget {
  const StudentSearchScreen({super.key});

  @override
  ConsumerState<StudentSearchScreen> createState() => _StudentSearchScreenState();
}

class _StudentSearchScreenState extends ConsumerState<StudentSearchScreen> {
  final _searchController = TextEditingController();
  String _query = '';
  String? _category;
  bool _remoteOnly = false;
  bool _paidOnly = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final opportunitiesAsync = ref.watch(allOpportunitiesProvider);
    final bookmarkedIds = ref.watch(bookmarkedOpportunityIdsProvider).valueOrNull ?? const {};
    final categories = ref
        .watch(categoriesByTypeProvider(CategoryType.opportunityCategory))
        .valueOrNull
        ?.map((category) => category.label)
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSearchBar(
              controller: _searchController,
              hint: 'Search opportunities',
              onChanged: (value) => setState(() => _query = value.trim().toLowerCase()),
            ),
            const SizedBox(height: AppSpacing.md),
            OpportunityFilters(
              categories: categories ?? const [],
              selectedCategory: _category,
              onCategoryChanged: (value) => setState(() => _category = value),
              remoteOnly: _remoteOnly,
              onRemoteChanged: (value) => setState(() => _remoteOnly = value),
              paidOnly: _paidOnly,
              onPaidChanged: (value) => setState(() => _paidOnly = value),
            ),
            const SizedBox(height: AppSpacing.md),
            Expanded(
              child: opportunitiesAsync.when(
                data: (opportunities) {
                  final results = opportunities.where((opportunity) {
                    final matchesQuery =
                        _query.isEmpty ||
                        opportunity.title.toLowerCase().contains(_query) ||
                        opportunity.startupName.toLowerCase().contains(_query) ||
                        opportunity.requiredSkills.any(
                          (skill) => skill.toLowerCase().contains(_query),
                        );
                    final matchesCategory = _category == null || opportunity.category == _category;
                    final matchesRemote = !_remoteOnly || opportunity.isRemote;
                    final matchesPaid = !_paidOnly || opportunity.isPaid;
                    return matchesQuery && matchesCategory && matchesRemote && matchesPaid;
                  }).toList();

                  if (results.isEmpty) {
                    return const EmptyState(
                      icon: Icons.search_off,
                      title: 'No matches',
                      message: 'Try a different search term or adjust your filters.',
                    );
                  }

                  return ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      final opportunity = results[index];
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
                          isBookmarked: bookmarkedIds.contains(opportunity.id),
                          onBookmarkTap: () => ref
                              .read(bookmarkControllerProvider.notifier)
                              .toggle(opportunity.id, !bookmarkedIds.contains(opportunity.id)),
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
                error: (error, stackTrace) =>
                    Center(child: Text('Could not load opportunities: $error')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
