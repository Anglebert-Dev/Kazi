import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/notification.dart';
import '../models/notification_mapper.dart';
import '../models/notification_type.dart';

class NotificationRepository {
  NotificationRepository(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _collection =>
      _firestore.collection('notifications');

  Future<void> send({
    required String userId,
    required NotificationType type,
    required String message,
    String? relatedId,
  }) {
    return _collection.add({
      'userId': userId,
      'type': type.name,
      'message': message,
      'relatedId': relatedId,
      'read': false,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Stream<List<AppNotification>> watchForUser(String userId) {
    return _collection.where('userId', isEqualTo: userId).snapshots().map((snapshot) {
      final notifications = [
        for (final doc in snapshot.docs) notificationFromFirestore(doc.id, doc.data()),
      ];
      notifications.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return notifications;
    });
  }

  Future<void> markAsRead(String notificationId) {
    return _collection.doc(notificationId).update({'read': true});
  }
}
