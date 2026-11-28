import 'dart:async';
import 'dart:math' as math;

import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/overlay/fluxer_layer.dart';
import 'package:fluxer_app/features/ui/preview/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

enum FluxerPopoutPosition { above, below, left, right }

typedef FluxerPopoutAnchorBuilder =
    Widget Function(BuildContext context, VoidCallback toggle);

typedef FluxerPopoutContentBuilder =
    Widget Function(BuildContext context, VoidCallback close);

class FluxerPopout extends StatefulWidget {
  const FluxerPopout({
    required this.anchorBuilder,
    required this.contentBuilder,
    this.position = FluxerPopoutPosition.below,
    this.gap,
    this.fadeOnDesktop = true,
    this.backgroundColor,
    super.key,
  });

  final FluxerPopoutAnchorBuilder anchorBuilder;
  final FluxerPopoutContentBuilder contentBuilder;
  final FluxerPopoutPosition position;
  final double? gap;
  final bool fadeOnDesktop;
  final Color? backgroundColor;

  @override
  State<FluxerPopout> createState() => _FluxerPopoutState();
}

class _FluxerPopoutState extends State<FluxerPopout>
    with SingleTickerProviderStateMixin {
  final OverlayPortalController _overlayController = OverlayPortalController();

  late final AnimationController _animationController;
  late final CurvedAnimation _curve;
  late final Animation<double> _scaleAnimation;

  static const double _screenPadding = 8;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: FluxerMotionTheme.normalDuration,
    );
    _curve = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );
    _scaleAnimation = Tween<double>(begin: 0.98, end: 1).animate(_curve);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _syncMotion();
  }

  @override
  void dispose() {
    _curve.dispose();
    _animationController.dispose();
    super.dispose();
  }

  bool get _desktop => usesDesktopPointerUi(context);

  void _syncMotion() {
    _animationController.duration = _desktop
        ? context.motion.popout
        : context.motion.normal;
    _curve.curve = _desktop ? Curves.easeInOut : Curves.easeOut;
  }

  void _toggle() {
    if (_overlayController.isShowing) {
      _close();
    } else {
      _syncMotion();
      _overlayController.show();
      if (_skipsFade) {
        _animationController.value = 1;
      } else {
        _animationController.forward();
      }
    }
  }

  bool get _skipsFade => !widget.fadeOnDesktop && _desktop;

  void _close() {
    if (_skipsFade) {
      _animationController.value = 0;
      if (_overlayController.isShowing) {
        _overlayController.hide();
      }
      return;
    }
    unawaited(
      _animationController.reverse().then((_) {
        if (mounted && _overlayController.isShowing) {
          _overlayController.hide();
        }
      }),
    );
  }

  Alignment _scaleAlignment() {
    return switch (widget.position) {
      FluxerPopoutPosition.above => Alignment.bottomCenter,
      FluxerPopoutPosition.below => Alignment.topCenter,
      FluxerPopoutPosition.left => Alignment.centerRight,
      FluxerPopoutPosition.right => Alignment.centerLeft,
    };
  }

  Widget _buildOverlay(BuildContext context, OverlayChildLayoutInfo info) {
    final colors = context.colors;
    final layout = context.layout;
    final Rect target = MatrixUtils.transformRect(
      info.childPaintTransform,
      Offset.zero & info.childSize,
    );
    final Widget panel = IntrinsicWidth(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? colors.backgroundFloating,
          borderRadius: layout.radiusLg,
          border: Border.all(color: colors.backgroundModifierAccent),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.24),
              blurRadius: 16,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: widget.contentBuilder(context, _close),
      ),
    );

    return FluxerLayer(
      onClose: _close,
      trapFocus: _desktop,
      child: Stack(
        children: [
          Positioned.fill(
            child: FluxerGestureDetector(
              onTap: _close,
              behavior: HitTestBehavior.opaque,
              child: const ColoredBox(color: Colors.transparent),
            ),
          ),
          Positioned.fill(
            child: CustomSingleChildLayout(
              delegate: _FluxerPopoutLayoutDelegate(
                target: target,
                position: widget.position,
                gap: widget.gap ?? (_desktop ? 8 : 4),
                padding:
                    MediaQuery.paddingOf(context) +
                    const EdgeInsets.all(_screenPadding),
              ),
              child: FadeTransition(
                opacity: _curve,
                child: _desktop
                    ? ScaleTransition(
                        scale: _scaleAnimation,
                        alignment: _scaleAlignment(),
                        child: panel,
                      )
                    : panel,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OverlayPortal.overlayChildLayoutBuilder(
      controller: _overlayController,
      overlayChildBuilder: _buildOverlay,
      child: widget.anchorBuilder(context, _toggle),
    );
  }
}

class _FluxerPopoutLayoutDelegate extends SingleChildLayoutDelegate {
  _FluxerPopoutLayoutDelegate({
    required this.target,
    required this.position,
    required this.gap,
    required this.padding,
  });

  final Rect target;
  final FluxerPopoutPosition position;
  final double gap;
  final EdgeInsets padding;

  @override
  Size getSize(BoxConstraints constraints) => constraints.biggest;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    final Size size = constraints.biggest;
    return BoxConstraints(
      maxWidth: math.max(0, size.width - padding.horizontal),
      maxHeight: math.max(0, size.height - padding.vertical),
    );
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    final double minX = padding.left;
    final double maxX = math.max(
      minX,
      size.width - padding.right - childSize.width,
    );
    final double minY = padding.top;
    final double maxY = math.max(
      minY,
      size.height - padding.bottom - childSize.height,
    );
    final double above = target.top - gap - childSize.height;
    final double below = target.bottom + gap;
    final double before = target.left - gap - childSize.width;
    final double after = target.right + gap;
    final double centeredX = target.center.dx - childSize.width / 2;
    final double centeredY = target.center.dy - childSize.height / 2;
    final bool fitsAbove = above >= minY;
    final bool fitsBelow =
        below + childSize.height <= size.height - padding.bottom;
    final bool fitsBefore = before >= minX;
    final bool fitsAfter =
        after + childSize.width <= size.width - padding.right;
    final (double x, double y) = switch (position) {
      FluxerPopoutPosition.above => (
        centeredX,
        !fitsAbove && fitsBelow ? below : above,
      ),
      FluxerPopoutPosition.below => (
        centeredX,
        !fitsBelow && fitsAbove ? above : below,
      ),
      FluxerPopoutPosition.left => (
        !fitsBefore && fitsAfter ? after : before,
        centeredY,
      ),
      FluxerPopoutPosition.right => (
        !fitsAfter && fitsBefore ? before : after,
        centeredY,
      ),
    };
    return Offset(x.clamp(minX, maxX), y.clamp(minY, maxY));
  }

  @override
  bool shouldRelayout(_FluxerPopoutLayoutDelegate oldDelegate) {
    return target != oldDelegate.target ||
        position != oldDelegate.position ||
        gap != oldDelegate.gap ||
        padding != oldDelegate.padding;
  }
}

@FluxerWidgetPreview(name: 'Default', group: 'FluxerPopout')
Widget fluxerPopoutPreview() {
  return FluxerPopout(
    anchorBuilder: (context, toggle) {
      return TextButton(onPressed: toggle, child: const Text('Open popout'));
    },
    contentBuilder: (context, close) {
      return Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Popout panel'),
            TextButton(onPressed: close, child: const Text('Close')),
          ],
        ),
      );
    },
  );
}
