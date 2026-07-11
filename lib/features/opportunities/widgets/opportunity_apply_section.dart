import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/index.dart';

class OpportunityApplySection extends StatelessWidget {
  const OpportunityApplySection({
    super.key,
    required this.opportunityTitle,
    required this.applicationEmail,
  });

  final String opportunityTitle;
  final String applicationEmail;

  Future<void> _emailCv() async {
    final uri = Uri(
      scheme: 'mailto',
      path: applicationEmail,
      query: 'subject=${Uri.encodeComponent('Application for $opportunityTitle')}',
    );
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    if (applicationEmail.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'How to apply'),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Send your cover note and CV to $applicationEmail',
          style: const TextStyle(color: AppColors.textSecondary),
        ),
        const SizedBox(height: AppSpacing.sm),
        AppButton(
          label: 'Apply via email',
          icon: Icons.email_outlined,
          onPressed: _emailCv,
          fullWidth: true,
        ),
      ],
    );
  }
}
