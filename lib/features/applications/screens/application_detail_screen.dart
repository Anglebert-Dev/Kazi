import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/index.dart';
import '../../student/profile/widgets/profile_link_tile.dart';
import '../models/application.dart';
import '../models/application_status.dart';
import '../providers/application_controller.dart';
import '../widgets/application_status_badge.dart';

class ApplicationDetailScreen extends ConsumerWidget {
  const ApplicationDetailScreen({
    super.key,
    required this.application,
    this.isFounderView = false,
  });

  final Application application;
  final bool isFounderView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isUpdating = ref.watch(applicationControllerProvider).isLoading;

    return Scaffold(
      appBar: AppBar(
        title: Text(isFounderView ? application.studentName : application.opportunityTitle),
        actions: [
          if (isFounderView)
            PopupMenuButton<ApplicationStatus>(
              enabled: !isUpdating,
              onSelected: (status) => ref
                  .read(applicationControllerProvider.notifier)
                  .updateStatus(application, status),
              itemBuilder: (context) => [
                for (final status in ApplicationStatus.values)
                  PopupMenuItem(value: status, child: Text(status.label)),
              ],
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Avatar(
                  imageUrl: isFounderView ? application.studentPhotoUrl : application.startupLogoUrl,
                  name: isFounderView ? application.studentName : application.startupName,
                  size: AvatarSize.medium,
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isFounderView ? application.studentName : application.opportunityTitle,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        isFounderView ? application.opportunityTitle : application.startupName,
                        style: const TextStyle(color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            ApplicationStatusBadge(status: application.status),
            const SizedBox(height: AppSpacing.lg),
            const SectionHeader(title: 'Cover note'),
            const SizedBox(height: AppSpacing.sm),
            Text(application.coverNote, style: const TextStyle(color: AppColors.textPrimary)),
            const SizedBox(height: AppSpacing.lg),
            const SectionHeader(title: 'Documents'),
            ProfileLinkTile(
              icon: Icons.description_outlined,
              label: 'CV',
              actionLabel: 'View CV',
              url: application.cvUrl,
            ),
            ProfileLinkTile(
              icon: Icons.link,
              label: 'Portfolio',
              actionLabel: 'View portfolio',
              url: application.portfolioLink,
            ),
          ],
        ),
      ),
    );
  }
}
