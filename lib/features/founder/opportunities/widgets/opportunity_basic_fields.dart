import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/index.dart';

class OpportunityBasicFields extends StatelessWidget {
  const OpportunityBasicFields({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.durationController,
    required this.locationController,
  });

  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController durationController;
  final TextEditingController locationController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextField(
          controller: titleController,
          label: 'Title',
          validator: (value) => (value == null || value.trim().isEmpty) ? 'Enter a title' : null,
        ),
        const SizedBox(height: AppSpacing.md),
        AppTextField(controller: descriptionController, label: 'Description', maxLines: 4),
        const SizedBox(height: AppSpacing.md),
        AppTextField(controller: durationController, label: 'Duration (e.g. 3 months)'),
        const SizedBox(height: AppSpacing.md),
        AppTextField(controller: locationController, label: 'Location (e.g. Kigali, Rwanda)'),
      ],
    );
  }
}
