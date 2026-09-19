import 'package:flutter/foundation.dart';
import 'package:fluxer_dart/export.dart' as sdk;

enum GifProviderKind { klipy, tenor }

@immutable
class GifPickerGif {
  const GifPickerGif({
    required this.provider,
    required this.id,
    required this.title,
    required this.url,
    required this.src,
    required this.proxySrc,
    required this.width,
    required this.height,
    this.slug = '',
    this.media,
  });

  final GifProviderKind provider;
  final String id;
  final String title;
  final String url;
  final String src;
  final String proxySrc;
  final int width;
  final int height;
  final String slug;
  final Map<String, sdk.GifMediaFormat>? media;
}

@immutable
class GifPickerCategory {
  const GifPickerCategory({
    required this.name,
    required this.src,
    required this.proxySrc,
  });

  final String name;
  final String src;
  final String proxySrc;
}

@immutable
class GifPickerFeatured {
  const GifPickerFeatured({required this.gifs, required this.categories});

  final List<GifPickerGif> gifs;
  final List<GifPickerCategory> categories;
}

@immutable
class FluxerSelectedGif {
  const FluxerSelectedGif({
    required this.provider,
    required this.id,
    required this.title,
    required this.url,
    required this.src,
    required this.proxySrc,
    required this.width,
    required this.height,
    required this.autoSend,
  });

  final GifProviderKind provider;
  final String id;
  final String title;
  final String url;
  final String src;
  final String proxySrc;
  final int width;
  final int height;
  final bool autoSend;
}
