import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_spacing.dart';
import '../providers/rating_controller.dart';
import 'star_rating_input.dart';

class RateStartupDialog extends ConsumerStatefulWidget {
  const RateStartupDialog({super.key, required this.startupId});

  final String startupId;

  static Future<void> show(BuildContext context, {required String startupId}) {
    return showDialog(
      context: context,
      builder: (context) => RateStartupDialog(startupId: startupId),
    );
  }

  @override
  ConsumerState<RateStartupDialog> createState() => _RateStartupDialogState();
}

class _RateStartupDialogState extends ConsumerState<RateStartupDialog> {
  int _score = 5;
  final _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    await ref
        .read(ratingControllerProvider.notifier)
        .rate(
          startupId: widget.startupId,
          score: _score,
          comment: _commentController.text.trim().isEmpty ? null : _commentController.text.trim(),
        );
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final isSaving = ref.watch(ratingControllerProvider).isLoading;

    return AlertDialog(
      title: const Text('Rate this startup'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StarRatingInput(score: _score, onChanged: (value) => setState(() => _score = value)),
            const SizedBox(height: AppSpacing.md),
            TextField(
              controller: _commentController,
              maxLines: 3,
              decoration: const InputDecoration(labelText: 'Comment (optional)'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
        TextButton(onPressed: isSaving ? null : _submit, child: const Text('Submit')),
      ],
    );
  }
}
