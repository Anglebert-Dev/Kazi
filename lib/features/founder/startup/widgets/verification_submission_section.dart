import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/index.dart';
import '../models/startup.dart';
import '../models/verification_status.dart';
import '../screens/verification_submission_screen.dart';

class VerificationSubmissionSection extends StatelessWidget {
  const VerificationSubmissionSection({super.key, required this.startup});

  final Startup startup;

  @override
  Widget build(BuildContext context) {
    final status = startup.verificationStatus;
    if (status == VerificationStatus.approved) return const SizedBox.shrink();

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            status == VerificationStatus.pending ? 'Verification pending' : 'Get verified',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            switch (status) {
              VerificationStatus.pending =>
                "We're reviewing your documents. This usually takes a few days.",
              VerificationStatus.rejected =>
                startup.verificationRejectionReason ?? 'Your submission was rejected.',
              _ => 'Only verified startups can post internship opportunities.',
            },
            style: const TextStyle(color: AppColors.textSecondary),
          ),
          if (status != VerificationStatus.pending) ...[
            const SizedBox(height: AppSpacing.md),
            AppButton(
              label: status == VerificationStatus.rejected
                  ? 'Resubmit documents'
                  : 'Start verification',
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => VerificationSubmissionScreen(startup: startup),
                ),
              ),
              fullWidth: true,
            ),
          ],
        ],
      ),
    );
  }
}
