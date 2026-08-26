import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/media_dimension_utils.dart';
import 'package:fluxer_app/features/chat/utils/media_proxy_url.dart';

class ChatVideoSource {
  const ChatVideoSource({
    required this.fallbackUrl,
    this.directMediaUrl,
    this.pageUrl,
    this.posterUrl,
    this.placeholder,
    this.width,
    this.height,
  });

  final String? directMediaUrl;
  final String? pageUrl;
  final String? posterUrl;
  final String? placeholder;
  final int? width;
  final int? height;
  final String fallbackUrl;

  bool get hasPlayableContent =>
      _nonEmpty(directMediaUrl) != null || _nonEmpty(pageUrl) != null;

  factory ChatVideoSource.fromAttachment(
    Attachment attachment,
    FluxerMediaDimensions layoutDimensions,
  ) {
    final String proxyOrUrl =
        (attachment.proxyUrl != null && attachment.proxyUrl!.trim().isNotEmpty)
        ? attachment.proxyUrl!.trim()
        : attachment.url.trim();
    final String? posterUrl = proxyOrUrl.isEmpty
        ? null
        : buildAttachmentVideoPosterUrl(
            proxyOrUrl: proxyOrUrl,
            attachmentWidth: attachment.width,
            attachmentHeight: attachment.height,
            layoutDimensions: layoutDimensions,
          );
    return ChatVideoSource(
      directMediaUrl: proxyOrUrl.isEmpty ? null : proxyOrUrl,
      posterUrl: posterUrl,
      placeholder: attachment.placeholder,
      width: attachment.width,
      height: attachment.height,
      fallbackUrl: proxyOrUrl,
    );
  }

  factory ChatVideoSource.fromEmbed(Embed embed) {
    final String? directMediaUrl =
        _nonEmpty(embed.video?.proxyUrl) ?? _nonEmpty(embed.video?.url);
    final String? pageUrl = _nonEmpty(embed.url) ?? _nonEmpty(embed.video?.url);
    final String? posterUrl =
        _nonEmpty(embed.thumbnail?.proxyUrl) ?? _nonEmpty(embed.thumbnail?.url);
    final int? width = embed.video?.width ?? embed.thumbnail?.width;
    final int? height = embed.video?.height ?? embed.thumbnail?.height;
    final String fallbackUrl = pageUrl ?? directMediaUrl ?? '';
    return ChatVideoSource(
      directMediaUrl: directMediaUrl,
      pageUrl: pageUrl,
      posterUrl: posterUrl,
      width: width,
      height: height,
      fallbackUrl: fallbackUrl,
    );
  }

  static String? _nonEmpty(String? value) {
    if (value == null) {
      return null;
    }
    final String trimmed = value.trim();
    if (trimmed.isEmpty) {
      return null;
    }
    return trimmed;
  }
}
