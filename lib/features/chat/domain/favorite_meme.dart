import 'dart:convert';

import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/chat/utils/klipy_utils.dart';
import 'package:fluxer_dart/export.dart' as sdk;

enum FavoriteMemeMediaType { image, gif, video, audio, unknown }

class FavoriteMemeSelection {
  const FavoriteMemeSelection({required this.meme, required this.autoSend});

  final FavoriteMeme meme;
  final bool autoSend;
}

class FavoriteMeme {
  const FavoriteMeme({
    required this.id,
    required this.userId,
    required this.name,
    required this.altText,
    required this.tags,
    required this.attachmentId,
    required this.filename,
    required this.contentType,
    required this.contentHash,
    required this.size,
    required this.width,
    required this.height,
    required this.duration,
    required this.isGifv,
    required this.url,
    required this.klipySlug,
    required this.tenorSlugId,
    this.media,
  });

  factory FavoriteMeme.fromSdk(sdk.FavoriteMemeResponse meme) {
    final gifSource = _gifSourceFromProvider(
      provider: meme.gifProvider,
      slug: meme.gifSlug,
    );
    return FavoriteMeme(
      id: meme.id,
      userId: meme.userId,
      name: meme.name,
      altText: meme.altText,
      tags: meme.tags,
      attachmentId: meme.attachmentId,
      filename: meme.filename,
      contentType: meme.contentType,
      contentHash: meme.contentHash,
      size: meme.size,
      width: meme.width,
      height: meme.height,
      duration: meme.duration?.toDouble(),
      isGifv: meme.isGifv ?? false,
      url: meme.url,
      klipySlug: gifSource.klipySlug,
      tenorSlugId: gifSource.tenorSlugId,
      media: meme.media,
    );
  }

  factory FavoriteMeme.fromRow(db.FavoriteMemesTableData row) {
    final json = jsonDecode(row.data) as Map<String, dynamic>;
    return FavoriteMeme.fromJson({...json, 'id': json['id'] ?? row.id});
  }

  factory FavoriteMeme.fromJson(Map<String, Object?> json) {
    final gifSource = _gifSourceFromProvider(
      provider: json['gif_provider'] as String?,
      slug: json['gif_slug'] as String?,
    );
    return FavoriteMeme(
      id: _requiredString(json, 'id'),
      userId: _requiredString(json, 'user_id'),
      name: _requiredString(json, 'name'),
      altText: json['alt_text'] as String?,
      tags:
          (json['tags'] as List<dynamic>?)
              ?.map((tag) => tag.toString())
              .toList(growable: false) ??
          const [],
      attachmentId: _requiredString(json, 'attachment_id'),
      filename: _requiredString(json, 'filename'),
      contentType: _requiredString(json, 'content_type'),
      contentHash: json['content_hash'] as String?,
      size: _requiredNum(json, 'size').toInt(),
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      duration: (json['duration'] as num?)?.toDouble(),
      isGifv: json['is_gifv'] as bool? ?? false,
      url: _requiredString(json, 'url'),
      klipySlug: json['klipy_slug'] as String? ?? gifSource.klipySlug,
      tenorSlugId: json['tenor_slug_id'] as String? ?? gifSource.tenorSlugId,
      media: _parseFavoriteMedia(json['media']),
    );
  }

  final String id;
  final String userId;
  final String name;
  final String? altText;
  final List<String> tags;
  final String attachmentId;
  final String filename;
  final String contentType;
  final String? contentHash;
  final int size;
  final int? width;
  final int? height;
  final double? duration;
  final bool isGifv;
  final String url;
  final String? klipySlug;
  final String? tenorSlugId;
  final Map<String, sdk.GifMediaFormat>? media;

  FavoriteMemeMediaType get mediaType {
    final normalized = contentType.toLowerCase();
    if (isGifv || normalized.contains('gif')) {
      return FavoriteMemeMediaType.gif;
    }
    if (normalized.startsWith('image/')) {
      return FavoriteMemeMediaType.image;
    }
    if (normalized.startsWith('video/')) {
      return FavoriteMemeMediaType.video;
    }
    if (normalized.startsWith('audio/')) {
      return FavoriteMemeMediaType.audio;
    }
    return FavoriteMemeMediaType.unknown;
  }

  bool get isVideoLike => contentType.toLowerCase().startsWith('video/');

  double get aspectRatio {
    final w = width;
    final h = height;
    if (w == null || h == null || w <= 0 || h <= 0) {
      return 1;
    }
    return (w / h).clamp(0.45, 2.2);
  }

  String get shareUrl {
    final klipy = klipySlug?.trim();
    if (klipy != null && klipy.isNotEmpty) {
      return buildKlipyShareUrl(slug: klipy);
    }

    final tenor = tenorSlugId?.trim();
    if (tenor != null && tenor.isNotEmpty) {
      return buildTenorShareUrl(tenor);
    }

    return url;
  }

  Map<String, Object?> toJson() => {
    'id': id,
    'user_id': userId,
    'name': name,
    'alt_text': altText,
    'tags': tags,
    'attachment_id': attachmentId,
    'filename': filename,
    'content_type': contentType,
    'content_hash': contentHash,
    'size': size,
    'width': width,
    'height': height,
    'duration': duration,
    'is_gifv': isGifv,
    'url': url,
    'klipy_slug': klipySlug,
    'tenor_slug_id': tenorSlugId,
    'media': media?.map((key, value) => MapEntry(key, value.toJson())),
  };
}

({String? klipySlug, String? tenorSlugId}) _gifSourceFromProvider({
  required String? provider,
  required String? slug,
}) {
  final normalizedSlug = slug?.trim();
  if (normalizedSlug == null || normalizedSlug.isEmpty) {
    return (klipySlug: null, tenorSlugId: null);
  }

  return switch (provider?.trim().toLowerCase()) {
    'klipy' => (klipySlug: normalizedSlug, tenorSlugId: null),
    'tenor' => (klipySlug: null, tenorSlugId: normalizedSlug),
    _ => (klipySlug: null, tenorSlugId: null),
  };
}

String _requiredString(Map<String, Object?> json, String key) =>
    json[key] as String? ?? (throw FormatException('Missing $key'));

num _requiredNum(Map<String, Object?> json, String key) =>
    json[key] as num? ?? (throw FormatException('Missing $key'));

Map<String, sdk.GifMediaFormat>? _parseFavoriteMedia(Object? value) {
  if (value is! Map) {
    return null;
  }
  final media = <String, sdk.GifMediaFormat>{};
  for (final entry in value.entries) {
    final key = entry.key;
    final raw = entry.value;
    if (key is String && raw is Map) {
      media[key] = sdk.GifMediaFormat.fromJson(Map<String, Object?>.from(raw));
    }
  }
  return media.isEmpty ? null : media;
}

String buildTenorShareUrl(String tenorSlugId) {
  final normalized = _normalizeTenorSlugId(tenorSlugId) ?? tenorSlugId.trim();
  final path = normalized.startsWith('/')
      ? normalized.substring(1)
      : normalized;
  return 'https://tenor.com/$path';
}

String? _normalizeTenorSlugId(String value) {
  final trimmed = value.trim();
  if (trimmed.isEmpty) {
    return null;
  }

  final withoutLeadingSlash = trimmed.startsWith('/')
      ? trimmed.substring(1)
      : trimmed;
  if (withoutLeadingSlash.toLowerCase().startsWith('view/')) {
    return withoutLeadingSlash.replaceAll(RegExp(r'/+$'), '');
  }

  if (!withoutLeadingSlash.contains('/')) {
    return 'view/${withoutLeadingSlash.replaceAll(RegExp(r'/+$'), '')}';
  }

  return null;
}
