import 'package:flutter/material.dart';

import '../../../notifications/widgets/notification_bell_button.dart';
import '../../../shared/feature_placeholder_screen.dart';

class FounderDashboardScreen extends StatelessWidget {
  const FounderDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) => const FeaturePlaceholderScreen(
    title: 'Dashboard',
    actions: [NotificationBellButton()],
  );
}
