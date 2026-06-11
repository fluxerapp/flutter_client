import 'package:fluxer_dart/export.dart' as sdk;

const _kPreferredGifPreviewFormats = <String>[
  'webp',
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
