import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/category.dart';
import '../models/category_type.dart';
import '../repository/category_repository.dart';

part 'category_providers.g.dart';

@riverpod
CategoryRepository categoryRepository(Ref ref) {
  return CategoryRepository(FirebaseFirestore.instance);
}

@riverpod
Stream<List<Category>> categoriesByType(
  Ref ref,
  CategoryType type, {
  bool activeOnly = true,
}) {
  return ref.watch(categoryRepositoryProvider).watchByType(type, activeOnly: activeOnly);
}
