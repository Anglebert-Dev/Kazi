import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/index.dart';

class OpportunityLogisticsFields extends StatelessWidget {
  const OpportunityLogisticsFields({
    super.key,
    required this.isPaid,
    required this.isRemote,
    required this.deadline,
    required this.onPaidChanged,
    required this.onRemoteChanged,
    required this.onDeadlineChanged,
  });

  final bool isPaid;
  final bool isRemote;
  final DateTime deadline;
  final ValueChanged<bool> onPaidChanged;
  final ValueChanged<bool> onRemoteChanged;
  final ValueChanged<DateTime> onDeadlineChanged;

  Future<void> _pickDeadline(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: deadline,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
    );
    if (picked != null) onDeadlineChanged(picked);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: AppSpacing.sm,
          children: [
            AppChip(label: 'Paid', selected: isPaid, onTap: () => onPaidChanged(!isPaid)),
            AppChip(label: 'Remote', selected: isRemote, onTap: () => onRemoteChanged(!isRemote)),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        const SectionHeader(title: 'Application deadline'),
        const SizedBox(height: AppSpacing.sm),
        AppButton(
          label: DateFormat('MMM d, yyyy').format(deadline),
          icon: Icons.calendar_today,
          variant: AppButtonVariant.secondary,
          onPressed: () => _pickDeadline(context),
        ),
      ],
    );
  }
}
