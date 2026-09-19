import 'package:fluxer_dart/export.dart' as sdk;

const _kPreferredGifPreviewFormats = <String>[
  'mediumwebp',
  'webp',
  'tinywebp',
  'nanowebp',
  'mediumgif',
  'gif',
  'tinygif',
  'nanogif',
];

const _kPreferredGifStoreFormats = <String>[
  'gif',
  'mediumgif',
  'tinygif',
  'nanogif',
  'webp',
  'mediumwebp',
  'tinywebp',
  'nanowebp',
];

final RegExp _videoFileExtensionRegex = RegExp(
  r'\.(?:mp4|webm|mov|m4v)(?:$|[?#])',
  caseSensitive: false,
);

final RegExp _gifFileExtensionRegex = RegExp(
  r'\.gif(?:$|[?#])',
  caseSensitive: false,
);

sdk.GifMediaFormat gifPreviewMediaForPicker({
  required String src,
  required String proxySrc,
  required int width,
  required int height,
  Map<String, sdk.GifMediaFormat>? media,
}) {
  for (final format in _kPreferredGifPreviewFormats) {
    final formatMedia = media?[format];
    if (formatMedia != null && _hasUsableUrl(formatMedia)) {
      return formatMedia;
    }
  }

  return sdk.GifMediaFormat(
    src: src,
    proxySrc: proxySrc,
    width: width,
    height: height,
  );
}

sdk.GifMediaFormat resolvedGifPreviewMediaForPicker(
  sdk.ResolvedGifEntrySchema entry,
) => gifPreviewMediaForPicker(
  src: entry.url,
  proxySrc: entry.proxyUrl,
  width: entry.width,
  height: entry.height,
  media: entry.media,
);

String bestStoredGifUrl({
  required String url,
  required String src,
  required String proxySrc,
  Map<String, sdk.GifMediaFormat>? media,
}) {
  for (final format in _kPreferredGifStoreFormats) {
    final stored = _firstImageUrl(media?[format]);
    if (stored != null) {
      return stored;
    }
  }

  return _firstMatchingUrl([src, proxySrc], _hasGifFileExtension) ??
      _firstMatchingUrl([
        src,
        proxySrc,
      ], (value) => !_hasVideoFileExtension(value)) ??
      url;
}

bool _hasUsableUrl(sdk.GifMediaFormat media) =>
    media.src.isNotEmpty || media.proxySrc.isNotEmpty;

String? _firstImageUrl(sdk.GifMediaFormat? media) {
  if (media == null) {
    return null;
  }
  return _imageUrl(media.proxySrc) ?? _imageUrl(media.src);
}

String? _imageUrl(String value) {
  final trimmed = value.trim();
  if (trimmed.isEmpty || _hasVideoFileExtension(trimmed)) {
    return null;
  }
  return trimmed;
}

String? _firstMatchingUrl(
  List<String> candidates,
  bool Function(String value) test,
) {
  for (final candidate in candidates) {
    final trimmed = candidate.trim();
    if (trimmed.isNotEmpty && test(trimmed)) {
      return trimmed;
    }
  }
  return null;
}

bool _hasVideoFileExtension(String value) =>
    _matchesPath(_videoFileExtensionRegex, value);

bool _hasGifFileExtension(String value) =>
    _matchesPath(_gifFileExtensionRegex, value);

bool _matchesPath(RegExp pattern, String value) {
  final path = Uri.tryParse(value)?.path;
  return pattern.hasMatch(path != null && path.isNotEmpty ? path : value);
}
