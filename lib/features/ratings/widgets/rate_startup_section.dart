import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/index.dart';
import '../providers/rating_providers.dart';
import 'rate_startup_dialog.dart';

class RateStartupSection extends ConsumerWidget {
  const RateStartupSection({super.key, required this.studentId, required this.startupId});

  final String studentId;
  final String startupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final existingRating = ref
        .watch(ratingByStudentAndStartupProvider(studentId, startupId))
        .valueOrNull;

    if (existingRating != null) {
      return Row(
        children: [
          const Icon(Icons.star, color: AppColors.primary, size: 18),
          const SizedBox(width: AppSpacing.xs),
          Text(
            'You rated this startup ${existingRating.score}/5',
            style: const TextStyle(color: AppColors.textSecondary),
          ),
        ],
      );
    }

    return AppButton(
      label: 'Rate this startup',
      icon: Icons.star_border,
      variant: AppButtonVariant.secondary,
      onPressed: () => RateStartupDialog.show(context, startupId: startupId),
    );
  }
}
