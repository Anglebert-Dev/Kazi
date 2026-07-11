import 'package:flutter/material.dart';

import '../constants/app_spacing.dart';
import 'app_chip.dart';

class SingleSelectChipGroup extends StatelessWidget {
  const SingleSelectChipGroup({
    super.key,
    required this.options,
    required this.selected,
    required this.onChanged,
  });

  final List<String> options;
  final String? selected;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: [
        for (final option in options)
          AppChip(
            label: option,
            selected: selected == option,
            onTap: () => onChanged(option),
          ),
      ],
    );
  }
}
