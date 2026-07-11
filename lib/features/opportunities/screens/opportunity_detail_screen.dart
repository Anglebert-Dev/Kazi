import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/index.dart';
import '../../student/bookmarks/providers/bookmark_controller.dart';
import '../../student/bookmarks/providers/bookmark_providers.dart';
import '../models/opportunity.dart';
import '../utils/deadline_label.dart';
import '../widgets/opportunity_apply_section.dart';
import 'startup_profile_screen.dart';

class OpportunityDetailScreen extends ConsumerWidget {
  const OpportunityDetailScreen({super.key, required this.opportunity});

  final Opportunity opportunity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarkedIds = ref.watch(bookmarkedOpportunityIdsProvider).valueOrNull ?? const {};
    final isBookmarked = bookmarkedIds.contains(opportunity.id);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Opportunity'),
        actions: [
          IconButton(
            icon: Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_border),
            onPressed: () => ref
                .read(bookmarkControllerProvider.notifier)
                .toggle(opportunity.id, !isBookmarked),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => StartupProfileScreen(startupId: opportunity.startupId),
                ),
              ),
              child: Row(
                children: [
                  Avatar(
                    imageUrl: opportunity.startupLogoUrl,
                    name: opportunity.startupName,
                    size: AvatarSize.medium,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          opportunity.title,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                opportunity.startupName,
                                style: const TextStyle(color: AppColors.textSecondary),
                              ),
                            ),
                            const SizedBox(width: AppSpacing.xs),
                            const Icon(
                              Icons.chevron_right,
                              size: 16,
                              color: AppColors.textSecondary,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                AppChip(label: opportunity.category),
                AppChip(label: opportunity.isRemote ? 'Remote' : 'Onsite'),
                AppChip(label: opportunity.isPaid ? 'Paid' : 'Unpaid'),
                if ((opportunity.duration ?? '').isNotEmpty) AppChip(label: opportunity.duration!),
                if ((opportunity.location ?? '').isNotEmpty)
                  AppChip(label: opportunity.location!, icon: Icons.location_on_outlined),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              deadlineLabel(opportunity.deadline),
              style: const TextStyle(color: AppColors.textSecondary),
            ),
            const SizedBox(height: AppSpacing.lg),
            OpportunityApplySection(
              opportunityTitle: opportunity.title,
              applicationEmail: opportunity.applicationEmail,
            ),
            const SizedBox(height: AppSpacing.lg),
            const SectionHeader(title: 'Description'),
            const SizedBox(height: AppSpacing.sm),
            Text(opportunity.description, style: const TextStyle(color: AppColors.textPrimary)),
            if (opportunity.requiredSkills.isNotEmpty) ...[
              const SizedBox(height: AppSpacing.lg),
              const SectionHeader(title: 'Required skills'),
              const SizedBox(height: AppSpacing.sm),
              Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: [
                  for (final skill in opportunity.requiredSkills) AppChip(label: skill),
                ],
              ),
            ],
            if ((opportunity.responsibilities ?? '').isNotEmpty) ...[
              const SizedBox(height: AppSpacing.lg),
              const SectionHeader(title: 'Responsibilities'),
              const SizedBox(height: AppSpacing.sm),
              Text(
                opportunity.responsibilities!,
                style: const TextStyle(color: AppColors.textPrimary),
              ),
            ],
            if ((opportunity.benefits ?? '').isNotEmpty) ...[
              const SizedBox(height: AppSpacing.lg),
              const SectionHeader(title: 'Benefits'),
              const SizedBox(height: AppSpacing.sm),
              Text(opportunity.benefits!, style: const TextStyle(color: AppColors.textPrimary)),
            ],
          ],
        ),
      ),
    );
  }
}
