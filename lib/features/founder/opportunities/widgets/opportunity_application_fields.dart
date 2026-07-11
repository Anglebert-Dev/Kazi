import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/index.dart';

class OpportunityApplicationFields extends StatelessWidget {
  const OpportunityApplicationFields({
    super.key,
    required this.responsibilitiesController,
    required this.benefitsController,
    required this.applicationEmailController,
  });

  final TextEditingController responsibilitiesController;
  final TextEditingController benefitsController;
  final TextEditingController applicationEmailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextField(
          controller: responsibilitiesController,
          label: 'Responsibilities',
          maxLines: 3,
        ),
        const SizedBox(height: AppSpacing.md),
        AppTextField(controller: benefitsController, label: 'Benefits', maxLines: 3),
        const SizedBox(height: AppSpacing.lg),
        const SectionHeader(title: 'How to apply'),
        const SizedBox(height: AppSpacing.sm),
        AppTextField(
          controller: applicationEmailController,
          label: 'Application email',
          hint: 'Where should CVs be sent?',
          keyboardType: TextInputType.emailAddress,
          validator: (value) =>
              (value == null || !value.contains('@')) ? 'Enter a valid email' : null,
        ),
      ],
    );
  }
}
