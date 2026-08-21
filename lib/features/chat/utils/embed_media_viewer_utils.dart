import 'dart:async';

import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/forward_message_sheet.dart';
import 'package:fluxer_app/features/chat/utils/embed_animated_image_url.dart';
import 'package:fluxer_app/features/ui/media_viewer/attachment_media_viewer.dart';
import 'package:material_ui/material_ui.dart';

String embedMediaEffectiveUrl(EmbedMedia media) {
  return media.proxyUrl ?? media.url;
}

bool canOpenEmbedMediaViewer(EmbedMedia media) {
  return embedMediaEffectiveUrl(media).isNotEmpty;
}

void openEmbedMediaViewer(
  BuildContext context, {
  required EmbedMedia media,
  String? title,
  bool animated = false,
  int? embedIndex,
  String? channelId,
  String? messageId,
  MessageMediaActionScope? actionScope,
  List<EmbedMedia>? gallery,
  int initialIndex = 0,
}) {
  final List<EmbedMedia> images = gallery ?? <EmbedMedia>[media];
  final List<AttachmentMediaViewerItem> items = images
      .where(canOpenEmbedMediaViewer)
      .map(
        (EmbedMedia item) => buildEmbedMediaViewerItem(
          media: item,
          title: title,
          animated: animated || item.isAnimated,
          embedIndex: embedIndex,
        ),
      )
      .toList();
  if (items.isEmpty) {
    return;
  }
  unawaited(
    showAttachmentMediaViewer(
      context,
      items: items,
      initialIndex: initialIndex.clamp(0, items.length - 1),
      onForward: (channelId != null && messageId != null && embedIndex != null)
          ? (int _) => showForwardMediaSheet(
              context,
              sourceChannelId: channelId,
              sourceMessageId: messageId,
              embedIndices: <int>[embedIndex],
            )
          : null,
      actionScope: actionScope,
    ),
  );
}

AttachmentMediaViewerItem buildEmbedMediaViewerItem({
  required EmbedMedia media,
  String? title,
  bool animated = false,
  int? embedIndex,
}) {
  final String url = animated
      ? animatedEmbedImageUrl(embedMediaEffectiveUrl(media))
      : embedMediaEffectiveUrl(media);
  return AttachmentMediaViewerItem(
    url: url,
    filename: resolveEmbedMediaViewerFilename(url: url, title: title),
    width: media.width,
    height: media.height,
    embedIndex: embedIndex,
    proxyUrl: media.proxyUrl,
    contentType: media.contentType,
  );
}

String resolveEmbedMediaViewerFilename({required String url, String? title}) {
  if (title != null && title.isNotEmpty) {
    return title;
  }
  final Uri? uri = Uri.tryParse(url);
  final List<String> segments = uri?.pathSegments ?? const <String>[];
  if (segments.isNotEmpty) {
    return segments.last;
  }
  return 'image';
}
