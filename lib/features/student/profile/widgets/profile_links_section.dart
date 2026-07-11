import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/index.dart';

class ProfileLinksSection extends StatelessWidget {
  const ProfileLinksSection({
    super.key,
    required this.portfolioController,
    required this.githubController,
    required this.linkedinController,
  });

  final TextEditingController portfolioController;
  final TextEditingController githubController;
  final TextEditingController linkedinController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(controller: portfolioController, label: 'Portfolio link'),
        const SizedBox(height: AppSpacing.md),
        AppTextField(controller: githubController, label: 'GitHub link'),
        const SizedBox(height: AppSpacing.md),
        AppTextField(controller: linkedinController, label: 'LinkedIn link'),
      ],
    );
  }
}
