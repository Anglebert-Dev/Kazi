import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class FeaturePlaceholderScreen extends StatelessWidget {
  const FeaturePlaceholderScreen({super.key, required this.title, this.actions});

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), actions: actions),
      body: Center(
        child: Text(
          '$title coming soon',
          style: const TextStyle(color: AppColors.textSecondary),
        ),
      ),
    );
  }
}
