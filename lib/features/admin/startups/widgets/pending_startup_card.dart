import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/index.dart';
import '../../../founder/startup/models/startup.dart';
import '../../../student/profile/widgets/profile_link_tile.dart';
import '../../categories/models/category_type.dart';
import '../../categories/providers/category_providers.dart';
import '../providers/admin_startup_controller.dart';

class PendingStartupCard extends ConsumerWidget {
  const PendingStartupCard({super.key, required this.startup});

  final Startup startup;

  Future<void> _approve(WidgetRef ref) {
    return ref.read(adminStartupControllerProvider.notifier).approve(startup.founderId);
  }

  Future<void> _reject(BuildContext context, WidgetRef ref) async {
    final reasonController = TextEditingController();
    final reason = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reject startup'),
        content: TextField(
          controller: reasonController,
          maxLines: 3,
          decoration: const InputDecoration(hintText: 'Reason for rejection'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, reasonController.text.trim()),
            child: const Text('Reject'),
          ),
        ],
      ),
    );

    if (reason != null && reason.isNotEmpty) {
      await ref.read(adminStartupControllerProvider.notifier).reject(startup.founderId, reason);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppCard(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Avatar(
                imageUrl: startup.logoUrl,
                name: startup.name ?? 'Startup',
                size: AvatarSize.small,
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      startup.name ?? '',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    if ((startup.industry ?? '').isNotEmpty)
                      Text(
                        startup.industry!,
                        style: const TextStyle(color: AppColors.textSecondary),
                      ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Consumer(
            builder: (context, ref, _) {
              final documents = ref
                  .watch(categoriesByTypeProvider(CategoryType.verificationDocument))
                  .valueOrNull;
              final labelById = {
                for (final doc in documents ?? []) doc.id: doc.label,
              };

              return Column(
                children: [
                  for (final entry in startup.verificationDocUrls.entries)
                    ProfileLinkTile(
                      icon: Icons.description,
                      label: labelById[entry.key] ?? 'Document',
                      actionLabel: 'View document',
                      url: entry.value,
                    ),
                ],
              );
            },
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              Expanded(
                child: AppButton(
                  label: 'Reject',
                  variant: AppButtonVariant.outlined,
                  onPressed: () => _reject(context, ref),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: AppButton(label: 'Approve', onPressed: () => _approve(ref)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
