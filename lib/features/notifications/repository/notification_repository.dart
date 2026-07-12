import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationRepository {
  NotificationRepository(this._firestore);

  final FirebaseFirestore _firestore;

  Future<void> send({required String userId, required String message}) {
    return _firestore.collection('notifications').add({
      'userId': userId,
      'message': message,
      'read': false,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}
