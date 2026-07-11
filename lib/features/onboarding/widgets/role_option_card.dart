import 'package:flutter/material.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/index.dart';

class RoleOptionCard extends StatelessWidget {
  const RoleOptionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: AppColors.secondarySurface,
              borderRadius: BorderRadius.circular(AppRadii.card),
            ),
            child: Icon(icon, color: AppColors.primary),
          ),
          const SizedBox(width: AppSpacing.md),
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
                Text(subtitle, style: const TextStyle(color: AppColors.textSecondary)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.textSecondary),
        ],
      ),
    );
  }
}
