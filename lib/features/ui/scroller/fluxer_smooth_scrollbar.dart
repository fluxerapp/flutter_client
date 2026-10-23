import 'dart:async';

import 'package:flutter/foundation.dart' show precisionErrorTolerance;
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart' show ScrollDirection;
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/scroller/fluxer_smooth_scrollbar_metrics.dart';
import 'package:fluxer_app/material_ui.dart';

const Duration _kIdleFadeDelay = Duration(milliseconds: 1000);
const Duration _kFadeDuration = Duration(milliseconds: 200);
const double _kCrossAxisMargin = 2;

class FluxerSmoothScrollbar extends StatefulWidget {
  const FluxerSmoothScrollbar({
    required this.controller,
    required this.child,
    this.scrollPosition,
    this.pinTrailingEdge = false,
    this.topInset = 0,
    this.bottomInset = 0,
    super.key,
  });

  final ScrollController controller;
  final Widget child;
  final ScrollPosition? scrollPosition;
  final bool pinTrailingEdge;
  final double topInset;
  final double bottomInset;

  @override
  State<FluxerSmoothScrollbar> createState() => _FluxerSmoothScrollbarState();
}

class _FluxerSmoothScrollbarState extends State<FluxerSmoothScrollbar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final CurvedAnimation _fadeAnimation;
  late final ScrollbarPainter _painter;
  final GlobalKey _painterKey = GlobalKey(
    debugLabel: 'fluxer_smooth_scrollbar',
  );
  final GlobalKey<RawGestureDetectorState> _gestureDetectorKey =
      GlobalKey<RawGestureDetectorState>();

  double _smoothedMinExtent = 0;
  double _smoothedMaxExtent = 0;
  double _targetMinExtent = 0;
  double _targetMaxExtent = 0;
  bool _hasExtent = false;
  bool _frameScheduled = false;
  bool _hoveringTrack = false;
  bool _draggingThumb = false;
  bool _scrollActivity = false;
  DateTime _idleDeadline = DateTime.fromMillisecondsSinceEpoch(0);
  Timer? _idleTimer;
  ScrollPosition? _attachedPosition;
  bool _reduceMotion = false;
  bool _scrollGesturesReady = false;

  Offset? _startDragScrollbarAxisOffset;
  Offset? _lastDragUpdateOffset;
  double? _startDragThumbOffset;
  ScrollHoldController? _thumbHold;
  Drag? _thumbDrag;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: _kFadeDuration,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.fastOutSlowIn,
    );
    _painter = ScrollbarPainter(
      color: const Color(0x00000000),
      fadeoutOpacityAnimation: _fadeAnimation,
      minLength: kFluxerSmoothScrollbarMinThumbExtent,
      minOverscrollLength: kFluxerSmoothScrollbarMinThumbExtent,
      crossAxisMargin: _kCrossAxisMargin,
    );
    widget.controller.addListener(_onControllerChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _attachPosition();
    });
  }

  @override
  void didUpdateWidget(FluxerSmoothScrollbar oldWidget) {
    super.didUpdateWidget(oldWidget);
    final bool controllerChanged = oldWidget.controller != widget.controller;
    if (controllerChanged) {
      oldWidget.controller.removeListener(_onControllerChanged);
      widget.controller.addListener(_onControllerChanged);
    }
    if (controllerChanged ||
        oldWidget.scrollPosition != widget.scrollPosition) {
      _detachPosition();
      _attachPosition();
    } else {
      _syncExtentTarget();
      if (!_extentsSettled) {
        if (_lerpExtents) {
          _scheduleFrame();
        } else {
          _smoothedMinExtent = _targetMinExtent;
          _smoothedMaxExtent = _targetMaxExtent;
          _refreshPainter();
        }
      }
    }
    if (oldWidget.pinTrailingEdge != widget.pinTrailingEdge ||
        oldWidget.topInset != widget.topInset ||
        oldWidget.bottomInset != widget.bottomInset) {
      _refreshPainter();
    }
  }

  @override
  void dispose() {
    _idleTimer?.cancel();
    _fadeAnimation.dispose();
    _fadeController.dispose();
    _detachPosition();
    widget.controller.removeListener(_onControllerChanged);
    _painter.dispose();
    super.dispose();
  }

  ScrollPosition? _resolvePosition() {
    final ScrollPosition? explicit = widget.scrollPosition;
    if (explicit != null) {
      return explicit;
    }
    if (!widget.controller.hasClients) {
      return null;
    }
    final Iterable<ScrollPosition> positions = widget.controller.positions;
    if (positions.length == 1) {
      return positions.first;
    }
    ScrollPosition? last;
    for (final ScrollPosition position in positions) {
      last = position;
    }
    return last;
  }

  void _onControllerChanged() {
    if (_resolvePosition() == _attachedPosition) {
      return;
    }
    _attachPosition();
  }

  void _attachPosition() {
    final ScrollPosition? position = _resolvePosition();
    if (position == _attachedPosition) {
      return;
    }
    _detachPosition();
    _attachedPosition = position;
    position?.addListener(_onPositionChanged);
    _syncExtentTarget(snap: true);
    _refreshPainter();
    _scheduleFrame();
  }

  void _detachPosition() {
    _attachedPosition?.removeListener(_onPositionChanged);
    _attachedPosition = null;
  }

  void _onPositionChanged() {
    _syncExtentTarget();
    if (!_lerpExtents && !_extentsSettled) {
      _smoothedMinExtent = _targetMinExtent;
      _smoothedMaxExtent = _targetMaxExtent;
    }
    if (_lerpExtents && !_extentsSettled) {
      _scheduleFrame();
    } else {
      _refreshPainter();
    }
  }

  bool get _lerpExtents => _hoveringTrack || _draggingThumb;

  bool _syncExtentTarget({bool snap = false}) {
    final ScrollPosition? position = _attachedPosition;
    if (position == null) {
      return false;
    }
    final bool changed =
        position.minScrollExtent != _targetMinExtent ||
        position.maxScrollExtent != _targetMaxExtent;
    _targetMinExtent = position.minScrollExtent;
    _targetMaxExtent = position.maxScrollExtent;
    if (snap || !_hasExtent || _draggingThumb) {
      _smoothedMinExtent = _targetMinExtent;
      _smoothedMaxExtent = _targetMaxExtent;
      _hasExtent = true;
      return true;
    }
    return changed;
  }

  bool get _extentsSettled =>
      (_smoothedMinExtent - _targetMinExtent).abs() <=
          kFluxerSmoothScrollbarExtentEpsilon &&
      (_smoothedMaxExtent - _targetMaxExtent).abs() <=
          kFluxerSmoothScrollbarExtentEpsilon;

  void _scheduleFrame() {
    if (_frameScheduled) {
      return;
    }
    _frameScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _frameScheduled = false;
      if (!mounted) {
        return;
      }
      if (_hasExtent && !_draggingThumb && !_extentsSettled) {
        if (_lerpExtents) {
          _smoothedMinExtent = fluxerSmoothScrollbarLerpExtent(
            current: _smoothedMinExtent,
            target: _targetMinExtent,
            snap: false,
          );
          _smoothedMaxExtent = fluxerSmoothScrollbarLerpExtent(
            current: _smoothedMaxExtent,
            target: _targetMaxExtent,
            snap: false,
          );
        } else {
          _smoothedMinExtent = _targetMinExtent;
          _smoothedMaxExtent = _targetMaxExtent;
        }
      }
      _refreshPainter();
      if (_hasExtent && !_extentsSettled && _lerpExtents) {
        _scheduleFrame();
      }
    });
  }

  void _refreshPainter() {
    final ScrollPosition? position = _attachedPosition;
    if (position == null || !position.hasContentDimensions) {
      _updateScrollGesturesReady();
      return;
    }
    _updateScrollbarTheme();
    final FixedScrollMetrics? metrics = fluxerSmoothScrollbarPaintMetrics(
      source: position,
      smoothedMinScrollExtent: _smoothedMinExtent,
      smoothedMaxScrollExtent: _smoothedMaxExtent,
      pinTrailingEdge: widget.pinTrailingEdge,
    );
    if (metrics == null) {
      _updateScrollGesturesReady();
      return;
    }
    _painter.update(metrics, position.axisDirection);
    _updateScrollGesturesReady();
  }

  void _updateScrollGesturesReady() {
    final bool ready = _canHandleGestures();
    if (ready == _scrollGesturesReady) {
      return;
    }
    _scrollGesturesReady = ready;
    setState(() {});
  }

  void _updateScrollbarTheme() {
    final ScrollbarThemeData scrollbarTheme = Theme.of(context).scrollbarTheme;
    final bool hovered = _hoveringTrack || _draggingThumb;
    _painter
      ..thickness = scrollbarTheme.thickness?.resolve({}) ?? 6
      ..radius = scrollbarTheme.radius ?? const Radius.circular(4)
      ..color = hovered
          ? context.colors.scrollbarThumbBgHover
          : context.colors.scrollbarThumbBg
      ..textDirection = Directionality.of(context)
      ..padding = EdgeInsets.only(
        top: widget.topInset,
        bottom: widget.bottomInset,
      )
      ..scrollbarOrientation = ScrollbarOrientation.right;
  }

  void _syncFadeVisibility() {
    final bool show = _hoveringTrack || _draggingThumb || _scrollActivity;
    if (show) {
      if (_fadeController.value < 1) {
        _fadeController.forward();
      }
    } else if (_reduceMotion) {
      _fadeController.value = 0;
    } else if (_fadeController.value > 0) {
      _fadeController.reverse();
    }
  }

  void _noteActivity() {
    _idleDeadline = DateTime.now().add(_kIdleFadeDelay);
    final bool started = !_scrollActivity;
    _scrollActivity = true;
    _syncFadeVisibility();
    if (_reduceMotion) {
      _idleTimer?.cancel();
      _idleTimer = null;
    } else {
      _idleTimer ??= Timer(_kIdleFadeDelay, _onIdleTimer);
    }
    if (started) {
      _refreshPainter();
    }
  }

  void _onIdleTimer() {
    _idleTimer = null;
    if (!mounted) {
      return;
    }
    final Duration remaining = _idleDeadline.difference(DateTime.now());
    if (remaining > Duration.zero) {
      _idleTimer = Timer(remaining, _onIdleTimer);
      return;
    }
    _endScrollActivity();
  }

  void _endScrollActivity() {
    if (!_scrollActivity) {
      return;
    }
    _scrollActivity = false;
    _syncFadeVisibility();
    _refreshPainter();
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.metrics.axis != Axis.vertical || notification.depth != 0) {
      return false;
    }
    if (notification is UserScrollNotification) {
      if (notification.direction != ScrollDirection.idle) {
        _noteActivity();
      } else if (_reduceMotion && !_hoveringTrack && !_draggingThumb) {
        _endScrollActivity();
      }
      return false;
    }
    if (notification is ScrollStartNotification &&
        notification.dragDetails != null) {
      _noteActivity();
    } else if (notification is ScrollUpdateNotification &&
        notification.dragDetails != null) {
      _noteActivity();
    } else if (notification is ScrollEndNotification && _thumbDrag == null) {
      _maybeStartIdleFade();
    }
    return false;
  }

  void _maybeStartIdleFade() {
    if (_hoveringTrack || _draggingThumb) {
      return;
    }
    _idleDeadline = DateTime.now().add(_kIdleFadeDelay);
    _idleTimer?.cancel();
    _idleTimer = Timer(_kIdleFadeDelay, _onIdleTimer);
  }

  bool _handleScrollMetrics(ScrollMetricsNotification notification) {
    if (notification.metrics.axis != Axis.vertical || notification.depth != 0) {
      return false;
    }
    _attachPosition();
    final bool targetChanged = _syncExtentTarget();
    if (!_lerpExtents) {
      if (targetChanged || !_extentsSettled) {
        _smoothedMinExtent = _targetMinExtent;
        _smoothedMaxExtent = _targetMaxExtent;
        _refreshPainter();
      }
      return false;
    }
    if (targetChanged || !_extentsSettled) {
      _scheduleFrame();
    } else {
      _refreshPainter();
    }
    return false;
  }

  bool _canHandleGestures() {
    final ScrollPosition? position = _attachedPosition;
    return position != null &&
        position.hasContentDimensions &&
        position.maxScrollExtent - position.minScrollExtent >
            precisionErrorTolerance;
  }

  void _disposeThumbDrag() {
    _thumbDrag = null;
  }

  void _disposeThumbHold() {
    _thumbHold = null;
  }

  void _handleThumbDragDown(DragDownDetails details) {
    final ScrollPosition? position = _attachedPosition;
    if (position == null) {
      return;
    }
    _fadeController.forward();
    _thumbHold = position.hold(_disposeThumbHold);
  }

  void _handleThumbDragStart(DragStartDetails details) {
    final ScrollPosition? position = _attachedPosition;
    if (position == null) {
      return;
    }
    _draggingThumb = true;
    _noteActivity();
    _syncExtentTarget(snap: true);
    _refreshPainter();

    final Offset localPosition = _scrollbarLocalOffset(
      _painterKey,
      details.globalPosition,
    );
    _thumbDrag = position.drag(
      DragStartDetails(
        localPosition: localPosition,
        globalPosition: details.globalPosition,
        kind: details.kind,
      ),
      _disposeThumbDrag,
    );
    _startDragScrollbarAxisOffset = localPosition;
    _lastDragUpdateOffset = localPosition;
    _startDragThumbOffset = _painter.getThumbScrollOffset();
    _updateScrollbarTheme();
  }

  void _handleThumbDragUpdate(DragUpdateDetails details) {
    final ScrollPosition? position = _attachedPosition;
    if (position == null || _thumbDrag == null) {
      return;
    }
    if (!position.physics.shouldAcceptUserOffset(position)) {
      return;
    }
    final Offset localPosition = _scrollbarLocalOffset(
      _painterKey,
      details.globalPosition,
    );
    if (_lastDragUpdateOffset == localPosition) {
      return;
    }
    final double? primaryDelta = fluxerSmoothScrollbarDragScrollDelta(
      axisDirection: position.axisDirection,
      startDragScrollbarAxisOffset: _startDragScrollbarAxisOffset!,
      lastDragUpdateOffset: _lastDragUpdateOffset!,
      localPosition: localPosition,
      startDragThumbOffset: _startDragThumbOffset!,
      painter: _painter,
      currentPixels: position.pixels,
      minScrollExtent: position.minScrollExtent,
      maxScrollExtent: position.maxScrollExtent,
    );
    if (primaryDelta == null || primaryDelta == 0) {
      _lastDragUpdateOffset = localPosition;
      return;
    }
    final Offset delta = position.axis == Axis.horizontal
        ? Offset(primaryDelta, 0)
        : Offset(0, primaryDelta);
    _thumbDrag!.update(
      DragUpdateDetails(
        delta: delta,
        primaryDelta: primaryDelta,
        globalPosition: details.globalPosition,
        localPosition: localPosition,
      ),
    );
    _lastDragUpdateOffset = localPosition;
    _noteActivity();
  }

  void _handleThumbDragEnd(DragEndDetails details) {
    _draggingThumb = false;
    _startDragScrollbarAxisOffset = null;
    _lastDragUpdateOffset = null;
    _startDragThumbOffset = null;
    _thumbHold?.cancel();
    _thumbDrag?.end(
      DragEndDetails(
        primaryVelocity: 0,
        globalPosition: details.globalPosition,
        localPosition: _scrollbarLocalOffset(
          _painterKey,
          details.globalPosition,
        ),
      ),
    );
    _thumbDrag = null;
    _updateScrollbarTheme();
    _maybeStartIdleFade();
    _scheduleFrame();
  }

  void _handleThumbDragCancel() {
    _draggingThumb = false;
    _startDragScrollbarAxisOffset = null;
    _lastDragUpdateOffset = null;
    _startDragThumbOffset = null;
    _thumbHold?.cancel();
    _thumbDrag?.cancel();
    _thumbDrag = null;
    _updateScrollbarTheme();
    _maybeStartIdleFade();
    _scheduleFrame();
  }

  void _handleTrackTapDown(TapDownDetails details) {
    final ScrollPosition? position = _attachedPosition;
    if (position == null || !_canHandleGestures()) {
      return;
    }
    if (!position.physics.shouldAcceptUserOffset(position)) {
      return;
    }
    _noteActivity();
    final Offset localPosition = _scrollbarLocalOffset(
      _painterKey,
      details.globalPosition,
    );
    final double thumbTrackOffset = _painter.getThumbScrollOffset();
    final AxisDirection scrollDirection = localPosition.dy > thumbTrackOffset
        ? AxisDirection.down
        : AxisDirection.up;
    final ScrollableState? state = Scrollable.maybeOf(
      position.context.notificationContext!,
    );
    if (state == null) {
      return;
    }
    final double scrollIncrement = ScrollAction.getDirectionalIncrement(
      state,
      ScrollIntent(direction: scrollDirection, type: ScrollIncrementType.page),
    );
    position.moveTo(
      position.pixels + scrollIncrement,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }

  void _initThumbDragGestureRecognizer(DragGestureRecognizer instance) {
    instance
      ..onDown = _handleThumbDragDown
      ..onStart = _handleThumbDragStart
      ..onUpdate = _handleThumbDragUpdate
      ..onEnd = _handleThumbDragEnd
      ..onCancel = _handleThumbDragCancel
      ..gestureSettings = const DeviceGestureSettings(touchSlop: 0)
      ..dragStartBehavior = DragStartBehavior.down;
  }

  Map<Type, GestureRecognizerFactory> get _gestures {
    final Map<Type, GestureRecognizerFactory> gestures =
        <Type, GestureRecognizerFactory>{};
    if (!_canHandleGestures()) {
      return gestures;
    }
    gestures[_VerticalThumbDragGestureRecognizer] =
        GestureRecognizerFactoryWithHandlers<
          _VerticalThumbDragGestureRecognizer
        >(
          () => _VerticalThumbDragGestureRecognizer(
            debugOwner: this,
            customPaintKey: _painterKey,
          ),
          _initThumbDragGestureRecognizer,
        );
    gestures[_TrackTapGestureRecognizer] =
        GestureRecognizerFactoryWithHandlers<_TrackTapGestureRecognizer>(
          () => _TrackTapGestureRecognizer(
            debugOwner: this,
            customPaintKey: _painterKey,
          ),
          (_TrackTapGestureRecognizer instance) {
            instance.onTapDown = _handleTrackTapDown;
          },
        );
    return gestures;
  }

  bool _isPointerOverScrollbar(Offset position, {bool forHover = false}) {
    if (_painterKey.currentContext == null) {
      return false;
    }
    final RenderBox renderBox =
        _painterKey.currentContext!.findRenderObject()! as RenderBox;
    final Offset local = renderBox.globalToLocal(position);
    return _painter.hitTestInteractive(
      local,
      PointerDeviceKind.mouse,
      forHover: forHover,
    );
  }

  @override
  Widget build(BuildContext context) {
    _reduceMotion = MediaQuery.disableAnimationsOf(context);
    _updateScrollbarTheme();
    return NotificationListener<ScrollMetricsNotification>(
      onNotification: _handleScrollMetrics,
      child: NotificationListener<ScrollNotification>(
        onNotification: _handleScrollNotification,
        child: RawGestureDetector(
          key: _gestureDetectorKey,
          gestures: _gestures,
          child: MouseRegion(
            onExit: (PointerExitEvent event) {
              if (event.kind == PointerDeviceKind.mouse ||
                  event.kind == PointerDeviceKind.trackpad) {
                if (_hoveringTrack) {
                  _hoveringTrack = false;
                  _updateScrollbarTheme();
                  _syncFadeVisibility();
                  _maybeStartIdleFade();
                }
              }
            },
            onHover: (PointerHoverEvent event) {
              if (event.kind == PointerDeviceKind.mouse ||
                  event.kind == PointerDeviceKind.trackpad) {
                final bool over = _isPointerOverScrollbar(
                  event.position,
                  forHover: true,
                );
                if (over != _hoveringTrack) {
                  _hoveringTrack = over;
                  if (over) {
                    _noteActivity();
                  } else {
                    _updateScrollbarTheme();
                    _syncFadeVisibility();
                    _maybeStartIdleFade();
                  }
                } else if (over) {
                  _fadeController.forward();
                  _idleTimer?.cancel();
                }
              }
            },
            child: CustomPaint(
              key: _painterKey,
              foregroundPainter: _painter,
              child: RepaintBoundary(child: widget.child),
            ),
          ),
        ),
      ),
    );
  }
}

Offset _scrollbarLocalOffset(GlobalKey customPaintKey, Offset position) {
  final RenderBox renderBox =
      customPaintKey.currentContext!.findRenderObject()! as RenderBox;
  return renderBox.globalToLocal(position);
}

bool _isThumbPointer(GlobalKey customPaintKey, PointerEvent event) {
  if (customPaintKey.currentContext == null) {
    return false;
  }
  final CustomPaint customPaint =
      customPaintKey.currentContext!.widget as CustomPaint;
  final ScrollbarPainter painter =
      customPaint.foregroundPainter! as ScrollbarPainter;
  final Offset localOffset = _scrollbarLocalOffset(
    customPaintKey,
    event.position,
  );
  return painter.hitTestOnlyThumbInteractive(localOffset, event.kind);
}

bool _isTrackPointer(GlobalKey customPaintKey, PointerEvent event) {
  if (customPaintKey.currentContext == null) {
    return false;
  }
  final CustomPaint customPaint =
      customPaintKey.currentContext!.widget as CustomPaint;
  final ScrollbarPainter painter =
      customPaint.foregroundPainter! as ScrollbarPainter;
  final Offset localOffset = _scrollbarLocalOffset(
    customPaintKey,
    event.position,
  );
  return painter.hitTestInteractive(localOffset, event.kind) &&
      !painter.hitTestOnlyThumbInteractive(localOffset, event.kind);
}

class _VerticalThumbDragGestureRecognizer
    extends VerticalDragGestureRecognizer {
  _VerticalThumbDragGestureRecognizer({
    required Object super.debugOwner,
    required this._customPaintKey,
  });

  final GlobalKey _customPaintKey;

  @override
  bool isPointerPanZoomAllowed(PointerPanZoomStartEvent event) {
    return false;
  }

  @override
  bool isPointerAllowed(PointerEvent event) {
    return _isThumbPointer(_customPaintKey, event) &&
        super.isPointerAllowed(event);
  }
}

class _TrackTapGestureRecognizer extends TapGestureRecognizer {
  _TrackTapGestureRecognizer({
    required super.debugOwner,
    required this._customPaintKey,
  });

  final GlobalKey _customPaintKey;

  @override
  bool isPointerAllowed(PointerDownEvent event) {
    return _isTrackPointer(_customPaintKey, event) &&
        super.isPointerAllowed(event);
  }
}
