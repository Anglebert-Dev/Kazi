import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/index.dart';
import '../../../admin/startups/providers/admin_startup_controller.dart';
import '../../../opportunities/screens/startup_profile_screen.dart';
import '../../../reports/models/report.dart';
import '../../../reports/models/report_reason.dart';
import '../../../reports/providers/report_controller.dart';

class ReportListTile extends ConsumerWidget {
  const ReportListTile({super.key, required this.report});

  final Report report;

  Future<void> _suspend(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Suspend this startup?'),
        content: Text(
          'This blocks "${report.startupName}" from posting or editing opportunities '
          'until an admin reverses it.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Suspend'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    await ref
        .read(adminStartupControllerProvider.notifier)
        .suspend(report.startupId, '${report.reason.label}: ${report.details ?? 'no details'}');
    await ref.read(reportControllerProvider.notifier).resolve(report.id);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppCard(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => StartupProfileScreen(startupId: report.startupId),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  report.startupName,
                  style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.textPrimary),
                ),
              ),
              AppChip(label: report.reason.label),
            ],
          ),
          if ((report.details ?? '').isNotEmpty) ...[
            const SizedBox(height: AppSpacing.xs),
            Text(report.details!, style: const TextStyle(color: AppColors.textSecondary)),
          ],
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              Expanded(
                child: AppButton(
                  label: 'Dismiss',
                  variant: AppButtonVariant.outlined,
                  onPressed: () =>
                      ref.read(reportControllerProvider.notifier).dismiss(report.id),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: AppButton(
                  label: 'Suspend startup',
                  onPressed: () => _suspend(context, ref),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
