import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/index.dart';
import '../../../reports/providers/report_providers.dart';
import '../widgets/report_list_tile.dart';

class AdminReportsScreen extends ConsumerWidget {
  const AdminReportsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportsAsync = ref.watch(pendingReportsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Reports')),
      body: reportsAsync.when(
        data: (reports) => reports.isEmpty
            ? const EmptyState(
                icon: Icons.flag_outlined,
                title: 'No pending reports',
                message: 'Reports submitted by students and founders will show up here.',
              )
            : ListView.builder(
                padding: const EdgeInsets.all(AppSpacing.lg),
                itemCount: reports.length,
                itemBuilder: (context, index) => ReportListTile(report: reports[index]),
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Could not load reports: $error')),
      ),
    );
  }
}
