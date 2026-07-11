import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/widgets/index.dart';
import '../../authentication/utils/auth_error_message.dart';
import '../providers/settings_controller.dart';

class ChangePasswordForm extends ConsumerStatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  ConsumerState<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends ConsumerState<ChangePasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    await ref
        .read(settingsControllerProvider.notifier)
        .updatePassword(
          currentPassword: _currentPasswordController.text,
          newPassword: _newPasswordController.text,
        );

    if (!mounted) return;

    final error = ref.read(settingsControllerProvider).error;
    if (error != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(authErrorMessage(error))));
    } else {
      _currentPasswordController.clear();
      _newPasswordController.clear();
      _confirmPasswordController.clear();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Password updated')));
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
          const SectionHeader(title: 'Change password'),
          const SizedBox(height: AppSpacing.sm),
          AppTextField(
            controller: _currentPasswordController,
            label: 'Current password',
            obscureText: true,
            validator: (value) => (value == null || value.isEmpty) ? 'Required' : null,
          ),
          const SizedBox(height: AppSpacing.sm),
          AppTextField(
            controller: _newPasswordController,
            label: 'New password',
            obscureText: true,
            validator: (value) =>
                (value == null || value.length < 6) ? 'Minimum 6 characters' : null,
          ),
          const SizedBox(height: AppSpacing.sm),
          AppTextField(
            controller: _confirmPasswordController,
            label: 'Confirm new password',
            obscureText: true,
            validator: (value) =>
                value != _newPasswordController.text ? 'Passwords do not match' : null,
          ),
          const SizedBox(height: AppSpacing.sm),
          AppButton(
            label: 'Change password',
            isLoading: isLoading,
            onPressed: _submit,
            fullWidth: true,
          ),
        ],
      ),
    );
  }
}
