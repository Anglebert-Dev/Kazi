import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/index.dart';
import '../models/hiring_status.dart';

class HiringStatusSelector extends StatelessWidget {
  const HiringStatusSelector({super.key, required this.value, required this.onChanged});

  final HiringStatus value;
  final ValueChanged<HiringStatus> onChanged;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.sm,
      children: [
        for (final status in HiringStatus.values)
          AppChip(
            label: status.label,
            selected: value == status,
            onTap: () => onChanged(status),
          ),
      ],
    );
  }
}
