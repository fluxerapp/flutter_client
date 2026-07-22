import 'package:fluxer_app/features/chat/domain/message.dart';

const int kMaxEmbedGalleryMedia = 10;

String? normalizeEmbedUrl(String? url) {
  if (url == null || url.isEmpty) {
    return null;
  }
  try {
    final Uri parsed = Uri.parse(url);
    if (!parsed.hasScheme || parsed.host.isEmpty) {
      return null;
    }
    var normalized = parsed.toString();
    if (normalized.endsWith('/')) {
      normalized = normalized.substring(0, normalized.length - 1);
    }
    return normalized;
  } on Object catch (_) {
    return null;
  }
}

bool isValidEmbedGalleryMedia(EmbedMedia? media) {
  return media != null && media.url.isNotEmpty;
}

EmbedMedia? galleryMediaForEmbed(Embed embed) {
  if (isValidEmbedGalleryMedia(embed.image)) {
    return embed.image;
  }
  if (isValidEmbedGalleryMedia(embed.thumbnail)) {
    return embed.thumbnail;
  }
  return null;
}

class EmbedGalleryDisplay {
  const EmbedGalleryDisplay({
    required this.galleryImages,
    required this.showGallery,
  });

  final List<EmbedMedia> galleryImages;
  final bool showGallery;
}

class _EmbedListRenderMetadata {
  const _EmbedListRenderMetadata({
    required this.normalizedUrls,
    required this.firstIndexByNormalizedUrl,
    required this.galleryImagesByFirstIndex,
  });

  final List<String?> normalizedUrls;
  final Map<String, int> firstIndexByNormalizedUrl;
  final Map<int, List<EmbedMedia>> galleryImagesByFirstIndex;
}

_EmbedListRenderMetadata _buildEmbedListRenderMetadata(List<Embed> embedList) {
  final List<String?> normalizedUrls = List<String?>.filled(
    embedList.length,
    null,
  );
  final Map<String, int> firstIndexByNormalizedUrl = <String, int>{};
  for (int index = 0; index < embedList.length; index++) {
    final String? normalizedUrl = normalizeEmbedUrl(embedList[index].url);
    normalizedUrls[index] = normalizedUrl;
    if (normalizedUrl != null &&
        !firstIndexByNormalizedUrl.containsKey(normalizedUrl)) {
      firstIndexByNormalizedUrl[normalizedUrl] = index;
    }
  }
  final Map<int, List<EmbedMedia>> galleryImagesByFirstIndex =
      <int, List<EmbedMedia>>{};
  final Map<int, Set<String>> seenMediaKeysByFirstIndex = <int, Set<String>>{};
  void tryAddGalleryMedia(int firstIndex, EmbedMedia? media) {
    if (!isValidEmbedGalleryMedia(media)) {
      return;
    }
    final List<EmbedMedia> images = galleryImagesByFirstIndex.putIfAbsent(
      firstIndex,
      () => <EmbedMedia>[],
    );
    if (images.length >= kMaxEmbedGalleryMedia) {
      return;
    }
    final Set<String> seenMediaKeys = seenMediaKeysByFirstIndex.putIfAbsent(
      firstIndex,
      () => <String>{},
    );
    final String mediaKey = media!.url;
    if (seenMediaKeys.contains(mediaKey)) {
      return;
    }
    seenMediaKeys.add(mediaKey);
    images.add(media);
  }

  for (int index = 0; index < embedList.length; index++) {
    final String? normalizedUrl = normalizedUrls[index];
    if (normalizedUrl == null) {
      continue;
    }
    final int? firstIndex = firstIndexByNormalizedUrl[normalizedUrl];
    if (firstIndex == null) {
      continue;
    }
    tryAddGalleryMedia(firstIndex, galleryMediaForEmbed(embedList[index]));
  }
  return _EmbedListRenderMetadata(
    normalizedUrls: normalizedUrls,
    firstIndexByNormalizedUrl: firstIndexByNormalizedUrl,
    galleryImagesByFirstIndex: galleryImagesByFirstIndex,
  );
}

class EmbedGalleryIndex {
  EmbedGalleryIndex(List<Embed> embedList)
    : _metadata = _buildEmbedListRenderMetadata(embedList);

  final _EmbedListRenderMetadata _metadata;

  bool isDuplicateAt(int embedIndex) {
    if (embedIndex < 0 || embedIndex >= _metadata.normalizedUrls.length) {
      return false;
    }
    final String? normalizedUrl = _metadata.normalizedUrls[embedIndex];
    if (normalizedUrl == null) {
      return false;
    }
    final int? firstIndex = _metadata.firstIndexByNormalizedUrl[normalizedUrl];
    return firstIndex != null && firstIndex < embedIndex;
  }

  List<EmbedMedia> galleryImagesAt(int embedIndex) {
    if (embedIndex < 0 || embedIndex >= _metadata.normalizedUrls.length) {
      return const <EmbedMedia>[];
    }
    return List<EmbedMedia>.unmodifiable(
      _metadata.galleryImagesByFirstIndex[embedIndex] ?? const <EmbedMedia>[],
    );
  }

  EmbedGalleryDisplay resolveDisplay({
    required int embedIndex,
    required bool hasAnyMedia,
  }) {
    final List<EmbedMedia> galleryImages = galleryImagesAt(embedIndex);
    return EmbedGalleryDisplay(
      galleryImages: galleryImages,
      showGallery: shouldShowEmbedGallery(
        galleryImages: galleryImages,
        hasAnyMedia: hasAnyMedia,
      ),
    );
  }
}

bool isDuplicateEmbedAtIndex(int embedIndex, List<Embed> embedList) {
  return EmbedGalleryIndex(embedList).isDuplicateAt(embedIndex);
}

List<EmbedMedia> collectGalleryImages({
  required int embedIndex,
  required List<Embed> embedList,
}) {
  return EmbedGalleryIndex(embedList).galleryImagesAt(embedIndex);
}

bool shouldShowEmbedGallery({
  required List<EmbedMedia> galleryImages,
  required bool hasAnyMedia,
}) {
  return galleryImages.length > 1 || (!hasAnyMedia && galleryImages.isNotEmpty);
}

String deriveFilenameFromUrl(String url) {
  try {
    final Uri parsed = Uri.parse(url);
    final String filename = parsed.pathSegments.isNotEmpty
        ? parsed.pathSegments.last
        : '';
    if (filename.isNotEmpty) {
      return filename;
    }
  } on Object catch (_) {}
  return 'embed-media';
}

List<Attachment> buildGalleryAttachments({
  required List<EmbedMedia> images,
  required Embed embed,
  int? embedIndex,
}) {
  final String idPrefix = embedIndex?.toString() ?? 'embed';
  return images
      .asMap()
      .entries
      .map(
        (MapEntry<int, EmbedMedia> entry) => Attachment(
          id: '$idPrefix-gallery-${entry.key}',
          filename: deriveFilenameFromUrl(entry.value.url),
          title: embed.title,
          url: entry.value.url,
          proxyUrl: entry.value.proxyUrl ?? entry.value.url,
          width: entry.value.width,
          height: entry.value.height,
          contentType: entry.value.contentType,
          flags: entry.value.flags,
          nsfw: embed.nsfw,
        ),
      )
      .toList();
}
