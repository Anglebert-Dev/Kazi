import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../models/category.dart';

class CategoryListTile extends StatelessWidget {
  const CategoryListTile({
    super.key,
    required this.category,
    required this.onEdit,
    required this.onDelete,
  });

  final Category category;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(category.label),
      subtitle: category.description != null ? Text(category.description!) : null,
      leading: Icon(
        category.isActive ? Icons.check_circle : Icons.remove_circle_outline,
        color: category.isActive ? AppColors.success : AppColors.textSecondary,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(icon: const Icon(Icons.edit_outlined), onPressed: onEdit),
          IconButton(icon: const Icon(Icons.delete_outline), onPressed: onDelete),
        ],
      ),
    );
  }
}
