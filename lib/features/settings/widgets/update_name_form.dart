import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/widgets/index.dart';
import '../../authentication/providers/auth_providers.dart';
import '../providers/settings_controller.dart';

class UpdateNameForm extends ConsumerStatefulWidget {
  const UpdateNameForm({super.key});

  @override
  ConsumerState<UpdateNameForm> createState() => _UpdateNameFormState();
}

class _UpdateNameFormState extends ConsumerState<UpdateNameForm> {
  final _formKey = GlobalKey<FormState>();
  late final _nameController = TextEditingController(
    text: ref.read(currentUserModelProvider).valueOrNull?.displayName,
  );

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    await ref.read(settingsControllerProvider.notifier).updateName(_nameController.text.trim());
    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Name updated')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(settingsControllerProvider).isLoading;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Personal info'),
          const SizedBox(height: AppSpacing.sm),
          AppTextField(
            controller: _nameController,
            label: 'Name',
            hint: 'e.g. Ada Lovelace',
            validator: (value) =>
                (value == null || value.trim().isEmpty) ? 'Enter your name' : null,
          ),
          const SizedBox(height: AppSpacing.sm),
          AppButton(label: 'Save name', isLoading: isLoading, onPressed: _save, fullWidth: true),
        ],
      ),
    );
  }
}
