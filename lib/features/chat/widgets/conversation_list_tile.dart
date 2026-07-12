import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/index.dart';
import '../models/conversation.dart';

final _dateFormat = DateFormat('MMM d');

class ConversationListTile extends StatelessWidget {
  const ConversationListTile({
    super.key,
    required this.conversation,
    required this.otherName,
    required this.otherPhotoUrl,
    required this.onTap,
  });

  final Conversation conversation;
  final String otherName;
  final String? otherPhotoUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Row(
        children: [
          Avatar(imageUrl: otherPhotoUrl, name: otherName, size: AvatarSize.small),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  otherName,
                  style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.textPrimary),
                ),
                if (conversation.lastMessage.isNotEmpty)
                  Text(
                    conversation.lastMessage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: AppColors.textSecondary),
                  ),
              ],
            ),
          ),
          Text(
            _dateFormat.format(conversation.lastMessageAt),
            style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
