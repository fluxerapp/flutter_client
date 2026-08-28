import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';
import 'package:visibility_detector/visibility_detector.dart';

const Duration _kNekoFrameInterval = Duration(milliseconds: 100);
const Duration _kNekoShockDuration = Duration(milliseconds: 900);
const Duration _kNekoHeartDuration = Duration(seconds: 1);
const Duration _kNekoHeartReducedDuration = Duration(milliseconds: 800);
const double kNekoSpriteSize = 32;
const double _kNekoSize = kNekoSpriteSize;
const int _kIdleBeforeRandomTicks = 10;
const double _kIdleAnimationChance = 0.005;
const int _kMaxIdleExtraTicks = 3000;
const int _kTiredFrames = 8;
const int _kSleepingEndFrame = 192;
const int _kSleepingFrameStride = 4;
const int _kScratchEndFrame = 9;
const String _kNekoHeartGlyph = '♥';
const Color _kNekoHeartColor = Color(0xFFFF5C8A);

typedef _SpriteFrame = (int x, int y);

const List<_SpriteFrame> _kIdleFrames = <_SpriteFrame>[(-3, -3)];
const List<_SpriteFrame> _kAlertFrames = <_SpriteFrame>[(-7, -3)];
const List<_SpriteFrame> _kTiredFramesList = <_SpriteFrame>[(-3, -2)];
const List<_SpriteFrame> _kSleepingFrames = <_SpriteFrame>[(-2, 0), (-2, -1)];
const List<_SpriteFrame> _kScratchSelfFrames = <_SpriteFrame>[
  (-5, 0),
  (-6, 0),
  (-7, 0),
];
const List<_SpriteFrame> _kScratchWallNFrames = <_SpriteFrame>[(0, 0), (0, -1)];
const List<_SpriteFrame> _kScratchWallSFrames = <_SpriteFrame>[
  (-7, -1),
  (-6, -2),
];
const List<_SpriteFrame> _kScratchWallEFrames = <_SpriteFrame>[
  (-2, -2),
  (-2, -3),
];
const List<_SpriteFrame> _kScratchWallWFrames = <_SpriteFrame>[
  (-4, 0),
  (-4, -1),
];

enum _NekoIdleAnimation {
  sleeping,
  scratchSelf,
  scratchWallN,
  scratchWallS,
  scratchWallE,
  scratchWallW,
}

const List<_NekoIdleAnimation> _kIdleAnimations = _NekoIdleAnimation.values;

enum _NekoAnimationMode { idle, shock, idleAnimation }

Rect _rectFor(_SpriteFrame frame) {
  return Rect.fromLTWH(
    -frame.$1 * _kNekoSize,
    -frame.$2 * _kNekoSize,
    _kNekoSize,
    _kNekoSize,
  );
}

Rect _rectAt(List<_SpriteFrame> frames, int frame) {
  return _rectFor(frames[frame % frames.length]);
}

@visibleForTesting
Rect? nekoSpritePaintRect(CustomPainter painter) {
  if (painter is _NekoSpritePainter) {
    return painter.listenable.sourceRect;
  }
  return null;
}

@visibleForTesting
bool nekoSpriteImageReady(CustomPainter painter) {
  return painter is _NekoSpritePainter && painter.listenable.image != null;
}

class NekoSprite extends ConsumerStatefulWidget {
  const NekoSprite({super.key, this.random});

  @visibleForTesting
  final Random? random;

  @override
  ConsumerState<NekoSprite> createState() => _NekoSpriteState();
}

class _NekoSpriteState extends ConsumerState<NekoSprite> {
  late final Random _random = widget.random ?? Random();
  late final _NekoPaintListenable _paint = _NekoPaintListenable();
  late final _NekoSpritePainter _painter = _NekoSpritePainter(_paint);
  final ValueNotifier<List<int>> _hearts = ValueNotifier<List<int>>(
    const <int>[],
  );
  _NekoAnimationMode _mode = _NekoAnimationMode.idle;
  _NekoIdleAnimation? _idleAnimation;
  int _idleAnimationFrame = 0;
  int _nextHeartId = 0;
  final Map<int, Timer> _heartTimers = <int, Timer>{};
  Timer? _idleScheduleTimer;
  Timer? _animationTimer;
  Timer? _shockTimer;
  StreamSubscription<MessageRealtimeEvent>? _messageSubscription;
  bool _isListeningForMessages = false;
  bool _idleAnimationsActive = false;
  bool _tickerEnabled = false;
  bool _reducedMotion = false;
  bool _isVisible = false;
  final Key _visibilityKey = UniqueKey();

  @override
  void initState() {
    super.initState();
    unawaited(_loadSpriteImage());
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
    _tickerEnabled = TickerMode.valuesOf(context).enabled;
    _reducedMotion = MediaQuery.disableAnimationsOf(context);
    _updateIdleAnimationsActive();
  }

  @override
  void dispose() {
    unawaited(_messageSubscription?.cancel());
    _cancelIdleTimers();
    _shockTimer?.cancel();
    for (final Timer timer in _heartTimers.values) {
      timer.cancel();
    }
    _heartTimers.clear();
    _hearts.dispose();
    _paint.dispose();
    super.dispose();
  }

  void _cancelIdleTimers() {
    _idleScheduleTimer?.cancel();
    _idleScheduleTimer = null;
    _animationTimer?.cancel();
    _animationTimer = null;
  }

  void _syncFrame() {
    _paint.setSourceRect(_frameForMode());
  }

  void _setIdleAnimationsActive(bool active) {
    if (active == _idleAnimationsActive) {
      return;
    }
    _idleAnimationsActive = active;
    if (active) {
      _returnToIdle();
      return;
    }
    _cancelIdleTimers();
    _shockTimer?.cancel();
    _resetIdleAnimation();
    _mode = _NekoAnimationMode.idle;
    _syncFrame();
  }

  void _updateIdleAnimationsActive() {
    _setIdleAnimationsActive(_tickerEnabled && _isVisible && !_reducedMotion);
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
    _updateIdleAnimationsActive();
  }

  void _onMessageRealtimeEvent(MessageRealtimeEvent event) {
    if (!_idleAnimationsActive || event is! MessageCreated) {
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
    if (!event.snapshot.mentionsCurrentUser) {
      return;
    }
    _playShock();
  }

  bool get _canPet => _isVisible && _tickerEnabled;

  void _pet() {
    if (!_canPet) {
      return;
    }
    _playShock();
    _spawnHeart();
  }

  void _spawnHeart() {
    final int id = _nextHeartId++;
    _hearts.value = <int>[..._hearts.value, id];
    final Duration duration = _reducedMotion
        ? _kNekoHeartReducedDuration
        : _kNekoHeartDuration;
    _heartTimers[id]?.cancel();
    _heartTimers[id] = Timer(duration, () => _removeHeart(id));
  }

  void _removeHeart(int id) {
    _heartTimers.remove(id)?.cancel();
    if (!mounted) {
      return;
    }
    final List<int> next = _hearts.value
        .where((int heartId) => heartId != id)
        .toList(growable: false);
    if (next.length != _hearts.value.length) {
      _hearts.value = next;
    }
  }

  void _playShock() {
    _cancelIdleTimers();
    _shockTimer?.cancel();
    _resetIdleAnimation();
    _mode = _NekoAnimationMode.shock;
    _syncFrame();
    _shockTimer = Timer(_kNekoShockDuration, () {
      if (!mounted) {
        return;
      }
      _returnToIdle();
    });
  }

  void _resetIdleAnimation() {
    _idleAnimation = null;
    _idleAnimationFrame = 0;
  }

  void _returnToIdle() {
    _shockTimer?.cancel();
    _cancelIdleTimers();
    _resetIdleAnimation();
    _mode = _NekoAnimationMode.idle;
    _syncFrame();
    if (_idleAnimationsActive) {
      _scheduleNextIdleAnimation();
    }
  }

  Duration? _sampleIdleDelay() {
    final double sample = _random.nextDouble();
    if (sample >= 1) {
      return null;
    }
    final int extraTicks = (log(1 - sample) / log(1 - _kIdleAnimationChance))
        .ceil()
        .clamp(1, _kMaxIdleExtraTicks);
    return _kNekoFrameInterval * (_kIdleBeforeRandomTicks + extraTicks);
  }

  void _scheduleNextIdleAnimation() {
    _idleScheduleTimer?.cancel();
    final Duration? delay = _sampleIdleDelay();
    if (delay == null) {
      return;
    }
    _idleScheduleTimer = Timer(delay, () {
      if (!mounted || !_idleAnimationsActive) {
        return;
      }
      _playIdleAnimation(
        _kIdleAnimations[_random.nextInt(_kIdleAnimations.length)],
      );
    });
  }

  void _playIdleAnimation(_NekoIdleAnimation animation) {
    _cancelIdleTimers();
    _idleAnimation = animation;
    _idleAnimationFrame = 0;
    _mode = _NekoAnimationMode.idleAnimation;
    _syncFrame();
    switch (animation) {
      case _NekoIdleAnimation.sleeping:
        _animationTimer = Timer(
          _kNekoFrameInterval * _kTiredFrames,
          _onTiredFinished,
        );
      case _NekoIdleAnimation.scratchSelf:
      case _NekoIdleAnimation.scratchWallN:
      case _NekoIdleAnimation.scratchWallS:
      case _NekoIdleAnimation.scratchWallE:
      case _NekoIdleAnimation.scratchWallW:
        _animationTimer = Timer.periodic(_kNekoFrameInterval, (_) {
          _advanceScratchFrame();
        });
    }
  }

  void _onTiredFinished() {
    if (!mounted || _idleAnimation != _NekoIdleAnimation.sleeping) {
      return;
    }
    _idleAnimationFrame = _kTiredFrames;
    _syncFrame();
    _animationTimer = Timer.periodic(
      _kNekoFrameInterval * _kSleepingFrameStride,
      (_) => _advanceSleepingFrame(),
    );
  }

  void _advanceSleepingFrame() {
    if (!mounted || _idleAnimation != _NekoIdleAnimation.sleeping) {
      return;
    }
    _idleAnimationFrame += _kSleepingFrameStride;
    if (_idleAnimationFrame > _kSleepingEndFrame) {
      _returnToIdle();
      return;
    }
    _syncFrame();
  }

  void _advanceScratchFrame() {
    if (!mounted || _idleAnimation == null) {
      return;
    }
    _idleAnimationFrame += 1;
    if (_idleAnimationFrame > _kScratchEndFrame) {
      _returnToIdle();
      return;
    }
    _syncFrame();
  }

  Future<void> _loadSpriteImage() async {
    final ByteData byteData = await rootBundle.load('assets/images/neko.gif');
    final Uint8List bytes = byteData.buffer.asUint8List();
    final ui.Image image = await _decodeImage(bytes);
    if (!mounted) {
      image.dispose();
      return;
    }
    _paint.setImage(image);
  }

  Future<ui.Image> _decodeImage(Uint8List bytes) {
    final Completer<ui.Image> completer = Completer<ui.Image>();
    ui.decodeImageFromList(bytes, completer.complete);
    return completer.future;
  }

  Rect _frameForMode() {
    switch (_mode) {
      case _NekoAnimationMode.idle:
        return _rectAt(_kIdleFrames, 0);
      case _NekoAnimationMode.shock:
        return _rectAt(_kAlertFrames, 0);
      case _NekoAnimationMode.idleAnimation:
        return switch (_idleAnimation) {
          _NekoIdleAnimation.sleeping => _sleepingFrame(),
          _NekoIdleAnimation.scratchSelf => _rectAt(
            _kScratchSelfFrames,
            _idleAnimationFrame,
          ),
          _NekoIdleAnimation.scratchWallN => _rectAt(
            _kScratchWallNFrames,
            _idleAnimationFrame,
          ),
          _NekoIdleAnimation.scratchWallS => _rectAt(
            _kScratchWallSFrames,
            _idleAnimationFrame,
          ),
          _NekoIdleAnimation.scratchWallE => _rectAt(
            _kScratchWallEFrames,
            _idleAnimationFrame,
          ),
          _NekoIdleAnimation.scratchWallW => _rectAt(
            _kScratchWallWFrames,
            _idleAnimationFrame,
          ),
          null => _rectAt(_kIdleFrames, 0),
        };
    }
  }

  Rect _sleepingFrame() {
    if (_idleAnimationFrame < _kTiredFrames) {
      return _rectAt(_kTiredFramesList, 0);
    }
    return _rectAt(
      _kSleepingFrames,
      _idleAnimationFrame ~/ _kSleepingFrameStride,
    );
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: VisibilityDetector(
        key: _visibilityKey,
        onVisibilityChanged: _onVisibilityChanged,
        child: ExcludeSemantics(
          child: GestureDetector(
            onTap: _pet,
            behavior: HitTestBehavior.opaque,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: SizedBox(
                width: _kNekoSize,
                height: _kNekoSize,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    CustomPaint(
                      size: const Size(_kNekoSize, _kNekoSize),
                      painter: _painter,
                    ),
                    ValueListenableBuilder<List<int>>(
                      valueListenable: _hearts,
                      builder:
                          (BuildContext context, List<int> hearts, Widget? _) {
                            return Stack(
                              clipBehavior: Clip.none,
                              children: <Widget>[
                                for (final int id in hearts)
                                  Positioned(
                                    key: ValueKey<int>(id),
                                    left: 0,
                                    right: 0,
                                    top: -4,
                                    child: IgnorePointer(
                                      child: _NekoHeart(
                                        reducedMotion: _reducedMotion,
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NekoPaintListenable extends ChangeNotifier {
  ui.Image? image;
  Rect sourceRect = _rectAt(_kIdleFrames, 0);

  void setImage(ui.Image next) {
    if (identical(next, image)) {
      return;
    }
    image?.dispose();
    image = next;
    notifyListeners();
  }

  void setSourceRect(Rect next) {
    if (next == sourceRect) {
      return;
    }
    sourceRect = next;
    notifyListeners();
  }

  @override
  void dispose() {
    image?.dispose();
    image = null;
    super.dispose();
  }
}

class _NekoHeart extends StatelessWidget {
  const _NekoHeart({required this.reducedMotion});

  final bool reducedMotion;

  @override
  Widget build(BuildContext context) {
    const Text heart = Text(
      _kNekoHeartGlyph,
      textAlign: TextAlign.center,
      style: TextStyle(color: _kNekoHeartColor, fontSize: 12, height: 1),
    );
    if (reducedMotion) {
      return heart;
    }
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: _kNekoHeartDuration,
      curve: Curves.easeOut,
      builder: (BuildContext context, double t, Widget? child) {
        final double opacity = t <= 0.2 ? t / 0.2 : (1 - t) / 0.8;
        return Opacity(
          opacity: opacity.clamp(0, 1),
          child: Transform.translate(
            offset: Offset(0, -24 * t),
            child: Transform.scale(scale: 0.6 + 0.5 * t, child: child),
          ),
        );
      },
      child: heart,
    );
  }
}

class _NekoSpritePainter extends CustomPainter {
  _NekoSpritePainter(this.listenable) : super(repaint: listenable);

  final _NekoPaintListenable listenable;

  @override
  void paint(Canvas canvas, Size size) {
    final ui.Image? image = listenable.image;
    if (image == null) {
      return;
    }
    final Paint paint = Paint()
      ..filterQuality = FilterQuality.none
      ..isAntiAlias = false;
    canvas.drawImageRect(
      image,
      listenable.sourceRect,
      Offset.zero & size,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _NekoSpritePainter oldDelegate) {
    return oldDelegate.listenable != listenable;
  }
}
