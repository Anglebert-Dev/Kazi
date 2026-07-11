import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../authentication/providers/auth_controller.dart';
import '../providers/student_profile_providers.dart';
import '../widgets/student_profile_form.dart';
import '../widgets/student_profile_summary.dart';

class StudentProfileScreen extends ConsumerStatefulWidget {
  const StudentProfileScreen({super.key});

  @override
  ConsumerState<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends ConsumerState<StudentProfileScreen> {
  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    final profileAsync = ref.watch(currentStudentProfileProvider);
    final profile = profileAsync.valueOrNull;
    final hasProfile =
        profile != null &&
        (profile.bio?.isNotEmpty == true ||
            profile.degree?.isNotEmpty == true ||
            profile.skills.isNotEmpty);
    final showForm = _isEditing || !hasProfile;

    return Scaffold(
      appBar: AppBar(
        title: Text(showForm ? 'Edit profile' : 'Profile'),
        leading: (showForm && hasProfile)
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => setState(() => _isEditing = false),
              )
            : null,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(authControllerProvider.notifier).signOut(),
          ),
        ],
      ),
      body: profileAsync.when(
        data: (profile) => showForm
            ? StudentProfileForm(
                profile: profile,
                onSaved: () => setState(() => _isEditing = false),
              )
            : StudentProfileSummary(
                profile: profile,
                onEdit: () => setState(() => _isEditing = true),
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Could not load profile: $error')),
      ),
    );
  }
}
