import 'package:flutter/material.dart';

import '../constants/app_spacing.dart';
import '../theme/app_colors.dart';
import 'app_bottom_nav_item.dart';

class AppBottomNavButton extends StatelessWidget {
  const AppBottomNavButton({
    super.key,
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final AppBottomNavItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: item.label,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: selected ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(AppRadii.chip),
          ),
          child: Icon(
            item.icon,
            size: 22,
            color: selected ? AppColors.surface : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
