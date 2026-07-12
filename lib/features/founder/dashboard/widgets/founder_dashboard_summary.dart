import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/index.dart';
import '../../../admin/dashboard/widgets/stat_card.dart';
import '../../../applications/models/application_status.dart';
import '../../../applications/providers/application_providers.dart';
import '../../../opportunities/providers/opportunity_providers.dart';
import '../../opportunities/screens/opportunity_edit_screen.dart';
import '../../startup/models/hiring_status.dart';
import '../../startup/models/startup.dart';
import '../../startup/widgets/verification_badge.dart';

class FounderDashboardSummary extends ConsumerWidget {
  const FounderDashboardSummary({super.key, required this.startup});

  final Startup startup;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final opportunities =
        ref.watch(founderOpportunitiesProvider(startup.founderId)).valueOrNull ?? const [];
    final applications =
        ref.watch(startupApplicationsProvider(startup.founderId)).valueOrNull ?? const [];
    final openCount = opportunities.where((o) => o.isAcceptingApplications).length;
    final pendingReviewCount = applications
        .where(
          (a) => a.status == ApplicationStatus.applied || a.status == ApplicationStatus.underReview,
        )
        .length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Avatar(imageUrl: startup.logoUrl, name: startup.name ?? 'Startup', size: AvatarSize.medium),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    startup.name ?? '',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Wrap(
                    spacing: AppSpacing.sm,
                    children: [
                      AppChip(label: startup.hiringStatus.label),
                      VerificationBadge(status: startup.verificationStatus),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        const SectionHeader(title: 'At a glance'),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            Expanded(
              child: StatCard(
                icon: Icons.work_outline,
                label: 'Open Opportunities',
                value: openCount,
                onTap: () => context.go('/founder/opportunities'),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: StatCard(
                icon: Icons.people_outline,
                label: 'Total Applicants',
                value: applications.length,
                onTap: () => context.go('/founder/applicants'),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: StatCard(
                icon: Icons.hourglass_top,
                label: 'Pending Review',
                value: pendingReviewCount,
                onTap: () => context.go('/founder/applicants'),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        AppButton(
          label: 'Post opportunity',
          icon: Icons.add,
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => OpportunityEditScreen(startup: startup)),
          ),
          fullWidth: true,
        ),
        const SizedBox(height: AppSpacing.sm),
        AppButton(
          label: 'View applicants',
          icon: Icons.people_outline,
          variant: AppButtonVariant.secondary,
          onPressed: () => context.go('/founder/applicants'),
          fullWidth: true,
        ),
      ],
    );
  }
}
