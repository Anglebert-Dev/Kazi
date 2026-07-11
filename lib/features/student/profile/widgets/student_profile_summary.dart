import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/index.dart';
import '../models/availability_status.dart';
import '../models/student_profile.dart';
import 'profile_info_row.dart';
import 'profile_link_tile.dart';

class StudentProfileSummary extends StatelessWidget {
  const StudentProfileSummary({super.key, required this.profile, required this.onEdit});

  final StudentProfile profile;
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
                Avatar(imageUrl: profile.photoUrl, name: 'Student', size: AvatarSize.large),
                const SizedBox(height: AppSpacing.sm),
                AppChip(label: profile.availability.label),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          if ((profile.bio ?? '').isNotEmpty) ...[
            Text(profile.bio!, style: const TextStyle(color: AppColors.textPrimary)),
            const SizedBox(height: AppSpacing.lg),
          ],
          if ((profile.degree ?? '').isNotEmpty)
            ProfileInfoRow(label: 'Degree', value: profile.degree!),
          if (profile.graduationYear != null)
            ProfileInfoRow(label: 'Graduation year', value: '${profile.graduationYear}'),
          const SizedBox(height: AppSpacing.md),
          if (profile.skills.isNotEmpty) ...[
            const SectionHeader(title: 'Skills'),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [for (final skill in profile.skills) AppChip(label: skill, selected: true)],
            ),
            const SizedBox(height: AppSpacing.lg),
          ],
          if (profile.interests.isNotEmpty) ...[
            const SectionHeader(title: 'Interests'),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [for (final interest in profile.interests) AppChip(label: interest)],
            ),
            const SizedBox(height: AppSpacing.lg),
          ],
          const SectionHeader(title: 'Links'),
          ProfileLinkTile(icon: Icons.link, label: 'Portfolio', url: profile.portfolioUrl),
          ProfileLinkTile(icon: Icons.code, label: 'GitHub', url: profile.githubUrl),
          ProfileLinkTile(icon: Icons.business_center, label: 'LinkedIn', url: profile.linkedinUrl),
          ProfileLinkTile(icon: Icons.description, label: 'CV', url: profile.cvUrl),
          const SizedBox(height: AppSpacing.lg),
          AppButton(label: 'Edit profile', icon: Icons.edit, onPressed: onEdit, fullWidth: true),
        ],
      ),
    );
  }
}
