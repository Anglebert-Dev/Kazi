import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/rating.dart';
import '../repository/rating_repository.dart';

part 'rating_providers.g.dart';

@riverpod
RatingRepository ratingRepository(Ref ref) {
  return RatingRepository(FirebaseFirestore.instance);
}

@riverpod
Stream<List<Rating>> ratingsForStartup(Ref ref, String startupId) {
  return ref.watch(ratingRepositoryProvider).watchForStartup(startupId);
}

@riverpod
Stream<Rating?> ratingByStudentAndStartup(Ref ref, String studentId, String startupId) {
  return ref.watch(ratingRepositoryProvider).watchByStudentAndStartup(studentId, startupId);
}
