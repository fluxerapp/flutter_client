import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/theme/reaction_chip_colors.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/attachments/attachment_display_utils.dart';
import 'package:fluxer_app/features/chat/utils/media/media_dimension_utils.dart';
import 'package:fluxer_app/features/chat/utils/media/media_proxy_url.dart';
import 'package:fluxer_app/features/forum/domain/forum_channel.dart';
import 'package:fluxer_app/features/forum/presentation/widgets/forum_tag_chip.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/relative_time.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;
import 'package:intl/intl.dart';

Color _forumCardFill(
  BuildContext context,
  Set<WidgetState> states, {
  required bool desktop,
  required Color cardBackground,
}) {
  if (desktop) {
    return states.contains(WidgetState.hovered) ||
            states.contains(WidgetState.pressed)
        ? fluxerDesktopHoverOver(context, cardBackground)
        : cardBackground;
  }
  return states.contains(WidgetState.pressed)
      ? context.colors.backgroundModifierSelected
      : cardBackground;
}

Color forumPostCardBackgroundColor(FluxerColorTheme colors) {
  if (colors.backgroundSecondary == colors.backgroundPrimary) {
    return colors.backgroundSecondaryAlt;
  }
  return colors.backgroundSecondary;
}

class ForumPostCardData {
  const ForumPostCardData({
    required this.forum,
    required this.post,
    required this.firstMessageLoaded,
    this.lastMessageId,
    this.firstMessage,
    this.isNew = false,
    this.unreadCount = 0,
    this.hasUnread = false,
    this.authorBlocked = false,
  });

  final Channel forum;
  final Channel post;
  final String? lastMessageId;
  final bool firstMessageLoaded;
  final Message? firstMessage;
  final bool isNew;
  final int unreadCount;
  final bool hasUnread;
  final bool authorBlocked;
}

const FluxerMediaDimensions _previewDimensions = FluxerMediaDimensions(
  maxWidth: 400,
  maxHeight: 400,
);

Attachment? _previewAttachment(Message? message) {
  if (message == null) {
    return null;
  }
  for (final Attachment attachment in message.attachments) {
    if ((attachment.isImage || attachment.isVideo) &&
        !attachment.isSpoiler &&
        !attachment.isMatureMedia &&
        !(attachment.expired ?? false)) {
      return attachment;
    }
  }
  return null;
}

String? _previewUrl(Attachment attachment) {
  final String url = attachmentEffectiveUrl(attachment);
  if (url.isEmpty) {
    return null;
  }
  if (attachment.isVideo) {
    return buildAttachmentVideoPosterUrl(
      proxyOrUrl: url,
      attachmentWidth: attachment.width,
      attachmentHeight: attachment.height,
      layoutDimensions: _previewDimensions,
    );
  }
  final String? proxy = attachment.proxyUrl?.trim();
  if (proxy == null || proxy.isEmpty) {
    return url;
  }
  final Size? size = constrainMediaSize(
    dimensions: _previewDimensions,
    width: attachment.width,
    height: attachment.height,
  );
  return buildMediaProxyUrl(
    proxy,
    width: size?.width.round(),
    height: size?.height.round(),
  );
}

String _snippet(Message message) =>
    message.content.replaceAll(RegExp(r'\s+'), ' ').trim();

const int forumCardMaxTags = 3;

double forumCardThumbnailSize(BuildContext context) =>
    MediaQuery.sizeOf(context).width >= 600 ? 96 : 80;

String forumPostTitleText(ForumPostCardData data, FluxerLocalizations l10n) =>
    data.authorBlocked ? l10n.forumPostBlockedAuthor : data.post.name;

class ForumPostCard extends StatelessWidget {
  const ForumPostCard({
    required this.data,
    required this.onTap,
    this.onLongPress,
    this.showReaction = false,
    this.onToggleReaction,
    super.key,
  });

  final ForumPostCardData data;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;
  final bool showReaction;
  final VoidCallback? onToggleReaction;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Channel post = data.post;
    final Message? message = data.firstMessage;
    final List<ForumTagResponse> tags = resolveForumTags(
      forumAvailableTags(data.forum),
      postAppliedTags(post),
    );
    final Attachment? preview = data.authorBlocked
        ? null
        : _previewAttachment(message);
    final String? previewUrl = preview == null ? null : _previewUrl(preview);
    final Color cardBackground = forumPostCardBackgroundColor(colors);
    final bool desktop = usesDesktopPointerUi(context);
    return FluxerTappable(
      onTap: onTap,
      onLongPress: onLongPress,
      semanticLabel: forumPostTitleText(data, l10n),
      builder: (BuildContext context, Set<WidgetState> states) => Container(
        margin: EdgeInsets.symmetric(
          horizontal: layout.s4,
          vertical: layout.s1,
        ),
        padding: EdgeInsets.all(desktop ? layout.s3 + 1 : layout.s3),
        decoration: BoxDecoration(
          color: _forumCardFill(
            context,
            states,
            desktop: desktop,
            cardBackground: cardBackground,
          ),
          borderRadius: desktop ? layout.radiusLg : layout.radiusXl,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      if (tags.isNotEmpty) ...<Widget>[
                        Wrap(
                          spacing: layout.s1,
                          runSpacing: layout.s1,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: <Widget>[
                            for (final ForumTagResponse tag in tags.take(
                              forumCardMaxTags,
                            ))
                              ForumTagChip(tag: tag, compact: true),
                            if (tags.length > forumCardMaxTags)
                              Text(
                                '+${tags.length - forumCardMaxTags}',
                                style: context.textStyles.smallText.copyWith(
                                  color: colors.textTertiary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: layout.s2),
                      ],
                      _ForumPostTitle(data: data),
                      if (!data.authorBlocked) ...<Widget>[
                        SizedBox(height: layout.s1),
                        _ForumPostSnippet(data: data),
                      ],
                    ],
                  ),
                ),
                if (previewUrl != null) ...<Widget>[
                  SizedBox(width: layout.s3),
                  ClipRRect(
                    borderRadius: layout.radiusMd,
                    child: _ForumPreviewImage(
                      url: previewUrl,
                      width: forumCardThumbnailSize(context),
                      height: forumCardThumbnailSize(context),
                    ),
                  ),
                ],
              ],
            ),
            SizedBox(height: layout.s2),
            _ForumPostMeta(
              data: data,
              l10n: l10n,
              reaction: showReaction
                  ? _DefaultReactionButton(data: data, onTap: onToggleReaction)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

class ForumPostTile extends StatelessWidget {
  const ForumPostTile({
    required this.data,
    required this.onTap,
    this.onLongPress,
    super.key,
  });

  final ForumPostCardData data;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Attachment? preview = data.authorBlocked
        ? null
        : _previewAttachment(data.firstMessage);
    final String? previewUrl = preview == null ? null : _previewUrl(preview);
    final Color cardBackground = forumPostCardBackgroundColor(colors);
    final bool desktop = usesDesktopPointerUi(context);
    return FluxerTappable(
      onTap: onTap,
      onLongPress: onLongPress,
      semanticLabel: forumPostTitleText(data, l10n),
      builder: (BuildContext context, Set<WidgetState> states) => ClipRRect(
        borderRadius: desktop ? layout.radiusLg : layout.radiusXl,
        child: ColoredBox(
          color: _forumCardFill(
            context,
            states,
            desktop: desktop,
            cardBackground: cardBackground,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: previewUrl == null
                    ? ColoredBox(
                        color: colors.backgroundTertiary,
                        child: Center(
                          child: PhosphorIcon(
                            data.firstMessageLoaded
                                ? PhosphorIconsBold.chatText
                                : PhosphorIconsBold.image,
                            color: colors.textTertiary,
                            size: 28,
                          ),
                        ),
                      )
                    : _ForumPreviewImage(url: previewUrl),
              ),
              Padding(
                padding: EdgeInsets.all(layout.s2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _ForumPostTitle(data: data),
                    SizedBox(height: layout.s1),
                    _ForumPostMeta(data: data, l10n: l10n, compact: true),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ForumPreviewImage extends StatelessWidget {
  const _ForumPreviewImage({required this.url, this.width, this.height});

  final String url;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (_, _, _) =>
          ColoredBox(color: context.colors.backgroundTertiary),
    );
  }
}

class _ForumPostTitle extends StatelessWidget {
  const _ForumPostTitle({required this.data});

  final ForumPostCardData data;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Channel post = data.post;
    final bool emphasized = data.hasUnread || data.isNew;
    return Row(
      children: <Widget>[
        if (isPinnedPost(post)) ...<Widget>[
          PhosphorIcon(
            PhosphorIconsFill.pushPin,
            size: 14,
            color: colors.textSecondary,
            semanticLabel: l10n.forumPostPinned,
          ),
          SizedBox(width: layout.s1),
        ],
        if (post.threadLocked ?? false) ...<Widget>[
          PhosphorIcon(
            PhosphorIconsFill.lock,
            size: 14,
            color: colors.textSecondary,
            semanticLabel: l10n.forumPostLocked,
          ),
          SizedBox(width: layout.s1),
        ],
        if (data.isNew) ...<Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: colors.statusDanger,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              l10n.forumPostNewBadge,
              style: context.textStyles.smallText.copyWith(
                color: colors.textOnBrandPrimary,
                fontSize: 11,
                fontWeight: FontWeight.w700,
                height: 18 / 11,
              ),
            ),
          ),
          SizedBox(width: layout.s1),
        ],
        Expanded(
          child: Text(
            forumPostTitleText(data, l10n),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.textStyles.bodyMedium.copyWith(
              color: emphasized ? colors.textPrimary : colors.textSecondary,
              fontWeight: emphasized ? FontWeight.w700 : FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class _ForumPostSnippet extends StatelessWidget {
  const _ForumPostSnippet({required this.data});

  final ForumPostCardData data;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final Message? message = data.firstMessage;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    if (message == null) {
      if (!data.firstMessageLoaded) {
        return const SizedBox(height: 16);
      }
      return Text(
        l10n.forumPostStarterDeleted,
        style: context.textStyles.bodySmall.copyWith(
          color: colors.textTertiary,
          fontStyle: FontStyle.italic,
        ),
      );
    }
    final String snippet = _snippet(message);
    final TextStyle style = context.textStyles.bodySmall.copyWith(
      color: colors.textSecondary,
    );
    final TextStyle authorStyle = style.copyWith(
      color: colors.textPrimary,
      fontWeight: FontWeight.w600,
    );
    final String text = snippet.isEmpty
        ? message.authorName
        : l10n.forumPostSnippet(message.authorName, snippet);
    final int authorAt = message.authorName.isEmpty
        ? -1
        : text.indexOf(message.authorName);
    return Text.rich(
      authorAt < 0
          ? TextSpan(text: text)
          : TextSpan(
              children: <InlineSpan>[
                TextSpan(text: text.substring(0, authorAt)),
                TextSpan(text: message.authorName, style: authorStyle),
                TextSpan(
                  text: text.substring(authorAt + message.authorName.length),
                ),
              ],
            ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: style,
    );
  }
}

String forumPostCompactCount(int count, String localeName) {
  if (count < 1000) {
    return '$count';
  }
  final NumberFormat format = NumberFormat.compact(locale: localeName)
    ..significantDigitsInUse = false
    ..maximumFractionDigits = 1;
  return format.format(count);
}

class _ForumPostMeta extends StatelessWidget {
  const _ForumPostMeta({
    required this.data,
    required this.l10n,
    this.compact = false,
    this.reaction,
  });

  final ForumPostCardData data;
  final FluxerLocalizations l10n;
  final bool compact;
  final Widget? reaction;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final Channel post = data.post;
    final TextStyle style = context.textStyles.smallText.copyWith(
      color: colors.textTertiary,
      fontFeatures: const <FontFeature>[FontFeature.tabularFigures()],
    );
    final int messageCount = post.messageCount ?? 0;
    final DateTime activity = DateTime.fromMillisecondsSinceEpoch(
      snowflakeTimestampMs(postLastActivityId(post, data.lastMessageId)),
    );
    final bool showNew = data.unreadCount > 0 || data.hasUnread;
    return Row(
      key: const ValueKey<String>('forumPostFooter'),
      children: <Widget>[
        if (reaction != null) ...<Widget>[
          reaction!,
          SizedBox(width: layout.s2),
        ],
        Semantics(
          label: l10n.threadMessageCount(messageCount),
          excludeSemantics: true,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              PhosphorIcon(
                PhosphorIconsBold.chatCircle,
                size: 13,
                color: colors.textTertiary,
              ),
              SizedBox(width: layout.s1),
              Text(
                forumPostCompactCount(
                  messageCount,
                  Localizations.localeOf(context).toString(),
                ),
                maxLines: 1,
                style: style,
              ),
            ],
          ),
        ),
        SizedBox(width: layout.s2),
        Expanded(
          child: _ForumPostMetaTail(
            newLabel: showNew
                ? (data.unreadCount > 0
                      ? l10n.forumPostNewMessagesShort(data.unreadCount)
                      : l10n.forumPostHasNewMessagesShort)
                : null,
            newSemanticLabel: data.unreadCount > 0
                ? l10n.forumPostNewMessages(data.unreadCount)
                : l10n.forumPostHasNewMessages,
            newStyle: style.copyWith(
              color: Theme.of(context).brightness == Brightness.light
                  ? colors.brandPrimary
                  : colors.brandPrimaryLight,
              fontWeight: FontWeight.w600,
            ),
            time: relativeTimeShort(activity, l10n),
            timeSemanticLabel: relativeTime(activity, l10n),
            timeStyle: style,
            archived: isPostArchived(post) && !compact,
            archivedLabel: l10n.forumPostArchived,
          ),
        ),
      ],
    );
  }
}

/// Lays out the new count and the time after the message count. A part that
/// does not fit is dropped whole, never cut mid-word: the new count goes
/// first, then the time.
class _ForumPostMetaTail extends StatelessWidget {
  const _ForumPostMetaTail({
    required this.newLabel,
    required this.newSemanticLabel,
    required this.newStyle,
    required this.time,
    required this.timeSemanticLabel,
    required this.timeStyle,
    required this.archived,
    required this.archivedLabel,
  });

  static const double _archiveIconSize = 13;

  final String? newLabel;
  final String newSemanticLabel;
  final TextStyle newStyle;
  final String time;
  final String timeSemanticLabel;
  final TextStyle timeStyle;
  final bool archived;
  final String archivedLabel;

  double _textWidth(BuildContext context, String text, TextStyle style) {
    final TextPainter painter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: Directionality.of(context),
      textScaler: MediaQuery.textScalerOf(context),
    )..layout();
    final double width = painter.width;
    painter.dispose();
    return width;
  }

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double timeWidth =
            _textWidth(context, time, timeStyle) +
            (archived ? layout.s1 + _archiveIconSize : 0);
        final bool showTime = timeWidth <= constraints.maxWidth;
        final String? label = newLabel;
        final bool showNew =
            label != null &&
            _textWidth(context, label, newStyle) +
                    (showTime ? layout.s2 + timeWidth : 0) <=
                constraints.maxWidth;
        return Row(
          children: <Widget>[
            if (showNew)
              Semantics(
                label: newSemanticLabel,
                excludeSemantics: true,
                child: Text(
                  label,
                  maxLines: 1,
                  softWrap: false,
                  style: newStyle,
                ),
              ),
            const Spacer(),
            if (showTime) ...<Widget>[
              Semantics(
                label: timeSemanticLabel,
                excludeSemantics: true,
                child: Text(
                  time,
                  maxLines: 1,
                  softWrap: false,
                  style: timeStyle,
                ),
              ),
              if (archived) ...<Widget>[
                SizedBox(width: layout.s1),
                PhosphorIcon(
                  PhosphorIconsBold.archive,
                  size: _archiveIconSize,
                  color: timeStyle.color,
                  semanticLabel: archivedLabel,
                ),
              ],
            ],
          ],
        );
      },
    );
  }
}

class _DefaultReactionButton extends StatelessWidget {
  const _DefaultReactionButton({required this.data, required this.onTap});

  final ForumPostCardData data;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final DefaultReactionEmojiResponse? reaction = forumDefaultReaction(
      data.forum,
    );
    final Message? message = data.firstMessage;
    if (reaction == null || message == null) {
      return const SizedBox.shrink();
    }
    final Reaction? current = forumDefaultReactionState(message, reaction);
    final bool me = current?.hasReacted ?? false;
    final int count = current?.count ?? 0;
    final colors = context.colors;
    final Color cardBackground = forumPostCardBackgroundColor(colors);
    final bool light = Theme.of(context).brightness == Brightness.light;
    final SelectedReactionChipColors selected = selectedReactionChipColors(
      context,
      surface: cardBackground,
    );
    return FluxerTappable(
      onTap: onTap,
      toggled: me,
      minSize: const Size(40, 32),
      semanticLabel: FluxerLocalizations.of(context).forumPostReact,
      builder: (BuildContext context, Set<WidgetState> states) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        decoration: BoxDecoration(
          color: me
              ? selected.background
              : light
              ? Color.lerp(cardBackground, colors.brandPrimaryLight, 0.06)
              : colors.backgroundPrimary,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: me
                ? selected.border
                : light
                ? Color.lerp(cardBackground, colors.brandPrimaryLight, 0.10)!
                : Colors.transparent,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ForumEmoji(
              emojiId: reaction.emojiId,
              emojiName: reaction.emojiName,
              size: 19,
            ),
            if (count > 0) ...<Widget>[
              const SizedBox(width: 6),
              Text(
                '$count',
                style: context.textStyles.smallText.copyWith(
                  color: me ? selected.foreground : colors.textTertiary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

Reaction? forumDefaultReactionState(
  Message message,
  DefaultReactionEmojiResponse reaction,
) {
  for (final Reaction entry in message.reactions) {
    final bool same = reaction.emojiId != null
        ? entry.emojiId == reaction.emojiId
        : entry.emojiId == null && entry.emoji == reaction.emojiName;
    if (same) {
      return entry;
    }
  }
  return null;
}
