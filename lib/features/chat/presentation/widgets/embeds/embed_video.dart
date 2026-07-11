import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_shared.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/chat_inline_video_player.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/spoiler_overlay.dart';
import 'package:fluxer_app/features/chat/utils/media_dimension_utils.dart';
import 'package:fluxer_app/features/mature_content/presentation/widgets/mature_media_overlay.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

/// A video embed
class EmbedVideo extends StatelessWidget {
  final Embed embed;
  final MediaDimensionSize dimensionSize;
  final bool isSpoiler;
  final bool revealSpoiler;
  final FluxerSpoilerSyncController? spoilerSyncController;
  final List<String> spoilerSyncKeys;
  final String? channelId;
  final String? messageId;
  final int? embedIndex;
  final MessageMediaActionScope? videoActionScope;

  const EmbedVideo({
    required this.embed,
    this.dimensionSize = MediaDimensionSize.small,
    this.isSpoiler = false,
    this.revealSpoiler = false,
    this.spoilerSyncController,
    this.spoilerSyncKeys = const [],
    this.channelId,
    this.messageId,
    this.embedIndex,
    this.videoActionScope,
    super.key,
  });

  bool get _hasHeader =>
      embed.providerName != null || embed.author != null || embed.title != null;

  @override
  Widget build(BuildContext context) {
    final sideColor = embed.color != null
        ? Color(0xFF000000 | (embed.color! & 0xFFFFFF))
        : context.colors.backgroundSecondaryAlt;

    final dimensions = mediaDimensionsForSize(dimensionSize);
    final ChatFullscreenVideoLaunchContext launchContext =
        ChatFullscreenVideoLaunchContext.fromEmbed(
          embed: embed,
          embedIndex: embedIndex,
          actionScope: videoActionScope,
        );

    return Container(
      margin: const EdgeInsets.only(top: 4),
      constraints: BoxConstraints(maxWidth: dimensions.maxWidth),
      decoration: BoxDecoration(
        color: context.colors.embedBackground,
        border: Border(left: BorderSide(color: sideColor, width: 4)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_hasHeader)
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (embed.providerName != null)
                    EmbedInlineText(
                      text: embed.providerName!,
                      style: context.textStyles.embedFooter.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  if (embed.author != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: EmbedAuthorRow(author: embed.author!),
                    ),
                  if (embed.title != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: EmbedTitle(title: embed.title!, url: embed.url),
                    ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
            child: SpoilerOverlay(
              isSpoiler: isSpoiler,
              initiallyRevealed: revealSpoiler,
              borderRadius: BorderRadius.circular(4),
              spoilerSyncController: spoilerSyncController,
              syncKeys: spoilerSyncKeys,
              child: MatureMediaOverlay(
                channelId: channelId,
                isMatureMedia: embed.isMatureMedia,
                borderRadius: BorderRadius.circular(4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: ChatInlineVideoPlayer(
                    source: launchContext.source,
                    launchContext: launchContext,
                    dimensionSize: dimensionSize,
                    posterFit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
