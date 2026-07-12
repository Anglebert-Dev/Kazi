import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/application.dart';
import '../repository/application_repository.dart';

part 'application_providers.g.dart';

@riverpod
ApplicationRepository applicationRepository(Ref ref) {
  return ApplicationRepository(FirebaseFirestore.instance);
}

@riverpod
Stream<Application?> applicationForOpportunity(Ref ref, String studentId, String opportunityId) {
  return ref.watch(applicationRepositoryProvider).watchById(studentId, opportunityId);
}

@riverpod
Stream<Application?> applicationById(Ref ref, String applicationId) {
  return ref.watch(applicationRepositoryProvider).watchByApplicationId(applicationId);
}

@riverpod
Stream<List<Application>> studentApplications(Ref ref, String studentId) {
  return ref.watch(applicationRepositoryProvider).watchByStudent(studentId);
}

@riverpod
Stream<List<Application>> startupApplications(Ref ref, String startupId) {
  return ref.watch(applicationRepositoryProvider).watchByStartup(startupId);
}
