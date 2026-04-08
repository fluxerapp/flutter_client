import 'package:flutter/widgets.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/utils/channel_jump_link.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_alert.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_mention.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:fluxer_app/shared/utils/emoji_utils.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';
import 'package:go_router/go_router.dart';

final _internalLinkPattern = RegExp(
  r'https?://fluxer\.app/channels/'
  r'(?:@me|\d{15,21})/\d{15,21}(?:/\d{15,21})?',
);

FluxerMarkdownConfig createFluxerMarkdownConfig({
  BuildContext? context,
  String? channelId,
}) {
  return FluxerMarkdownConfig(
    resolveEmojiShortcode: EmojiRegistry.resolveSync,
    unicodeEmojiUrlBuilder: getTwemojiUrl,
    customEmojiUrlBuilder: getCustomEmojiUrl,
    unicodeEmojiPattern: EmojiRegistry.unicodeEmojiRegexSync,
    linkColor: context?.colors.textLink,
    blockquoteBorderColor: context?.colors.bgBlockquote,
    blockquoteTextColor: context?.colors.textSecondary,
    inlineCodeBackgroundColor: context?.colors.bgCodeBlock,
    inlineCodeTextColor: context?.colors.textSecondary,
    internalLinkPattern: _internalLinkPattern,
    userMentionBuilder: (context, id, style) {
      return UserMention(userId: id, channelId: channelId, baseStyle: style);
    },
    channelMentionBuilder: (context, id, style) {
      return ChannelMention(channelId: id, baseStyle: style);
    },
    roleMentionBuilder: (context, id, style) {
      return RoleMention(roleId: id, baseStyle: style);
    },
    everyoneMentionBuilder: (context, label, style) {
      return TextMention(label: label, baseStyle: style);
    },
    linkWidgetBuilder: (context, href, style) {
      final link = parseChannelJumpLink(href);
      if (link == null) {
        return null;
      }
      return ChannelJumpLinkMention(link: link, url: href, baseStyle: style);
    },
    onTapLink: (context, href) async {
      final jump = parseChannelJumpLink(href);
      if (jump != null) {
        if (!context.mounted) {
          return;
        }
        if (jump.isDm) {
          context.go(RoutePaths.dmChannel(jump.channelId));
        } else if (jump is MessageJumpLink) {
          context.go(
            RoutePaths.guildChannelMessage(
              jump.scope,
              jump.channelId,
              jump.messageId,
            ),
          );
        } else {
          context.go(RoutePaths.guildChannel(jump.scope, jump.channelId));
        }
        return;
      }

      await handleExternalLinkTap(context, href);
    },
    alertBuilder: (context, type, body, baseStyle) {
      return MessageAlert(
        type: switch (type) {
          FluxerAlertType.note => AlertType.note,
          FluxerAlertType.tip => AlertType.tip,
          FluxerAlertType.important => AlertType.important,
          FluxerAlertType.warning => AlertType.warning,
          FluxerAlertType.caution => AlertType.caution,
        },
        bodyWidget: body,
        baseStyle: baseStyle,
      );
    },
  );
}
