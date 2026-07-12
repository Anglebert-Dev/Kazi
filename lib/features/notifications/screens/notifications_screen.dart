import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/widgets/index.dart';
import '../../applications/providers/application_providers.dart';
import '../../applications/screens/application_detail_screen.dart';
import '../../authentication/models/user_role.dart';
import '../../authentication/providers/auth_providers.dart';
import '../../chat/screens/chat_thread_screen.dart';
import '../../founder/startup/screens/founder_startup_screen.dart';
import '../models/notification.dart';
import '../models/notification_type.dart';
import '../providers/notification_controller.dart';
import '../providers/notification_providers.dart';
import '../widgets/notification_list_tile.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  Future<void> _open(BuildContext context, WidgetRef ref, AppNotification notification) async {
    await ref.read(notificationControllerProvider.notifier).markAsRead(notification.id);
    if (!context.mounted) return;

    switch (notification.type) {
      case NotificationType.newMessage:
        if (notification.relatedId == null) return;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ChatThreadScreen(conversationId: notification.relatedId!),
          ),
        );
      case NotificationType.newApplicant:
      case NotificationType.applicationStatusChanged:
        if (notification.relatedId == null) return;
        final application = await ref.read(
          applicationByIdProvider(notification.relatedId!).future,
        );
        final userModel = ref.read(currentUserModelProvider).valueOrNull;
        if (application == null || !context.mounted) return;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ApplicationDetailScreen(
              application: application,
              isFounderView: userModel?.role == UserRole.founder,
            ),
          ),
        );
      case NotificationType.verificationResult:
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const FounderStartupScreen()));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userModel = ref.watch(currentUserModelProvider).valueOrNull;

    if (userModel == null) {
      return Scaffold(appBar: AppBar(title: const Text('Notifications')));
    }

    final notificationsAsync = ref.watch(notificationsForUserProvider(userModel.uid));
    final isProcessing = ref.watch(notificationControllerProvider).isLoading;

    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: notificationsAsync.when(
        data: (notifications) => notifications.isEmpty
            ? const EmptyState(
                icon: Icons.notifications_none,
                title: 'No notifications yet',
                message: 'Updates on your activity will show up here.',
              )
            : ListView.builder(
                padding: const EdgeInsets.all(AppSpacing.lg),
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return NotificationListTile(
                    notification: notification,
                    onTap: isProcessing ? () {} : () => _open(context, ref, notification),
                  );
                },
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Could not load notifications: $error')),
      ),
    );
  }
}
