import 'dart:async';

import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:material_ui/material_ui.dart';

/// Position of the popout relative to its anchor.
enum FluxerPopoutPosition { above, below, left, right }

/// Builder for the anchor widget that triggers the popout.
typedef FluxerPopoutAnchorBuilder =
    Widget Function(BuildContext context, VoidCallback toggle);

/// Builder for the popout content.
typedef FluxerPopoutContentBuilder =
    Widget Function(BuildContext context, VoidCallback close);

/// Anchored floating overlay panel.
///
/// Shows a floating panel anchored to a target widget. Used as the base for
/// select dropdowns and action menus.
class FluxerPopout extends StatefulWidget {
  const FluxerPopout({
    required this.anchorBuilder,
    required this.contentBuilder,
    this.position = FluxerPopoutPosition.below,
    super.key,
  });

  final FluxerPopoutAnchorBuilder anchorBuilder;
  final FluxerPopoutContentBuilder contentBuilder;
  final FluxerPopoutPosition position;

  @override
  State<FluxerPopout> createState() => _FluxerPopoutState();
}

class _FluxerPopoutState extends State<FluxerPopout>
    with SingleTickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  final OverlayPortalController _overlayController = OverlayPortalController();

  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;

  static const Duration _fadeDuration = FluxerMotionTheme.normalDuration;
  static const double _popoutGap = 4;

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
    _animationController.duration = context.motion.normal;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggle() {
    if (_overlayController.isShowing) {
      _close();
    } else {
      _overlayController.show();
      _animationController.forward();
    }
  }

  void _close() {
    unawaited(
      _animationController.reverse().then((_) {
        if (mounted && _overlayController.isShowing) {
          _overlayController.hide();
        }
      }),
    );
  }

  Alignment _getTargetAnchor() {
    return switch (widget.position) {
      FluxerPopoutPosition.above => Alignment.topCenter,
      FluxerPopoutPosition.below => Alignment.bottomCenter,
      FluxerPopoutPosition.left => Alignment.centerLeft,
      FluxerPopoutPosition.right => Alignment.centerRight,
    };
  }

  Alignment _getFollowerAnchor() {
    return switch (widget.position) {
      FluxerPopoutPosition.above => Alignment.bottomCenter,
      FluxerPopoutPosition.below => Alignment.topCenter,
      FluxerPopoutPosition.left => Alignment.centerRight,
      FluxerPopoutPosition.right => Alignment.centerLeft,
    };
  }

  Offset _getOffset() {
    return switch (widget.position) {
      FluxerPopoutPosition.above => const Offset(0, -_popoutGap),
      FluxerPopoutPosition.below => const Offset(0, _popoutGap),
      FluxerPopoutPosition.left => const Offset(-_popoutGap, 0),
      FluxerPopoutPosition.right => const Offset(_popoutGap, 0),
    };
  }

  Widget _buildOverlay(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

    return Stack(
      children: [
        Positioned.fill(
          child: FluxerGestureDetector(
            onTap: _close,
            behavior: HitTestBehavior.opaque,
            child: const ColoredBox(color: Colors.transparent),
          ),
        ),
        FadeTransition(
          opacity: _fadeAnimation,
          child: CompositedTransformFollower(
            link: _layerLink,
            targetAnchor: _getTargetAnchor(),
            followerAnchor: _getFollowerAnchor(),
            offset: _getOffset(),
            child: Align(
              alignment: _getFollowerAnchor(),
              child: IntrinsicWidth(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: colors.backgroundFloating,
                    borderRadius: layout.radiusLg,
                    border: Border.all(color: colors.backgroundModifierAccent),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.2),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: widget.contentBuilder(context, _close),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: _overlayController,
      overlayChildBuilder: _buildOverlay,
      child: CompositedTransformTarget(
        link: _layerLink,
        child: widget.anchorBuilder(context, _toggle),
      ),
    );
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
