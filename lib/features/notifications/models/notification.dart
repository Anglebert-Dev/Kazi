import 'package:freezed_annotation/freezed_annotation.dart';

import 'notification_type.dart';

part 'notification.freezed.dart';

@freezed
class AppNotification with _$AppNotification {
  const factory AppNotification({
    required String id,
    required String userId,
    required NotificationType type,
    required String message,
    String? relatedId,
    @Default(false) bool read,
    required DateTime createdAt,
  }) = _AppNotification;
}
