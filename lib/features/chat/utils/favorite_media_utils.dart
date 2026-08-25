import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/klipy_utils.dart';

class MessageMediaGifInfo {
  const MessageMediaGifInfo({
    required this.url,
    required this.proxyUrl,
    this.width = 0,
    this.height = 0,
  });

  final String url;
  final String proxyUrl;
  final int width;
  final int height;
}

class MessageMediaFavoriteTarget {
  const MessageMediaFavoriteTarget({
    required this.defaultName,
    this.attachmentId,
    this.embedIndex,
    this.contentHash,
    this.defaultAltText,
    this.gifInfo,
    this.isAudioOnly = false,
  });

  final String? attachmentId;
  final int? embedIndex;
  final String? contentHash;
  final String defaultName;
  final String? defaultAltText;
  final MessageMediaGifInfo? gifInfo;
  final bool isAudioOnly;

  bool get isGifFavoriteMedia => gifInfo != null;

  FavoriteMeme? findExisting(Iterable<FavoriteMeme> savedMedia) {
    return findFavoritedMedia(
      savedMedia,
      contentHash: contentHash,
      attachmentId: attachmentId,
    );
  }

  factory MessageMediaFavoriteTarget.forMessageMedia({
    required Message message,
    String? attachmentId,
    int? embedIndex,
    String? filename,
    String? fallbackContentHash,
  }) {
    final Attachment? attachment = resolveMessageAttachment(
      message,
      attachmentId,
    );
    final EmbedMedia? embedMedia = resolveMessageEmbedMedia(
      message,
      embedIndex,
    );

    final Embed? embed =
        embedIndex != null &&
            embedIndex >= 0 &&
            embedIndex < message.embeds.length
        ? message.embeds[embedIndex]
        : null;

    return MessageMediaFavoriteTarget(
      attachmentId: attachmentId,
      embedIndex: embedIndex,
      contentHash:
          attachment?.contentHash ??
          embedMedia?.contentHash ??
          fallbackContentHash,
      defaultName: _defaultNameForMessageMedia(
        message: message,
        attachment: attachment,
        embedMedia: embedMedia,
        embed: embed,
        embedIndex: embedIndex,
        filename: filename,
      ),
      defaultAltText: attachment?.description,
      gifInfo: gifInfoForMessageMedia(
        attachment: attachment,
        embed: embed,
        embedMedia: embedMedia,
      ),
      isAudioOnly: attachment?.isAudio ?? false,
    );
  }

  factory MessageMediaFavoriteTarget.forAttachment(Attachment attachment) {
    return MessageMediaFavoriteTarget(
      attachmentId: attachment.id,
      contentHash: attachment.contentHash,
      defaultName: deriveDefaultNameFromAttachment(attachment),
      defaultAltText: attachment.description,
      gifInfo: gifInfoForMessageMedia(attachment: attachment),
      isAudioOnly: attachment.isAudio,
    );
  }
}

MessageMediaFavoriteTarget? favoriteTargetForMessageMedia({
  required MessageMediaActionScope? actionScope,
  String? attachmentId,
  int? embedIndex,
  String? filename,
  String? fallbackContentHash,
  Attachment? attachment,
  bool forMediaViewerToolbar = false,
}) {
  if (!canSaveMessageMediaToFavorites(
    actionScope: actionScope,
    attachmentId: attachmentId,
    embedIndex: embedIndex,
    attachment: attachment,
    forMediaViewerToolbar: forMediaViewerToolbar,
  )) {
    return null;
  }
  return MessageMediaFavoriteTarget.forMessageMedia(
    message: actionScope!.message,
    attachmentId: attachmentId,
    embedIndex: embedIndex,
    filename: filename,
    fallbackContentHash: fallbackContentHash,
  );
}

FavoriteMeme? findFavoritedMedia(
  Iterable<FavoriteMeme> savedMedia, {
  String? contentHash,
  String? attachmentId,
}) {
  final normalizedHash = contentHash?.trim();
  if (normalizedHash != null && normalizedHash.isNotEmpty) {
    for (final FavoriteMeme item in savedMedia) {
      if (item.contentHash == normalizedHash) {
        return item;
      }
    }
  }

  final normalizedAttachmentId = attachmentId?.trim();
  if (normalizedAttachmentId != null && normalizedAttachmentId.isNotEmpty) {
    for (final FavoriteMeme item in savedMedia) {
      if (item.attachmentId == normalizedAttachmentId) {
        return item;
      }
    }
  }

  return null;
}

bool canSaveMessageMediaToFavorites({
  required MessageMediaActionScope? actionScope,
  required String? attachmentId,
  required int? embedIndex,
  Attachment? attachment,
  bool forMediaViewerToolbar = false,
}) {
  if (actionScope == null) {
    return false;
  }
  if (attachmentId != null && attachmentId.isNotEmpty) {
    if (attachment == null) {
      return true;
    }
    if (forMediaViewerToolbar) {
      return attachment.isImage || attachment.isAnimated || attachment.isVideo;
    }
    return attachment.isSavableMedia;
  }
  return embedIndex != null;
}

MessageMediaGifInfo? gifInfoForMessageMedia({
  Attachment? attachment,
  Embed? embed,
  EmbedMedia? embedMedia,
}) {
  if (attachment != null) {
    if (!attachment.isAnimated) {
      return null;
    }
    final String proxyUrl = (attachment.proxyUrl?.trim().isNotEmpty ?? false)
        ? attachment.proxyUrl!.trim()
        : attachment.url;
    return MessageMediaGifInfo(
      url: attachment.url,
      proxyUrl: proxyUrl,
      width: attachment.width ?? 0,
      height: attachment.height ?? 0,
    );
  }

  if (embed == null || embedMedia == null) {
    return null;
  }

  final bool isGifMedia = embed.type == EmbedType.gifv || embedMedia.isAnimated;
  if (!isGifMedia) {
    return null;
  }

  final String proxyUrl = (embedMedia.proxyUrl?.trim().isNotEmpty ?? false)
      ? embedMedia.proxyUrl!.trim()
      : embedMedia.url;
  return MessageMediaGifInfo(
    url: embedMedia.url,
    proxyUrl: proxyUrl,
    width: embedMedia.width ?? 0,
    height: embedMedia.height ?? 0,
  );
}

String deriveDefaultNameFromAttachment(Attachment attachment) {
  final title = attachment.title?.trim();
  if (title != null && title.isNotEmpty) {
    return title;
  }

  final fromFilename = cleanFilenameStem(attachment.filename);
  if (fromFilename != null) {
    return fromFilename;
  }

  final urlName = filenameStemFromUrl(attachment.url);
  if (urlName != null) {
    return urlName;
  }

  return defaultMediaLabel(attachment.contentType);
}

String deriveDefaultNameFromEmbedMedia({
  required EmbedMedia media,
  String? title,
}) {
  final embedTitle = title?.trim();
  if (embedTitle != null && embedTitle.isNotEmpty) {
    return embedTitle;
  }

  final klipyName = klipyNameFromUrl(media.url);
  if (klipyName != null) {
    return klipyName;
  }

  final urlName = filenameStemFromUrl(media.url);
  if (urlName != null) {
    return urlName;
  }

  return defaultMediaLabel(media.contentType);
}

String? klipyNameFromUrl(String url) {
  final slug = extractKlipySlug(url);
  if (slug == null || slug.isEmpty) {
    return null;
  }
  final cleaned = slug.replaceAll('-', ' ').trim();
  return cleaned.isEmpty ? null : cleaned;
}

Attachment? resolveMessageAttachment(Message message, String? attachmentId) {
  final normalizedId = attachmentId?.trim();
  if (normalizedId == null || normalizedId.isEmpty) {
    return null;
  }
  for (final Attachment attachment in message.attachments) {
    if (attachment.id == normalizedId) {
      return attachment;
    }
  }
  return null;
}

EmbedMedia? resolveMessageEmbedMedia(Message message, int? embedIndex) {
  if (embedIndex == null ||
      embedIndex < 0 ||
      embedIndex >= message.embeds.length) {
    return null;
  }
  final Embed embed = message.embeds[embedIndex];
  return embed.image ?? embed.video ?? embed.thumbnail;
}

String? cleanFilenameStem(String filename) {
  final trimmed = filename.trim();
  if (trimmed.isEmpty) {
    return null;
  }
  final withoutExtension = trimmed.replaceAll(RegExp(r'\.[^.]+$'), '');
  final cleaned = withoutExtension.replaceAll(RegExp('[-_]'), ' ').trim();
  return cleaned.isEmpty ? null : cleaned;
}

String? filenameStemFromUrl(String url) {
  final trimmed = url.trim();
  if (trimmed.isEmpty) {
    return null;
  }

  final uri = Uri.tryParse(trimmed);
  if (uri == null || uri.pathSegments.isEmpty) {
    return null;
  }

  return cleanFilenameStem(uri.pathSegments.last);
}

String defaultMediaLabel(String? contentType) {
  final normalized = contentType?.toLowerCase() ?? '';
  if (normalized.contains('gif')) {
    return 'GIF';
  }
  if (normalized.startsWith('image/')) {
    return 'Image';
  }
  if (normalized.startsWith('video/')) {
    return 'Video';
  }
  if (normalized.startsWith('audio/')) {
    return 'Audio';
  }
  return 'Media';
}

String _defaultNameForMessageMedia({
  required Message message,
  required Attachment? attachment,
  required EmbedMedia? embedMedia,
  required int? embedIndex,
  Embed? embed,
  String? filename,
}) {
  if (attachment != null) {
    return deriveDefaultNameFromAttachment(attachment);
  }
  if (embedMedia != null) {
    return deriveDefaultNameFromEmbedMedia(
      media: embedMedia,
      title:
          embed?.title ??
          (embedIndex != null && embedIndex < message.embeds.length
              ? message.embeds[embedIndex].title
              : null),
    );
  }

  final fromFilename = filename == null ? null : cleanFilenameStem(filename);
  if (fromFilename != null) {
    return fromFilename;
  }

  return 'Media';
}
