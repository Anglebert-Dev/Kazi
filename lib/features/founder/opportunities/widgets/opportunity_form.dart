import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/index.dart';
import '../../../opportunities/models/opportunity.dart';
import '../../../opportunities/providers/opportunity_controller.dart';
import '../../startup/models/startup.dart';
import 'opportunity_application_fields.dart';
import 'opportunity_basic_fields.dart';
import 'opportunity_category_fields.dart';
import 'opportunity_logistics_fields.dart';

class OpportunityForm extends ConsumerStatefulWidget {
  const OpportunityForm({super.key, required this.startup, this.opportunity, this.onSaved});

  final Startup startup;
  final Opportunity? opportunity;
  final VoidCallback? onSaved;

  @override
  ConsumerState<OpportunityForm> createState() => _OpportunityFormState();
}

class _OpportunityFormState extends ConsumerState<OpportunityForm> {
  final _formKey = GlobalKey<FormState>();
  late final _titleController = TextEditingController(text: widget.opportunity?.title);
  late final _descriptionController = TextEditingController(text: widget.opportunity?.description);
  late final _durationController = TextEditingController(text: widget.opportunity?.duration);
  late final _locationController = TextEditingController(text: widget.opportunity?.location);
  late final _responsibilitiesController = TextEditingController(
    text: widget.opportunity?.responsibilities,
  );
  late final _benefitsController = TextEditingController(text: widget.opportunity?.benefits);
  late final _applicationEmailController = TextEditingController(
    text: widget.opportunity?.applicationEmail,
  );

  late String? _category = widget.opportunity?.category;
  late List<String> _requiredSkills = List.of(widget.opportunity?.requiredSkills ?? const []);
  late bool _isPaid = widget.opportunity?.isPaid ?? false;
  late bool _isRemote = widget.opportunity?.isRemote ?? false;
  late DateTime _deadline = widget.opportunity?.deadline ?? DateTime.now().add(const Duration(days: 30));

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _durationController.dispose();
    _locationController.dispose();
    _responsibilitiesController.dispose();
    _benefitsController.dispose();
    _applicationEmailController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final base =
        widget.opportunity ??
        Opportunity.draft(
          startupId: widget.startup.founderId,
          startupName: widget.startup.name ?? '',
          startupLogoUrl: widget.startup.logoUrl,
          deadline: _deadline,
        );

    final opportunity = base.copyWith(
      title: _titleController.text.trim(),
      description: _descriptionController.text.trim(),
      category: _category ?? '',
      requiredSkills: _requiredSkills,
      duration: _durationController.text.trim(),
      location: _locationController.text.trim(),
      isPaid: _isPaid,
      isRemote: _isRemote,
      deadline: _deadline,
      responsibilities: _responsibilitiesController.text.trim(),
      benefits: _benefitsController.text.trim(),
      applicationEmail: _applicationEmailController.text.trim(),
    );

    final controller = ref.read(opportunityControllerProvider.notifier);
    if (widget.opportunity == null) {
      await controller.create(opportunity);
    } else {
      await controller.save(opportunity);
    }

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Opportunity saved')));
      widget.onSaved?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isSaving = ref.watch(opportunityControllerProvider).isLoading;

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OpportunityBasicFields(
              titleController: _titleController,
              descriptionController: _descriptionController,
              durationController: _durationController,
              locationController: _locationController,
            ),
            const SizedBox(height: AppSpacing.lg),
            OpportunityCategoryFields(
              selectedCategory: _category,
              onCategoryChanged: (v) => setState(() => _category = v),
              selectedSkills: _requiredSkills,
              onSkillsChanged: (v) => setState(() => _requiredSkills = v),
            ),
            const SizedBox(height: AppSpacing.lg),
            OpportunityLogisticsFields(
              isPaid: _isPaid,
              isRemote: _isRemote,
              deadline: _deadline,
              onPaidChanged: (v) => setState(() => _isPaid = v),
              onRemoteChanged: (v) => setState(() => _isRemote = v),
              onDeadlineChanged: (v) => setState(() => _deadline = v),
            ),
            const SizedBox(height: AppSpacing.lg),
            OpportunityApplicationFields(
              responsibilitiesController: _responsibilitiesController,
              benefitsController: _benefitsController,
              applicationEmailController: _applicationEmailController,
            ),
            const SizedBox(height: AppSpacing.lg),
            AppButton(
              label: 'Save opportunity',
              isLoading: isSaving,
              onPressed: _save,
              fullWidth: true,
            ),
          ],
        ),
      ),
    );
  }
}
