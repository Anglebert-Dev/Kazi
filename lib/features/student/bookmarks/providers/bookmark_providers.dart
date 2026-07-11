import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../authentication/providers/auth_providers.dart';
import '../repository/bookmark_repository.dart';

part 'bookmark_providers.g.dart';

@riverpod
BookmarkRepository bookmarkRepository(Ref ref) {
  return BookmarkRepository(FirebaseFirestore.instance);
}

@riverpod
Stream<Set<String>> bookmarkedOpportunityIds(Ref ref) {
  final user = ref.watch(authStateChangesProvider).valueOrNull;
  if (user == null) return Stream.value(const {});
  return ref.watch(bookmarkRepositoryProvider).watchBookmarkedIds(user.uid);
}
