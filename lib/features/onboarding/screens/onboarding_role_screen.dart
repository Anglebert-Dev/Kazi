import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/theme/app_colors.dart';
import '../../authentication/models/user_role.dart';
import '../../authentication/providers/auth_controller.dart';
import '../../authentication/utils/auth_error_message.dart';
import '../providers/onboarding_controller.dart';
import '../widgets/role_option_card.dart';

class OnboardingRoleScreen extends ConsumerStatefulWidget {
  const OnboardingRoleScreen({super.key});

  @override
  ConsumerState<OnboardingRoleScreen> createState() => _OnboardingRoleScreenState();
}

class _OnboardingRoleScreenState extends ConsumerState<OnboardingRoleScreen> {
  Future<void> _selectRole(UserRole role) async {
    await ref.read(onboardingControllerProvider.notifier).selectRole(role);

    final error = ref.read(onboardingControllerProvider).error;
    if (error != null && mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(authErrorMessage(error))));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(onboardingControllerProvider).isLoading;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.xl),
              Text(
                'How will you use Kazi?',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              const Text(
                'This decides what your home screen looks like.',
                style: TextStyle(color: AppColors.textSecondary),
              ),
              const SizedBox(height: AppSpacing.xl),
              RoleOptionCard(
                icon: Icons.school_outlined,
                title: "I'm a Student",
                subtitle: 'Find internships at ALU startups',
                onTap: isLoading ? null : () => _selectRole(UserRole.student),
              ),
              const SizedBox(height: AppSpacing.md),
              RoleOptionCard(
                icon: Icons.rocket_launch_outlined,
                title: "I'm a Founder",
                subtitle: 'Recruit student talent for my startup',
                onTap: isLoading ? null : () => _selectRole(UserRole.founder),
              ),
              if (isLoading) ...[
                const SizedBox(height: AppSpacing.lg),
                const Center(child: CircularProgressIndicator()),
              ],
              const Spacer(),
              Center(
                child: TextButton(
                  onPressed: () => ref.read(authControllerProvider.notifier).signOut(),
                  child: const Text('Log out'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
