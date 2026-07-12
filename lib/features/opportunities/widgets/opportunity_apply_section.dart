import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/index.dart';
import '../../applications/providers/application_providers.dart';
import '../../applications/screens/application_detail_screen.dart';
import '../../applications/widgets/application_status_badge.dart';
import '../../authentication/models/user_role.dart';
import '../../authentication/providers/auth_providers.dart';
import '../../student/applications/screens/opportunity_apply_screen.dart';
import '../models/opportunity.dart';

class OpportunityApplySection extends ConsumerWidget {
  const OpportunityApplySection({super.key, required this.opportunity});

  final Opportunity opportunity;

  Future<void> _emailCv() async {
    final uri = Uri(
      scheme: 'mailto',
      path: opportunity.applicationEmail,
      query: 'subject=${Uri.encodeComponent('Application for ${opportunity.title}')}',
    );
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userModel = ref.watch(currentUserModelProvider).valueOrNull;
    final existingApplication = userModel == null
        ? null
        : ref
              .watch(applicationForOpportunityProvider(userModel.uid, opportunity.id))
              .valueOrNull;

    if (userModel?.role != UserRole.student) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'How to apply'),
        const SizedBox(height: AppSpacing.sm),
        if (existingApplication != null) ...[
          ApplicationStatusBadge(status: existingApplication.status),
          const SizedBox(height: AppSpacing.sm),
          AppButton(
            label: 'View application',
            icon: Icons.assignment_outlined,
            variant: AppButtonVariant.secondary,
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ApplicationDetailScreen(application: existingApplication),
              ),
            ),
            fullWidth: true,
          ),
        ] else if (!opportunity.isAcceptingApplications) ...[
          Row(
            children: [
              const Icon(Icons.block, color: AppColors.textSecondary, size: 18),
              const SizedBox(width: AppSpacing.xs),
              Text(
                opportunity.applicationStatusLabel,
                style: const TextStyle(color: AppColors.textSecondary),
              ),
            ],
          ),
        ] else
          AppButton(
            label: 'Apply now',
            icon: Icons.send_outlined,
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => OpportunityApplyScreen(opportunity: opportunity),
              ),
            ),
            fullWidth: true,
          ),
        if (opportunity.isAcceptingApplications && opportunity.applicationEmail.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.sm),
          Center(
            child: TextButton(
              onPressed: _emailCv,
              child: Text(
                'Or email directly: ${opportunity.applicationEmail}',
                style: const TextStyle(color: AppColors.textSecondary),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
