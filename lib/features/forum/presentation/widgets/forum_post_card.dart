import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/attachments/attachment_display_utils.dart';
import 'package:fluxer_app/features/chat/utils/media/media_dimension_utils.dart';
import 'package:fluxer_app/features/chat/utils/media/media_proxy_url.dart';
import 'package:fluxer_app/features/forum/domain/forum_channel.dart';
import 'package:fluxer_app/features/forum/presentation/widgets/forum_tag_chip.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/relative_time.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
  });

  final Channel forum;
  final Channel post;
  final String? lastMessageId;
  final bool firstMessageLoaded;
  final Message? firstMessage;
  final bool isNew;
  final int unreadCount;
  final bool hasUnread;
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
    final Attachment? preview = _previewAttachment(message);
    final String? previewUrl = preview == null ? null : _previewUrl(preview);
    final Color cardBackground = forumPostCardBackgroundColor(colors);
    return FluxerTappable(
      onTap: onTap,
      onLongPress: onLongPress,
      semanticLabel: post.name,
      builder: (BuildContext context, Set<WidgetState> states) => Container(
        margin: EdgeInsets.symmetric(
          horizontal: layout.s4,
          vertical: layout.s1,
        ),
        padding: EdgeInsets.all(layout.s3),
        decoration: BoxDecoration(
          color: states.contains(WidgetState.pressed)
              ? colors.backgroundModifierSelected
              : cardBackground,
          borderRadius: layout.radiusXl,
        ),
        child: Row(
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
                      children: <Widget>[
                        for (final ForumTagResponse tag in tags)
                          ForumTagChip(tag: tag, compact: true),
                      ],
                    ),
                    SizedBox(height: layout.s2),
                  ],
                  _ForumPostTitle(data: data),
                  SizedBox(height: layout.s1),
                  _ForumPostSnippet(data: data),
                  SizedBox(height: layout.s2),
                  _ForumPostMeta(data: data, l10n: l10n),
                ],
              ),
            ),
            if (previewUrl != null) ...<Widget>[
              SizedBox(width: layout.s3),
              ClipRRect(
                borderRadius: layout.radiusLg,
                child: _ForumPreviewImage(
                  url: previewUrl,
                  width: 72,
                  height: 72,
                ),
              ),
            ],
            if (showReaction)
              _DefaultReactionButton(data: data, onTap: onToggleReaction),
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
    final Attachment? preview = _previewAttachment(data.firstMessage);
    final String? previewUrl = preview == null ? null : _previewUrl(preview);
    final Color cardBackground = forumPostCardBackgroundColor(colors);
    return FluxerTappable(
      onTap: onTap,
      onLongPress: onLongPress,
      semanticLabel: data.post.name,
      builder: (BuildContext context, Set<WidgetState> states) => ClipRRect(
        borderRadius: layout.radiusXl,
        child: ColoredBox(
          color: states.contains(WidgetState.pressed)
              ? colors.backgroundModifierSelected
              : cardBackground,
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
                    _ForumPostTitle(data: data, maxLines: 1),
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
  const _ForumPostTitle({required this.data, this.maxLines = 2});

  final ForumPostCardData data;
  final int maxLines;

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
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
            decoration: BoxDecoration(
              color: colors.brandPrimary,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              l10n.forumPostNewBadge,
              style: context.textStyles.smallText.copyWith(
                color: colors.textOnBrandPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(width: layout.s1),
        ],
        Expanded(
          child: Text(
            post.name,
            maxLines: maxLines,
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
    return Row(
      children: <Widget>[
        FluxerAvatar(
          imageUrl:
              FluxerMediaUrl.userAvatar(
                userId: message.authorId,
                hash: message.authorAvatar,
              ) ??
              FluxerMediaUrl.defaultAvatar(userId: message.authorId),
          fallbackText: message.authorName,
          size: 16,
        ),
        SizedBox(width: context.layout.s1),
        Flexible(
          child: Text(
            snippet.isEmpty
                ? message.authorName
                : l10n.forumPostSnippet(message.authorName, snippet),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.textStyles.bodySmall.copyWith(
              color: colors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}

class _ForumPostMeta extends StatelessWidget {
  const _ForumPostMeta({
    required this.data,
    required this.l10n,
    this.compact = false,
  });

  final ForumPostCardData data;
  final FluxerLocalizations l10n;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final Channel post = data.post;
    final TextStyle style = context.textStyles.smallText.copyWith(
      color: colors.textTertiary,
    );
    final int messageCount = post.messageCount ?? 0;
    final DateTime activity = DateTime.fromMillisecondsSinceEpoch(
      snowflakeTimestampMs(postLastActivityId(post, data.lastMessageId)),
    );
    return Row(
      children: <Widget>[
        PhosphorIcon(
          PhosphorIconsBold.chatCircle,
          size: 13,
          color: colors.textTertiary,
        ),
        SizedBox(width: layout.s1),
        Text(
          data.unreadCount > 0
              ? l10n.forumPostNewMessages(data.unreadCount)
              : '$messageCount',
          style: data.unreadCount > 0
              ? style.copyWith(
                  color: Theme.of(context).brightness == Brightness.light
                      ? colors.brandPrimary
                      : colors.brandPrimaryLight,
                  fontWeight: FontWeight.w700,
                )
              : style,
        ),
        SizedBox(width: layout.s2),
        Flexible(
          child: Text(
            compact
                ? relativeTimeShort(activity, l10n)
                : relativeTime(activity, l10n),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: style,
          ),
        ),
        if (isPostArchived(post) && !compact) ...<Widget>[
          SizedBox(width: layout.s2),
          PhosphorIcon(
            PhosphorIconsBold.archive,
            size: 13,
            color: colors.textTertiary,
            semanticLabel: l10n.forumPostArchived,
          ),
        ],
      ],
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
    return Padding(
      padding: EdgeInsets.only(left: context.layout.s2),
      child: FluxerTappable(
        onTap: onTap,
        toggled: me,
        semanticLabel: FluxerLocalizations.of(context).forumPostReact,
        builder: (BuildContext context, Set<WidgetState> states) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          decoration: BoxDecoration(
            color: me
                ? Color.lerp(cardBackground, colors.brandPrimary, 0.36)
                : light
                ? Color.lerp(cardBackground, colors.brandPrimaryLight, 0.06)
                : colors.backgroundPrimary,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: me
                  ? colors.brandPrimary
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
                    color: !me
                        ? colors.textTertiary
                        : light
                        ? colors.brandPrimary
                        : colors.textOnBrandPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ],
          ),
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
