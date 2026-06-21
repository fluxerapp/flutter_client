import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/utils/channel_jump_link.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_alert.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_mention.dart';
import 'package:fluxer_app/features/chat/utils/channel_jump_navigator.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:fluxer_app/shared/utils/emoji_utils.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

String? _normalizeSpoilerSyncUrl(String url) {
  final uri = Uri.tryParse(url);
  if (uri == null || !uri.hasScheme || uri.host.isEmpty) {
    return null;
  }
  final normalized = uri.toString();
  return normalized.endsWith('/')
      ? normalized.substring(0, normalized.length - 1)
      : normalized;
}

FluxerMarkdownConfig createFluxerMarkdownConfig({
  BuildContext? context,
  String? channelId,
  bool revealSpoilers = false,
  FluxerSpoilerSyncController? spoilerSyncController,
}) {
  return FluxerMarkdownConfig(
    resolveEmojiShortcode: EmojiRegistry.resolveSync,
    unicodeEmojiUrlBuilder: getTwemojiUrl,
    customEmojiUrlBuilder: FluxerMediaUrl.customEmoji,
    unicodeEmojiPattern: EmojiRegistry.unicodeEmojiRegexSync,
    linkColor: context?.colors.textLink,
    blockquoteBorderColor: context?.colors.interactiveMuted,
    blockquoteTextColor: context?.colors.textChatMuted,
    inlineCodeBackgroundColor: context?.colors.bgCodeBlock,
    inlineCodeTextColor: context?.colors.textSecondary,
    spoilerBackgroundColor: context?.colors.spoilerBackground,
    internalLinkPattern: buildChannelJumpLinkPattern(channelJumpLinkHosts()),
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
        await navigateToChannelJumpLinkFromContext(
          context: context,
          link: jump,
        );
        return;
      }

      await handleExternalLinkTap(context, href);
    },
    spoilersInitiallyRevealed: revealSpoilers,
    spoilerSyncController: spoilerSyncController,
    spoilerSyncKeyNormalizer: _normalizeSpoilerSyncUrl,
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
    onCopyCode: context == null
        ? null
        : (BuildContext ctx, String code) {
            ProviderScope.containerOf(ctx, listen: false)
                .read(toastProvider.notifier)
                .show(
                  FluxerToast(
                    message: FluxerLocalizations.of(ctx).copiedToClipboard,
                    variant: FluxerToastVariant.success,
                  ),
                );
          },
  );
}
