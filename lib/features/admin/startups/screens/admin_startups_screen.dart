import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/index.dart';
import '../../../founder/startup/models/verification_status.dart';
import '../../../settings/screens/settings_screen.dart';
import '../providers/admin_startup_providers.dart';
import '../widgets/admin_startup_list_tile.dart';

const _filters = ['All', 'Pending', 'Approved', 'Rejected', 'Suspended'];

class AdminStartupsScreen extends ConsumerStatefulWidget {
  const AdminStartupsScreen({super.key});

  @override
  ConsumerState<AdminStartupsScreen> createState() => _AdminStartupsScreenState();
}

class _AdminStartupsScreenState extends ConsumerState<AdminStartupsScreen> {
  String _filter = 'All';

  @override
  Widget build(BuildContext context) {
    final startupsAsync = ref.watch(allStartupsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Startups'),
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
            child: startupsAsync.when(
              data: (startups) {
                final filtered = switch (_filter) {
                  'Pending' => startups
                      .where((s) => s.verificationStatus == VerificationStatus.pending)
                      .toList(),
                  'Approved' => startups
                      .where((s) => s.verificationStatus == VerificationStatus.approved)
                      .toList(),
                  'Rejected' => startups
                      .where((s) => s.verificationStatus == VerificationStatus.rejected)
                      .toList(),
                  'Suspended' => startups.where((s) => s.isSuspended).toList(),
                  _ => startups,
                };

                return filtered.isEmpty
                    ? const EmptyState(
                        icon: Icons.storefront_outlined,
                        title: 'No startups found',
                        message: 'Nothing matches this filter yet.',
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                        itemCount: filtered.length,
                        itemBuilder: (context, index) =>
                            AdminStartupListTile(startup: filtered[index]),
                      );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Center(child: Text('Could not load startups: $error')),
            ),
          ),
        ],
      ),
    );
  }
}
