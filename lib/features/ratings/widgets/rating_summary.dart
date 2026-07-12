import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/theme/app_colors.dart';
import '../providers/rating_providers.dart';

class RatingSummary extends ConsumerWidget {
  const RatingSummary({super.key, required this.startupId});

  final String startupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ratings = ref.watch(ratingsForStartupProvider(startupId)).valueOrNull ?? const [];

    if (ratings.isEmpty) {
      return const Text(
        'No ratings yet',
        style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
      );
    }

    final average = ratings.map((rating) => rating.score).reduce((a, b) => a + b) / ratings.length;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.star, color: AppColors.primary, size: 16),
        const SizedBox(width: AppSpacing.xs),
        Text(
          '${average.toStringAsFixed(1)} (${ratings.length})',
          style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
        ),
      ],
    );
  }
}
