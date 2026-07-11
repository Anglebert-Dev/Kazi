import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/index.dart';

class VerificationDocumentRow extends StatelessWidget {
  const VerificationDocumentRow({
    super.key,
    required this.label,
    required this.description,
    required this.isUploaded,
    required this.isBusy,
    required this.onTap,
  });

  final String label;
  final String? description;
  final bool isUploaded;
  final bool isBusy;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        children: [
          Icon(
            isUploaded ? Icons.check_circle : Icons.upload_file,
            color: isUploaded ? AppColors.success : AppColors.textSecondary,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
                if ((description ?? '').isNotEmpty)
                  Text(
                    description!,
                    style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
                  ),
              ],
            ),
          ),
          TextButton(
            onPressed: isBusy ? null : onTap,
            child: Text(isUploaded ? 'Replace' : 'Upload'),
          ),
        ],
      ),
    );
  }
}
