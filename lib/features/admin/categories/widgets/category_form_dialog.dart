import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/category_type.dart';

class CategoryFormDialog extends StatefulWidget {
  const CategoryFormDialog({super.key, required this.type, this.existing});

  final CategoryType type;
  final Category? existing;

  static Future<Category?> show(
    BuildContext context, {
    required CategoryType type,
    Category? existing,
  }) {
    return showDialog<Category>(
      context: context,
      builder: (context) => CategoryFormDialog(type: type, existing: existing),
    );
  }

  @override
  State<CategoryFormDialog> createState() => _CategoryFormDialogState();
}

class _CategoryFormDialogState extends State<CategoryFormDialog> {
  late final _labelController = TextEditingController(text: widget.existing?.label);
  late final _descriptionController = TextEditingController(
    text: widget.existing?.description,
  );
  late final _orderController = TextEditingController(
    text: (widget.existing?.order ?? 0).toString(),
  );
  late bool _isActive = widget.existing?.isActive ?? true;

  @override
  void dispose() {
    _labelController.dispose();
    _descriptionController.dispose();
    _orderController.dispose();
    super.dispose();
  }

  void _save() {
    final label = _labelController.text.trim();
    if (label.isEmpty) return;

    Navigator.pop(
      context,
      Category(
        id: widget.existing?.id ?? '',
        type: widget.type,
        label: label,
        description: _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
        order: int.tryParse(_orderController.text) ?? 0,
        isActive: _isActive,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.existing == null ? 'Add category' : 'Edit category'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _labelController,
              decoration: const InputDecoration(labelText: 'Label'),
            ),
            if (widget.type == CategoryType.verificationDocument)
              TextField(
                controller: _descriptionController,
                maxLines: 2,
                decoration: const InputDecoration(
                  labelText: 'Description (upload instructions)',
                ),
              ),
            TextField(
              controller: _orderController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Order'),
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Active'),
              value: _isActive,
              onChanged: (value) => setState(() => _isActive = value),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
        TextButton(onPressed: _save, child: const Text('Save')),
      ],
    );
  }
}
