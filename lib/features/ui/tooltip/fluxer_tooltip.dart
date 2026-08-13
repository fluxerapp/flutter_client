import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';

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
  final LayerLink _layerLink = LayerLink();
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

  Alignment _getTargetAnchor() {
    return switch (widget.position) {
      FluxerTooltipPosition.above => Alignment.topCenter,
      FluxerTooltipPosition.below => Alignment.bottomCenter,
      FluxerTooltipPosition.left => Alignment.centerLeft,
      FluxerTooltipPosition.right => Alignment.centerRight,
    };
  }

  Alignment _getFollowerAnchor() {
    return switch (widget.position) {
      FluxerTooltipPosition.above => Alignment.bottomCenter,
      FluxerTooltipPosition.below => Alignment.topCenter,
      FluxerTooltipPosition.left => Alignment.centerRight,
      FluxerTooltipPosition.right => Alignment.centerLeft,
    };
  }

  Offset _getOffset() {
    return switch (widget.position) {
      FluxerTooltipPosition.above => const Offset(0, -_tooltipGap),
      FluxerTooltipPosition.below => const Offset(0, _tooltipGap),
      FluxerTooltipPosition.left => const Offset(-_tooltipGap, 0),
      FluxerTooltipPosition.right => const Offset(_tooltipGap, 0),
    };
  }

  Widget _buildOverlay(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final textStyles = context.textStyles;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: CompositedTransformFollower(
        link: _layerLink,
        targetAnchor: _getTargetAnchor(),
        followerAnchor: _getFollowerAnchor(),
        offset: _getOffset(),
        child: Align(
          alignment: _getFollowerAnchor(),
          child: IntrinsicWidth(
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
                    style: textStyles.bodySmall.copyWith(
                      color: colors.textPrimary,
                    ),
                  ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String? semanticsLabel = widget.message;
    final Widget target = CompositedTransformTarget(
      link: _layerLink,
      child: MouseRegion(
        onEnter: _handleMouseEnter,
        onExit: _handleMouseExit,
        child: FluxerGestureDetector(
          onLongPress: _handleLongPress,
          behavior: HitTestBehavior.translucent,
          child: widget.child,
        ),
      ),
    );
    return OverlayPortal(
      controller: _overlayController,
      overlayChildBuilder: _buildOverlay,
      child: semanticsLabel == null
          ? target
          : Semantics(label: semanticsLabel, child: target),
    );
  }
}

@FluxerWidgetPreview(name: 'Text', group: 'FluxerTooltip')
Widget fluxerTooltipTextPreview() {
  return const FluxerTooltip(
    message: 'This action cannot be undone.',
    child: Text('Hover or long-press'),
  );
}
