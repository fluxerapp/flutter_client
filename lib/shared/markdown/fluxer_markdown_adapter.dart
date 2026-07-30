import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/deep_links/deep_link_path_policy.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/utils/channel_jump_link.dart';
import 'package:fluxer_app/features/channels/utils/channel_mention_utils.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_alert.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_mention.dart';
import 'package:fluxer_app/features/chat/utils/channel_jump_navigator.dart';
import 'package:fluxer_app/features/guilds/utils/invite_link_navigator.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:fluxer_app/shared/utils/emoji_utils.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

import 'package:go_router/go_router.dart';

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

String _fluxerAppLinkToHttps(String href) {
  if (href.startsWith('fluxer://')) {
    final Uri uri = Uri.parse(href);
    return 'https://fluxer.app${uri.path}';
  }
  if (href.startsWith('fluxer:/')) {
    return 'https://fluxer.app/${href.substring('fluxer:/'.length)}';
  }
  if (href.startsWith('fluxer:')) {
    return 'https://fluxer.app/${href.substring('fluxer:'.length)}';
  }
  return href;
}

Uri? _parseFluxerAppLinkPath(String href) {
  if (!href.startsWith('fluxer:')) {
    return null;
  }
  if (href.startsWith('fluxer://') || href.startsWith('fluxer:/')) {
    final String normalized =
        href.startsWith('fluxer:/') && !href.startsWith('fluxer://')
        ? 'fluxer://${href.substring('fluxer:/'.length)}'
        : href;
    return normalizeAppProtocolDeepLinkUri(Uri.parse(normalized));
  }
  final String path = href.substring('fluxer:'.length);
  return Uri(path: path.startsWith('/') ? path : '/$path');
}

FluxerMarkdownConfig createFluxerMarkdownConfig({
  BuildContext? context,
  String? channelId,
  List<MessageChannelMention> mentionChannels = const [],
  bool revealSpoilers = false,
  FluxerSpoilerSyncController? spoilerSyncController,
  FluxerTimestampFormatter? timestampFormatter,
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
    codeTextStyle: context?.textStyles.codeText,
    tableBorderColor: context?.colors.borderColor,
    tableHeaderBackgroundColor: context?.colors.bgTableHeader,
    tableHeaderTextColor: context?.colors.textPrimary,
    tableRowOddBackgroundColor: context?.colors.bgTableRowOdd,
    tableRowEvenBackgroundColor: context?.colors.bgTableRowEven,
    tableBorderRadius: context?.layout.radiusMd,
    spoilerBackgroundColor: context?.colors.spoilerBackground,
    internalLinkPattern: buildChannelJumpLinkPattern(channelJumpLinkHosts()),
    userMentionBuilder: (context, id, style) {
      return UserMention(userId: id, channelId: channelId, baseStyle: style);
    },
    channelMentionBuilder: (context, id, style) {
      return ChannelMention(
        channelId: id,
        fallback: findChannelMentionFallback(mentionChannels, id),
        baseStyle: style,
      );
    },
    roleMentionBuilder: (context, id, style) {
      return RoleMention(roleId: id, baseStyle: style);
    },
    everyoneMentionBuilder: (context, label, style) {
      return TextMention(label: label, baseStyle: style);
    },
    commandMentionBuilder: (context, command, applicationId, style) {
      return CommandMention(
        command: command,
        applicationId: applicationId,
        baseStyle: style,
      );
    },
    guildNavigationMentionBuilder: (context, type, navigationId, style) {
      return GuildNavigationMention(
        type: type,
        navigationId: navigationId,
        baseStyle: style,
      );
    },
    linkWidgetBuilder: (context, href, style) {
      final String resolvedHref = href.startsWith('fluxer:')
          ? _fluxerAppLinkToHttps(href)
          : href;
      final link = parseChannelJumpLink(resolvedHref);
      if (link == null) {
        return null;
      }
      return ChannelJumpLinkMention(link: link, url: href, baseStyle: style);
    },
    onTapLink: (context, href) async {
      final Uri? fluxerPath = _parseFluxerAppLinkPath(href);
      if (fluxerPath != null) {
        if (!context.mounted) {
          return;
        }
        final String path = normalizeDeepLinkPath(fluxerPath.path);
        if (path.startsWith('/invite/') || path.startsWith('/gift/')) {
          GoRouter.of(context).go(path);
          return;
        }
      }

      final String resolvedHref = href.startsWith('fluxer:')
          ? _fluxerAppLinkToHttps(href)
          : href;
      final jump = parseChannelJumpLink(resolvedHref);
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

      if (isInviteLink(href)) {
        if (!context.mounted) {
          return;
        }
        await handleInviteLinkTap(context, href);
        return;
      }

      await handleExternalLinkTap(context, href);
    },
    spoilersInitiallyRevealed: revealSpoilers,
    spoilerSyncController: spoilerSyncController,
    spoilerSyncKeyNormalizer: _normalizeSpoilerSyncUrl,
    timestampFormatter: timestampFormatter,
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
