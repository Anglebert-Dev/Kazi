import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/index.dart';
import '../../../admin/categories/models/category_type.dart';
import '../../../admin/categories/providers/category_providers.dart';
import '../models/startup.dart';
import '../providers/startup_controller.dart';
import '../providers/startup_providers.dart';
import '../widgets/verification_document_row.dart';

class VerificationSubmissionScreen extends ConsumerWidget {
  const VerificationSubmissionScreen({super.key, required this.startup});

  final Startup startup;

  Future<void> _pickAndUpload(
    BuildContext context,
    WidgetRef ref,
    String categoryId,
    String categoryLabel,
  ) async {
    final file = await openFile(
      acceptedTypeGroups: const [
        XTypeGroup(label: 'Document', extensions: ['pdf', 'jpg', 'jpeg', 'png']),
      ],
    );
    if (file == null) return;

    await ref
        .read(startupControllerProvider.notifier)
        .uploadVerificationDocument(startup.founderId, categoryId, file.path);

    if (!context.mounted) return;

    final error = ref.read(startupControllerProvider).error;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(error != null ? 'Upload failed: $error' : '$categoryLabel uploaded')),
    );
  }

  Future<void> _submit(BuildContext context, WidgetRef ref) async {
    await ref.read(startupControllerProvider.notifier).submitForReview(startup.founderId);
    if (context.mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final documentsAsync = ref.watch(
      categoriesByTypeProvider(CategoryType.verificationDocument),
    );
    final isLoading = ref.watch(startupControllerProvider).isLoading;
    final currentStartup = ref.watch(currentStartupProvider).valueOrNull ?? startup;

    return Scaffold(
      appBar: AppBar(title: const Text('Verify your startup')),
      body: documentsAsync.when(
        data: (documents) {
          if (documents.isEmpty) {
            return const EmptyState(
              icon: Icons.description_outlined,
              title: 'No documents configured',
              message: 'An admin needs to set up required verification documents first.',
            );
          }

          final allUploaded = documents.every(
            (doc) => currentStartup.verificationDocUrls.containsKey(doc.id),
          );
          final rejectionReason = currentStartup.verificationRejectionReason;

          return Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if ((rejectionReason ?? '').isNotEmpty) ...[
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: AppColors.error.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(AppRadii.card),
                    ),
                    child: Text(
                      'Previous submission rejected: $rejectionReason',
                      style: const TextStyle(color: AppColors.error),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                ],
                const Text(
                  'Upload each required document below, then submit for review.',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
                const SizedBox(height: AppSpacing.lg),
                Expanded(
                  child: ListView.separated(
                    itemCount: documents.length,
                    separatorBuilder: (context, index) => const SizedBox(height: AppSpacing.sm),
                    itemBuilder: (context, index) {
                      final doc = documents[index];
                      final uploaded = currentStartup.verificationDocUrls.containsKey(doc.id);
                      return VerificationDocumentRow(
                        label: doc.label,
                        description: doc.description,
                        isUploaded: uploaded,
                        isBusy: isLoading,
                        onTap: () => _pickAndUpload(context, ref, doc.id, doc.label),
                      );
                    },
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                AppButton(
                  label: 'Submit for review',
                  isLoading: isLoading,
                  onPressed: allUploaded ? () => _submit(context, ref) : null,
                  fullWidth: true,
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Could not load requirements: $error')),
      ),
    );
  }
}
