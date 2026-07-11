import 'package:flutter/material.dart';

import '../constants/app_spacing.dart';
import '../theme/app_colors.dart';
import 'app_card.dart';
import 'app_chip.dart';
import 'avatar.dart';

class OpportunityCard extends StatelessWidget {
  const OpportunityCard({
    super.key,
    required this.title,
    required this.startupName,
    this.startupLogoUrl,
    required this.category,
    required this.isRemote,
    required this.isPaid,
    this.matchScorePercent,
    required this.deadlineLabel,
    this.isBookmarked = false,
    this.onBookmarkTap,
    this.onTap,
  });

  final String title;
  final String startupName;
  final String? startupLogoUrl;
  final String category;
  final bool isRemote;
  final bool isPaid;
  final int? matchScorePercent;
  final String deadlineLabel;
  final bool isBookmarked;
  final VoidCallback? onBookmarkTap;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Avatar(imageUrl: startupLogoUrl, name: startupName, size: AvatarSize.small),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      startupName,
                      style: const TextStyle(color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onBookmarkTap,
                icon: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              AppChip(label: category),
              AppChip(label: isRemote ? 'Remote' : 'Onsite'),
              AppChip(label: isPaid ? 'Paid' : 'Unpaid'),
              if (matchScorePercent != null)
                AppChip(label: '$matchScorePercent% Match', icon: Icons.bolt),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            deadlineLabel,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
