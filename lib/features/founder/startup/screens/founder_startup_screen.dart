import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../authentication/providers/auth_controller.dart';
import '../../../shared/feature_placeholder_screen.dart';

class FounderStartupScreen extends ConsumerWidget {
  const FounderStartupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FeaturePlaceholderScreen(
      title: 'Startup',
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () => ref.read(authControllerProvider.notifier).signOut(),
        ),
      ],
    );
  }
}
