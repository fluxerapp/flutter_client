import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluxer_app/shared/utils/emoji_utils.dart';

const _kSpriteSize = 32;
const _kNonDiversitySpritesPerRow = 42;
const _kDiversitySpritesPerRow = 10;
const _kSpriteBase = 'https://fluxerstatic.com/emoji';
const _kSpriteVersion = '2';

const Map<String, String> _kSpriteSheetNames = {
  'default': 'spritesheet-emoji',
  '1f3fb': 'spritesheet-1f3fb',
  '1f3fc': 'spritesheet-1f3fc',
  '1f3fd': 'spritesheet-1f3fd',
  '1f3fe': 'spritesheet-1f3fe',
  '1f3ff': 'spritesheet-1f3ff',
};

String _buildSpriteSheetUrl(String name) =>
    '$_kSpriteBase/$name@2x.png?v=$_kSpriteVersion';

String _spriteSheetKeyForSkinTone(String? skinTone) {
  if (skinTone == null || skinTone.isEmpty) {
    return 'default';
  }
  final codePoint = emojiToCodePoints(skinTone);
  return _kSpriteSheetNames.containsKey(codePoint) ? codePoint : 'default';
}

class EmojiSpriteSheet {
  EmojiSpriteSheet._();

  static final Map<String, ui.Image> _images = <String, ui.Image>{};
  static final Map<String, Future<ui.Image>> _loading =
      <String, Future<ui.Image>>{};
  static BaseCacheManager get _cacheManager =>
      CachedNetworkImageProvider.defaultCacheManager;

  static bool isLoaded({String? skinTone}) =>
      _images.containsKey(_spriteSheetKeyForSkinTone(skinTone));

  static Future<void> preload({String? skinTone}) async {
    final key = _spriteSheetKeyForSkinTone(skinTone);
    if (_images.containsKey(key)) {
      return;
    }
    _images[key] = await _load(key);
  }

  static Future<ui.Image> ensureLoaded({String? skinTone}) {
    final key = _spriteSheetKeyForSkinTone(skinTone);
    final existing = _images[key];
    if (existing != null) {
      return Future.value(existing);
    }
    return _loading[key] ??= _load(key).then((img) {
      _images[key] = img;
      final _ = _loading.remove(key);
      return img;
    });
  }

  static ui.Image? imageFor({String? skinTone}) =>
      _images[_spriteSheetKeyForSkinTone(skinTone)];

  static Future<ui.Image> _load(String key) async {
    final name = _kSpriteSheetNames[key] ?? _kSpriteSheetNames['default']!;
    final url = _buildSpriteSheetUrl(name);
    final cacheKey = 'emoji-sprite-$name-v$_kSpriteVersion';

    final bytes = await _fetchBytes(url, cacheKey);
    final codec = await ui.instantiateImageCodec(bytes);
    final frame = await codec.getNextFrame();
    return frame.image;
  }

  static Future<Uint8List> _fetchBytes(String url, String cacheKey) async {
    final cached = await _cacheManager.getFileFromCache(cacheKey);
    if (cached != null) {
      return cached.file.readAsBytes();
    }

    final client = HttpClient();
    Uint8List bytes;
    try {
      final request = await client.getUrl(Uri.parse(url));
      final response = await request.close();
      bytes = await consolidateHttpClientResponseBytes(response);
    } finally {
      client.close();
    }

    unawaited(
      _cacheManager.putFile(
        url,
        bytes,
        key: cacheKey,
        fileExtension: 'png',
        maxAge: const Duration(days: 365),
      ),
    );

    return bytes;
  }

  /// Source rect for [index] in the @2x sheet (64px per sprite).
  static Rect spriteRect(int index, {required bool diversity}) {
    final spritesPerRow = diversity
        ? _kDiversitySpritesPerRow
        : _kNonDiversitySpritesPerRow;
    final col = index % spritesPerRow;
    final row = index ~/ spritesPerRow;
    const size = _kSpriteSize * 2;
    return Rect.fromLTWH(
      col * size.toDouble(),
      row * size.toDouble(),
      size.toDouble(),
      size.toDouble(),
    );
  }
}

class EmojiSpritePainter extends CustomPainter {
  EmojiSpritePainter({
    required this.image,
    required this.spriteIndex,
    required this.diversity,
  });

  static final Paint _paint = Paint()..filterQuality = FilterQuality.medium;

  final ui.Image image;
  final int spriteIndex;
  final bool diversity;

  @override
  void paint(Canvas canvas, Size size) {
    final src = EmojiSpriteSheet.spriteRect(spriteIndex, diversity: diversity);
    final dst = Offset.zero & size;
    canvas.drawImageRect(image, src, dst, _paint);
  }

  @override
  bool shouldRepaint(EmojiSpritePainter oldDelegate) =>
      oldDelegate.spriteIndex != spriteIndex ||
      oldDelegate.diversity != diversity ||
      !identical(oldDelegate.image, image);
}

class SpriteEmoji extends StatelessWidget {
  const SpriteEmoji({
    required this.index,
    required this.size,
    this.diversityIndex,
    this.skinTone,
    super.key,
  });

  final int index;
  final double size;
  final int? diversityIndex;
  final String? skinTone;

  @override
  Widget build(BuildContext context) {
    final useDiversitySheet =
        skinTone != null && skinTone!.isNotEmpty && diversityIndex != null;
    final targetSkinTone = useDiversitySheet ? skinTone : null;
    final image = EmojiSpriteSheet.imageFor(skinTone: targetSkinTone);

    if (image == null) {
      return FutureBuilder<ui.Image>(
        future: EmojiSpriteSheet.ensureLoaded(skinTone: targetSkinTone),
        builder: (context, snapshot) {
          final resolvedImage = snapshot.data;
          if (resolvedImage == null) {
            return SizedBox(width: size, height: size);
          }
          return _SpriteEmojiPaint(
            image: resolvedImage,
            index: useDiversitySheet ? diversityIndex! : index,
            size: size,
            diversity: useDiversitySheet,
          );
        },
      );
    }

    return _SpriteEmojiPaint(
      image: image,
      index: useDiversitySheet ? diversityIndex! : index,
      size: size,
      diversity: useDiversitySheet,
    );
  }
}

class _SpriteEmojiPaint extends StatelessWidget {
  const _SpriteEmojiPaint({
    required this.image,
    required this.index,
    required this.size,
    required this.diversity,
  });

  final ui.Image image;
  final int index;
  final double size;
  final bool diversity;

  @override
  Widget build(BuildContext context) => CustomPaint(
    size: Size(size, size),
    painter: EmojiSpritePainter(
      image: image,
      spriteIndex: index,
      diversity: diversity,
    ),
  );
}
