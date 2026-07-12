import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/index.dart';
import '../../../applications/models/application.dart';
import '../../../applications/widgets/application_status_badge.dart';

class StudentApplicationListTile extends StatelessWidget {
  const StudentApplicationListTile({super.key, required this.application, required this.onTap});

  final Application application;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Row(
        children: [
          Avatar(
            imageUrl: application.startupLogoUrl,
            name: application.startupName,
            size: AvatarSize.small,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  application.opportunityTitle,
                  style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.textPrimary),
                ),
                Text(
                  application.startupName,
                  style: const TextStyle(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
          ApplicationStatusBadge(status: application.status),
        ],
      ),
    );
  }
}
