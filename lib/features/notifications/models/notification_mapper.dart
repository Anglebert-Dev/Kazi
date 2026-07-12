import 'package:cloud_firestore/cloud_firestore.dart';

import 'notification.dart';
import 'notification_type.dart';

AppNotification notificationFromFirestore(String id, Map<String, dynamic> data) {
  return AppNotification(
    id: id,
    userId: data['userId'] as String? ?? '',
    type: NotificationType.values.byName(data['type'] as String? ?? 'newMessage'),
    message: data['message'] as String? ?? '',
    relatedId: data['relatedId'] as String?,
    read: data['read'] as bool? ?? false,
    createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
  );
}
