import 'package:flutter/material.dart';

import '../../../core/constants/app_spacing.dart';
import '../widgets/change_password_form.dart';
import '../widgets/logout_button.dart';
import '../widgets/update_name_form.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UpdateNameForm(),
            SizedBox(height: AppSpacing.xl),
            ChangePasswordForm(),
            SizedBox(height: AppSpacing.xl),
            LogoutButton(),
          ],
        ),
      ),
    );
  }
}
