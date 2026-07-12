import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/widgets/index.dart';
import '../models/report_reason.dart';
import '../providers/report_controller.dart';

class ReportStartupDialog extends ConsumerStatefulWidget {
  const ReportStartupDialog({super.key, required this.startupId, required this.startupName});

  final String startupId;
  final String startupName;

  static Future<void> show(
    BuildContext context, {
    required String startupId,
    required String startupName,
  }) {
    return showDialog(
      context: context,
      builder: (context) =>
          ReportStartupDialog(startupId: startupId, startupName: startupName),
    );
  }

  @override
  ConsumerState<ReportStartupDialog> createState() => _ReportStartupDialogState();
}

class _ReportStartupDialogState extends ConsumerState<ReportStartupDialog> {
  ReportReason _reason = ReportReason.spam;
  final _detailsController = TextEditingController();

  @override
  void dispose() {
    _detailsController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    await ref
        .read(reportControllerProvider.notifier)
        .submit(
          startupId: widget.startupId,
          startupName: widget.startupName,
          reason: _reason,
          details: _detailsController.text.trim().isEmpty ? null : _detailsController.text.trim(),
        );
    if (mounted) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Report submitted')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isSubmitting = ref.watch(reportControllerProvider).isLoading;

    return AlertDialog(
      title: const Text('Report startup'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleSelectChipGroup(
              options: [for (final reason in ReportReason.values) reason.label],
              selected: _reason.label,
              onChanged: (label) => setState(
                () => _reason = ReportReason.values.firstWhere((r) => r.label == label),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            TextField(
              controller: _detailsController,
              maxLines: 3,
              decoration: const InputDecoration(labelText: 'Details (optional)'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
        TextButton(onPressed: isSubmitting ? null : _submit, child: const Text('Submit')),
      ],
    );
  }
}
