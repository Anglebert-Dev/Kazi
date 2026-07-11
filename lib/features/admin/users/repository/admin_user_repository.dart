import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../authentication/models/user_mapper.dart';
import '../../../authentication/models/user_model.dart';

class AdminUserRepository {
  AdminUserRepository(this._firestore);

  final FirebaseFirestore _firestore;

  Stream<List<UserModel>> watchAllUsers() {
    return _firestore.collection('users').snapshots().map(
      (snapshot) => [
        for (final doc in snapshot.docs) userModelFromDoc(doc.id, doc.data()),
      ],
    );
  }
}
