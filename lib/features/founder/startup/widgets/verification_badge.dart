import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../models/verification_status.dart';

class VerificationBadge extends StatelessWidget {
  const VerificationBadge({super.key, required this.status});

  final VerificationStatus status;

  Color get _color => switch (status) {
    VerificationStatus.approved => AppColors.success,
    VerificationStatus.rejected => AppColors.error,
    VerificationStatus.pending || VerificationStatus.unverified => AppColors.textSecondary,
  };

  IconData get _icon => switch (status) {
    VerificationStatus.approved => Icons.verified,
    VerificationStatus.rejected => Icons.cancel_outlined,
    VerificationStatus.pending => Icons.hourglass_top,
    VerificationStatus.unverified => Icons.info_outline,
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
