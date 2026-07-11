import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/index.dart';
import '../../../authentication/models/user_role.dart';
import '../../../authentication/providers/auth_providers.dart';
import '../../../settings/screens/settings_screen.dart';
import '../providers/admin_user_controller.dart';
import '../providers/admin_user_providers.dart';
import '../widgets/user_list_tile.dart';

const _filters = ['All', 'Student', 'Founder', 'Admin'];

class AdminUsersScreen extends ConsumerStatefulWidget {
  const AdminUsersScreen({super.key});

  @override
  ConsumerState<AdminUsersScreen> createState() => _AdminUsersScreenState();
}

class _AdminUsersScreenState extends ConsumerState<AdminUsersScreen> {
  String _filter = 'All';

  @override
  Widget build(BuildContext context) {
    final usersAsync = ref.watch(allUsersProvider);
    final currentUid = ref.watch(authStateChangesProvider).valueOrNull?.uid;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => const SettingsScreen())),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: SingleSelectChipGroup(
              options: _filters,
              selected: _filter,
              onChanged: (value) => setState(() => _filter = value),
            ),
          ),
          Expanded(
            child: usersAsync.when(
              data: (users) {
                final filtered = _filter == 'All'
                    ? users
                    : users
                          .where((user) => user.role?.label == _filter)
                          .toList();

                return filtered.isEmpty
                    ? const EmptyState(
                        icon: Icons.people_outline,
                        title: 'No users found',
                        message: 'Nobody matches this filter yet.',
                      )
                    : ListView.builder(
                        itemCount: filtered.length,
                        itemBuilder: (context, index) {
                          final user = filtered[index];
                          return UserListTile(
                            user: user,
                            isSelf: user.uid == currentUid,
                            onChangeRole: (role) => ref
                                .read(adminUserControllerProvider.notifier)
                                .changeRole(user.uid, role),
                            onChangeStatus: (status) => ref
                                .read(adminUserControllerProvider.notifier)
                                .changeStatus(user.uid, status),
                          );
                        },
                      );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Center(child: Text('Could not load users: $error')),
            ),
          ),
        ],
      ),
    );
  }
}
