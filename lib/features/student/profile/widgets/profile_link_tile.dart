import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/theme/app_colors.dart';

class ProfileLinkTile extends StatelessWidget {
  const ProfileLinkTile({
    super.key,
    required this.icon,
    required this.label,
    required this.actionLabel,
    required this.url,
  });

  final IconData icon;
  final String label;
  final String actionLabel;
  final String? url;

  Future<void> _open() async {
    final value = url;
    if (value == null || value.isEmpty) return;

    final uri = Uri.tryParse(value);
    if (uri == null) return;

    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final hasUrl = url != null && url!.isNotEmpty;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: hasUrl ? AppColors.primary : AppColors.textSecondary),
      title: Text(label),
      subtitle: Text(
        hasUrl ? actionLabel : 'Not added',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: hasUrl ? _open : null,
    );
  }
}
