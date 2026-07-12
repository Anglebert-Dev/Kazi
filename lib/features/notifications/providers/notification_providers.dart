import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/notification.dart';
import '../repository/notification_repository.dart';

part 'notification_providers.g.dart';

@riverpod
NotificationRepository notificationRepository(Ref ref) {
  return NotificationRepository(FirebaseFirestore.instance);
}

@riverpod
Stream<List<AppNotification>> notificationsForUser(Ref ref, String uid) {
  return ref.watch(notificationRepositoryProvider).watchForUser(uid);
}
