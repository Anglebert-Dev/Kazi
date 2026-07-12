import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';

class SuspendedStartupBanner extends StatelessWidget {
  const SuspendedStartupBanner({super.key, this.reason});

  final String? reason;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.error.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppRadii.card),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.block, color: AppColors.error),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'This startup has been suspended',
                  style: TextStyle(color: AppColors.error, fontWeight: FontWeight.w600),
                ),
                if ((reason ?? '').isNotEmpty)
                  Text(reason!, style: const TextStyle(color: AppColors.error)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
