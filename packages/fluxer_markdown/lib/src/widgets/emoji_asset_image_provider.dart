import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:fluxer_markdown/src/utils/emoji_asset_cache.dart';

@immutable
class EmojiAssetImageKey {
  const EmojiAssetImageKey({required this.url, required this.targetPixels});

  final String url;
  final int targetPixels;

  @override
  bool operator ==(Object other) =>
      other is EmojiAssetImageKey &&
      other.url == url &&
      other.targetPixels == targetPixels;

  @override
  int get hashCode => Object.hash(url, targetPixels);

  @override
  String toString() => 'EmojiAssetImageKey($url, ${targetPixels}px)';
}

/// Decodes a raster emoji asset at its display size, keyed by url plus target
/// pixel size so identical emoji at one size share one decode through
/// [ImageCache]. `Image.memory` keys by the bytes instance, and each
/// `CachedEmojiAssetImage` reads its own copy of the asset, so it decodes a
/// separate full-resolution texture per widget.
@immutable
class EmojiAssetImageProvider extends ImageProvider<EmojiAssetImageKey> {
  const EmojiAssetImageProvider({
    required this.url,
    required this.size,
    this.bytes,
  });

  final String url;
  final double size;

  /// Decode source when the caller already holds the asset. Deliberately not
  /// part of the key or of equality: the url plus target size decide which
  /// [ImageCache] entry these bytes belong to, so an instance holding bytes
  /// and one without still share a single decode.
  final Uint8List? bytes;

  @override
  Future<EmojiAssetImageKey> obtainKey(ImageConfiguration configuration) {
    final double ratio = configuration.devicePixelRatio ?? 1.0;
    return SynchronousFuture<EmojiAssetImageKey>(
      EmojiAssetImageKey(
        url: url,
        targetPixels: math.max(1, (size * ratio).round()),
      ),
    );
  }

  @override
  ImageStreamCompleter loadImage(
    EmojiAssetImageKey key,
    ImageDecoderCallback decode,
  ) {
    return MultiFrameImageStreamCompleter(
      codec: _loadCodec(key, decode),
      scale: size > 0 ? key.targetPixels / size : 1.0,
      debugLabel: key.toString(),
      informationCollector: () => <DiagnosticsNode>[
        ErrorDescription('Emoji asset: ${key.url}'),
      ],
    );
  }

  Future<ui.Codec> _loadCodec(
    EmojiAssetImageKey key,
    ImageDecoderCallback decode,
  ) async {
    final Uint8List data = bytes ?? await EmojiAssetCache.loadBytes(key.url);
    final ui.ImmutableBuffer buffer = await ui.ImmutableBuffer.fromUint8List(
      data,
    );
    return decode(
      buffer,
      // Cap the longer axis only. Capping both forces an exact fit, which
      // stretches non-square assets (same constraint as custom emoji, #445).
      getTargetSize: (int width, int height) => width >= height
          ? ui.TargetImageSize(width: key.targetPixels)
          : ui.TargetImageSize(height: key.targetPixels),
    );
  }

  @override
  bool operator ==(Object other) =>
      other is EmojiAssetImageProvider &&
      other.url == url &&
      other.size == size;

  @override
  int get hashCode => Object.hash(url, size);
}
