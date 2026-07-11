import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../features/authentication/models/user_role.dart';
import '../../features/authentication/models/user_status.dart';

Future<void> ensureAdminAccountExists() async {
  final auth = FirebaseAuth.instance;
  if (auth.currentUser != null) return;

  final name = dotenv.env['ADMIN_NAME'];
  final email = dotenv.env['ADMIN_EMAIL'];
  final password = dotenv.env['ADMIN_PASSWORD'];

  if (name == null || email == null || password == null) {
    debugPrint('[admin bootstrap] ADMIN_NAME/ADMIN_EMAIL/ADMIN_PASSWORD not set in .env, skipping');
    return;
  }

  try {
    final credential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await credential.user!.updateDisplayName(name);
    await FirebaseFirestore.instance.collection('users').doc(credential.user!.uid).set({
      'email': email,
      'displayName': name,
      'role': UserRole.admin.name,
      'status': UserStatus.active.name,
      'createdAt': FieldValue.serverTimestamp(),
    });
    debugPrint('[admin bootstrap] created admin account for $email');
  } on FirebaseAuthException catch (error) {
    debugPrint('[admin bootstrap] skipped: ${error.code}');
  } finally {
    if (auth.currentUser != null) {
      await auth.signOut();
    }
  }
}
