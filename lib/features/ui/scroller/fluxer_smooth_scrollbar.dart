import 'dart:async';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/scroller/fluxer_smooth_scrollbar_metrics.dart';
import 'package:fluxer_app/material_ui.dart';

const Duration _kIdleFadeDelay = Duration(milliseconds: 1000);
const Duration _kFadeDuration = Duration(milliseconds: 200);
const double _kTrackHitWidth = 14;

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

class _ScrollbarGeometry {
  const _ScrollbarGeometry({
    required this.pixels,
    required this.minScrollExtent,
    required this.maxScrollExtent,
    required this.thumbVisible,
    required this.thumbHovered,
  });

  static const _ScrollbarGeometry empty = _ScrollbarGeometry(
    pixels: 0,
    minScrollExtent: 0,
    maxScrollExtent: 0,
    thumbVisible: false,
    thumbHovered: false,
  );

  final double pixels;
  final double minScrollExtent;
  final double maxScrollExtent;
  final bool thumbVisible;
  final bool thumbHovered;

  bool matches(_ScrollbarGeometry other) {
    return pixels == other.pixels &&
        minScrollExtent == other.minScrollExtent &&
        maxScrollExtent == other.maxScrollExtent &&
        thumbVisible == other.thumbVisible &&
        thumbHovered == other.thumbHovered;
  }
}

class _FluxerSmoothScrollbarState extends State<FluxerSmoothScrollbar> {
  final ValueNotifier<_ScrollbarGeometry> _geometry =
      ValueNotifier<_ScrollbarGeometry>(_ScrollbarGeometry.empty);

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

  @override
  void initState() {
    super.initState();
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
        _scheduleFrame();
      }
    }
    if (oldWidget.pinTrailingEdge != widget.pinTrailingEdge) {
      _scheduleFrame();
    }
  }

  @override
  void dispose() {
    _idleTimer?.cancel();
    _detachPosition();
    widget.controller.removeListener(_onControllerChanged);
    _geometry.dispose();
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
    _scheduleFrame();
  }

  void _detachPosition() {
    _attachedPosition?.removeListener(_onPositionChanged);
    _attachedPosition = null;
  }

  void _onPositionChanged() {
    _syncExtentTarget();
    if (_smoothExtents || !_extentsSettled) {
      _scheduleFrame();
    } else {
      _updateGeometry();
    }
  }

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

  bool get _smoothExtents =>
      _scrollActivity || _hoveringTrack || _draggingThumb;

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
        if (_smoothExtents) {
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
      _updateGeometry();
      if (_hasExtent && !_extentsSettled && _smoothExtents) {
        _scheduleFrame();
      }
    });
  }

  void _updateGeometry() {
    final _ScrollbarGeometry next = _ScrollbarGeometry(
      pixels: _attachedPosition?.pixels ?? 0,
      minScrollExtent: _smoothedMinExtent,
      maxScrollExtent: _smoothedMaxExtent,
      thumbVisible: _hoveringTrack || _draggingThumb || _scrollActivity,
      thumbHovered: _hoveringTrack || _draggingThumb,
    );
    if (next.matches(_geometry.value)) {
      return;
    }
    _geometry.value = next;
  }

  void _noteActivity() {
    _idleDeadline = DateTime.now().add(_kIdleFadeDelay);
    final bool started = !_scrollActivity;
    _scrollActivity = true;
    _idleTimer ??= Timer(_kIdleFadeDelay, _onIdleTimer);
    if (started) {
      _scheduleFrame();
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
    _scrollActivity = false;
    _scheduleFrame();
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.metrics.axis != Axis.vertical || notification.depth != 0) {
      return false;
    }
    if (notification is ScrollStartNotification ||
        notification is ScrollUpdateNotification) {
      _noteActivity();
    }
    return false;
  }

  bool _handleScrollMetrics(ScrollMetricsNotification notification) {
    if (notification.metrics.axis != Axis.vertical || notification.depth != 0) {
      return false;
    }
    _attachPosition();
    final bool targetChanged = _syncExtentTarget();
    if (!_smoothExtents) {
      if (targetChanged || !_extentsSettled) {
        _smoothedMinExtent = _targetMinExtent;
        _smoothedMaxExtent = _targetMaxExtent;
        _updateGeometry();
      }
      return false;
    }
    if (targetChanged || !_extentsSettled) {
      _scheduleFrame();
    }
    return false;
  }

  void _jumpToTrackY(double localY, double viewportDimension) {
    final ScrollPosition? position = _attachedPosition;
    if (position == null) {
      return;
    }
    final double trackLength = fluxerSmoothScrollbarTrackLength(
      viewportDimension: viewportDimension,
      topInset: widget.topInset,
      bottomInset: widget.bottomInset,
    );
    final double thumbExtent = fluxerSmoothScrollbarThumbExtent(
      trackLength: trackLength,
      viewportDimension: viewportDimension,
      scrollableExtent: position.maxScrollExtent - position.minScrollExtent,
    );
    final double pixels = fluxerSmoothScrollbarPixelsForTrackY(
      localY: localY,
      topInset: widget.topInset,
      trackLength: trackLength,
      thumbExtent: thumbExtent,
      minScrollExtent: position.minScrollExtent,
      maxScrollExtent: position.maxScrollExtent,
    );
    if (pixels == position.pixels) {
      return;
    }
    position.jumpTo(pixels);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        NotificationListener<ScrollMetricsNotification>(
          onNotification: _handleScrollMetrics,
          child: NotificationListener<ScrollNotification>(
            onNotification: _handleScrollNotification,
            child: widget.child,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          bottom: 0,
          width: _kTrackHitWidth,
          child: RepaintBoundary(
            child: ValueListenableBuilder<_ScrollbarGeometry>(
              valueListenable: _geometry,
              builder: (BuildContext context, _ScrollbarGeometry geometry, _) {
                return _FluxerSmoothScrollbarThumb(
                  geometry: geometry,
                  topInset: widget.topInset,
                  bottomInset: widget.bottomInset,
                  pinTrailingEdge: widget.pinTrailingEdge,
                  onHoverChanged: (bool hovering) {
                    _hoveringTrack = hovering;
                    if (hovering) {
                      _noteActivity();
                    }
                    _scheduleFrame();
                  },
                  onDragStart: (double localY, double viewportDimension) {
                    _draggingThumb = true;
                    _noteActivity();
                    _syncExtentTarget(snap: true);
                    _jumpToTrackY(localY, viewportDimension);
                    _scheduleFrame();
                  },
                  onDragUpdate: (double localY, double viewportDimension) {
                    _noteActivity();
                    _jumpToTrackY(localY, viewportDimension);
                  },
                  onDragEnd: () {
                    _draggingThumb = false;
                    _scheduleFrame();
                  },
                  onTrackTap: (double localY, double viewportDimension) {
                    _noteActivity();
                    _syncExtentTarget(snap: true);
                    _jumpToTrackY(localY, viewportDimension);
                    _scheduleFrame();
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _FluxerSmoothScrollbarThumb extends StatelessWidget {
  const _FluxerSmoothScrollbarThumb({
    required this.geometry,
    required this.topInset,
    required this.bottomInset,
    required this.pinTrailingEdge,
    required this.onHoverChanged,
    required this.onDragStart,
    required this.onDragUpdate,
    required this.onDragEnd,
    required this.onTrackTap,
  });

  final _ScrollbarGeometry geometry;
  final double topInset;
  final double bottomInset;
  final bool pinTrailingEdge;
  final ValueChanged<bool> onHoverChanged;
  final void Function(double localY, double viewportDimension) onDragStart;
  final void Function(double localY, double viewportDimension) onDragUpdate;
  final VoidCallback onDragEnd;
  final void Function(double localY, double viewportDimension) onTrackTap;

  @override
  Widget build(BuildContext context) {
    final double range = geometry.maxScrollExtent - geometry.minScrollExtent;
    if (range <= kFluxerSmoothScrollbarExtentEpsilon) {
      return const SizedBox.shrink();
    }
    final ScrollbarThemeData scrollbarTheme = Theme.of(context).scrollbarTheme;
    final double thickness = scrollbarTheme.thickness?.resolve({}) ?? 6;
    final Radius radius = scrollbarTheme.radius ?? const Radius.circular(4);
    final Color color = geometry.thumbHovered
        ? context.colors.scrollbarThumbBgHover
        : context.colors.scrollbarThumbBg;
    final Duration fadeDuration = context.motion.normal == Duration.zero
        ? Duration.zero
        : _kFadeDuration;

    return IgnorePointer(
      ignoring: !geometry.thumbVisible,
      child: MouseRegion(
        onEnter: (_) => onHoverChanged(true),
        onExit: (_) => onHoverChanged(false),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double viewportDimension = constraints.maxHeight;
            final double trackLength = fluxerSmoothScrollbarTrackLength(
              viewportDimension: viewportDimension,
              topInset: topInset,
              bottomInset: bottomInset,
            );
            final double thumbExtent = fluxerSmoothScrollbarThumbExtent(
              trackLength: trackLength,
              viewportDimension: viewportDimension,
              scrollableExtent: range,
            );
            final double fraction = fluxerSmoothScrollbarScrollFraction(
              pixels: geometry.pixels,
              minExtent: geometry.minScrollExtent,
              maxExtent: geometry.maxScrollExtent,
              pinTrailingEdge: pinTrailingEdge,
            );
            final double thumbTop = fluxerSmoothScrollbarThumbOffset(
              fraction: fraction,
              topInset: topInset,
              trackLength: trackLength,
              thumbExtent: thumbExtent,
            );
            return GestureDetector(
              behavior: HitTestBehavior.translucent,
              onVerticalDragStart: (DragStartDetails details) {
                onDragStart(details.localPosition.dy, viewportDimension);
              },
              onVerticalDragUpdate: (DragUpdateDetails details) {
                onDragUpdate(details.localPosition.dy, viewportDimension);
              },
              onVerticalDragEnd: (_) => onDragEnd(),
              onVerticalDragCancel: onDragEnd,
              onTapDown: (TapDownDetails details) {
                onTrackTap(details.localPosition.dy, viewportDimension);
              },
              child: AnimatedOpacity(
                opacity: geometry.thumbVisible ? 1 : 0,
                duration: fadeDuration,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 2),
                    child: Container(
                      key: const Key('fluxer_smooth_scrollbar_thumb'),
                      width: thickness,
                      height: thumbExtent,
                      margin: EdgeInsets.only(top: thumbTop),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.all(radius),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
