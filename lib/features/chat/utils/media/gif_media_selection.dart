import 'package:fluxer_dart/export.dart' as sdk;

// Image renditions only — picker previews go through the media proxy's image
// pipeline (`format=webp&animated=true`), which cannot decode webm/mp4. Webp
// is animated and lighter than gif, so the whole webp family outranks gif.
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

bool _hasUsableUrl(sdk.GifMediaFormat media) =>
    media.src.isNotEmpty || media.proxySrc.isNotEmpty;
