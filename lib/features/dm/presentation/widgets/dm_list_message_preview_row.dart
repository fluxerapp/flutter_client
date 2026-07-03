import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_markdown.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/domain/dm_list_message_preview.dart';
import 'package:fluxer_app/features/dm/providers/dm_list_presence_provider.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/widgets/custom_status_display.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

class DmListTileSubtext extends StatelessWidget {
  const DmListTileSubtext({
    required this.conversation,
    required this.style,
    required this.hasUnread,
    required this.currentUserId,
    super.key,
  });

  final DmConversation conversation;
  final TextStyle style;
  final bool hasUnread;
  final String? currentUserId;

  @override
  Widget build(BuildContext context) {
    if (conversation.isGroup) {
      return Text(
        FluxerLocalizations.of(
          context,
        ).dmGroupMemberCount(conversation.memberCount),
        style: style.copyWith(height: 14 / 11),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      );
    }
    return _DmListDirectSubtext(
      conversation: conversation,
      style: style,
      hasUnread: hasUnread,
      currentUserId: currentUserId,
    );
  }
}

class _DmListDirectSubtext extends ConsumerWidget {
  const _DmListDirectSubtext({
    required this.conversation,
    required this.style,
    required this.hasUnread,
    required this.currentUserId,
  });

  final DmConversation conversation;
  final TextStyle style;
  final bool hasUnread;
  final String? currentUserId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DmMessagePreviewMode previewMode = ref.watch(
      appearancePreferencesProvider.select(
        (state) => state.dmMessagePreviewMode,
      ),
    );
    if (shouldShowDmMessagePreview(mode: previewMode, hasUnread: hasUnread)) {
      final String? authorId = conversation.lastMessageAuthorId;
      final String? authorFriendNickname =
          authorId != null && authorId.isNotEmpty && authorId != currentUserId
          ? ref.watch(
              friendNicknameProvider(
                authorId,
              ).select((AsyncValue<String?> value) => value.value),
            )
          : null;
      final DmListMessagePreview? preview = resolveDmListMessagePreview(
        l10n: FluxerLocalizations.of(context),
        conversation: conversation,
        currentUserId: currentUserId,
        authorFriendNickname: authorFriendNickname,
      );
      if (preview != null) {
        return DmListMessagePreviewRow(
          preview: preview,
          channelId: conversation.id,
          messageId: conversation.lastMessageId,
          style: style,
          attachmentLabel: FluxerLocalizations.of(
            context,
          ).dmListSentAnAttachment,
        );
      }
    }
    final String? customStatus = ref.watch(
      dmListRecipientRowDataProvider.select(
        (AsyncValue<Map<String, DmListRecipientRowData>> value) =>
            value.value?[conversation.recipientId]?.customStatus,
      ),
    );
    return CustomStatusDisplay(stored: customStatus, maxLines: 1);
  }
}

class DmListMessagePreviewRow extends StatelessWidget {
  const DmListMessagePreviewRow({
    required this.preview,
    required this.channelId,
    required this.messageId,
    required this.style,
    required this.attachmentLabel,
    super.key,
  });

  final DmListMessagePreview preview;
  final String channelId;
  final String? messageId;
  final TextStyle style;
  final String attachmentLabel;

  @override
  Widget build(BuildContext context) {
    final DmListMessagePreview messagePreview = preview;
    if (messagePreview is DmListMarkdownMessagePreview) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          Text(messagePreview.authorPrefix, style: style, maxLines: 1),
          Expanded(
            child: RepaintBoundary(
              child: IgnorePointer(
                child: MessageMarkdown(
                  data: messagePreview.content,
                  channelId: channelId,
                  messageId: messageId,
                  markdownContext: FluxerMarkdownContext.restrictedInlineReply,
                  revealSpoilers: true,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  baseStyle: style,
                ),
              ),
            ),
          ),
        ],
      );
    }
    if (messagePreview is DmListSystemMessagePreview) {
      return Text(
        messagePreview.text,
        style: style,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      );
    }
    final DmListAttachmentMessagePreview attachmentPreview =
        messagePreview as DmListAttachmentMessagePreview;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Text(attachmentPreview.authorPrefix, style: style, maxLines: 1),
        Expanded(
          child: Text(
            attachmentLabel,
            style: style.copyWith(fontStyle: FontStyle.italic),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
