import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/widgets/index.dart';
import '../../authentication/providers/auth_providers.dart';
import '../providers/chat_providers.dart';
import '../widgets/conversation_list_tile.dart';
import 'chat_thread_screen.dart';

class ConversationsListScreen extends ConsumerWidget {
  const ConversationsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userModel = ref.watch(currentUserModelProvider).valueOrNull;

    if (userModel == null) {
      return Scaffold(appBar: AppBar(title: const Text('Messages')));
    }

    final conversationsAsync = ref.watch(conversationsProvider(userModel.uid));

    return Scaffold(
      appBar: AppBar(title: const Text('Messages')),
      body: conversationsAsync.when(
        data: (conversations) => conversations.isEmpty
            ? const EmptyState(
                icon: Icons.chat_bubble_outline,
                title: 'No conversations yet',
                message: 'Messages with students and founders will show up here.',
              )
            : ListView.builder(
                padding: const EdgeInsets.all(AppSpacing.lg),
                itemCount: conversations.length,
                itemBuilder: (context, index) {
                  final conversation = conversations[index];
                  final otherId = conversation.participantIds.firstWhere(
                    (id) => id != userModel.uid,
                    orElse: () => userModel.uid,
                  );

                  return ConversationListTile(
                    conversation: conversation,
                    otherName: conversation.participantNames[otherId] ?? 'Unknown',
                    otherPhotoUrl: conversation.participantPhotoUrls[otherId],
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            ChatThreadScreen(conversationId: conversation.id),
                      ),
                    ),
                  );
                },
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Could not load messages: $error')),
      ),
    );
  }
}
