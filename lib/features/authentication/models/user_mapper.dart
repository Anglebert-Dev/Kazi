import 'package:cloud_firestore/cloud_firestore.dart';

import 'user_model.dart';
import 'user_role.dart';
import 'user_status.dart';

UserModel userModelFromDoc(String uid, Map<String, dynamic> data) {
  return UserModel(
    uid: uid,
    email: data['email'] as String,
    displayName: data['displayName'] as String?,
    role: data['role'] != null ? UserRole.values.byName(data['role'] as String) : null,
    status: UserStatus.values.byName((data['status'] as String?) ?? UserStatus.active.name),
    createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
  );
}
