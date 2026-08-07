import 'dart:async';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/utils/channel_jump_link.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/attachment_list_renderer.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_image.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_link.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_rich.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_video.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_markdown.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/spoiler_overlay.dart';
import 'package:fluxer_app/features/chat/utils/channel_jump_navigator.dart';
import 'package:fluxer_app/features/chat/utils/embed_gallery_utils.dart';
import 'package:fluxer_app/features/chat/utils/spoiler_utils.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/providers/dm_providers.dart';
import 'package:fluxer_app/features/dm/utils/group_dm_display_name.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';
import 'package:fluxer_app/shared/utils/guild_name_abbreviation.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ForwardedMessageContent extends ConsumerWidget {
  const ForwardedMessageContent({
    required this.message,
    required this.snapshot,
    required this.renderEmbeds,
    required this.inlineAttachmentMedia,
    required this.revealSpoilers,
    required this.chatPreferences,
    required this.spoilerSyncController,
    super.key,
  });

  final Message message;
  final MessageSnapshot snapshot;
  final bool renderEmbeds;
  final bool inlineAttachmentMedia;
  final bool revealSpoilers;
  final ChatPreferencesState chatPreferences;
  final FluxerSpoilerSyncController spoilerSyncController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spoileredUrls = extractSpoileredUrls(snapshot.content);
    final attachmentSize = snapshot.hasCompactAttachments
        ? MediaDimensionSize.small
        : chatPreferences.attachmentMediaDimensionSize;

    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Stack(
        children: [
          PositionedDirectional(
            start: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 4,
              decoration: BoxDecoration(
                color: context.colors.interactiveMuted,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 16,
              top: 4,
              bottom: 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _ForwardedHeader(),
                if (snapshot.content.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: MessageMarkdown(
                      data: snapshot.content,
                      channelId: message.channelId,
                      mentionChannels: snapshot.mentionChannels,
                      baseStyle: context.textStyles.messageText.copyWith(
                        fontSize: 13,
                        color: context.colors.textChat,
                      ),
                      revealSpoilers: revealSpoilers,
                      spoilerSyncController: spoilerSyncController,
                    ),
                  ),
                if (snapshot.attachments.isNotEmpty)
                  AttachmentListRenderer(
                    attachments: snapshot.attachments,
                    inlineAttachmentMedia: inlineAttachmentMedia,
                    dimensionSize: attachmentSize,
                    revealSpoilers: revealSpoilers,
                    topPadding: 4,
                    channelId: message.channelId,
                    messageId: message.id,
                    messageFlags: snapshot.flags,
                  ),
                if (renderEmbeds)
                  ...() {
                    final EmbedGalleryIndex galleryIndex = EmbedGalleryIndex(
                      snapshot.embeds,
                    );
                    return snapshot.embeds.indexed
                        .where((entry) => !galleryIndex.isDuplicateAt(entry.$1))
                        .map((entry) {
                          final int embedIndex = entry.$1;
                          final embed = entry.$2;
                          final spoilerSyncKeys = spoilerSyncKeysForEmbed(
                            embed,
                            spoileredUrls,
                          );
                          return Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: _ForwardedEmbed(
                              embed: embed,
                              galleryIndex: galleryIndex,
                              dimensionSize:
                                  chatPreferences.embedMediaDimensionSize,
                              revealSpoilers: revealSpoilers,
                              isSpoiler: spoilerSyncKeys.isNotEmpty,
                              spoilerSyncKeys: spoilerSyncKeys,
                              spoilerSyncController: spoilerSyncController,
                              channelId: message.channelId,
                              messageId: message.id,
                              embedIndex: embedIndex,
                            ),
                          );
                        });
                  }(),
                if (message.messageReference != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: _ForwardedSourceButton(
                      reference: message.messageReference!,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ForwardedHeader extends StatelessWidget {
  const _ForwardedHeader();

  @override
  Widget build(BuildContext context) {
    final color = context.colors.textPrimaryMuted;
    return Row(
      children: [
        PhosphorIcon(
          PhosphorIconsBold.arrowBendUpRight,
          size: 14,
          color: color,
        ),
        const SizedBox(width: 4),
        Text(
          'Forwarded',
          style: context.textStyles.timestamp.copyWith(
            color: color,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}

class _ForwardedEmbed extends StatelessWidget {
  const _ForwardedEmbed({
    required this.embed,
    required this.galleryIndex,
    required this.dimensionSize,
    required this.revealSpoilers,
    required this.isSpoiler,
    required this.spoilerSyncKeys,
    required this.spoilerSyncController,
    this.channelId,
    this.messageId,
    this.embedIndex,
  });

  final Embed embed;
  final EmbedGalleryIndex galleryIndex;
  final MediaDimensionSize dimensionSize;
  final bool revealSpoilers;
  final bool isSpoiler;
  final List<String> spoilerSyncKeys;
  final FluxerSpoilerSyncController spoilerSyncController;
  final String? channelId;
  final String? messageId;
  final int? embedIndex;

  @override
  Widget build(BuildContext context) {
    final child = switch (embed.type) {
      EmbedType.rich => EmbedRich(
        embed: embed,
        galleryIndex: galleryIndex,
        embedIndex: embedIndex ?? 0,
        dimensionSize: dimensionSize,
        revealSpoilers: revealSpoilers,
        spoilerSyncController: spoilerSyncController,
        channelId: channelId,
        messageId: messageId,
      ),
      EmbedType.image || EmbedType.gifv => EmbedImage(
        embed: embed,
        dimensionSize: dimensionSize,
        isSpoiler: isSpoiler,
        revealSpoiler: revealSpoilers,
        spoilerSyncController: spoilerSyncController,
        spoilerSyncKeys: spoilerSyncKeys,
        channelId: channelId,
        messageId: messageId,
        embedIndex: embedIndex,
      ),
      EmbedType.link => EmbedLink(
        embed: embed,
        galleryIndex: galleryIndex,
        embedIndex: embedIndex ?? 0,
        dimensionSize: dimensionSize,
        revealSpoilers: revealSpoilers,
        spoilerSyncController: spoilerSyncController,
        channelId: channelId,
        messageId: messageId,
      ),
      EmbedType.video => EmbedVideo(
        embed: embed,
        dimensionSize: dimensionSize,
        isSpoiler: isSpoiler,
        revealSpoiler: revealSpoilers,
        spoilerSyncController: spoilerSyncController,
        spoilerSyncKeys: spoilerSyncKeys,
        channelId: channelId,
      ),
    };

    if (embed.type == EmbedType.image ||
        embed.type == EmbedType.gifv ||
        embed.type == EmbedType.video) {
      return child;
    }

    return SpoilerOverlay(
      isSpoiler: isSpoiler,
      initiallyRevealed: revealSpoilers,
      spoilerSyncController: spoilerSyncController,
      syncKeys: spoilerSyncKeys,
      child: child,
    );
  }
}

class _ForwardedSourceButton extends ConsumerStatefulWidget {
  const _ForwardedSourceButton({required this.reference});

  final MessageReference reference;

  @override
  ConsumerState<_ForwardedSourceButton> createState() =>
      _ForwardedSourceButtonState();
}

class _ForwardedSourceButtonState
    extends ConsumerState<_ForwardedSourceButton> {
  late Future<_ForwardedSourceData?> _future;

  @override
  void initState() {
    super.initState();
    _future = _load();
  }

  @override
  void didUpdateWidget(covariant _ForwardedSourceButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.reference.channelId != widget.reference.channelId ||
        oldWidget.reference.messageId != widget.reference.messageId ||
        oldWidget.reference.guildId != widget.reference.guildId) {
      _future = _load();
    }
  }

  Future<_ForwardedSourceData?> _load() async {
    final db = ref.read(fluxerDatabaseProvider);
    final guildChannel = await db.channelDao.getChannelById(
      widget.reference.channelId,
    );
    if (guildChannel != null) {
      final guildId = widget.reference.guildId ?? guildChannel.guildId;
      final guildRow = await db.guildDao.getServerById(guildId);
      return _ForwardedSourceData.guildChannel(
        channelId: widget.reference.channelId,
        messageId: widget.reference.messageId,
        guildId: guildId,
        channelName: guildChannel.name,
        channelType: ChannelType.fromWire(guildChannel.type),
        guild: guildRow == null ? null : Guild.fromRow(guildRow),
      );
    }

    final dmChannel = await db.dmChannelDao.getDmChannelById(
      widget.reference.channelId,
    );
    if (dmChannel == null) {
      return null;
    }

    if (isDmGroupType(dmChannel.type)) {
      final conversation = await ref
          .read(dmRepositoryProvider)
          .conversationFromChannelRow(dmChannel);
      return _ForwardedSourceData.groupDm(
        channelId: widget.reference.channelId,
        messageId: widget.reference.messageId,
        name: resolveGroupDmDisplayName(dm: conversation),
      );
    }

    final user = await db.userDao.getUserById(dmChannel.recipientId);
    final relationship = await db.relationshipDao.getRelationship(
      dmChannel.recipientId,
    );
    final name = resolveDisplayName(
      friendNickname: relationship?.nickname,
      globalName: user?.globalName,
      username: user?.username ?? dmChannel.recipientId,
    );
    return _ForwardedSourceData.dm(
      channelId: widget.reference.channelId,
      messageId: widget.reference.messageId,
      name: name,
      avatar: user?.avatar,
      userId: user?.id ?? dmChannel.recipientId,
    );
  }

  void _jumpToOriginal(_ForwardedSourceData data) {
    final ChannelJumpLink link = MessageJumpLink(
      scope: data.guildId ?? '@me',
      channelId: data.channelId,
      messageId: data.messageId,
    );
    unawaited(
      navigateToChannelJumpLink(
        container: ref.container,
        context: context,
        link: link,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<_ForwardedSourceData?>(
      future: _future,
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (data == null) {
          return const SizedBox.shrink();
        }

        return Align(
          alignment: Alignment.centerLeft,
          child: Material(
            color: context.colors.backgroundSecondary,
            borderRadius: BorderRadius.circular(6),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: context.colors.backgroundModifierAccent,
                ),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(6),
                onTap: () => _jumpToOriginal(data),
                hoverColor: context.colors.backgroundSecondaryAlt,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Forwarded from',
                        style: context.textStyles.timestamp.copyWith(
                          color: context.colors.textPrimaryMuted,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Flexible(child: _ForwardedSourceInfo(data: data)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ForwardedSourceInfo extends StatelessWidget {
  const _ForwardedSourceInfo({required this.data});

  final _ForwardedSourceData data;

  @override
  Widget build(BuildContext context) {
    final style = context.textStyles.timestamp.copyWith(
      fontWeight: FontWeight.w500,
      color: context.colors.textPrimary,
    );
    final muted = context.colors.textSecondary;

    if (data.kind == _ForwardedSourceKind.dm) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _DirectMessageAvatar(data: data),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              data.primaryName ?? '',
              style: style,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      );
    }

    if (data.kind == _ForwardedSourceKind.groupDm) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          PhosphorIcon(PhosphorIconsFill.usersThree, size: 14, color: muted),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              data.primaryName ?? '',
              style: style,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      );
    }

    if (data.guild != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _GuildSourceIcon(guild: data.guild!),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              data.guild!.name,
              style: style,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const SizedBox(width: 4),
          PhosphorIcon(PhosphorIconsBold.caretRight, size: 12, color: muted),
          const SizedBox(width: 4),
          ChannelIcon(
            type: data.channelType ?? ChannelType.guildText,
            size: 13,
            color: muted,
          ),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              data.primaryName ?? '',
              style: style,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ChannelIcon(
          type: data.channelType ?? ChannelType.guildText,
          size: 13,
          color: muted,
        ),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            data.primaryName ?? '',
            style: style,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}

class _DirectMessageAvatar extends StatelessWidget {
  const _DirectMessageAvatar({required this.data});

  final _ForwardedSourceData data;

  @override
  Widget build(BuildContext context) {
    if (data.avatarUrl == null) {
      return PhosphorIcon(
        PhosphorIconsFill.chatCircle,
        size: 14,
        color: context.colors.textPrimaryMuted,
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: CachedNetworkImage(
        imageUrl: data.avatarUrl!,
        width: 16,
        height: 16,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => PhosphorIcon(
          PhosphorIconsFill.chatCircle,
          size: 14,
          color: context.colors.textPrimaryMuted,
        ),
      ),
    );
  }
}

class _GuildSourceIcon extends StatelessWidget {
  const _GuildSourceIcon({required this.guild});

  final Guild guild;

  @override
  Widget build(BuildContext context) {
    if (guild.iconUrl == null) {
      final initials = abbreviateGuildName(guild.name);
      final initialsLength = guildNameInitialsLength(guild.name);
      return Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: context.colors.backgroundSecondaryAlt,
          borderRadius: BorderRadius.circular(4),
        ),
        alignment: Alignment.center,
        child: Text(
          initials,
          style: context.textStyles.smallText.copyWith(
            fontSize: _forwardedGuildInitialsFontSize(initialsLength),
            fontWeight: FontWeight.w700,
            color: context.colors.textPrimary,
          ),
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: CachedNetworkImage(
        imageUrl: guild.iconUrl!,
        width: 16,
        height: 16,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => const SizedBox.shrink(),
      ),
    );
  }
}

double _forwardedGuildInitialsFontSize(int initialsLength) {
  if (initialsLength <= 2) {
    return 10;
  }
  if (initialsLength <= kGuildIconInitialsMaxLength) {
    return 8;
  }
  return 6.5;
}

enum _ForwardedSourceKind { guildChannel, dm, groupDm }

class _ForwardedSourceData {
  const _ForwardedSourceData({
    required this.kind,
    required this.channelId,
    required this.messageId,
    this.guildId,
    this.primaryName,
    this.avatarUrl,
    this.channelType,
    this.guild,
  });

  factory _ForwardedSourceData.guildChannel({
    required String channelId,
    required String messageId,
    required String guildId,
    required String channelName,
    required ChannelType channelType,
    required Guild? guild,
  }) {
    return _ForwardedSourceData(
      kind: _ForwardedSourceKind.guildChannel,
      channelId: channelId,
      messageId: messageId,
      guildId: guildId,
      primaryName: channelName,
      channelType: channelType,
      guild: guild,
    );
  }

  factory _ForwardedSourceData.dm({
    required String channelId,
    required String messageId,
    required String name,
    required String? avatar,
    required String userId,
  }) {
    final avatarUrl = avatar == null
        ? null
        : FluxerMediaUrl.userAvatar(userId: userId, hash: avatar);
    return _ForwardedSourceData(
      kind: _ForwardedSourceKind.dm,
      channelId: channelId,
      messageId: messageId,
      primaryName: name,
      avatarUrl: avatarUrl,
    );
  }

  factory _ForwardedSourceData.groupDm({
    required String channelId,
    required String messageId,
    required String name,
  }) {
    return _ForwardedSourceData(
      kind: _ForwardedSourceKind.groupDm,
      channelId: channelId,
      messageId: messageId,
      primaryName: name,
    );
  }

  final _ForwardedSourceKind kind;
  final String channelId;
  final String messageId;
  final String? guildId;
  final String? primaryName;
  final String? avatarUrl;
  final ChannelType? channelType;
  final Guild? guild;
}
