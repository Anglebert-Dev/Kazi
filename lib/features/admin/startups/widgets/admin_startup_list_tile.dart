import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/index.dart';
import '../../../founder/startup/models/startup.dart';
import '../../../founder/startup/models/verification_status.dart';
import '../../../founder/startup/widgets/verification_badge.dart';
import '../../../opportunities/screens/startup_profile_screen.dart';
import '../providers/admin_startup_controller.dart';
import 'startup_verification_documents.dart';

Future<String?> _promptReason(BuildContext context, {required String title, required String actionLabel}) {
  final controller = TextEditingController();
  return showDialog<String>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: TextField(
        controller: controller,
        maxLines: 3,
        decoration: const InputDecoration(hintText: 'Reason'),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
        TextButton(
          onPressed: () => Navigator.pop(context, controller.text.trim()),
          child: Text(actionLabel),
        ),
      ],
    ),
  );
}

class AdminStartupListTile extends ConsumerWidget {
  const AdminStartupListTile({super.key, required this.startup});

  final Startup startup;

  Future<void> _reject(BuildContext context, WidgetRef ref) async {
    final reason = await _promptReason(context, title: 'Reject startup', actionLabel: 'Reject');
    if (reason != null && reason.isNotEmpty) {
      await ref.read(adminStartupControllerProvider.notifier).reject(startup.founderId, reason);
    }
  }

  Future<void> _suspend(BuildContext context, WidgetRef ref) async {
    final reason = await _promptReason(
      context,
      title: 'Suspend this startup?',
      actionLabel: 'Suspend',
    );
    if (reason != null && reason.isNotEmpty) {
      await ref.read(adminStartupControllerProvider.notifier).suspend(startup.founderId, reason);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPending = startup.verificationStatus == VerificationStatus.pending;

    return AppCard(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => StartupProfileScreen(startupId: startup.founderId),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Avatar(imageUrl: startup.logoUrl, name: startup.name ?? 'Startup', size: AvatarSize.small),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      startup.name ?? '',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    if ((startup.industry ?? '').isNotEmpty)
                      Text(startup.industry!, style: const TextStyle(color: AppColors.textSecondary)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.sm,
            children: [
              VerificationBadge(status: startup.verificationStatus),
              if (startup.isSuspended) const AppChip(label: 'Suspended', icon: Icons.block),
            ],
          ),
          if (isPending) ...[
            const SizedBox(height: AppSpacing.sm),
            StartupVerificationDocuments(startup: startup),
          ],
          const SizedBox(height: AppSpacing.sm),
          if (isPending) ...[
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    label: 'Reject',
                    variant: AppButtonVariant.outlined,
                    onPressed: () => _reject(context, ref),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: AppButton(
                    label: 'Approve',
                    onPressed: () =>
                        ref.read(adminStartupControllerProvider.notifier).approve(startup.founderId),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
          ],
          AppButton(
            label: startup.isSuspended ? 'Unsuspend startup' : 'Suspend startup',
            variant: AppButtonVariant.outlined,
            icon: startup.isSuspended ? Icons.play_circle_outline : Icons.block,
            onPressed: startup.isSuspended
                ? () => ref.read(adminStartupControllerProvider.notifier).unsuspend(startup.founderId)
                : () => _suspend(context, ref),
            fullWidth: true,
          ),
        ],
      ),
    );
  }
}
