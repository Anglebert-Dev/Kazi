import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/index.dart';
import '../../../opportunities/models/opportunity.dart';
import '../../../applications/providers/application_controller.dart';
import '../../profile/providers/student_profile_providers.dart';
import '../../profile/screens/student_profile_screen.dart';

class OpportunityApplyScreen extends ConsumerStatefulWidget {
  const OpportunityApplyScreen({super.key, required this.opportunity});

  final Opportunity opportunity;

  @override
  ConsumerState<OpportunityApplyScreen> createState() => _OpportunityApplyScreenState();
}

class _OpportunityApplyScreenState extends ConsumerState<OpportunityApplyScreen> {
  final _formKey = GlobalKey<FormState>();
  final _coverNoteController = TextEditingController();
  late final _portfolioController = TextEditingController(
    text: ref.read(currentStudentProfileProvider).valueOrNull?.portfolioUrl,
  );

  @override
  void dispose() {
    _coverNoteController.dispose();
    _portfolioController.dispose();
    super.dispose();
  }

  Future<void> _submit(String cvUrl) async {
    if (!_formKey.currentState!.validate()) return;

    await ref
        .read(applicationControllerProvider.notifier)
        .apply(
          opportunity: widget.opportunity,
          coverNote: _coverNoteController.text.trim(),
          cvUrl: cvUrl,
          portfolioLink: _portfolioController.text.trim(),
        );

    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Application submitted')));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cvUrl = ref.watch(currentStudentProfileProvider).valueOrNull?.cvUrl;
    final isSubmitting = ref.watch(applicationControllerProvider).isLoading;

    return Scaffold(
      appBar: AppBar(title: Text('Apply — ${widget.opportunity.title}')),
      body: (cvUrl == null || cvUrl.isEmpty)
          ? EmptyState(
              icon: Icons.description_outlined,
              title: 'Add a CV first',
              message: 'Upload a CV to your profile before applying to opportunities.',
              actionLabel: 'Go to profile',
              onActionTap: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => const StudentProfileScreen())),
            )
          : Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextField(
                      controller: _coverNoteController,
                      label: 'Cover note',
                      hint: 'Tell them why you\'re a great fit for this role...',
                      minLines: 10,
                      maxLines: 20,
                      validator: (value) =>
                          (value == null || value.trim().isEmpty) ? 'Add a cover note' : null,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    AppTextField(controller: _portfolioController, label: 'Portfolio link'),
                    const SizedBox(height: AppSpacing.lg),
                    AppButton(
                      label: 'Submit application',
                      isLoading: isSubmitting,
                      onPressed: () => _submit(cvUrl),
                      fullWidth: true,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
