import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/index.dart';
import '../providers/startup_controller.dart';

class DeleteStartupButton extends ConsumerWidget {
  const DeleteStartupButton({super.key, required this.founderId});

  final String founderId;

  Future<void> _confirmAndDelete(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete startup?'),
        content: const Text(
          'This permanently removes your startup profile and verification status. '
          "You'll need to create it again to post opportunities.",
        ),
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
      await ref.read(startupControllerProvider.notifier).deleteStartup(founderId);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton(
      label: 'Delete startup',
      variant: AppButtonVariant.outlined,
      icon: Icons.delete_outline,
      onPressed: () => _confirmAndDelete(context, ref),
      fullWidth: true,
    );
  }
}
