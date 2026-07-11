import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_mapper.dart';
import '../models/user_model.dart';
import '../models/user_role.dart';
import '../models/user_status.dart';

class AuthRepository {
  AuthRepository(this._auth, this._firestore);

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  Stream<User?> authStateChanges() => _auth.authStateChanges();

  Future<void> signIn({required String email, required String password}) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String displayName,
  }) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await credential.user!.updateDisplayName(displayName);

    await _firestore.collection('users').doc(credential.user!.uid).set({
      'email': email,
      'displayName': displayName,
      'role': null,
      'status': UserStatus.active.name,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> signOut() => _auth.signOut();

  Future<void> sendPasswordResetEmail(String email) {
    return _auth.sendPasswordResetEmail(email: email);
  }

  String? get currentUserId => _auth.currentUser?.uid;

  Future<UserModel?> fetchUserModel(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();
    if (!doc.exists) return null;
    return userModelFromDoc(uid, doc.data()!);
  }

  Stream<UserModel?> watchUserModel(String uid) {
    return _firestore
        .collection('users')
        .doc(uid)
        .snapshots()
        .map((doc) => doc.exists ? userModelFromDoc(uid, doc.data()!) : null);
  }

  Future<void> updateUserRole(String uid, UserRole role) {
    return _firestore.collection('users').doc(uid).update({'role': role.name});
  }

  Future<void> updateUserStatus(String uid, UserStatus status) {
    return _firestore.collection('users').doc(uid).update({'status': status.name});
  }

  Future<void> updateDisplayName(String uid, String displayName) async {
    await _auth.currentUser?.updateDisplayName(displayName);
    await _firestore.collection('users').doc(uid).update({'displayName': displayName});
  }

  Future<void> updatePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final user = _auth.currentUser!;
    final credential = EmailAuthProvider.credential(
      email: user.email!,
      password: currentPassword,
    );
    await user.reauthenticateWithCredential(credential);
    await user.updatePassword(newPassword);
  }
}
