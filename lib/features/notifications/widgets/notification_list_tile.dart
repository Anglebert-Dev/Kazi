import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/index.dart';
import '../models/notification.dart';
import '../models/notification_type.dart';

final _dateFormat = DateFormat('MMM d, h:mm a');

class NotificationListTile extends StatelessWidget {
  const NotificationListTile({super.key, required this.notification, required this.onTap});

  final AppNotification notification;
  final VoidCallback onTap;

  IconData get _icon => switch (notification.type) {
    NotificationType.newApplicant => Icons.person_add_alt_outlined,
    NotificationType.applicationStatusChanged => Icons.assignment_outlined,
    NotificationType.newMessage => Icons.chat_bubble_outline,
    NotificationType.verificationResult => Icons.verified_outlined,
  };

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Row(
        children: [
          Icon(
            _icon,
            color: notification.read ? AppColors.textSecondary : AppColors.primary,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.message,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: notification.read ? FontWeight.normal : FontWeight.w700,
                  ),
                ),
                Text(
                  _dateFormat.format(notification.createdAt),
                  style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
                ),
              ],
            ),
          ),
          if (!notification.read)
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
            ),
        ],
      ),
    );
  }
}
