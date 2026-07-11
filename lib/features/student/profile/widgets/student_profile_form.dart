import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/index.dart';
import '../constants/skill_options.dart';
import '../models/availability_status.dart';
import '../models/student_profile.dart';
import '../providers/student_profile_controller.dart';
import 'availability_selector.dart';
import 'cv_upload_field.dart';
import 'profile_avatar_picker.dart';
import 'profile_links_section.dart';
import 'skill_chip_selector.dart';

class StudentProfileForm extends ConsumerStatefulWidget {
  const StudentProfileForm({super.key, required this.profile, this.onSaved});

  final StudentProfile profile;
  final VoidCallback? onSaved;

  @override
  ConsumerState<StudentProfileForm> createState() => _StudentProfileFormState();
}

class _StudentProfileFormState extends ConsumerState<StudentProfileForm> {
  late final _bioController = TextEditingController(text: widget.profile.bio);
  late final _degreeController = TextEditingController(text: widget.profile.degree);
  late final _gradYearController = TextEditingController(
    text: widget.profile.graduationYear?.toString() ?? '',
  );
  late final _portfolioController = TextEditingController(text: widget.profile.portfolioUrl);
  late final _githubController = TextEditingController(text: widget.profile.githubUrl);
  late final _linkedinController = TextEditingController(text: widget.profile.linkedinUrl);

  late List<String> _skills = List.of(widget.profile.skills);
  late List<String> _interests = List.of(widget.profile.interests);
  late AvailabilityStatus _availability = widget.profile.availability;
  late String? _photoUrl = widget.profile.photoUrl;
  late String? _cvUrl = widget.profile.cvUrl;
  bool _isUploadingCv = false;
  bool _cvUploadFailed = false;

  @override
  void dispose() {
    _bioController.dispose();
    _degreeController.dispose();
    _gradYearController.dispose();
    _portfolioController.dispose();
    _githubController.dispose();
    _linkedinController.dispose();
    super.dispose();
  }

  void _showUploadError() {
    final error = ref.read(studentProfileControllerProvider).error;
    if (error == null || !mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Upload failed: $error')));
  }

  Future<void> _pickAvatar() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (picked == null) return;

    final url = await ref
        .read(studentProfileControllerProvider.notifier)
        .uploadAvatar(picked.path);
    if (url != null) {
      setState(() => _photoUrl = url);
    } else {
      _showUploadError();
    }
  }

  Future<void> _pickCv() async {
    debugPrint('[CV upload] opening file picker');
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    final path = result?.files.single.path;
    if (path == null) {
      debugPrint('[CV upload] no file selected (path was null)');
      return;
    }

    debugPrint('[CV upload] selected file: $path');
    setState(() {
      _isUploadingCv = true;
      _cvUploadFailed = false;
    });

    final url = await ref.read(studentProfileControllerProvider.notifier).uploadCv(path);
    if (!mounted) return;

    if (url != null) {
      debugPrint('[CV upload] success: $url');
      setState(() {
        _cvUrl = url;
        _isUploadingCv = false;
      });
    } else {
      final error = ref.read(studentProfileControllerProvider).error;
      debugPrint('[CV upload] failed: $error');
      setState(() {
        _isUploadingCv = false;
        _cvUploadFailed = true;
      });
      _showUploadError();
    }
  }

  Future<void> _save() async {
    final profile = widget.profile.copyWith(
      bio: _bioController.text.trim(),
      degree: _degreeController.text.trim(),
      graduationYear: int.tryParse(_gradYearController.text.trim()),
      portfolioUrl: _portfolioController.text.trim(),
      githubUrl: _githubController.text.trim(),
      linkedinUrl: _linkedinController.text.trim(),
      skills: _skills,
      interests: _interests,
      availability: _availability,
      photoUrl: _photoUrl,
      cvUrl: _cvUrl,
    );

    await ref.read(studentProfileControllerProvider.notifier).save(profile);
    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Profile saved')));
      widget.onSaved?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isSaving = ref.watch(studentProfileControllerProvider).isLoading;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: ProfileAvatarPicker(photoUrl: _photoUrl, onTap: _pickAvatar)),
          const SizedBox(height: AppSpacing.lg),
          AppTextField(controller: _bioController, label: 'Bio', maxLines: 3),
          const SizedBox(height: AppSpacing.md),
          AppTextField(controller: _degreeController, label: 'Degree'),
          const SizedBox(height: AppSpacing.md),
          AppTextField(
            controller: _gradYearController,
            label: 'Graduation year',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: AppSpacing.lg),
          const SectionHeader(title: 'Skills'),
          const SizedBox(height: AppSpacing.sm),
          SkillChipSelector(
            options: skillOptions,
            selected: _skills,
            onChanged: (v) => setState(() => _skills = v),
          ),
          const SizedBox(height: AppSpacing.lg),
          const SectionHeader(title: 'Interests'),
          const SizedBox(height: AppSpacing.sm),
          SkillChipSelector(
            options: interestOptions,
            selected: _interests,
            onChanged: (v) => setState(() => _interests = v),
          ),
          const SizedBox(height: AppSpacing.lg),
          const SectionHeader(title: 'Availability'),
          const SizedBox(height: AppSpacing.sm),
          AvailabilitySelector(
            value: _availability,
            onChanged: (v) => setState(() => _availability = v),
          ),
          const SizedBox(height: AppSpacing.lg),
          ProfileLinksSection(
            portfolioController: _portfolioController,
            githubController: _githubController,
            linkedinController: _linkedinController,
          ),
          const SizedBox(height: AppSpacing.lg),
          CvUploadField(
            hasFile: _cvUrl != null,
            isUploading: _isUploadingCv,
            uploadFailed: _cvUploadFailed,
            onTap: _pickCv,
          ),
          const SizedBox(height: AppSpacing.lg),
          AppButton(label: 'Save profile', isLoading: isSaving, onPressed: _save, fullWidth: true),
        ],
      ),
    );
  }
}
