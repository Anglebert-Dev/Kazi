import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../authentication/providers/auth_providers.dart';
import '../providers/notification_providers.dart';
import '../screens/notifications_screen.dart';

class NotificationBellButton extends ConsumerWidget {
  const NotificationBellButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userModel = ref.watch(currentUserModelProvider).valueOrNull;
    if (userModel == null) return const SizedBox.shrink();

    final unreadCount = ref
        .watch(notificationsForUserProvider(userModel.uid))
        .valueOrNull
        ?.where((notification) => !notification.read)
        .length;

    return IconButton(
      icon: Stack(
        clipBehavior: Clip.none,
        children: [
          const Icon(Icons.notifications_outlined),
          if ((unreadCount ?? 0) > 0)
            Positioned(
              right: -2,
              top: -2,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(color: AppColors.error, shape: BoxShape.circle),
              ),
            ),
        ],
      ),
      onPressed: () => Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => const NotificationsScreen())),
    );
  }
}
