import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/widgets/index.dart';
import '../../authentication/providers/auth_providers.dart';
import '../providers/chat_controller.dart';
import '../providers/chat_providers.dart';
import '../widgets/chat_message_bubble.dart';

class ChatThreadScreen extends ConsumerStatefulWidget {
  const ChatThreadScreen({super.key, required this.conversationId});

  final String conversationId;

  @override
  ConsumerState<ChatThreadScreen> createState() => _ChatThreadScreenState();
}

class _ChatThreadScreenState extends ConsumerState<ChatThreadScreen> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> _send(String myUid, String otherId) async {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    _textController.clear();
    await ref
        .read(chatControllerProvider.notifier)
        .send(
          conversationId: widget.conversationId,
          senderId: myUid,
          recipientId: otherId,
          text: text,
        );
  }

  @override
  Widget build(BuildContext context) {
    final userModel = ref.watch(currentUserModelProvider).valueOrNull;
    final conversationAsync = ref.watch(conversationByIdProvider(widget.conversationId));
    final messagesAsync = ref.watch(messagesProvider(widget.conversationId));
    final isSending = ref.watch(chatControllerProvider).isLoading;

    if (userModel == null) return const Scaffold();

    final conversation = conversationAsync.valueOrNull;
    final otherId = conversation?.participantIds.firstWhere(
      (id) => id != userModel.uid,
      orElse: () => userModel.uid,
    );
    final otherName = conversation?.participantNames[otherId] ?? '';

    return Scaffold(
      appBar: AppBar(title: Text(otherName)),
      body: Column(
        children: [
          Expanded(
            child: messagesAsync.when(
              data: (messages) => ListView.builder(
                reverse: true,
                padding: const EdgeInsets.all(AppSpacing.lg),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[messages.length - 1 - index];
                  return ChatMessageBubble(message: message, isMine: message.senderId == userModel.uid);
                },
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Center(child: Text('Could not load messages: $error')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              children: [
                Expanded(
                  child: AppTextField(controller: _textController, hint: 'Message'),
                ),
                const SizedBox(width: AppSpacing.sm),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: (otherId == null || isSending)
                      ? null
                      : () => _send(userModel.uid, otherId),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
