import 'package:fluxer_app/core/instance/instance_endpoints.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';

const String kYouTubeProviderHostname = 'www.youtube.com';

String? getUrlHostname(String? url) {
  if (url == null || url.trim().isEmpty) {
    return null;
  }
  final String? host = Uri.tryParse(url)?.host;
  if (host == null || host.isEmpty) {
    return null;
  }
  return host;
}

bool isYouTubeEmbed(Embed embed) {
  return getUrlHostname(embed.providerUrl) == kYouTubeProviderHostname;
}

bool isValidEmbedMedia(EmbedMedia? media) {
  if (media == null) {
    return false;
  }
  final int? width = media.width;
  final int? height = media.height;
  return media.proxyUrl != null &&
      media.proxyUrl!.isNotEmpty &&
      media.url.isNotEmpty &&
      width != null &&
      height != null &&
      width > 0 &&
      height > 0;
}

bool canRenderYouTubeEmbed(Embed embed) {
  if (!isYouTubeEmbed(embed)) {
    return false;
  }
  if (!isValidEmbedMedia(embed.video)) {
    return false;
  }
  final String? thumbnailProxyUrl = embed.thumbnail?.proxyUrl;
  return thumbnailProxyUrl != null && thumbnailProxyUrl.isNotEmpty;
}

String youtubeEmbedPageOrigin() => InstanceEndpoints.webApp;

String buildYouTubeAutoplayEmbedUrl(
  String videoUrl, {
  String? pageOrigin,
}) {
  final String origin = pageOrigin ?? youtubeEmbedPageOrigin();
  final Uri uri = Uri.parse(videoUrl);
  return uri
      .replace(
        queryParameters: <String, String>{
          ...uri.queryParameters,
          'autoplay': '1',
          'auto_play': '1',
          'origin': origin,
        },
      )
      .toString();
}

String? resolveYouTubeEmbedVideoUrl(
  Embed embed, {
  String? pageOrigin,
}) {
  final String? videoUrl = _nonEmpty(embed.video?.url) ?? _nonEmpty(embed.url);
  if (videoUrl == null) {
    return null;
  }
  return buildYouTubeAutoplayEmbedUrl(videoUrl, pageOrigin: pageOrigin);
}

String? _nonEmpty(String? value) {
  if (value == null) {
    return null;
  }
  final String trimmed = value.trim();
  if (trimmed.isEmpty) {
    return null;
  }
  return trimmed;
}
