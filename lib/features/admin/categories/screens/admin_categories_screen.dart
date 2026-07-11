import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../settings/screens/settings_screen.dart';
import '../models/category_type.dart';
import '../providers/category_controller.dart';
import '../widgets/category_form_dialog.dart';
import '../widgets/category_type_tab.dart';

class AdminCategoriesScreen extends ConsumerStatefulWidget {
  const AdminCategoriesScreen({super.key});

  @override
  ConsumerState<AdminCategoriesScreen> createState() => _AdminCategoriesScreenState();
}

class _AdminCategoriesScreenState extends ConsumerState<AdminCategoriesScreen>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: CategoryType.values.length, vsync: this);

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _addCategory() async {
    final type = CategoryType.values[_tabController.index];
    final category = await CategoryFormDialog.show(context, type: type);
    if (category != null) {
      await ref.read(categoryControllerProvider.notifier).create(category);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => const SettingsScreen())),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: [for (final type in CategoryType.values) Tab(text: type.label)],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [for (final type in CategoryType.values) CategoryTypeTab(type: type)],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addCategory,
        child: const Icon(Icons.add),
      ),
    );
  }
}
