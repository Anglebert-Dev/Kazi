import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/index.dart';
import '../../../settings/screens/settings_screen.dart';
import '../providers/admin_startup_providers.dart';
import '../widgets/pending_startup_card.dart';

class AdminStartupsScreen extends ConsumerWidget {
  const AdminStartupsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pendingAsync = ref.watch(pendingStartupsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Verification'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => const SettingsScreen())),
          ),
        ],
      ),
      body: pendingAsync.when(
        data: (startups) => startups.isEmpty
            ? const EmptyState(
                icon: Icons.verified_outlined,
                title: 'All caught up',
                message: 'No startups are waiting for verification.',
              )
            : ListView.builder(
                padding: const EdgeInsets.all(AppSpacing.lg),
                itemCount: startups.length,
                itemBuilder: (context, index) => PendingStartupCard(startup: startups[index]),
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Could not load startups: $error')),
      ),
    );
  }
}
