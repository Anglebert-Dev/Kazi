import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/user_model.dart';
import '../repository/auth_repository.dart';

part 'auth_providers.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepository(FirebaseAuth.instance, FirebaseFirestore.instance);
}

@riverpod
Stream<User?> authStateChanges(Ref ref) {
  return ref.watch(authRepositoryProvider).authStateChanges();
}

@riverpod
Stream<UserModel?> currentUserModel(Ref ref) {
  final user = ref.watch(authStateChangesProvider).valueOrNull;
  if (user == null) return Stream.value(null);
  return ref.watch(authRepositoryProvider).watchUserModel(user.uid);
}
