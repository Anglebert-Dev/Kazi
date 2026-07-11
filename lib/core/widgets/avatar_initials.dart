import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AvatarInitials extends StatelessWidget {
  const AvatarInitials({super.key, required this.diameter, required this.initials});

  final double diameter;
  final String initials;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      alignment: Alignment.center,
      color: AppColors.secondarySurface,
      child: Text(
        initials,
        style: TextStyle(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,
          fontSize: diameter / 2.6,
        ),
      ),
    );
  }
}
