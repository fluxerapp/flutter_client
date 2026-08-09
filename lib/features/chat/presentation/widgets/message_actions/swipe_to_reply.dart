import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/swipe_constants.dart';
import 'package:fluxer_app/shared/gestures/nested_horizontal_scrollable.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double _kMaxDragFraction = 0.30;
const double _kTriggerFraction = 0.20;
const double _kIconPillSize = 36;
const double _kIconSize = 20;
const double _kIconMinScale = 0.6;
const double _kIconRightPadding = 20;
const double _kMaxCornerRadius = 8;

const Duration _kEditHoldDelay = Duration(milliseconds: 400);
const double _kHoldRingStroke = 1.5;
const double _kHoldRingInset = 2;

/// Wraps [child] with a swipe-left-to-reply gesture, plus optional
/// hold-to-edit.
///
/// The child follows the finger leftward, capped at [_kMaxDragFraction] of the
/// screen width, while an action icon fades in from the right. Releasing past
/// the trigger threshold invokes [onReply]. When [onEdit] is non-null, holding
/// the swipe past the threshold for [_kEditHoldDelay] escalates to edit: a
/// progress ring fills, the icon morphs to a pencil, and releasing invokes
/// [onEdit] instead. Either way the child springs back.
class SwipeToReply extends StatefulWidget {
  const SwipeToReply({
    required this.child,
    required this.onReply,
    this.onEdit,
    this.enabled = true,
    super.key,
  });

  final Widget child;
  final VoidCallback onReply;
  final VoidCallback? onEdit;
  final bool enabled;

  @override
  State<SwipeToReply> createState() => _SwipeToReplyState();
}

class _SwipeToReplyState extends State<SwipeToReply>
    with TickerProviderStateMixin {
  final GlobalKey _contentKey = GlobalKey();
  late final AnimationController _springController;
  late final AnimationController _holdController;
  Animation<double>? _springAnimation;
  final ValueNotifier<double> _dragOffset = ValueNotifier<double>(0);
  double _maxDrag = 0;
  double _triggerOffset = 0;
  bool _hasCrossedThreshold = false;
  final ValueNotifier<bool> _armedEdit = ValueNotifier<bool>(false);

  bool get _canEdit => widget.onEdit != null;

  @override
  void initState() {
    super.initState();
    _springController = AnimationController(
      vsync: this,
      duration: FluxerMotionTheme.normalDuration,
    );
    _holdController = AnimationController(
      vsync: this,
      duration: _kEditHoldDelay,
    )..addStatusListener(_onHoldStatus);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _springController.duration = context.motion.normal;
  }

  @override
  void dispose() {
    _springController.dispose();
    _holdController.dispose();
    _dragOffset.dispose();
    _armedEdit.dispose();
    super.dispose();
  }

  void _measureBounds() {
    final width = MediaQuery.sizeOf(context).width;
    _maxDrag = width * _kMaxDragFraction;
    _triggerOffset = width * _kTriggerFraction;
  }

  void _handleDragStart(DragStartDetails details) {
    _measureBounds();
    _hasCrossedThreshold = false;
    _armedEdit.value = false;
    _holdController
      ..stop()
      ..value = 0;
    _springAnimation?.removeListener(_onSpringTick);
    _springAnimation = null;
    _springController.stop();
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    final next = (_dragOffset.value + details.delta.dx).clamp(-_maxDrag, 0.0);
    final bool pastThreshold = next <= -_triggerOffset;
    if (!_hasCrossedThreshold && pastThreshold) {
      _hasCrossedThreshold = true;
      unawaited(HapticFeedback.mediumImpact());
      if (_canEdit) {
        unawaited(_holdController.forward(from: 0));
      }
    } else if (_hasCrossedThreshold && !pastThreshold) {
      _hasCrossedThreshold = false;
      _cancelHold();
    }
    _dragOffset.value = next;
  }

  void _handleDragEnd(DragEndDetails details) {
    final bool shouldEdit = _armedEdit.value && _canEdit;
    _holdController.stop();
    if (shouldEdit) {
      widget.onEdit!.call();
    } else if (_dragOffset.value <= -_triggerOffset) {
      widget.onReply();
    }
    _armedEdit.value = false;
    _holdController.value = 0;
    _animateBack();
  }

  void _handleDragCancel() {
    _cancelHold();
    _animateBack();
  }

  void _cancelHold() {
    _armedEdit.value = false;
    _holdController
      ..stop()
      ..value = 0;
  }

  void _onHoldStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed &&
        _hasCrossedThreshold &&
        _canEdit &&
        !_armedEdit.value) {
      unawaited(HapticFeedback.heavyImpact());
      _armedEdit.value = true;
    }
  }

  void _animateBack() {
    if (_dragOffset.value == 0) {
      return;
    }
    final start = _dragOffset.value;
    _springController
      ..stop()
      ..reset();
    final animation = Tween<double>(begin: start, end: 0).animate(
      CurvedAnimation(parent: _springController, curve: Curves.easeOut),
    )..addListener(_onSpringTick);
    _springAnimation = animation;
    unawaited(_springController.forward());
  }

  void _onSpringTick() {
    if (!mounted) {
      return;
    }
    _dragOffset.value = _springAnimation?.value ?? 0;
  }

  bool _shouldDeferToHorizontalScroll(PointerDownEvent event) {
    final BuildContext? searchRoot = _contentKey.currentContext;
    if (searchRoot == null) {
      return false;
    }
    return isPointerOverOverflowingHorizontalScrollable(
      searchRoot,
      event.position,
      viewId: event.viewId,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) {
      return widget.child;
    }
    if (_maxDrag == 0) {
      _measureBounds();
    }
    final double leadingReserve = leadingEdgeHorizontalSwipeReserveWidth(
      context,
    );
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AnimatedBuilder(
          animation: _dragOffset,
          child: RepaintBoundary(key: _contentKey, child: widget.child),
          builder: (BuildContext context, Widget? child) {
            final double offset = _dragOffset.value;
            final double progress = _maxDrag == 0
                ? 0.0
                : (-offset / _maxDrag).clamp(0.0, 1.0);
            final double cornerRadius = _kMaxCornerRadius * progress;
            return Transform.translate(
              offset: Offset(offset, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(cornerRadius),
                  bottomRight: Radius.circular(cornerRadius),
                ),
                child: child,
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: Listenable.merge([
            _dragOffset,
            _holdController,
            _armedEdit,
          ]),
          builder: (BuildContext context, _) {
            final double progress = _maxDrag == 0
                ? 0.0
                : (-_dragOffset.value / _maxDrag).clamp(0.0, 1.0);
            if (progress <= 0) {
              return const SizedBox.shrink();
            }
            return _buildActionIcon(context, progress);
          },
        ),
        PositionedDirectional(
          start: leadingReserve,
          top: 0,
          end: 0,
          bottom: 0,
          child: RawGestureDetector(
            behavior: HitTestBehavior.translucent,
            gestures: <Type, GestureRecognizerFactory>{
              _LeftwardHorizontalDragRecognizer:
                  GestureRecognizerFactoryWithHandlers<
                    _LeftwardHorizontalDragRecognizer
                  >(
                    () => _LeftwardHorizontalDragRecognizer(
                      shouldDeferToHorizontalScroll:
                          _shouldDeferToHorizontalScroll,
                    ),
                    (recognizer) {
                      recognizer
                        ..onStart = _handleDragStart
                        ..onUpdate = _handleDragUpdate
                        ..onEnd = _handleDragEnd
                        ..onCancel = _handleDragCancel;
                    },
                  ),
            },
            child: const SizedBox.expand(),
          ),
        ),
      ],
    );
  }

  Widget _buildActionIcon(BuildContext context, double progress) {
    final scale = _kIconMinScale + (1 - _kIconMinScale) * progress;
    final double holdProgress = _armedEdit.value ? 1.0 : _holdController.value;
    final bool showRing = _canEdit && holdProgress > 0;
    final Color ringColor = context.colors.textOnBrandPrimary;
    return Positioned.fill(
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(right: _kIconRightPadding),
          child: Opacity(
            opacity: progress,
            child: Transform.scale(
              scale: scale,
              child: Container(
                width: _kIconPillSize,
                height: _kIconPillSize,
                decoration: BoxDecoration(
                  color: context.colors.brandPrimary,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (showRing)
                      CustomPaint(
                        size: const Size.square(_kIconPillSize),
                        painter: _HoldRingPainter(
                          progress: holdProgress,
                          color: ringColor,
                          trackColor: ringColor.withValues(alpha: 0.25),
                        ),
                      ),
                    PhosphorIcon(
                      _armedEdit.value
                          ? PhosphorIconsFill.pencilSimple
                          : PhosphorIconsFill.arrowBendUpLeft,
                      size: _kIconSize,
                      color: context.colors.textOnBrandPrimary,
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

/// Circular hold-progress ring drawn inside the action pill.
class _HoldRingPainter extends CustomPainter {
  const _HoldRingPainter({
    required this.progress,
    required this.color,
    required this.trackColor,
  });

  final double progress;
  final Color color;
  final Color trackColor;

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = size.center(Offset.zero);
    final double radius = size.shortestSide / 2 - _kHoldRingInset;
    if (radius <= 0) {
      return;
    }
    final Paint track = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = _kHoldRingStroke
      ..color = trackColor;
    canvas.drawCircle(center, radius, track);
    final double sweep = progress.clamp(0.0, 1.0) * 2 * math.pi;
    if (sweep <= 0) {
      return;
    }
    final Paint arc = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = _kHoldRingStroke
      ..strokeCap = StrokeCap.round
      ..color = color;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      sweep,
      false,
      arc,
    );
  }

  @override
  bool shouldRepaint(_HoldRingPainter oldDelegate) =>
      oldDelegate.progress != progress ||
      oldDelegate.color != color ||
      oldDelegate.trackColor != trackColor;
}

/// Horizontal drag recognizer that drops out of the gesture arena as soon
/// as the dominant drag direction is rightward, leaving the parent shell
/// drawer free to claim the gesture and open the drawer.
class _LeftwardHorizontalDragRecognizer
    extends HorizontalDragGestureRecognizer {
  _LeftwardHorizontalDragRecognizer({
    required this.shouldDeferToHorizontalScroll,
  });

  final bool Function(PointerDownEvent event) shouldDeferToHorizontalScroll;

  final Map<int, Offset> _initialPositions = <int, Offset>{};
  final Set<int> _resolved = <int>{};

  @override
  void addAllowedPointer(PointerDownEvent event) {
    if (shouldDeferToHorizontalScroll(event)) {
      resolve(GestureDisposition.rejected);
      return;
    }
    _initialPositions[event.pointer] = event.position;
    super.addAllowedPointer(event);
  }

  @override
  void handleEvent(PointerEvent event) {
    if (event is PointerMoveEvent && !_resolved.contains(event.pointer)) {
      final start = _initialPositions[event.pointer];
      if (start != null) {
        final delta = event.position - start;
        if (delta.dx.abs() >= kTouchSlop &&
            delta.dx.abs() > delta.dy.abs() &&
            delta.dx > 0) {
          _resolved.add(event.pointer);
          resolve(GestureDisposition.rejected);
          return;
        }
      }
    }
    super.handleEvent(event);
  }

  @override
  void didStopTrackingLastPointer(int pointer) {
    _initialPositions.remove(pointer);
    _resolved.remove(pointer);
    super.didStopTrackingLastPointer(pointer);
  }

  @override
  void rejectGesture(int pointer) {
    _initialPositions.remove(pointer);
    _resolved.remove(pointer);
    super.rejectGesture(pointer);
  }
}
