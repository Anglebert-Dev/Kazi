import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/index.dart';
import '../models/startup.dart';
import 'delete_startup_button.dart';
import 'startup_profile_view.dart';
import 'verification_submission_section.dart';

class StartupSummary extends StatelessWidget {
  const StartupSummary({super.key, required this.startup, required this.onEdit});

  final Startup startup;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StartupProfileView(startup: startup),
          const SizedBox(height: AppSpacing.lg),
          VerificationSubmissionSection(startup: startup),
          const SizedBox(height: AppSpacing.lg),
          AppButton(label: 'Edit startup', icon: Icons.edit, onPressed: onEdit, fullWidth: true),
          const SizedBox(height: AppSpacing.sm),
          DeleteStartupButton(founderId: startup.founderId),
        ],
      ),
    );
  }
}
