import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/index.dart';
import '../../../student/profile/widgets/profile_info_row.dart';
import '../../../student/profile/widgets/profile_link_tile.dart';
import '../models/hiring_status.dart';
import '../models/startup.dart';
import '../models/startup_stage.dart';
import 'verification_badge.dart';
import 'verification_submission_section.dart';

class StartupSummary extends StatelessWidget {
  const StartupSummary({super.key, required this.startup, required this.onEdit});

  final Startup startup;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                Avatar(
                  imageUrl: startup.logoUrl,
                  name: startup.name ?? 'Startup',
                  size: AvatarSize.large,
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  startup.name ?? '',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Wrap(
                  spacing: AppSpacing.sm,
                  alignment: WrapAlignment.center,
                  children: [
                    AppChip(label: startup.hiringStatus.label),
                    VerificationBadge(status: startup.verificationStatus),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          if ((startup.description ?? '').isNotEmpty) ...[
            Text(startup.description!, style: const TextStyle(color: AppColors.textPrimary)),
            const SizedBox(height: AppSpacing.lg),
          ],
          if ((startup.industry ?? '').isNotEmpty)
            ProfileInfoRow(label: 'Industry', value: startup.industry!),
          ProfileInfoRow(label: 'Stage', value: startup.stage.label),
          const SizedBox(height: AppSpacing.md),
          const SectionHeader(title: 'Links'),
          ProfileLinkTile(
            icon: Icons.link,
            label: 'Website',
            actionLabel: 'Visit website',
            url: startup.website,
          ),
          const SizedBox(height: AppSpacing.lg),
          VerificationSubmissionSection(startup: startup),
          const SizedBox(height: AppSpacing.lg),
          AppButton(label: 'Edit startup', icon: Icons.edit, onPressed: onEdit, fullWidth: true),
        ],
      ),
    );
  }
}
