import 'package:dio/dio.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/utils/bounded_lru_cache.dart';
import 'package:fluxer_app/features/chat/domain/gif_selection.dart';
import 'package:fluxer_app/features/chat/utils/gif_media_selection.dart';
import 'package:fluxer_dart/export.dart' as sdk;

// The generated SDK no longer exposes provider-specific KLIPY/Tenor APIs.
// The client talks to the provider-agnostic GIF routes directly and keeps the
// SDK-owned GifMediaFormat shape for alternate media formats.
typedef GifActiveProviderLoader = Future<GifProviderKind> Function();

const _kFeaturedCacheCapacity = 8;
const _kTrendingCacheCapacity = 8;
const _kSearchCacheCapacity = 40;
const _kSuggestionCacheCapacity = 40;

const _kGifsFeaturedPath = '/gifs/featured';
const _kGifsRegisterSharePath = '/gifs/register-share';
const _kGifsSearchPath = '/gifs/search';
const _kGifsSuggestPath = '/gifs/suggest';
const _kGifsTrendingPath = '/gifs/trending-gifs';

class GifRepository {
  GifRepository({
    required Dio dio,
    required GifActiveProviderLoader loadActiveProvider,
  }) : _dio = dio,
       _loadActiveProvider = loadActiveProvider;

  final Dio _dio;
  final GifActiveProviderLoader _loadActiveProvider;
  final BoundedLruCache<String, GifPickerFeatured> _featuredCache =
      BoundedLruCache<String, GifPickerFeatured>(
        capacity: _kFeaturedCacheCapacity,
      );
  final BoundedLruCache<String, List<GifPickerGif>> _searchCache =
      BoundedLruCache<String, List<GifPickerGif>>(
        capacity: _kSearchCacheCapacity,
      );
  final BoundedLruCache<String, List<GifPickerGif>> _trendingCache =
      BoundedLruCache<String, List<GifPickerGif>>(
        capacity: _kTrendingCacheCapacity,
      );
  final BoundedLruCache<String, List<String>> _suggestionCache =
      BoundedLruCache<String, List<String>>(
        capacity: _kSuggestionCacheCapacity,
      );
  GifProviderKind? _activeProvider;

  Future<GifProviderKind> getActiveProvider() async {
    final cached = _activeProvider;
    if (cached != null) {
      return cached;
    }

    try {
      final provider = await _loadActiveProvider();
      _activeProvider = provider;
      return provider;
    } on Object catch (error) {
      talker.warning('[GifRepository] Failed to load GIF provider: $error');
      _activeProvider = GifProviderKind.klipy;
      return _activeProvider!;
    }
  }

  Future<GifPickerFeatured> getFeatured({required sdk.Locale locale}) async {
    final provider = await getActiveProvider();
    final key = _cacheKey(provider, locale);
    final cached = _featuredCache.get(key);
    if (cached != null) {
      return cached;
    }

    final featured = await _getFeatured(locale: locale);
    final mapped = GifPickerFeatured(
      gifs: _mapGifs(featured.gifs, provider),
      categories: featured.categories
          .map(
            (category) => GifPickerCategory(
              name: category.name,
              src: category.src,
              proxySrc: category.proxySrc,
            ),
          )
          .toList(),
    );
    _featuredCache.set(key, mapped);
    return mapped;
  }

  Future<List<GifPickerGif>> getTrending({required sdk.Locale locale}) async {
    final provider = await getActiveProvider();
    final key = _cacheKey(provider, locale);
    final cached = _trendingCache.get(key);
    if (cached != null) {
      return cached;
    }

    final gifs = _mapGifs(await _getGifs(_kGifsTrendingPath, locale), provider);
    _trendingCache.set(key, gifs);
    return gifs;
  }

  Future<List<GifPickerGif>> search({
    required String query,
    required sdk.Locale locale,
  }) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty) {
      return const <GifPickerGif>[];
    }

    final provider = await getActiveProvider();
    final key = _cacheKey(provider, locale, trimmed);
    final cached = _searchCache.get(key);
    if (cached != null) {
      return cached;
    }

    final gifs = _mapGifs(
      await _getGifs(
        _kGifsSearchPath,
        locale,
        queryParameters: <String, Object?>{'q': trimmed},
      ),
      provider,
    );
    _searchCache.set(key, gifs);
    return gifs;
  }

  Future<List<String>> suggest({
    required String query,
    required sdk.Locale locale,
  }) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty) {
      return const <String>[];
    }

    final provider = await getActiveProvider();
    final key = _cacheKey(provider, locale, trimmed);
    final cached = _suggestionCache.get(key);
    if (cached != null) {
      return cached;
    }

    final suggestions = await _getStringList(
      _kGifsSuggestPath,
      locale,
      queryParameters: <String, Object?>{'q': trimmed},
    );
    _suggestionCache.set(key, suggestions);
    return suggestions;
  }

  Future<void> registerShare({
    required GifProviderKind provider,
    required String id,
    required String query,
    required sdk.Locale locale,
  }) async {
    try {
      final normalizedQuery = query.trim();
      await _dio.post<Object?>(
        _kGifsRegisterSharePath,
        data: <String, Object?>{
          'id': id,
          if (normalizedQuery.isNotEmpty) 'q': normalizedQuery,
          'locale': _localeQueryValue(locale),
        },
      );
    } on Object catch (error) {
      talker.warning('[GifRepository] Failed to register share: $error');
    }
  }

  Future<_GifApiFeatured> _getFeatured({required sdk.Locale locale}) async {
    final response = await _dio.get<Object?>(
      _kGifsFeaturedPath,
      queryParameters: <String, Object?>{'locale': _localeQueryValue(locale)},
    );
    return _GifApiFeatured.fromJson(
      _stringObjectMap(response.data, _kGifsFeaturedPath),
    );
  }

  Future<List<_GifApiGif>> _getGifs(
    String path,
    sdk.Locale locale, {
    Map<String, Object?> queryParameters = const <String, Object?>{},
  }) async {
    final response = await _dio.get<Object?>(
      path,
      queryParameters: <String, Object?>{
        ...queryParameters,
        'locale': _localeQueryValue(locale),
      },
    );
    return _jsonObjectList(
      response.data,
      path,
    ).map(_GifApiGif.fromJson).toList();
  }

  Future<List<String>> _getStringList(
    String path,
    sdk.Locale locale, {
    Map<String, Object?> queryParameters = const <String, Object?>{},
  }) async {
    final response = await _dio.get<Object?>(
      path,
      queryParameters: <String, Object?>{
        ...queryParameters,
        'locale': _localeQueryValue(locale),
      },
    );
    final data = response.data;
    if (data is List<Object?>) {
      return data.map((value) => value.toString()).toList(growable: false);
    }
    throw FormatException('Expected $path to be a list');
  }

  List<GifPickerGif> _mapGifs(
    List<_GifApiGif> gifs,
    GifProviderKind provider,
  ) => gifs.map((gif) {
    final previewMedia = gifPreviewMediaForPicker(
      src: gif.src,
      proxySrc: gif.proxySrc,
      width: gif.width,
      height: gif.height,
      media: gif.media,
    );
    return GifPickerGif(
      provider: provider,
      id: gif.id,
      title: gif.title,
      url: gif.url,
      src: previewMedia.src,
      proxySrc: previewMedia.proxySrc,
      width: previewMedia.width > 0 ? previewMedia.width : gif.width,
      height: previewMedia.height > 0 ? previewMedia.height : gif.height,
    );
  }).toList();

  String _cacheKey(
    GifProviderKind provider,
    sdk.Locale locale, [
    String value = '',
  ]) => '${provider.name}::${_localeQueryValue(locale)}::$value';
}

GifProviderKind gifProviderKindFromWireValue(String provider) =>
    switch (provider.toLowerCase()) {
      'tenor' => GifProviderKind.tenor,
      'klipy' => GifProviderKind.klipy,
      _ => GifProviderKind.klipy,
    };

String _localeQueryValue(sdk.Locale locale) => locale.json ?? locale.name;

class _GifApiFeatured {
  const _GifApiFeatured({required this.gifs, required this.categories});

  factory _GifApiFeatured.fromJson(Map<String, Object?> json) =>
      _GifApiFeatured(
        gifs: _jsonObjectList(
          json['gifs'],
          'gifs',
        ).map(_GifApiGif.fromJson).toList(growable: false),
        categories: _jsonObjectList(
          json['categories'],
          'categories',
        ).map(_GifApiCategory.fromJson).toList(growable: false),
      );

  final List<_GifApiGif> gifs;
  final List<_GifApiCategory> categories;
}

class _GifApiCategory {
  const _GifApiCategory({
    required this.name,
    required this.src,
    required this.proxySrc,
  });

  factory _GifApiCategory.fromJson(Map<String, Object?> json) =>
      _GifApiCategory(
        name: _requiredString(json, 'name'),
        src: _requiredString(json, 'src'),
        proxySrc: _requiredString(json, 'proxy_src'),
      );

  final String name;
  final String src;
  final String proxySrc;
}

class _GifApiGif {
  const _GifApiGif({
    required this.id,
    required this.title,
    required this.url,
    required this.src,
    required this.proxySrc,
    required this.width,
    required this.height,
    this.media,
  });

  factory _GifApiGif.fromJson(Map<String, Object?> json) => _GifApiGif(
    id: _requiredString(json, 'id'),
    title: _requiredString(json, 'title'),
    url: _requiredString(json, 'url'),
    src: _requiredString(json, 'src'),
    proxySrc: _requiredString(json, 'proxy_src'),
    width: _requiredInt(json, 'width'),
    height: _requiredInt(json, 'height'),
    media: _parseMedia(json['media']),
  );

  final String id;
  final String title;
  final String url;
  final String src;
  final String proxySrc;
  final int width;
  final int height;
  final Map<String, sdk.GifMediaFormat>? media;
}

Map<String, sdk.GifMediaFormat>? _parseMedia(Object? value) {
  if (value == null) {
    return null;
  }

  final mediaJson = _stringObjectMap(value, 'media');
  final media = <String, sdk.GifMediaFormat>{};
  for (final entry in mediaJson.entries) {
    media[entry.key] = sdk.GifMediaFormat.fromJson(
      _stringObjectMap(entry.value, 'media.${entry.key}'),
    );
  }

  return media.isEmpty ? null : media;
}

List<Map<String, Object?>> _jsonObjectList(Object? value, String context) {
  if (value is List<Object?>) {
    return value
        .map((entry) => _stringObjectMap(entry, context))
        .toList(growable: false);
  }
  throw FormatException('Expected $context to be a list');
}

Map<String, Object?> _stringObjectMap(Object? value, String context) {
  if (value is Map<String, Object?>) {
    return value;
  }
  if (value is Map<Object?, Object?>) {
    return value.map((key, mapValue) {
      if (key is! String) {
        throw FormatException('Expected $context to have string keys');
      }
      return MapEntry(key, mapValue);
    });
  }
  throw FormatException('Expected $context to be an object');
}

String _requiredString(Map<String, Object?> json, String key) =>
    json[key] as String? ?? (throw FormatException('Missing $key'));

int _requiredInt(Map<String, Object?> json, String key) =>
    (json[key] as num? ?? (throw FormatException('Missing $key'))).toInt();
