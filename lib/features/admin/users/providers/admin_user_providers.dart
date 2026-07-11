import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../authentication/models/user_model.dart';
import '../repository/admin_user_repository.dart';

part 'admin_user_providers.g.dart';

@riverpod
AdminUserRepository adminUserRepository(Ref ref) {
  return AdminUserRepository(FirebaseFirestore.instance);
}

@riverpod
Stream<List<UserModel>> allUsers(Ref ref) {
  return ref.watch(adminUserRepositoryProvider).watchAllUsers();
}
