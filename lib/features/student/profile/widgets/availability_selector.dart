import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/index.dart';
import '../models/availability_status.dart';

class AvailabilitySelector extends StatelessWidget {
  const AvailabilitySelector({super.key, required this.value, required this.onChanged});

  final AvailabilityStatus value;
  final ValueChanged<AvailabilityStatus> onChanged;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.sm,
      children: [
        for (final status in AvailabilityStatus.values)
          AppChip(
            label: status.label,
            selected: value == status,
            onTap: () => onChanged(status),
          ),
      ],
    );
  }
}
