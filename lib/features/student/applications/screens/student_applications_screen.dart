import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/index.dart';
import '../../../applications/providers/application_providers.dart';
import '../../../applications/screens/application_detail_screen.dart';
import '../../../authentication/providers/auth_providers.dart';
import '../widgets/student_application_list_tile.dart';

class StudentApplicationsScreen extends ConsumerWidget {
  const StudentApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userModel = ref.watch(currentUserModelProvider).valueOrNull;

    if (userModel == null) {
      return Scaffold(appBar: AppBar(title: const Text('Applications')));
    }

    final applicationsAsync = ref.watch(studentApplicationsProvider(userModel.uid));

    return Scaffold(
      appBar: AppBar(title: const Text('Applications')),
      body: applicationsAsync.when(
        data: (applications) => applications.isEmpty
            ? const EmptyState(
                icon: Icons.assignment_outlined,
                title: 'No applications yet',
                message: 'Opportunities you apply to will show up here.',
              )
            : ListView.builder(
                padding: const EdgeInsets.all(AppSpacing.lg),
                itemCount: applications.length,
                itemBuilder: (context, index) {
                  final application = applications[index];
                  return StudentApplicationListTile(
                    application: application,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ApplicationDetailScreen(application: application),
                      ),
                    ),
                  );
                },
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Could not load applications: $error')),
      ),
    );
  }
}
