import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/desktop_shell_scaffold.dart';
import 'package:fluxer_app/features/shell/presentation/swipe_constants.dart';
import 'package:fluxer_app/features/shell/providers/shell_blocks_horizontal_gestures_provider.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:go_router/go_router.dart';

class MobileHomeUtilityShell extends ConsumerStatefulWidget {
  const MobileHomeUtilityShell({
    required this.shellLocation,
    required this.navigationShell,
    required this.bottomNav,
    super.key,
  });

  final String shellLocation;
  final Widget navigationShell;
  final Widget bottomNav;

  @override
  ConsumerState<MobileHomeUtilityShell> createState() =>
      _MobileHomeUtilityShellState();
}

class _MobileHomeUtilityShellState extends ConsumerState<MobileHomeUtilityShell>
    with SingleTickerProviderStateMixin {
  late final AnimationController _swipeController;

  @override
  void initState() {
    super.initState();
    _swipeController = AnimationController(
      vsync: this,
      duration: FluxerMotionTheme.slowDuration,
    );
    ref.listenManual<bool>(shellBlocksHorizontalGesturesProvider, (
      bool? previous,
      bool next,
    ) {
      if (next && _swipeController.value > 0) {
        _swipeController.value = 0;
      }
    });
  }

  @override
  void dispose() {
    _swipeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool blocksHorizontalGestures = ref.watch(
      shellBlocksHorizontalGesturesProvider,
    );
    final bool canSwipePop = !blocksHorizontalGestures;
    final Widget mainContent = AnimatedBuilder(
      animation: _swipeController,
      builder: (BuildContext context, Widget? child) {
        return _buildSwipeTransition(context, child!);
      },
      child: widget.navigationShell,
    );
    if (!canSwipePop) {
      return PopScope(
        canPop: context.canPop(),
        child: Scaffold(
          backgroundColor: context.colors.backgroundPrimary,
          body: mainContent,
        ),
      );
    }
    final double screenWidth = MediaQuery.sizeOf(context).width;
    if (screenWidth <= 0) {
      return PopScope(
        canPop: context.canPop(),
        child: Scaffold(
          backgroundColor: context.colors.backgroundPrimary,
          body: mainContent,
        ),
      );
    }
    final bool isRtl = Directionality.of(context) == TextDirection.rtl;
    return PopScope(
      canPop: context.canPop(),
      child: Scaffold(
        backgroundColor: context.colors.backgroundPrimary,
        body: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            mainContent,
            PositionedDirectional(
              start: 0,
              top: 0,
              bottom: 0,
              width: leadingEdgeHorizontalSwipeReserveWidth(context),
              child: FluxerGestureDetector(
                behavior: HitTestBehavior.translucent,
                onHorizontalDragUpdate: (DragUpdateDetails details) {
                  final double primaryDelta = details.primaryDelta ?? 0;
                  final double logical =
                      (isRtl ? -primaryDelta : primaryDelta) / screenWidth;
                  _swipeController.value = (_swipeController.value + logical)
                      .clamp(0.0, 1.0);
                },
                onHorizontalDragEnd: (DragEndDetails details) {
                  _onBackSwipeEnd(
                    context,
                    isRtl: isRtl,
                    screenWidth: screenWidth,
                    endDetails: details,
                  );
                },
                onHorizontalDragCancel: () {
                  _swipeController.animateBack(
                    0,
                    duration: horizontalSwipeSnapBackDuration(context),
                    curve: kHorizontalSwipeCurve,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _backSwipeProgressThreshold() {
    return horizontalSwipeCompletionThreshold();
  }

  void _onBackSwipeEnd(
    BuildContext context, {
    required bool isRtl,
    required double screenWidth,
    required DragEndDetails endDetails,
  }) {
    final double vx = endDetails.velocity.pixelsPerSecond.dx;
    final double logicalWidthPerSec = (isRtl ? -vx : vx) / screenWidth;
    final bool shouldComplete;
    if (logicalWidthPerSec.abs() >= kHorizontalSwipeFlingVelocity) {
      shouldComplete = logicalWidthPerSec > 0;
    } else {
      shouldComplete = _swipeController.value > _backSwipeProgressThreshold();
    }
    if (shouldComplete) {
      unawaited(
        _swipeController
            .animateTo(
              1,
              duration: horizontalSwipeRevealDuration(context),
              curve: kHorizontalSwipeCurve,
            )
            .then((void _) {
              if (mounted) {
                context.pop();
              }
            }),
      );
    } else {
      _swipeController.animateBack(
        0,
        duration: horizontalSwipeSnapBackDuration(context),
        curve: kHorizontalSwipeCurve,
      );
    }
  }

  Widget _buildSwipeTransition(BuildContext context, Widget child) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final bool isRtl = Directionality.of(context) == TextDirection.rtl;
    if (_swipeController.value == 0) {
      return Column(
        children: <Widget>[
          Expanded(child: child),
          widget.bottomNav,
        ],
      );
    }
    final double t = _swipeController.value;
    final double slideOffset = t * screenWidth;
    final double sign = isRtl ? -1.0 : 1.0;
    final double foregroundOffset = sign * slideOffset;
    final Widget slidingContent = Column(
      children: <Widget>[
        Expanded(child: child),
        widget.bottomNav,
      ],
    );
    return Stack(
      children: <Widget>[
        IgnorePointer(
          child: RepaintBoundary(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: mobileSidebarForLocation(
                    context,
                    widget.shellLocation,
                  ),
                ),
                widget.bottomNav,
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: ColoredBox(
            color: Colors.black.withValues(alpha: 0.5 * (1 - t)),
          ),
        ),
        Transform.translate(
          offset: Offset(foregroundOffset, 0),
          child: RepaintBoundary(
            child: ExcludeSemantics(child: slidingContent),
          ),
        ),
      ],
    );
  }
}
