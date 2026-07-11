import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/index.dart';
import '../../../opportunities/models/opportunity.dart';
import '../../../opportunities/providers/opportunity_controller.dart';
import '../../../opportunities/utils/deadline_label.dart';

class FounderOpportunityListTile extends ConsumerWidget {
  const FounderOpportunityListTile({super.key, required this.opportunity, required this.onEdit});

  final Opportunity opportunity;
  final VoidCallback onEdit;

  Future<void> _confirmAndDelete(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete opportunity?'),
        content: Text('This permanently removes "${opportunity.title}".'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await ref.read(opportunityControllerProvider.notifier).delete(opportunity.id);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppCard(
      onTap: onEdit,
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  opportunity.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.edit_outlined),
                onPressed: onEdit,
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline, color: AppColors.error),
                onPressed: () => _confirmAndDelete(context, ref),
              ),
            ],
          ),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              AppChip(label: opportunity.category),
              AppChip(label: opportunity.isRemote ? 'Remote' : 'Onsite'),
              AppChip(label: opportunity.isPaid ? 'Paid' : 'Unpaid'),
              if ((opportunity.location ?? '').isNotEmpty)
                AppChip(label: opportunity.location!, icon: Icons.location_on_outlined),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            deadlineLabel(opportunity.deadline),
            style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
