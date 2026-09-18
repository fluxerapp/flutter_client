import 'package:flutter/foundation.dart';
import 'package:fluxer_app/features/chat/domain/gif_selection.dart';
import 'package:fluxer_dart/export.dart' as sdk;

@immutable
class FavoriteGifMediaFormat {
  const FavoriteGifMediaFormat({
    required this.src,
    required this.proxySrc,
    required this.width,
    required this.height,
  });

  factory FavoriteGifMediaFormat.fromSdk(sdk.GifMediaFormat format) {
    return FavoriteGifMediaFormat(
      src: format.src,
      proxySrc: format.proxySrc,
      width: format.width,
      height: format.height,
    );
  }

  final String src;
  final String proxySrc;
  final int width;
  final int height;

  sdk.GifMediaFormat toSdk() => sdk.GifMediaFormat(
    src: src,
    proxySrc: proxySrc,
    width: width,
    height: height,
  );

  @override
  bool operator ==(Object other) {
    return other is FavoriteGifMediaFormat &&
        other.src == src &&
        other.proxySrc == proxySrc &&
        other.width == width &&
        other.height == height;
  }

  @override
  int get hashCode => Object.hash(src, proxySrc, width, height);
}

@immutable
class FavoriteGifEntry {
  const FavoriteGifEntry({
    required this.url,
    required this.proxyUrl,
    required this.width,
    required this.height,
    this.contentType = '',
    this.placeholder,
    this.media = const {},
  });

  final String url;
  final String proxyUrl;
  final int width;
  final int height;
  final String contentType;
  final String? placeholder;
  final Map<String, FavoriteGifMediaFormat> media;

  @override
  bool operator ==(Object other) {
    return other is FavoriteGifEntry &&
        other.url == url &&
        other.proxyUrl == proxyUrl &&
        other.width == width &&
        other.height == height &&
        other.contentType == contentType &&
        other.placeholder == placeholder &&
        mapEquals(other.media, media);
  }

  @override
  int get hashCode {
    return Object.hash(
      url,
      proxyUrl,
      width,
      height,
      contentType,
      placeholder,
      Object.hashAllUnordered(media.entries),
    );
  }
}

String favoriteGifUrl(GifPickerGif gif) => gif.url;

FavoriteGifEntry favoriteGifEntryFromPickerGif(GifPickerGif gif) {
  final proxyUrl = gif.proxySrc.trim().isNotEmpty
      ? gif.proxySrc
      : gif.src.trim().isNotEmpty
      ? gif.src
      : gif.url;
  final media = gif.media;
  return FavoriteGifEntry(
    url: favoriteGifUrl(gif),
    proxyUrl: proxyUrl,
    width: gif.width,
    height: gif.height,
    media: {
      for (final entry
          in (media ?? const <String, sdk.GifMediaFormat>{}).entries)
        entry.key: FavoriteGifMediaFormat.fromSdk(entry.value),
    },
  );
}

Map<String, sdk.GifMediaFormat>? sdkMediaFromFavoriteGif(
  Map<String, FavoriteGifMediaFormat> media,
) {
  if (media.isEmpty) {
    return null;
  }
  return {for (final entry in media.entries) entry.key: entry.value.toSdk()};
}
