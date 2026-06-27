import 'dart:async';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluxer_app/features/chat/domain/chat_video_source.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/forward_message_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/attachment_expiry_footnote.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/chat_inline_video_player.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/chat_mobile_fullscreen_video.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/spoiler_overlay.dart';
import 'package:fluxer_app/features/chat/utils/media_dimension_utils.dart';
import 'package:fluxer_app/features/mature_content/presentation/widgets/mature_media_overlay.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:intl/intl.dart';

class AttachmentMediaGrid extends StatelessWidget {
  const AttachmentMediaGrid({
    required this.attachments,
    required this.revealSpoilers,
    required this.dimensionSize,
    this.channelId,
    this.messageId,
    super.key,
  });

  final List<Attachment> attachments;
  final bool revealSpoilers;
  final MediaDimensionSize dimensionSize;
  final String? channelId;
  final String? messageId;

  @override
  Widget build(BuildContext context) {
    if (attachments.isEmpty) {
      return const SizedBox.shrink();
    }
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
    return SizedBox(
      height: 300,
      child: Row(
        children: [
          Expanded(child: _buildTile(context, items[0])),
          const SizedBox(width: _kGridGap),
          Expanded(
            child: Column(
              children: [
                Expanded(child: _buildTile(context, items[1])),
                const SizedBox(height: _kGridGap),
                Expanded(child: _buildTile(context, items[2])),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroGridLayout(
    BuildContext context,
    List<Attachment> items, {
    required double heroRatio,
    required List<int> rows,
  }) {
    int index = 0;
    final List<Widget> children = <Widget>[
      AspectRatio(
        aspectRatio: heroRatio,
        child: _buildTile(context, items[index]),
      ),
    ];
    index++;
    for (final int rowCount in rows) {
      if (index >= items.length) {
        break;
      }
      children
        ..add(const SizedBox(height: _kGridGap))
        ..add(_buildRow(context, items, index, rowCount));
      index += rowCount;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
  }

  Widget _buildRows(
    BuildContext context,
    List<Attachment> items,
    List<int> rows,
  ) {
    int index = 0;
    final List<Widget> children = <Widget>[];
    for (int i = 0; i < rows.length; i++) {
      if (index >= items.length) {
        break;
      }
      if (i > 0) {
        children.add(const SizedBox(height: _kGridGap));
      }
      children.add(_buildRow(context, items, index, rows[i]));
      index += rows[i];
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
  }

  Widget _buildRow(
    BuildContext context,
    List<Attachment> items,
    int startIndex,
    int count,
  ) {
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
            child: _buildTile(context, items[itemIndex]),
          ),
        ),
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: rowChildren,
    );
  }

  Widget _buildTile(BuildContext context, Attachment attachment) {
    final bool isVideo = attachment.isVideo;
    final bool canOpen =
        attachment.url.isNotEmpty && (!attachment.isSpoiler || revealSpoilers);
    final double dpr = MediaQuery.devicePixelRatioOf(context);
    final FluxerMediaDimensions dimensions = mediaDimensionsForSize(
      dimensionSize,
    );
    final String displayUrl = isVideo
        ? (ChatVideoSource.fromAttachment(attachment, dimensions).posterUrl ??
              '')
        : attachment.url;
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SpoilerOverlay(
        isSpoiler: attachment.isSpoiler,
        initiallyRevealed: revealSpoilers,
        child: MatureMediaOverlay(
          channelId: channelId,
          isMatureMedia: attachment.isMatureMedia,
          borderRadius: BorderRadius.circular(8),
          child: GestureDetector(
            onTap: canOpen ? () => _openMedia(context, attachment) : null,
            child: DecoratedBox(
              decoration: const BoxDecoration(color: Colors.black),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (displayUrl.isEmpty) {
                        return const ColoredBox(color: Colors.black);
                      }
                      final ({int? width, int? height}) cache =
                          coverDecodeCacheSize(
                            cellWidth: constraints.maxWidth,
                            cellHeight: constraints.maxHeight,
                            devicePixelRatio: dpr,
                            sourceWidth: attachment.width,
                            sourceHeight: attachment.height,
                          );
                      return CachedNetworkImage(
                        imageUrl: displayUrl,
                        memCacheWidth: cache.width,
                        memCacheHeight: cache.height,
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) =>
                            const ColoredBox(color: Colors.black),
                      );
                    },
                  ),
                  if (isVideo) const VideoPlayButtonOverlay(),
                ],
              ),
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
          source: ChatVideoSource.fromAttachment(
            attachment,
            mediaDimensionsForSize(dimensionSize),
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
    final DateFormat dateFormat = DateFormat('dd MMM, yyyy');
    final String earliest = dateFormat.format(dates.first);
    final String latest = dateFormat.format(dates.last);
    if (earliest == latest) {
      return l10n.chatAttachmentExpiresOn(earliest);
    }
    return l10n.chatAttachmentExpiresBetween(earliest, latest);
  }
}

const double _kGridGap = 4;
