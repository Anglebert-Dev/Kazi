import 'package:flutter/material.dart';

import '../../../settings/screens/settings_screen.dart';
import '../../../shared/feature_placeholder_screen.dart';

class FounderStartupScreen extends StatelessWidget {
  const FounderStartupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FeaturePlaceholderScreen(
      title: 'Startup',
      actions: [
        IconButton(
          icon: const Icon(Icons.settings_outlined),
          onPressed: () => Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => const SettingsScreen())),
        ),
      ],
    );
  }
}
