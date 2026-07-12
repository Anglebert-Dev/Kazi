import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation.freezed.dart';

@freezed
class Conversation with _$Conversation {
  const factory Conversation({
    required String id,
    required List<String> participantIds,
    @Default(<String, String>{}) Map<String, String> participantNames,
    @Default(<String, String>{}) Map<String, String> participantPhotoUrls,
    String? opportunityId,
    String? opportunityTitle,
    @Default('') String lastMessage,
    required DateTime lastMessageAt,
    String? lastSenderId,
    required DateTime createdAt,
  }) = _Conversation;
}
