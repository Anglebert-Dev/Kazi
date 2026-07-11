import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/index.dart';

class SkillChipSelector extends StatelessWidget {
  const SkillChipSelector({
    super.key,
    required this.options,
    required this.selected,
    required this.onChanged,
  });

  final List<String> options;
  final List<String> selected;
  final ValueChanged<List<String>> onChanged;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: [
        for (final option in options)
          AppChip(
            label: option,
            selected: selected.contains(option),
            onTap: () {
              final next = List<String>.of(selected);
              next.contains(option) ? next.remove(option) : next.add(option);
              onChanged(next);
            },
          ),
      ],
    );
  }
}
