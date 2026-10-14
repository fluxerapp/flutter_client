import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/emoji_utils.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

const _kSpriteSize = 32;
const _kNonDiversitySpritesPerRow = 42;
const _kDiversitySpritesPerRow = 10;
const _kSpriteAssetDir = 'assets/emoji-sprites';

const Duration kEmojiSpriteSheetReleaseDelay = Duration(seconds: 30);

const Map<String, String> _kSpriteSheetNames = {
  'default': 'spritesheet-emoji',
  '1f3fb': 'spritesheet-1f3fb',
  '1f3fc': 'spritesheet-1f3fc',
  '1f3fd': 'spritesheet-1f3fd',
  '1f3fe': 'spritesheet-1f3fe',
  '1f3ff': 'spritesheet-1f3ff',
};

String _spriteSheetAssetPath(String name) => '$_kSpriteAssetDir/$name@2x.png';

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
  static final ValueNotifier<int> _releases = ValueNotifier<int>(0);
  static int _users = 0;
  static Timer? _releaseTimer;

  static Future<void> preload({String? skinTone}) => ensureLoaded(
    skinTone: skinTone,
  ).then<void>((ui.Image _) {}, onError: (Object _) {});

  static Future<ui.Image> ensureLoaded({String? skinTone}) {
    final key = _spriteSheetKeyForSkinTone(skinTone);
    final existing = _images[key];
    if (existing != null) {
      return Future.value(existing);
    }
    return _loading[key] ??= _loadAndCache(key);
  }

  static ui.Image? imageFor({String? skinTone}) =>
      _images[_spriteSheetKeyForSkinTone(skinTone)];

  static void release() {
    _releaseTimer?.cancel();
    _releaseTimer = null;
    if (_images.isEmpty && _loading.isEmpty) {
      return;
    }
    for (final ui.Image image in _images.values) {
      image.dispose();
    }
    _images.clear();
    _loading.clear();
    _releases.value++;
  }

  static Future<ui.Image> _loadAndCache(String key) async {
    final int generation = _releases.value;
    try {
      final ui.Image image = await _load(key);
      if (generation != _releases.value) {
        image.dispose();
        throw StateError('Emoji sprite sheet released while decoding');
      }
      _images[key] = image;
      if (_users == 0) {
        _scheduleRelease();
      }
      return image;
    } finally {
      if (generation == _releases.value) {
        final _ = _loading.remove(key);
      }
    }
  }

  static Future<ui.Image> _load(String key) async {
    final name = _kSpriteSheetNames[key] ?? _kSpriteSheetNames['default']!;
    final data = await rootBundle.load(_spriteSheetAssetPath(name));
    final codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    final frame = await codec.getNextFrame();
    return frame.image;
  }

  static void _addUser() {
    _users++;
    _releaseTimer?.cancel();
    _releaseTimer = null;
  }

  static void _removeUser() {
    _users--;
    if (_users == 0) {
      _scheduleRelease();
    }
  }

  static void _scheduleRelease() {
    if (_images.isEmpty) {
      return;
    }
    _releaseTimer?.cancel();
    _releaseTimer = Timer(kEmojiSpriteSheetReleaseDelay, release);
  }

  static Rect spriteRect(int index, {required bool diversity}) {
    final spritesPerRow = diversity
        ? _kDiversitySpritesPerRow
        : _kNonDiversitySpritesPerRow;
    final col = index % spritesPerRow;
    final row = index ~/ spritesPerRow;
    const size = _kSpriteSize * 2.0;
    return Rect.fromLTWH(col * size, row * size, size, size);
  }
}

class EmojiSpritePainter extends CustomPainter {
  EmojiSpritePainter({
    required this.image,
    required this.spriteIndex,
    required this.diversity,
  });

  // Medium filtering smooths sprite upscaling on high-DPR screens: https://feedback.fluxer.com/p/1551
  static final Paint _paint = Paint()
    ..filterQuality = FilterQuality.medium
    ..isAntiAlias = true;

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

class SpriteEmoji extends StatefulWidget {
  const SpriteEmoji({
    required this.emoji,
    required this.index,
    required this.size,
    this.diversityIndex,
    this.skinTone,
    super.key,
  });

  final String emoji;
  final int index;
  final double size;
  final int? diversityIndex;
  final String? skinTone;

  @override
  State<SpriteEmoji> createState() => _SpriteEmojiState();
}

class _SpriteEmojiState extends State<SpriteEmoji> {
  ui.Image? _sheet;
  bool _needsSheet = true;

  bool get _useDiversitySheet =>
      widget.skinTone != null &&
      widget.skinTone!.isNotEmpty &&
      widget.diversityIndex != null;

  String? get _sheetSkinTone => _useDiversitySheet ? widget.skinTone : null;

  @override
  void initState() {
    super.initState();
    EmojiSpriteSheet._addUser();
    EmojiSpriteSheet._releases.addListener(_onSheetsReleased);
  }

  @override
  void didUpdateWidget(SpriteEmoji oldWidget) {
    super.didUpdateWidget(oldWidget);
    final bool oldUsesDiversity =
        oldWidget.skinTone != null &&
        oldWidget.skinTone!.isNotEmpty &&
        oldWidget.diversityIndex != null;
    final String? oldSkinTone = oldUsesDiversity ? oldWidget.skinTone : null;
    if (_spriteSheetKeyForSkinTone(oldSkinTone) !=
        _spriteSheetKeyForSkinTone(_sheetSkinTone)) {
      _dropSheet();
      _needsSheet = true;
    }
  }

  @override
  void dispose() {
    EmojiSpriteSheet._releases.removeListener(_onSheetsReleased);
    _dropSheet();
    EmojiSpriteSheet._removeUser();
    super.dispose();
  }

  void _onSheetsReleased() {
    _dropSheet();
    setState(() => _needsSheet = true);
  }

  void _dropSheet() {
    _sheet?.dispose();
    _sheet = null;
  }

  void _requestSheet() {
    _needsSheet = false;
    final String? skinTone = _sheetSkinTone;
    final ui.Image? cached = EmojiSpriteSheet.imageFor(skinTone: skinTone);
    if (cached != null) {
      _sheet = cached.clone();
      return;
    }
    unawaited(
      EmojiSpriteSheet.ensureLoaded(skinTone: skinTone).then<void>((
        ui.Image _,
      ) {
        if (!mounted || _sheet != null || skinTone != _sheetSkinTone) {
          return;
        }
        final ui.Image? loaded = EmojiSpriteSheet.imageFor(skinTone: skinTone);
        if (loaded != null) {
          setState(() => _sheet = loaded.clone());
        }
      }, onError: (Object _) {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_needsSheet) {
      _requestSheet();
    }
    final ui.Image? sheet = _sheet;
    if (sheet == null) {
      return SystemEmojiFallback(emoji: widget.emoji, size: widget.size);
    }
    return CustomPaint(
      size: Size(widget.size, widget.size),
      painter: EmojiSpritePainter(
        image: sheet,
        spriteIndex: _useDiversitySheet ? widget.diversityIndex! : widget.index,
        diversity: _useDiversitySheet,
      ),
    );
  }
}
