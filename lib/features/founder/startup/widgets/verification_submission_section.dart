import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/index.dart';
import '../models/startup.dart';
import '../models/verification_status.dart';
import '../providers/startup_controller.dart';

class VerificationSubmissionSection extends ConsumerStatefulWidget {
  const VerificationSubmissionSection({super.key, required this.startup});

  final Startup startup;

  @override
  ConsumerState<VerificationSubmissionSection> createState() =>
      _VerificationSubmissionSectionState();
}

class _VerificationSubmissionSectionState
    extends ConsumerState<VerificationSubmissionSection> {
  Future<void> _submit() async {
    final file = await openFile(
      acceptedTypeGroups: const [
        XTypeGroup(label: 'Verification document', extensions: ['pdf', 'jpg', 'jpeg', 'png']),
      ],
    );
    if (file == null) return;

    await ref
        .read(startupControllerProvider.notifier)
        .submitVerification(widget.startup.founderId, file.path);

    if (!mounted) return;

    final error = ref.read(startupControllerProvider).error;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error != null ? 'Upload failed: $error' : 'Submitted for review'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final status = widget.startup.verificationStatus;
    if (status == VerificationStatus.approved) return const SizedBox.shrink();

    final isLoading = ref.watch(startupControllerProvider).isLoading;

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            status == VerificationStatus.pending
                ? 'Verification pending'
                : 'Get verified',
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
                widget.startup.verificationRejectionReason ??
                    'Your submission was rejected. Please resubmit.',
              _ => 'Only verified startups can post internship opportunities.',
            },
            style: const TextStyle(color: AppColors.textSecondary),
          ),
          if (status != VerificationStatus.pending) ...[
            const SizedBox(height: AppSpacing.md),
            AppButton(
              label: status == VerificationStatus.rejected
                  ? 'Resubmit documents'
                  : 'Submit for verification',
              isLoading: isLoading,
              onPressed: _submit,
              fullWidth: true,
            ),
          ],
        ],
      ),
    );
  }
}
