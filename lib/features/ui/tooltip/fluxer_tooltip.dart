import 'dart:async';
import 'dart:math' as math;

import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/material_ui.dart';

/// Position of the tooltip relative to its target.
enum FluxerTooltipPosition { above, below, left, right }

/// Custom overlay tooltip with position control.
///
/// Shows on hover (desktop) and long-press (mobile). Supports both plain
/// [message] text and a [richMessage] widget.
class FluxerTooltip extends StatefulWidget {
  const FluxerTooltip({
    required this.child,
    this.message,
    this.richMessage,
    this.position = FluxerTooltipPosition.above,
    super.key,
  }) : assert(
         message != null || richMessage != null,
         'Either message or richMessage must be provided.',
       );

  final Widget child;
  final String? message;
  final Widget? richMessage;
  final FluxerTooltipPosition position;

  @override
  State<FluxerTooltip> createState() => _FluxerTooltipState();
}

class _FluxerTooltipState extends State<FluxerTooltip>
    with SingleTickerProviderStateMixin {
  final OverlayPortalController _overlayController = OverlayPortalController();

  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;

  Timer? _showTimer;
  Timer? _hideTimer;
  Timer? _longPressTimer;
  bool _isHovering = false;

  static const Duration _showDelay = Duration(milliseconds: 500);
  static const Duration _hideDelay = Duration(milliseconds: 100);
  static const Duration _fadeDuration = FluxerMotionTheme.fastDuration;
  static const Duration _longPressDuration = Duration(seconds: 2);
  static const double _tooltipGap = 8;
  static const double _screenInset = 8;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: _fadeDuration,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _animationController.duration = context.motion.fast;
  }

  @override
  void dispose() {
    _showTimer?.cancel();
    _hideTimer?.cancel();
    _longPressTimer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  void _showTooltip() {
    _hideTimer?.cancel();
    _overlayController.show();
    _animationController.forward();
  }

  void _hideTooltip() {
    unawaited(
      _animationController.reverse().then((_) {
        if (mounted && _overlayController.isShowing) {
          _overlayController.hide();
        }
      }),
    );
  }

  void _handleMouseEnter(PointerEvent _) {
    _isHovering = true;
    _hideTimer?.cancel();
    _showTimer = Timer(_showDelay, () {
      if (_isHovering && mounted) {
        _showTooltip();
      }
    });
  }

  void _handleMouseExit(PointerEvent _) {
    _isHovering = false;
    _showTimer?.cancel();
    _hideTimer = Timer(_hideDelay, () {
      if (!_isHovering && mounted) {
        _hideTooltip();
      }
    });
  }

  void _handleLongPress() {
    _showTooltip();
    _longPressTimer?.cancel();
    _longPressTimer = Timer(_longPressDuration, () {
      if (mounted) {
        _hideTooltip();
      }
    });
  }

  Widget _buildOverlay(BuildContext context, OverlayChildLayoutInfo info) {
    final colors = context.colors;
    final layout = context.layout;
    final textStyles = context.textStyles;
    final EdgeInsets safePadding = MediaQuery.paddingOf(context);
    final Rect target = MatrixUtils.transformRect(
      info.childPaintTransform,
      Offset.zero & info.childSize,
    );

    return CustomSingleChildLayout(
      delegate: _FluxerTooltipPositionDelegate(
        target: target,
        position: widget.position,
        gap: _tooltipGap,
        padding: safePadding + const EdgeInsets.all(_screenInset),
      ),
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: layout.s2,
            vertical: layout.s1_5,
          ),
          decoration: BoxDecoration(
            color: colors.backgroundFloating,
            borderRadius: layout.radiusMd,
            border: Border.all(color: colors.backgroundModifierAccent),
          ),
          child:
              widget.richMessage ??
              Text(
                widget.message!,
                style: textStyles.bodySmall.copyWith(color: colors.textPrimary),
              ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String? semanticsLabel = widget.message;
    final Widget target = MouseRegion(
      onEnter: _handleMouseEnter,
      onExit: _handleMouseExit,
      child: FluxerGestureDetector(
        onLongPress: _handleLongPress,
        behavior: HitTestBehavior.translucent,
        child: widget.child,
      ),
    );
    return OverlayPortal.overlayChildLayoutBuilder(
      controller: _overlayController,
      overlayChildBuilder: _buildOverlay,
      child: semanticsLabel == null
          ? target
          : Semantics(label: semanticsLabel, child: target),
    );
  }
}

class _FluxerTooltipPositionDelegate extends SingleChildLayoutDelegate {
  _FluxerTooltipPositionDelegate({
    required this.target,
    required this.position,
    required this.gap,
    required this.padding,
  });

  final Rect target;
  final FluxerTooltipPosition position;
  final double gap;
  final EdgeInsets padding;

  @override
  Size getSize(BoxConstraints constraints) => constraints.biggest;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    final Size size = constraints.biggest;
    final double maxWidth = math.max(0, size.width - padding.horizontal);
    final double maxHeight = math.max(0, size.height - padding.vertical);
    return BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    double x = switch (position) {
      FluxerTooltipPosition.above ||
      FluxerTooltipPosition.below => target.center.dx - childSize.width / 2,
      FluxerTooltipPosition.left => target.left - gap - childSize.width,
      FluxerTooltipPosition.right => target.right + gap,
    };
    double y = switch (position) {
      FluxerTooltipPosition.above => target.top - gap - childSize.height,
      FluxerTooltipPosition.below => target.bottom + gap,
      FluxerTooltipPosition.left ||
      FluxerTooltipPosition.right => target.center.dy - childSize.height / 2,
    };

    final double minX = padding.left;
    final double maxX = math.max(
      minX,
      size.width - childSize.width - padding.right,
    );
    final double minY = padding.top;
    final double maxY = math.max(
      minY,
      size.height - childSize.height - padding.bottom,
    );

    switch (position) {
      case FluxerTooltipPosition.above:
        if (y < minY) {
          y = target.bottom + gap;
        }
      case FluxerTooltipPosition.below:
        if (y + childSize.height > size.height - padding.bottom) {
          y = target.top - gap - childSize.height;
        }
      case FluxerTooltipPosition.left:
        if (x < minX) {
          x = target.right + gap;
        }
      case FluxerTooltipPosition.right:
        if (x + childSize.width > size.width - padding.right) {
          x = target.left - gap - childSize.width;
        }
    }

    return Offset(x.clamp(minX, maxX), y.clamp(minY, maxY));
  }

  @override
  bool shouldRelayout(covariant _FluxerTooltipPositionDelegate oldDelegate) {
    return target != oldDelegate.target ||
        position != oldDelegate.position ||
        gap != oldDelegate.gap ||
        padding != oldDelegate.padding;
  }
}

@FluxerWidgetPreview(name: 'Text', group: 'FluxerTooltip')
Widget fluxerTooltipTextPreview() {
  return const FluxerTooltip(
    message: 'This action cannot be undone.',
    child: Text('Hover or long-press'),
  );
}
