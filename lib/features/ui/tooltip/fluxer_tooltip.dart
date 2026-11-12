import 'dart:async';
import 'dart:math' as math;

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/features/ui/preview/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

enum FluxerTooltipPosition { above, below, left, right }

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
  late final Animation<double> _mobileFadeAnimation;
  late final Animation<double> _scaleAnimation;
  final _FluxerTooltipGeometry _geometry = _FluxerTooltipGeometry();

  Timer? _showTimer;
  Timer? _hideTimer;
  Timer? _longPressTimer;
  bool _isHovering = false;

  static const Duration _fadeDuration = Duration(milliseconds: 100);
  static const Duration _showDelay = Duration(milliseconds: 500);
  static const Duration _hideDelay = Duration(milliseconds: 100);
  static const Duration _longPressDuration = Duration(seconds: 2);
  static const double _tooltipGap = 8;
  static const double _screenInset = 8;
  static const double _maxWidth = 190;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: _fadeDuration,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    );
    _mobileFadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );
    _scaleAnimation = Tween<double>(begin: 0.98, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _syncMode();
  }

  @override
  void dispose() {
    _showTimer?.cancel();
    _hideTimer?.cancel();
    _longPressTimer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  void _syncMode() {
    final Duration fast = context.motion.fast;
    _animationController.duration = !usesDesktopPointerUi(context)
        ? fast
        : fast > Duration.zero
        ? _fadeDuration
        : Duration.zero;
  }

  void _showTooltip() {
    _hideTimer?.cancel();
    if (!_overlayController.isShowing) {
      _syncMode();
    }
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
    if (usesDesktopPointerUi(context)) {
      _showTimer?.cancel();
      _showTooltip();
      return;
    }
    _showTimer = Timer(_showDelay, () {
      if (_isHovering && mounted) {
        _showTooltip();
      }
    });
  }

  void _handleMouseExit(PointerEvent _) {
    _isHovering = false;
    _showTimer?.cancel();
    if (usesDesktopPointerUi(context)) {
      _hideTimer?.cancel();
      _hideTooltip();
      return;
    }
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

  FluxerTooltipPosition _resolvedPosition(BuildContext context) =>
      switch ((widget.position, Directionality.of(context))) {
        (FluxerTooltipPosition.left, TextDirection.rtl) =>
          FluxerTooltipPosition.right,
        (FluxerTooltipPosition.right, TextDirection.rtl) =>
          FluxerTooltipPosition.left,
        (final FluxerTooltipPosition position, _) => position,
      };

  Widget _buildMobileOverlay(BuildContext context, Rect target) {
    final colors = context.colors;
    final layout = context.layout;
    final textStyles = context.textStyles;
    final EdgeInsets safePadding = MediaQuery.paddingOf(context);
    return CustomSingleChildLayout(
      delegate: _FluxerTooltipPositionDelegate(
        target: target,
        position: _resolvedPosition(context),
        gap: _tooltipGap,
        padding: safePadding + const EdgeInsets.all(_screenInset),
        geometry: _geometry,
      ),
      child: FadeTransition(
        opacity: _mobileFadeAnimation,
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

  Widget _buildOverlay(BuildContext context, OverlayChildLayoutInfo info) {
    final Rect target = MatrixUtils.transformRect(
      info.childPaintTransform,
      Offset.zero & info.childSize,
    );
    if (!usesDesktopPointerUi(context)) {
      return _buildMobileOverlay(context, target);
    }
    final colors = context.colors;
    final EdgeInsets safePadding = MediaQuery.paddingOf(context);
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color surface = fluxerFormSurfaceBackground(context);
    final Color border = colors.backgroundModifierAccent;

    final Widget bubble = Container(
      constraints: widget.richMessage == null
          ? const BoxConstraints(maxWidth: _maxWidth)
          : null,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: fluxerDesktopFloatingDecoration(
        context,
        shadows: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.22 : 0.12),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: DefaultTextStyle.merge(
        style: fluxerDesktopMenuLabelStyle(
          context,
        ).copyWith(color: colors.textPrimary),
        textAlign: TextAlign.center,
        child:
            widget.richMessage ??
            Text(widget.message!, textAlign: TextAlign.center),
      ),
    );

    return FadeTransition(
      opacity: _fadeAnimation,
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomSingleChildLayout(
              delegate: _FluxerTooltipPositionDelegate(
                target: target,
                position: _resolvedPosition(context),
                gap: _tooltipGap,
                padding: safePadding + const EdgeInsets.all(_screenInset),
                geometry: _geometry,
              ),
              child: ScaleTransition(
                scale: _scaleAnimation,
                alignment: switch (widget.position) {
                  FluxerTooltipPosition.above => Alignment.bottomCenter,
                  FluxerTooltipPosition.below => Alignment.topCenter,
                  FluxerTooltipPosition.left => Alignment.centerRight,
                  FluxerTooltipPosition.right => Alignment.centerLeft,
                },
                child: bubble,
              ),
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: CustomPaint(
                painter: _FluxerTooltipArrowPainter(
                  geometry: _geometry,
                  target: target,
                  fill: surface,
                  border: border,
                ),
              ),
            ),
          ),
        ],
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

class _FluxerTooltipGeometry {
  Rect? rect;
  FluxerTooltipPosition? side;
}

class _FluxerTooltipArrowPainter extends CustomPainter {
  _FluxerTooltipArrowPainter({
    required this.geometry,
    required this.target,
    required this.fill,
    required this.border,
  });

  static const double _half = 5;
  static const double _inset = 8;

  final _FluxerTooltipGeometry geometry;
  final Rect target;
  final Color fill;
  final Color border;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect? rect = geometry.rect;
    final FluxerTooltipPosition? side = geometry.side;
    if (rect == null || side == null) {
      return;
    }
    const double reach = _half * math.sqrt2;
    final Offset base;
    final Offset tip;
    final Offset along;
    switch (side) {
      case FluxerTooltipPosition.above:
        final double x = target.center.dx.clamp(
          rect.left + _inset,
          rect.right - _inset,
        );
        base = Offset(x, rect.bottom);
        tip = Offset(x, rect.bottom + reach);
        along = const Offset(reach, 0);
      case FluxerTooltipPosition.below:
        final double x = target.center.dx.clamp(
          rect.left + _inset,
          rect.right - _inset,
        );
        base = Offset(x, rect.top);
        tip = Offset(x, rect.top - reach);
        along = const Offset(reach, 0);
      case FluxerTooltipPosition.left:
        final double y = target.center.dy.clamp(
          rect.top + _inset,
          rect.bottom - _inset,
        );
        base = Offset(rect.right, y);
        tip = Offset(rect.right + reach, y);
        along = const Offset(0, reach);
      case FluxerTooltipPosition.right:
        final double y = target.center.dy.clamp(
          rect.top + _inset,
          rect.bottom - _inset,
        );
        base = Offset(rect.left, y);
        tip = Offset(rect.left - reach, y);
        along = const Offset(0, reach);
    }
    final Offset inward = (base - tip) / reach;
    final Offset fillBase = base + inward;
    final Path triangle = Path()
      ..moveTo(fillBase.dx - along.dx, fillBase.dy - along.dy)
      ..lineTo(tip.dx, tip.dy)
      ..lineTo(fillBase.dx + along.dx, fillBase.dy + along.dy)
      ..close();
    canvas.drawPath(triangle, Paint()..color = fill);
    final Path edges = Path()
      ..moveTo(base.dx - along.dx, base.dy - along.dy)
      ..lineTo(tip.dx, tip.dy)
      ..lineTo(base.dx + along.dx, base.dy + along.dy);
    canvas.drawPath(
      edges,
      Paint()
        ..color = border
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );
  }

  @override
  bool shouldRepaint(covariant _FluxerTooltipArrowPainter oldDelegate) => true;
}

class _FluxerTooltipPositionDelegate extends SingleChildLayoutDelegate {
  _FluxerTooltipPositionDelegate({
    required this.target,
    required this.position,
    required this.gap,
    required this.padding,
    required this.geometry,
  });

  final Rect target;
  final FluxerTooltipPosition position;
  final double gap;
  final EdgeInsets padding;
  final _FluxerTooltipGeometry geometry;

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

    FluxerTooltipPosition side = position;
    switch (position) {
      case FluxerTooltipPosition.above:
        if (y < minY) {
          y = target.bottom + gap;
          side = FluxerTooltipPosition.below;
        }
      case FluxerTooltipPosition.below:
        if (y + childSize.height > size.height - padding.bottom) {
          y = target.top - gap - childSize.height;
          side = FluxerTooltipPosition.above;
        }
      case FluxerTooltipPosition.left:
        if (x < minX) {
          x = target.right + gap;
          side = FluxerTooltipPosition.right;
        }
      case FluxerTooltipPosition.right:
        if (x + childSize.width > size.width - padding.right) {
          x = target.left - gap - childSize.width;
          side = FluxerTooltipPosition.left;
        }
    }

    final Offset resolved = Offset(x.clamp(minX, maxX), y.clamp(minY, maxY));
    geometry
      ..rect = resolved & childSize
      ..side = side;
    return resolved;
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
