import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/category.dart';
import '../models/category_type.dart';

class CategoryRepository {
  CategoryRepository(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _collection =>
      _firestore.collection('categories');

  Stream<List<Category>> watchByType(CategoryType type, {bool activeOnly = false}) {
    Query<Map<String, dynamic>> query = _collection.where(
      'type',
      isEqualTo: type.name,
    );
    if (activeOnly) {
      query = query.where('isActive', isEqualTo: true);
    }

    return query.snapshots().map((snapshot) {
      final categories = [
        for (final doc in snapshot.docs) _fromDoc(doc.id, doc.data()),
      ];
      categories.sort((a, b) => a.order.compareTo(b.order));
      return categories;
    });
  }

  Future<void> create(Category category) {
    return _collection.add(_toMap(category));
  }

  Future<void> update(Category category) {
    return _collection.doc(category.id).update(_toMap(category));
  }

  Future<void> delete(String id) {
    return _collection.doc(id).delete();
  }

  Category _fromDoc(String id, Map<String, dynamic> data) {
    return Category(
      id: id,
      type: CategoryType.values.byName(data['type'] as String),
      label: data['label'] as String,
      description: data['description'] as String?,
      order: (data['order'] as num?)?.toInt() ?? 0,
      isActive: data['isActive'] as bool? ?? true,
    );
  }

  Map<String, dynamic> _toMap(Category category) {
    return {
      'type': category.type.name,
      'label': category.label,
      'description': category.description,
      'order': category.order,
      'isActive': category.isActive,
    };
  }
}
