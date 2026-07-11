import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/services/cloudinary_service.dart';
import '../../../authentication/providers/auth_providers.dart';
import '../models/student_profile.dart';
import '../repository/student_profile_repository.dart';

part 'student_profile_providers.g.dart';

@riverpod
StudentProfileRepository studentProfileRepository(Ref ref) {
  return StudentProfileRepository(FirebaseFirestore.instance, CloudinaryService());
}

@riverpod
Stream<StudentProfile> currentStudentProfile(Ref ref) {
  final user = ref.watch(authStateChangesProvider).valueOrNull;
  if (user == null) return Stream.value(const StudentProfile());
  return ref.watch(studentProfileRepositoryProvider).watchProfile(user.uid);
}
