import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/system_message_text.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

sealed class DmListMessagePreview {
  const DmListMessagePreview();
}

final class DmListMarkdownMessagePreview extends DmListMessagePreview {
  const DmListMarkdownMessagePreview({
    required this.authorPrefix,
    required this.content,
  });

  final String authorPrefix;
  final String content;
}

final class DmListSystemMessagePreview extends DmListMessagePreview {
  const DmListSystemMessagePreview({required this.text});

  final String text;
}

final class DmListAttachmentMessagePreview extends DmListMessagePreview {
  const DmListAttachmentMessagePreview({required this.authorPrefix});

  final String authorPrefix;
}

bool shouldShowDmMessagePreview({
  required DmMessagePreviewMode mode,
  required bool hasUnread,
}) {
  return switch (mode) {
    DmMessagePreviewMode.all => true,
    DmMessagePreviewMode.unreadOnly => hasUnread,
    DmMessagePreviewMode.none => false,
  };
}

DmListMessagePreview? resolveDmListMessagePreview({
  required FluxerLocalizations l10n,
  required DmConversation conversation,
  required String? currentUserId,
  required String? authorFriendNickname,
}) {
  if (conversation.isGroup) {
    return null;
  }
  if (!_isUserAuthoredMessage(conversation.lastMessageType)) {
    final String? authorName = conversation.lastMessageAuthorName;
    if (authorName == null || authorName.isEmpty) {
      return null;
    }
    final String? systemText = stringifySystemMessageForDmListPreview(
      l10n: l10n,
      messageType: conversation.lastMessageType,
      messageId: conversation.lastMessageId ?? conversation.id,
      content: conversation.lastMessage,
      authorName: authorName,
      mentionedUserName: conversation.lastMessageMentionedUserName,
      mentionedUserId: conversation.lastMessageMentionedUserId,
      authorId: conversation.lastMessageAuthorId,
    );
    if (systemText == null) {
      return null;
    }
    return DmListSystemMessagePreview(text: systemText);
  }
  final String content = conversation.lastMessageInlineContent;
  if (content.isNotEmpty) {
    final String? authorPrefix = _authorPrefix(
      conversation: conversation,
      currentUserId: currentUserId,
      authorFriendNickname: authorFriendNickname,
    );
    if (authorPrefix == null) {
      return null;
    }
    return DmListMarkdownMessagePreview(
      authorPrefix: authorPrefix,
      content: content,
    );
  }
  if (conversation.lastMessageHasAttachments) {
    final String? authorPrefix = _authorPrefix(
      conversation: conversation,
      currentUserId: currentUserId,
      authorFriendNickname: authorFriendNickname,
    );
    if (authorPrefix == null) {
      return null;
    }
    return DmListAttachmentMessagePreview(authorPrefix: authorPrefix);
  }
  return null;
}

bool _isUserAuthoredMessage(int messageType) {
  return messageType == messageTypeDefault || messageType == messageTypeReply;
}

String? _authorPrefix({
  required DmConversation conversation,
  required String? currentUserId,
  required String? authorFriendNickname,
}) {
  final String? authorName = conversation.lastMessageAuthorName;
  final String? authorId = conversation.lastMessageAuthorId;
  if (authorName == null || authorId == null || authorId.isEmpty) {
    return null;
  }
  final String label = authorId == currentUserId
      ? 'You'
      : (authorFriendNickname ?? authorName);
  return '$label: ';
}
