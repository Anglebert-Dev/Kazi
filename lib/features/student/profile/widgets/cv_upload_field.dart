import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/index.dart';

class CvUploadField extends StatelessWidget {
  const CvUploadField({
    super.key,
    required this.hasFile,
    required this.isUploading,
    required this.uploadFailed,
    required this.onTap,
  });

  final bool hasFile;
  final bool isUploading;
  final bool uploadFailed;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final label = isUploading ? 'Uploading CV...' : (hasFile ? 'Replace CV' : 'Upload CV');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppButton(
          label: label,
          variant: AppButtonVariant.outlined,
          icon: Icons.upload_file,
          isLoading: isUploading,
          onPressed: isUploading ? null : onTap,
          fullWidth: true,
        ),
        if (!isUploading && (hasFile || uploadFailed)) ...[
          const SizedBox(height: AppSpacing.xs),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                hasFile ? Icons.check_circle : Icons.error,
                size: 16,
                color: hasFile ? AppColors.success : AppColors.error,
              ),
              const SizedBox(width: AppSpacing.xs),
              Text(
                hasFile ? 'CV uploaded' : 'Upload failed',
                style: TextStyle(
                  color: hasFile ? AppColors.success : AppColors.error,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
