import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:visibility_detector/visibility_detector.dart';

const Duration _kNekoIdleFrameDuration = Duration(seconds: 1);
const Duration _kNekoShockDuration = Duration(milliseconds: 900);
const Duration _kNekoScratchFrameDuration = Duration(milliseconds: 500);
const Duration _kNekoScratchMinInterval = Duration(seconds: 80);
const Duration _kNekoScratchMaxInterval = Duration(seconds: 180);
const double _kNekoSize = 32;

/// Idle bounce frames (column 2, rows 0–1).
const Rect _kNekoIdleFrameTop = Rect.fromLTWH(64, 0, 32, 32);
const Rect _kNekoIdleFrameBottom = Rect.fromLTWH(64, 32, 32, 32);

/// `alert` — startled when mentioned.
const Rect _kNekoShockFrame = Rect.fromLTWH(224, 96, 32, 32);

/// `scratchSelf`
const List<Rect> _kNekoScratchFrames = <Rect>[
  Rect.fromLTWH(160, 0, 32, 32),
  Rect.fromLTWH(192, 0, 32, 32),
  Rect.fromLTWH(224, 0, 32, 32),
];

enum _NekoAnimationMode { idle, shock, scratch }

class NekoSprite extends ConsumerStatefulWidget {
  const NekoSprite({super.key});

  @override
  ConsumerState<NekoSprite> createState() => _NekoSpriteState();
}

class _NekoSpriteState extends ConsumerState<NekoSprite> {
  final Random _random = Random();
  ui.Image? _spriteImage;
  _NekoAnimationMode _mode = _NekoAnimationMode.idle;
  int _scratchFrameIndex = 0;
  int _scratchTick = 0;
  int _idleFrameIndex = 0;
  Timer? _idleTimer;
  Timer? _scratchFrameTimer;
  Timer? _scratchScheduleTimer;
  Timer? _shockTimer;
  StreamSubscription<MessageRealtimeEvent>? _messageSubscription;
  bool _isListeningForMessages = false;
  bool _animationsActive = false;
  bool _tickerEnabled = false;
  bool _isVisible = false;
  final Key _visibilityKey = UniqueKey();

  @override
  void initState() {
    super.initState();
    unawaited(_loadSpriteImage());
    // Animations are started from didChangeDependencies once TickerMode is
    // known, so an offscreen sprite never animates before it becomes visible.
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isListeningForMessages) {
      _isListeningForMessages = true;
      _messageSubscription = ref
          .read(messageRealtimeBusProvider)
          .stream
          .listen(_onMessageRealtimeEvent);
    }
    // TickerMode flips (inactive shell branch / offstage route) drive
    // didChangeDependencies; combined with the VisibilityDetector in build (which
    // also catches in-layout hiding: another channel open, PageView page swiped
    // away, scrolled offscreen) a non-visible Neko fires no timers and no frames.
    _tickerEnabled = TickerMode.valuesOf(context).enabled;
    _updateAnimationsActive();
  }

  @override
  void dispose() {
    unawaited(_messageSubscription?.cancel());
    _idleTimer?.cancel();
    _scratchFrameTimer?.cancel();
    _scratchScheduleTimer?.cancel();
    _shockTimer?.cancel();
    _spriteImage?.dispose();
    super.dispose();
  }

  void _setAnimationsActive(bool active) {
    if (active == _animationsActive) {
      return;
    }
    _animationsActive = active;
    if (active) {
      _returnToIdle();
      _scheduleRandomScratch();
    } else {
      _idleTimer?.cancel();
      _scratchFrameTimer?.cancel();
      _scratchScheduleTimer?.cancel();
      _shockTimer?.cancel();
    }
  }

  void _updateAnimationsActive() {
    _setAnimationsActive(_tickerEnabled && _isVisible);
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (!mounted) {
      return;
    }
    final bool visible = info.visibleFraction > 0;
    if (visible == _isVisible) {
      return;
    }
    _isVisible = visible;
    _updateAnimationsActive();
  }

  void _onMessageRealtimeEvent(MessageRealtimeEvent event) {
    if (!_animationsActive || event is! MessageCreated) {
      return;
    }
    final MessageResponseSchema message = event.event.message;
    final String channelId = ref.read(chatViewModelProvider).channelId;
    if (message.channelId != channelId) {
      return;
    }
    final String? currentUserId = ref.read(currentUserIdProvider);
    if (currentUserId == null || message.author.id == currentUserId) {
      return;
    }
    final bool isMentioned =
        message.mentionEveryone ||
        message.mentions.any((UserPartialResponse u) => u.id == currentUserId);
    if (!isMentioned) {
      return;
    }
    _playShock();
  }

  void _scheduleRandomScratch() {
    _scratchScheduleTimer?.cancel();
    final int spanMs =
        _kNekoScratchMaxInterval.inMilliseconds -
        _kNekoScratchMinInterval.inMilliseconds;
    final Duration delay =
        _kNekoScratchMinInterval +
        Duration(milliseconds: _random.nextInt(spanMs + 1));
    _scratchScheduleTimer = Timer(delay, () {
      if (!mounted) {
        return;
      }
      if (_mode == _NekoAnimationMode.idle) {
        _playScratch();
      } else {
        _scheduleRandomScratch();
      }
    });
  }

  void _playShock() {
    _scratchFrameTimer?.cancel();
    _shockTimer?.cancel();
    _idleTimer?.cancel();
    setState(() => _mode = _NekoAnimationMode.shock);
    _shockTimer = Timer(_kNekoShockDuration, () {
      if (!mounted) {
        return;
      }
      _returnToIdle();
    });
  }

  void _playScratch() {
    _shockTimer?.cancel();
    _scratchFrameTimer?.cancel();
    _idleTimer?.cancel();
    setState(() {
      _mode = _NekoAnimationMode.scratch;
      _scratchFrameIndex = 0;
      _scratchTick = 0;
    });
    _scratchFrameTimer = Timer.periodic(_kNekoScratchFrameDuration, (
      Timer timer,
    ) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      _scratchTick += 1;
      if (_scratchTick >= 10) {
        timer.cancel();
        _returnToIdle();
        _scheduleRandomScratch();
        return;
      }
      setState(
        () => _scratchFrameIndex = _scratchTick % _kNekoScratchFrames.length,
      );
    });
  }

  void _returnToIdle() {
    _scratchFrameTimer?.cancel();
    _shockTimer?.cancel();
    if (_mode != _NekoAnimationMode.idle) {
      setState(() => _mode = _NekoAnimationMode.idle);
    }
    _startIdleBounce();
  }

  void _startIdleBounce() {
    // Two idle frames per [_kNekoIdleFrameDuration] cycle. A plain timer only
    // schedules a frame when the sprite actually changes (~2 fps) instead of a
    // repeating AnimationController that forces a frame every vsync.
    _idleTimer?.cancel();
    _idleTimer = Timer.periodic(_kNekoIdleFrameDuration ~/ 2, (_) {
      if (!mounted || _mode != _NekoAnimationMode.idle) {
        return;
      }
      setState(() => _idleFrameIndex = _idleFrameIndex == 0 ? 1 : 0);
    });
  }

  Future<void> _loadSpriteImage() async {
    final ByteData byteData = await rootBundle.load('assets/images/neko.gif');
    final Uint8List bytes = byteData.buffer.asUint8List();
    final ui.Image image = await _decodeImage(bytes);
    if (!mounted) {
      image.dispose();
      return;
    }
    setState(() {
      _spriteImage?.dispose();
      _spriteImage = image;
    });
  }

  Future<ui.Image> _decodeImage(Uint8List bytes) {
    final Completer<ui.Image> completer = Completer<ui.Image>();
    ui.decodeImageFromList(bytes, completer.complete);
    return completer.future;
  }

  Rect _frameForMode() {
    switch (_mode) {
      case _NekoAnimationMode.idle:
        return _idleFrameIndex == 0
            ? _kNekoIdleFrameTop
            : _kNekoIdleFrameBottom;
      case _NekoAnimationMode.shock:
        return _kNekoShockFrame;
      case _NekoAnimationMode.scratch:
        return _kNekoScratchFrames[_scratchFrameIndex];
    }
  }

  @override
  Widget build(BuildContext context) {
    final ui.Image? spriteImage = _spriteImage;
    final Widget sprite = spriteImage == null
        ? const SizedBox(width: _kNekoSize, height: _kNekoSize)
        : CustomPaint(
            size: const Size(_kNekoSize, _kNekoSize),
            painter: _NekoSpritePainter(
              image: spriteImage,
              sourceRect: _frameForMode(),
            ),
          );
    return VisibilityDetector(
      key: _visibilityKey,
      onVisibilityChanged: _onVisibilityChanged,
      child: sprite,
    );
  }
}

class _NekoSpritePainter extends CustomPainter {
  const _NekoSpritePainter({required this.image, required this.sourceRect});

  final ui.Image image;
  final Rect sourceRect;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..filterQuality = FilterQuality.none
      ..isAntiAlias = false;
    final Rect destinationRect = Offset.zero & size;
    canvas.drawImageRect(image, sourceRect, destinationRect, paint);
  }

  @override
  bool shouldRepaint(covariant _NekoSpritePainter oldDelegate) {
    return oldDelegate.image != image || oldDelegate.sourceRect != sourceRect;
  }
}
