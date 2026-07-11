import 'package:freezed_annotation/freezed_annotation.dart';

import 'category_type.dart';

part 'category.freezed.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required String id,
    required CategoryType type,
    required String label,
    String? description,
    @Default(0) int order,
    @Default(true) bool isActive,
  }) = _Category;
}
