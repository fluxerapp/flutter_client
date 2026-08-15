import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/deep_links/deep_link_path_policy.dart';
import 'package:fluxer_app/core/deep_links/user_settings_deep_link.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/utils/channel_jump_link.dart';
import 'package:fluxer_app/features/channels/utils/channel_mention_utils.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_alert.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_mention.dart';
import 'package:fluxer_app/features/chat/utils/channel_jump_navigator.dart';
import 'package:fluxer_app/features/guilds/utils/invite_link_navigator.dart';
import 'package:fluxer_app/features/settings/utils/open_user_settings_deep_link.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:fluxer_app/shared/markdown/message_markdown_settings.dart';
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

Widget _fluxerUserMentionBuilder(
  BuildContext context,
  String id,
  TextStyle style,
) {
  final MessageMarkdownBinding? binding = MessageMarkdownBinding.maybeOf(
    context,
  );
  return UserMention(
    userId: id,
    channelId: binding?.channelId,
    guildId: binding?.guildId,
    baseStyle: style,
  );
}

Widget _fluxerChannelMentionBuilder(
  BuildContext context,
  String id,
  TextStyle style,
) {
  final MessageMarkdownBinding? binding = MessageMarkdownBinding.maybeOf(
    context,
  );
  return ChannelMention(
    channelId: id,
    fallback: findChannelMentionFallback(
      binding?.mentionChannels ?? const <MessageChannelMention>[],
      id,
    ),
    baseStyle: style,
  );
}

Widget _fluxerRoleMentionBuilder(
  BuildContext context,
  String id,
  TextStyle style,
) {
  return RoleMention(roleId: id, baseStyle: style);
}

Widget _fluxerEveryoneMentionBuilder(
  BuildContext context,
  String label,
  TextStyle style,
) {
  return TextMention(label: label, baseStyle: style);
}

Widget _fluxerCommandMentionBuilder(
  BuildContext context,
  String command,
  String applicationId,
  TextStyle style,
) {
  return CommandMention(
    command: command,
    applicationId: applicationId,
    baseStyle: style,
  );
}

Widget _fluxerGuildNavigationMentionBuilder(
  BuildContext context,
  FluxerGuildNavigationType type,
  String? navigationId,
  TextStyle style,
) {
  return GuildNavigationMention(
    type: type,
    navigationId: navigationId,
    baseStyle: style,
  );
}

Widget? _fluxerLinkWidgetBuilder(
  BuildContext context,
  String href,
  TextStyle style,
) {
  final UserSettingsDeepLinkTarget? settingsTarget = _parseSettingsDeepLinkHref(
    href,
  );
  if (settingsTarget != null) {
    return SettingsJumpLinkMention(target: settingsTarget, baseStyle: style);
  }
  final String resolvedHref = href.startsWith('fluxer:')
      ? _fluxerAppLinkToHttps(href)
      : href;
  final ChannelJumpLink? link = parseChannelJumpLink(resolvedHref);
  if (link == null) {
    return null;
  }
  return ChannelJumpLinkMention(link: link, url: href, baseStyle: style);
}

Future<void> _fluxerOnTapLink(BuildContext context, String href) async {
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
    if (isUserSettingsDeepLinkPath(fluxerPath)) {
      await openUserSettingsDeepLinkFromContext(
        context,
        parseUserSettingsDeepLink(fluxerPath)!,
      );
      return;
    }
  }

  final String resolvedHref = href.startsWith('fluxer:')
      ? _fluxerAppLinkToHttps(href)
      : href;
  final ChannelJumpLink? jump = parseChannelJumpLink(resolvedHref);
  if (jump != null) {
    if (!context.mounted) {
      return;
    }
    await navigateToChannelJumpLinkFromContext(context: context, link: jump);
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
}

Widget _fluxerAlertBuilder(
  BuildContext context,
  FluxerAlertType type,
  Widget body,
  TextStyle baseStyle,
) {
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
}

void _fluxerOnCopyCode(BuildContext ctx, String _) {
  ProviderScope.containerOf(ctx, listen: false)
      .read(toastProvider.notifier)
      .show(
        FluxerToast(
          message: FluxerLocalizations.of(ctx).copiedToClipboard,
          variant: FluxerToastVariant.success,
        ),
      );
}

FluxerMarkdownConfig createFluxerMarkdownConfig({
  BuildContext? context,
  bool revealSpoilers = false,
  FluxerSpoilerSyncController? spoilerSyncController,
  FluxerTimestampFormatter? timestampFormatter,
  FluxerSelectionContextMenuBuilder? selectionContextMenuBuilder,
  bool alwaysUnderlineLinks = false,
  bool dimStrikethroughText = true,
  bool animateCustomEmoji = true,
}) {
  return FluxerMarkdownConfig(
    resolveEmojiShortcode: EmojiRegistry.resolveSync,
    unicodeEmojiUrlBuilder: getTwemojiUrl,
    customEmojiUrlBuilder: FluxerMediaUrl.customEmoji,
    unicodeEmojiPattern: EmojiRegistry.unicodeEmojiRegexSync,
    animateCustomEmoji: animateCustomEmoji,
    linkColor: context?.colors.textLink,
    blockquoteBorderColor: context?.colors.interactiveMuted,
    blockquoteTextColor: context?.colors.textChatMuted,
    alwaysUnderlineLinks: alwaysUnderlineLinks,
    dimStrikethroughText: dimStrikethroughText,
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
    userMentionBuilder: _fluxerUserMentionBuilder,
    channelMentionBuilder: _fluxerChannelMentionBuilder,
    roleMentionBuilder: _fluxerRoleMentionBuilder,
    everyoneMentionBuilder: _fluxerEveryoneMentionBuilder,
    commandMentionBuilder: _fluxerCommandMentionBuilder,
    guildNavigationMentionBuilder: _fluxerGuildNavigationMentionBuilder,
    linkWidgetBuilder: _fluxerLinkWidgetBuilder,
    onTapLink: _fluxerOnTapLink,
    spoilersInitiallyRevealed: revealSpoilers,
    spoilerSyncController: spoilerSyncController,
    spoilerSyncKeyNormalizer: _normalizeSpoilerSyncUrl,
    timestampFormatter: timestampFormatter,
    alertBuilder: _fluxerAlertBuilder,
    onCopyCode: _fluxerOnCopyCode,
    selectionContextMenuBuilder: selectionContextMenuBuilder,
  );
}

UserSettingsDeepLinkTarget? _parseSettingsDeepLinkHref(String href) {
  final Uri? fluxerPath = _parseFluxerAppLinkPath(href);
  if (fluxerPath == null || !isUserSettingsDeepLinkPath(fluxerPath)) {
    return null;
  }
  return parseUserSettingsDeepLink(fluxerPath);
}
