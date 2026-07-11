import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/index.dart';

class OpportunityFilters extends StatelessWidget {
  const OpportunityFilters({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategoryChanged,
    required this.remoteOnly,
    required this.onRemoteChanged,
    required this.paidOnly,
    required this.onPaidChanged,
  });

  final List<String> categories;
  final String? selectedCategory;
  final ValueChanged<String?> onCategoryChanged;
  final bool remoteOnly;
  final ValueChanged<bool> onRemoteChanged;
  final bool paidOnly;
  final ValueChanged<bool> onPaidChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: AppSpacing.sm,
          children: [
            AppChip(
              label: 'Remote only',
              selected: remoteOnly,
              onTap: () => onRemoteChanged(!remoteOnly),
            ),
            AppChip(
              label: 'Paid only',
              selected: paidOnly,
              onTap: () => onPaidChanged(!paidOnly),
            ),
          ],
        ),
        if (categories.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              AppChip(
                label: 'All categories',
                selected: selectedCategory == null,
                onTap: () => onCategoryChanged(null),
              ),
              for (final category in categories)
                AppChip(
                  label: category,
                  selected: selectedCategory == category,
                  onTap: () => onCategoryChanged(category),
                ),
            ],
          ),
        ],
      ],
    );
  }
}
