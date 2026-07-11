import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/index.dart';
import '../models/category.dart';
import '../models/category_type.dart';
import '../providers/category_controller.dart';
import '../providers/category_providers.dart';
import 'category_form_dialog.dart';
import 'category_list_tile.dart';

class CategoryTypeTab extends ConsumerWidget {
  const CategoryTypeTab({super.key, required this.type});

  final CategoryType type;

  Future<void> _edit(BuildContext context, WidgetRef ref, Category category) async {
    final updated = await CategoryFormDialog.show(context, type: type, existing: category);
    if (updated != null) {
      await ref.read(categoryControllerProvider.notifier).updateCategory(updated);
    }
  }

  Future<void> _delete(BuildContext context, WidgetRef ref, Category category) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete category?'),
        content: Text('This removes "${category.label}" permanently.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await ref.read(categoryControllerProvider.notifier).delete(category.id);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesByTypeProvider(type, activeOnly: false));

    return categoriesAsync.when(
      data: (categories) => categories.isEmpty
          ? EmptyState(
              icon: Icons.category_outlined,
              title: 'No ${type.label.toLowerCase()} yet',
              message: 'Tap the + button to add the first one.',
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return CategoryListTile(
                  category: category,
                  onEdit: () => _edit(context, ref, category),
                  onDelete: () => _delete(context, ref, category),
                );
              },
            ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Could not load categories: $error')),
    );
  }
}
