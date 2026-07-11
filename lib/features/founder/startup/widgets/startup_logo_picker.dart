import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/index.dart';

class StartupLogoPicker extends StatelessWidget {
  const StartupLogoPicker({
    super.key,
    required this.logoUrl,
    required this.startupName,
    required this.onTap,
  });

  final String? logoUrl;
  final String startupName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Avatar(imageUrl: logoUrl, name: startupName, size: AvatarSize.large),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.camera_alt, size: 16, color: AppColors.surface),
            ),
          ),
        ],
      ),
    );
  }
}
