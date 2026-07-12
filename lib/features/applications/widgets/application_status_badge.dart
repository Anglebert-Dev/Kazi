import 'package:flutter/material.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/theme/app_colors.dart';
import '../models/application_status.dart';

class ApplicationStatusBadge extends StatelessWidget {
  const ApplicationStatusBadge({super.key, required this.status});

  final ApplicationStatus status;

  Color get _color => switch (status) {
    ApplicationStatus.accepted => AppColors.success,
    ApplicationStatus.rejected => AppColors.error,
    ApplicationStatus.interview => AppColors.primary,
    ApplicationStatus.applied || ApplicationStatus.underReview => AppColors.textSecondary,
  };

  IconData get _icon => switch (status) {
    ApplicationStatus.accepted => Icons.check_circle,
    ApplicationStatus.rejected => Icons.cancel_outlined,
    ApplicationStatus.interview => Icons.event_available,
    ApplicationStatus.underReview => Icons.hourglass_top,
    ApplicationStatus.applied => Icons.send_outlined,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xs),
      decoration: BoxDecoration(
        color: _color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppRadii.chip),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(_icon, size: 14, color: _color),
          const SizedBox(width: AppSpacing.xs),
          Text(status.label, style: TextStyle(color: _color, fontSize: 12)),
        ],
      ),
    );
  }
}
