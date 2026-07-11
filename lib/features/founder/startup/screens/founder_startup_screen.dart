import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../settings/screens/settings_screen.dart';
import '../providers/startup_providers.dart';
import '../widgets/startup_form.dart';
import '../widgets/startup_summary.dart';

class FounderStartupScreen extends ConsumerStatefulWidget {
  const FounderStartupScreen({super.key});

  @override
  ConsumerState<FounderStartupScreen> createState() => _FounderStartupScreenState();
}

class _FounderStartupScreenState extends ConsumerState<FounderStartupScreen> {
  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    final startupAsync = ref.watch(currentStartupProvider);
    final startup = startupAsync.valueOrNull;
    final hasStartup = startup != null && (startup.name ?? '').isNotEmpty;
    final showForm = _isEditing || !hasStartup;

    return Scaffold(
      appBar: AppBar(
        title: Text(showForm ? 'Edit startup' : 'Startup'),
        leading: (showForm && hasStartup)
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => setState(() => _isEditing = false),
              )
            : null,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => const SettingsScreen())),
          ),
        ],
      ),
      body: startupAsync.when(
        data: (startup) => showForm
            ? StartupForm(startup: startup, onSaved: () => setState(() => _isEditing = false))
            : StartupSummary(startup: startup, onEdit: () => setState(() => _isEditing = true)),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Could not load startup: $error')),
      ),
    );
  }
}
