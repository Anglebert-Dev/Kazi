import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/index.dart';
import '../../../applications/models/application.dart';
import '../../../applications/widgets/application_status_badge.dart';

class FounderApplicantListTile extends StatelessWidget {
  const FounderApplicantListTile({super.key, required this.application, required this.onTap});

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
            imageUrl: application.studentPhotoUrl,
            name: application.studentName,
            size: AvatarSize.small,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              application.studentName,
              style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.textPrimary),
            ),
          ),
          ApplicationStatusBadge(status: application.status),
        ],
      ),
    );
  }
}
