import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/index.dart';
import '../models/hiring_status.dart';
import '../models/startup.dart';
import '../models/startup_stage.dart';
import '../providers/startup_controller.dart';
import 'hiring_status_selector.dart';
import 'stage_selector.dart';
import 'startup_logo_picker.dart';

class StartupForm extends ConsumerStatefulWidget {
  const StartupForm({super.key, required this.startup, this.onSaved});

  final Startup startup;
  final VoidCallback? onSaved;

  @override
  ConsumerState<StartupForm> createState() => _StartupFormState();
}

class _StartupFormState extends ConsumerState<StartupForm> {
  final _formKey = GlobalKey<FormState>();
  late final _nameController = TextEditingController(text: widget.startup.name);
  late final _industryController = TextEditingController(text: widget.startup.industry);
  late final _descriptionController = TextEditingController(text: widget.startup.description);
  late final _websiteController = TextEditingController(text: widget.startup.website);

  late StartupStage _stage = widget.startup.stage;
  late HiringStatus _hiringStatus = widget.startup.hiringStatus;
  late String? _logoUrl = widget.startup.logoUrl;

  @override
  void dispose() {
    _nameController.dispose();
    _industryController.dispose();
    _descriptionController.dispose();
    _websiteController.dispose();
    super.dispose();
  }

  void _showUploadError() {
    final error = ref.read(startupControllerProvider).error;
    if (error == null || !mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Upload failed: $error')));
  }

  Future<void> _pickLogo() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (picked == null) return;

    final url = await ref.read(startupControllerProvider.notifier).uploadLogo(picked.path);
    if (url != null) {
      setState(() => _logoUrl = url);
    } else {
      _showUploadError();
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final startup = widget.startup.copyWith(
      name: _nameController.text.trim(),
      industry: _industryController.text.trim(),
      description: _descriptionController.text.trim(),
      website: _websiteController.text.trim(),
      stage: _stage,
      hiringStatus: _hiringStatus,
      logoUrl: _logoUrl,
    );

    await ref.read(startupControllerProvider.notifier).save(startup);
    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Startup profile saved')));
      widget.onSaved?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isSaving = ref.watch(startupControllerProvider).isLoading;

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: StartupLogoPicker(
                logoUrl: _logoUrl,
                startupName: widget.startup.name ?? 'Startup',
                onTap: _pickLogo,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppTextField(
              controller: _nameController,
              label: 'Startup name',
              validator: (value) =>
                  (value == null || value.trim().isEmpty) ? 'Enter a startup name' : null,
            ),
            const SizedBox(height: AppSpacing.md),
            AppTextField(controller: _industryController, label: 'Industry'),
            const SizedBox(height: AppSpacing.md),
            AppTextField(controller: _descriptionController, label: 'Description', maxLines: 4),
            const SizedBox(height: AppSpacing.md),
            AppTextField(controller: _websiteController, label: 'Website'),
            const SizedBox(height: AppSpacing.lg),
            const SectionHeader(title: 'Stage'),
            const SizedBox(height: AppSpacing.sm),
            StageSelector(value: _stage, onChanged: (v) => setState(() => _stage = v)),
            const SizedBox(height: AppSpacing.lg),
            const SectionHeader(title: 'Hiring status'),
            const SizedBox(height: AppSpacing.sm),
            HiringStatusSelector(
              value: _hiringStatus,
              onChanged: (v) => setState(() => _hiringStatus = v),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppButton(
              label: 'Save startup',
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
