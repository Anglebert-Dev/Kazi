import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/category.dart';
import 'category_providers.dart';

part 'category_controller.g.dart';

@riverpod
class CategoryController extends _$CategoryController {
  @override
  FutureOr<void> build() {}

  Future<void> create(Category category) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(categoryRepositoryProvider).create(category),
    );
  }

  Future<void> updateCategory(Category category) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(categoryRepositoryProvider).update(category),
    );
  }

  Future<void> delete(String id) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(categoryRepositoryProvider).delete(id));
  }
}
