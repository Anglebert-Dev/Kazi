import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/services/cloudinary_service.dart';
import '../../../authentication/providers/auth_providers.dart';
import '../models/startup.dart';
import '../repository/startup_repository.dart';

part 'startup_providers.g.dart';

@riverpod
StartupRepository startupRepository(Ref ref) {
  return StartupRepository(FirebaseFirestore.instance, CloudinaryService());
}

@riverpod
Stream<Startup> currentStartup(Ref ref) {
  final user = ref.watch(authStateChangesProvider).valueOrNull;
  if (user == null) return Stream.value(Startup(founderId: ''));
  return ref.watch(startupRepositoryProvider).watchStartup(user.uid);
}

@riverpod
Stream<Startup> startupById(Ref ref, String startupId) {
  return ref.watch(startupRepositoryProvider).watchStartup(startupId);
}
