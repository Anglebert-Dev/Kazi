import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/index.dart';
import '../models/startup_stage.dart';

class StageSelector extends StatelessWidget {
  const StageSelector({super.key, required this.value, required this.onChanged});

  final StartupStage value;
  final ValueChanged<StartupStage> onChanged;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: [
        for (final stage in StartupStage.values)
          AppChip(
            label: stage.label,
            selected: value == stage,
            onTap: () => onChanged(stage),
          ),
      ],
    );
  }
}
