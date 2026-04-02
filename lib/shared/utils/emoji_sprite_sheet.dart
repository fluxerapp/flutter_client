import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const _kSpriteSize = 32;
const _kSpritesPerRow = 42;
const _kSpriteSheetUrl =
    'https://fluxerstatic.com/emoji/spritesheet-emoji@2x.png?v=2';

/// Singleton sprite sheet — one PNG for all unicode emojis.
class EmojiSpriteSheet {
  EmojiSpriteSheet._();

  static ui.Image? _image;
  static Future<ui.Image>? _loading;

  static bool get isLoaded => _image != null;

  static Future<void> preload() async {
    if (_image != null) {
      return;
    }
    _image = await _load();
  }

  static Future<ui.Image> ensureLoaded() {
    if (_image != null) {
      return Future.value(_image!);
    }
    return _loading ??= _load().then((img) {
      _image = img;
      _loading = null;
      return img;
    });
  }

  static Future<ui.Image> _load() async {
    final client = HttpClient();
    final request = await client.getUrl(Uri.parse(_kSpriteSheetUrl));
    final response = await request.close();
    final bytes = await consolidateHttpClientResponseBytes(response);
    final codec = await ui.instantiateImageCodec(bytes);
    final frame = await codec.getNextFrame();
    return frame.image;
  }

  /// Source rect for [index] in the @2x sheet (64px per sprite).
  static Rect spriteRect(int index) {
    final col = index % _kSpritesPerRow;
    final row = index ~/ _kSpritesPerRow;
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
  EmojiSpritePainter({required this.image, required this.spriteIndex});

  final ui.Image image;
  final int spriteIndex;

  @override
  void paint(Canvas canvas, Size size) {
    final src = EmojiSpriteSheet.spriteRect(spriteIndex);
    final dst = Offset.zero & size;
    canvas.drawImageRect(
      image,
      src,
      dst,
      Paint()..filterQuality = FilterQuality.medium,
    );
  }

  @override
  bool shouldRepaint(EmojiSpritePainter oldDelegate) =>
      oldDelegate.spriteIndex != spriteIndex;
}

class SpriteEmoji extends StatelessWidget {
  const SpriteEmoji({required this.index, required this.size, super.key});

  final int index;
  final double size;

  @override
  Widget build(BuildContext context) {
    final image = EmojiSpriteSheet._image;
    if (image == null) {
      return SizedBox(width: size, height: size);
    }
    return CustomPaint(
      size: Size(size, size),
      painter: EmojiSpritePainter(image: image, spriteIndex: index),
    );
  }
}
