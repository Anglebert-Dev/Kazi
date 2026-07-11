import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../founder/startup/models/startup.dart';
import '../repository/admin_startup_repository.dart';

part 'admin_startup_providers.g.dart';

@riverpod
AdminStartupRepository adminStartupRepository(Ref ref) {
  return AdminStartupRepository(FirebaseFirestore.instance);
}

@riverpod
Stream<List<Startup>> pendingStartups(Ref ref) {
  return ref.watch(adminStartupRepositoryProvider).watchPendingStartups();
}
