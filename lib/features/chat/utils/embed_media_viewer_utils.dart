import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/embed_animated_image_url.dart';
import 'package:fluxer_app/features/ui/media_viewer/attachment_media_viewer.dart';

String embedMediaEffectiveUrl(EmbedMedia media) {
  return media.proxyUrl ?? media.url;
}

bool canOpenEmbedMediaViewer(EmbedMedia media) {
  return embedMediaEffectiveUrl(media).isNotEmpty;
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
