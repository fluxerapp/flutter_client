import 'dart:async';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/chat_video_source.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/forward_message_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/attachment_expiry_footnote.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/chat_inline_video_player.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/chat_mobile_fullscreen_video.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/spoiler_overlay.dart';
import 'package:fluxer_app/features/chat/utils/hdr_aware_image_url.dart';
import 'package:fluxer_app/features/chat/utils/media_dimension_utils.dart';
import 'package:fluxer_app/features/mature_content/presentation/widgets/mature_media_overlay.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';

class AttachmentMediaGrid extends ConsumerWidget {
  const AttachmentMediaGrid({
    required this.attachments,
    required this.revealSpoilers,
    required this.dimensionSize,
    this.channelId,
    this.messageId,
    this.mediaActionScope,
    super.key,
  });

  final List<Attachment> attachments;
  final bool revealSpoilers;
  final MediaDimensionSize dimensionSize;
  final String? channelId;
  final String? messageId;
  final MessageMediaActionScope? mediaActionScope;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (attachments.isEmpty) {
      return const SizedBox.shrink();
    }
    ref.watch(
      appearancePreferencesProvider.select(
        (AppearancePreferencesState state) => state.hdrDisplayMode,
      ),
    );
    final FluxerMediaDimensions dimensions = mediaDimensionsForSize(
      dimensionSize,
    );
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: dimensions.maxWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLayout(context),
          if (_hasExpiry)
            AttachmentExpiryFootnote(text: _buildExpiryText(context)),
        ],
      ),
    );
  }

  Widget _buildLayout(BuildContext context) {
    final int count = attachments.length.clamp(2, 10);
    final List<Attachment> visibleAttachments = attachments
        .take(count)
        .toList();
    return switch (count) {
      2 => _buildRows(context, visibleAttachments, const [2]),
      3 => _buildThreeLayout(context, visibleAttachments),
      4 => _buildRows(context, visibleAttachments, const [2, 2]),
      5 => _buildRows(context, visibleAttachments, const [2, 3]),
      6 => _buildRows(context, visibleAttachments, const [3, 3]),
      7 => _buildHeroGridLayout(
        context,
        visibleAttachments,
        heroRatio: 16 / 9,
        rows: const [3, 3],
      ),
      8 => _buildRows(context, visibleAttachments, const [2, 3, 3]),
      9 => _buildRows(context, visibleAttachments, const [3, 3, 3]),
      10 => _buildHeroGridLayout(
        context,
        visibleAttachments,
        heroRatio: 16 / 9,
        rows: const [3, 3, 3],
      ),
      _ => _buildRows(context, visibleAttachments, const [2]),
    };
  }

  Widget _buildThreeLayout(BuildContext context, List<Attachment> items) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double gridWidth = constraints.maxWidth;
        final double columnWidth = (gridWidth - _kGridGap) / 2;
        const double rightCellHeight = (_kThreeLayoutHeight - _kGridGap) / 2;
        return SizedBox(
          height: _kThreeLayoutHeight,
          child: Row(
            children: [
              Expanded(
                child: _buildTile(
                  context,
                  items[0],
                  cellWidth: columnWidth,
                  cellHeight: _kThreeLayoutHeight,
                ),
              ),
              const SizedBox(width: _kGridGap),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: _buildTile(
                        context,
                        items[1],
                        cellWidth: columnWidth,
                        cellHeight: rightCellHeight,
                      ),
                    ),
                    const SizedBox(height: _kGridGap),
                    Expanded(
                      child: _buildTile(
                        context,
                        items[2],
                        cellWidth: columnWidth,
                        cellHeight: rightCellHeight,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeroGridLayout(
    BuildContext context,
    List<Attachment> items, {
    required double heroRatio,
    required List<int> rows,
  }) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double gridWidth = constraints.maxWidth;
        final double heroHeight = gridWidth / heroRatio;
        int index = 0;
        final List<Widget> children = <Widget>[
          SizedBox(
            height: heroHeight,
            width: gridWidth,
            child: _buildTile(
              context,
              items[index],
              cellWidth: gridWidth,
              cellHeight: heroHeight,
            ),
          ),
        ];
        index++;
        for (final int rowCount in rows) {
          if (index >= items.length) {
            break;
          }
          children
            ..add(const SizedBox(height: _kGridGap))
            ..add(
              _buildRow(context, items, index, rowCount, gridWidth: gridWidth),
            );
          index += rowCount;
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        );
      },
    );
  }

  Widget _buildRows(
    BuildContext context,
    List<Attachment> items,
    List<int> rows,
  ) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double gridWidth = constraints.maxWidth;
        int index = 0;
        final List<Widget> children = <Widget>[];
        for (int i = 0; i < rows.length; i++) {
          if (index >= items.length) {
            break;
          }
          if (i > 0) {
            children.add(const SizedBox(height: _kGridGap));
          }
          children.add(
            _buildRow(context, items, index, rows[i], gridWidth: gridWidth),
          );
          index += rows[i];
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        );
      },
    );
  }

  Widget _buildRow(
    BuildContext context,
    List<Attachment> items,
    int startIndex,
    int count, {
    required double gridWidth,
  }) {
    final double cellWidth = (gridWidth - (count - 1) * _kGridGap) / count;
    final double cellHeight = cellWidth;
    final List<Widget> rowChildren = <Widget>[];
    for (int i = 0; i < count; i++) {
      final int itemIndex = startIndex + i;
      if (itemIndex >= items.length) {
        break;
      }
      if (i > 0) {
        rowChildren.add(const SizedBox(width: _kGridGap));
      }
      rowChildren.add(
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: _buildTile(
              context,
              items[itemIndex],
              cellWidth: cellWidth,
              cellHeight: cellHeight,
            ),
          ),
        ),
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: rowChildren,
    );
  }

  Widget _buildTile(
    BuildContext context,
    Attachment attachment, {
    required double cellWidth,
    required double cellHeight,
  }) {
    final bool isVideo = attachment.isVideo;
    final bool canOpen = attachment.url.isNotEmpty;
    final HdrDisplayMode hdrDisplayMode = ProviderScope.containerOf(
      context,
    ).read(appearancePreferencesProvider).hdrDisplayMode;
    final double devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
    final FluxerMediaDimensions dimensions = mediaDimensionsForSize(
      dimensionSize,
    );
    final String displayUrl = isVideo
        ? (ChatVideoSource.fromAttachment(attachment, dimensions).posterUrl ??
              '')
        : buildHdrAwareImageUrl(
            url: attachment.proxyUrl ?? attachment.url,
            mode: hdrDisplayMode,
            contentType: attachment.contentType,
          );
    final ({int? width, int? height}) cache = coverDecodeCacheSize(
      cellWidth: cellWidth,
      cellHeight: cellHeight,
      devicePixelRatio: devicePixelRatio,
      sourceWidth: attachment.width,
      sourceHeight: attachment.height,
    );
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SpoilerOverlay(
        isSpoiler: attachment.isSpoiler,
        initiallyRevealed: revealSpoilers,
        child: MatureMediaOverlay(
          channelId: channelId,
          isMatureMedia: attachment.isMatureMedia,
          borderRadius: BorderRadius.circular(8),
          child: FluxerGestureDetector(
            onTap: canOpen ? () => _openMedia(context, attachment) : null,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                if (displayUrl.isEmpty)
                  const ColoredBox(color: Colors.black)
                else
                  CachedNetworkImage(
                    imageUrl: displayUrl,
                    memCacheWidth: cache.width,
                    memCacheHeight: cache.height,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) =>
                        const ColoredBox(color: Colors.black),
                  ),
                if (isVideo) const VideoPlayButtonOverlay(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openMedia(BuildContext context, Attachment attachment) {
    if (attachment.isVideo) {
      unawaited(
        showChatMobileFullscreenVideo(
          context,
          launchContext: ChatFullscreenVideoLaunchContext.fromAttachment(
            attachment: attachment,
            layoutDimensions: mediaDimensionsForSize(dimensionSize),
            actionScope: mediaActionScope,
          ),
        ),
      );
      return;
    }
    final List<Attachment> images = attachments
        .where((Attachment item) => !item.isVideo)
        .toList();
    final int initialIndex = images.indexOf(attachment);
    unawaited(
      showAttachmentMediaViewer(
        context,
        items: images
            .map(
              (Attachment item) => AttachmentMediaViewerItem(
                url: item.url,
                filename: item.filename,
                width: item.width,
                height: item.height,
                isMatureMedia: item.isMatureMedia,
                attachmentId: item.id,
                proxyUrl: item.proxyUrl,
                contentType: item.contentType,
                isExpired: item.expired ?? false,
              ),
            )
            .toList(),
        initialIndex: initialIndex < 0 ? 0 : initialIndex,
        channelId: channelId,
        onForward: (channelId != null && messageId != null)
            ? (int i) => showForwardMediaSheet(
                context,
                sourceChannelId: channelId!,
                sourceMessageId: messageId!,
                attachmentIds: <String>[images[i].id],
              )
            : null,
        actionScope: mediaActionScope,
      ),
    );
  }

  bool get _hasExpiry =>
      attachments.any((Attachment attachment) => attachment.expiresAt != null);

  String _buildExpiryText(BuildContext context) {
    final List<DateTime> dates =
        attachments
            .map((Attachment attachment) => attachment.expiresAt)
            .whereType<DateTime>()
            .toList()
          ..sort();
    if (dates.isEmpty) {
      return '';
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final DateFormat dateFormat = DateFormat('dd MMM, yyyy', l10n.localeName);
    final String earliest = dateFormat.format(dates.first);
    final String latest = dateFormat.format(dates.last);
    if (earliest == latest) {
      return l10n.chatAttachmentExpiresOn(earliest);
    }
    return l10n.chatAttachmentExpiresBetween(earliest, latest);
  }
}

const double _kGridGap = 4;
const double _kThreeLayoutHeight = 300;
