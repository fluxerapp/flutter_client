import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb, visibleForTesting;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/swipe_constants.dart';
import 'package:fluxer_app/features/shell/providers/drawer_reveal_sync_trigger_provider.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';
import 'package:fluxer_app/features/shell/providers/shell_blocks_horizontal_gestures_provider.dart';
import 'package:fluxer_app/shared/gestures/nested_horizontal_scrollable.dart';

/// Compact wide mobile peeks the drawer at the channel list edge.
class SidebarDrawer extends ConsumerStatefulWidget {
  final Widget base;
  final Widget slider;

  final Duration revealDuration;
  final Curve revealCurve;
  final Duration snapBackDuration;
  final Curve snapBackCurve;

  const SidebarDrawer({
    required this.base,
    required this.slider,
    this.revealDuration = kHorizontalSwipeRevealDuration,
    this.revealCurve = kHorizontalSwipeCurve,
    this.snapBackDuration = kHorizontalSwipeSnapBackDuration,
    this.snapBackCurve = kHorizontalSwipeCurve,
    super.key,
  });

  @override
  ConsumerState<SidebarDrawer> createState() => _SidebarDrawerState();
}

class _SidebarDrawerState extends ConsumerState<SidebarDrawer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  RevealSide _currentSide = RevealSide.main;
  bool _initialTranslateSet = false;
  double _lastWidth = 0;

  @override
  void initState() {
    super.initState();
    _currentSide = ref.read(currentRevealSideProvider);
    _animationController = AnimationController.unbounded(
      vsync: this,
      duration: widget.revealDuration,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _syncWidth(MediaQuery.sizeOf(context).width);
  }

  void _syncWidth(double width) {
    if (width <= 0) {
      return;
    }
    if (!_initialTranslateSet) {
      _animationController.value = _goalForSide(_currentSide, width);
      _initialTranslateSet = true;
      _lastWidth = width;
      return;
    }
    if (_lastWidth == width) {
      return;
    }
    _lastWidth = width;
    _animationController.value = _goalForSide(_currentSide, width);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool _isSidebarDrawerLocked() {
    return isSidebarDrawerLockedForLocation(ref.read(shellLocationProvider));
  }

  bool _usesPeekReveal() {
    return isCompactWideMobileLayout(context) && !_isSidebarDrawerLocked();
  }

  double _peekWidth(double screenWidth) {
    return math.min(mobileDrawerPeekWidth(context), screenWidth);
  }

  double _maxRevealTranslate(double width) {
    if (_usesPeekReveal()) {
      return _peekWidth(width);
    }
    return width;
  }

  double _goalForSide(RevealSide side, double width) {
    switch (side) {
      case RevealSide.left:
        return _maxRevealTranslate(width);
      case RevealSide.main:
        return 0;
    }
  }

  Future<void> _moveToState(RevealSide side, {bool writeBack = true}) async {
    if (!mounted) {
      return;
    }
    final width = MediaQuery.sizeOf(context).width;
    _syncWidth(width);
    final goal = _goalForSide(side, width);
    final isReveal = side == RevealSide.left;
    if (isReveal) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
    _currentSide = side;
    if (writeBack) {
      ref.read(currentRevealSideProvider.notifier).set(side);
    }
    await _animateToPosition(
      goal,
      isReveal ? widget.revealDuration : widget.snapBackDuration,
      isReveal ? widget.revealCurve : widget.snapBackCurve,
    );
  }

  Future<void> _animateToPosition(
    double goal,
    Duration duration,
    Curve curve,
  ) async {
    final current = _animationController.value;
    if (current == goal && !_animationController.isAnimating) {
      return;
    }
    _animationController.stop();
    await _animationController.animateTo(
      goal,
      duration: duration,
      curve: curve,
    );
  }

  void _handleDragStart(DragStartDetails details) {
    _animationController.stop();
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    _onTranslate(details.delta.dx);
  }

  Future<void> _handleDragEnd(DragEndDetails details) async {
    await _onApplyTranslation(details);
  }

  void _onTranslate(double delta) {
    if (!mounted) {
      return;
    }
    final width = MediaQuery.sizeOf(context).width;
    if (width <= 0) {
      return;
    }
    final maxTranslate = _maxRevealTranslate(width);
    final minTranslate = _isSidebarDrawerLocked() ? maxTranslate : 0.0;
    final newTranslate = (_animationController.value + delta).clamp(
      minTranslate,
      maxTranslate,
    );
    _animationController.value = newTranslate;
  }

  Future<void> _onApplyTranslation(DragEndDetails details) async {
    if (!mounted) {
      return;
    }
    final width = MediaQuery.sizeOf(context).width;
    if (width <= 0) {
      return;
    }
    final completionThreshold =
        (defaultTargetPlatform == TargetPlatform.iOS && !kIsWeb)
        ? kHorizontalSwipeCompletionThresholdCupertino
        : kHorizontalSwipeCompletionThresholdMaterial;
    final double? peekWidth = _usesPeekReveal() ? _peekWidth(width) : null;
    final targetSide = sidebarDrawerTargetForDrag(
      translate: _animationController.value,
      width: width,
      primaryVelocity: details.primaryVelocity ?? 0,
      completionThreshold: completionThreshold,
      peekWidth: peekWidth,
    );
    final resolvedSide =
        _isSidebarDrawerLocked() && targetSide == RevealSide.main
        ? RevealSide.left
        : targetSide;
    await _moveToState(resolvedSide);
  }

  Future<void> _syncTranslateToRevealSide({required bool writeBack}) async {
    if (!mounted) {
      return;
    }
    final RevealSide side = ref.read(currentRevealSideProvider);
    final double width = MediaQuery.sizeOf(context).width;
    if (width <= 0) {
      return;
    }
    _syncWidth(width);
    _currentSide = side;
    if (writeBack) {
      ref.read(currentRevealSideProvider.notifier).set(side);
    }
    await _animateToPosition(
      _goalForSide(side, width),
      widget.snapBackDuration,
      widget.snapBackCurve,
    );
  }

  bool _shouldDeferDrawerGesture(PointerDownEvent event) {
    if (isPointerOverOverflowingHorizontalScrollable(
      context,
      event.position,
      viewId: event.viewId,
    )) {
      return true;
    }
    if (isPointerOverDescendantWithKey(
      context,
      event.position,
      key: kExpressionPanelShellGestureBlockKey,
      viewId: event.viewId,
    )) {
      return true;
    }
    return isPointerOverDescendantWithKey(
      context,
      event.position,
      key: kPlaybackSeekShellGestureBlockKey,
      viewId: event.viewId,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool blocksHorizontalGestures = ref.watch(
      shellBlocksHorizontalGesturesProvider,
    );
    ref
      ..listen<RevealSide>(currentRevealSideProvider, (
        RevealSide? prev,
        RevealSide next,
      ) {
        if (next != _currentSide) {
          unawaited(_moveToState(next, writeBack: false));
        }
      })
      ..listen<String>(shellLocationProvider, (String? prev, String next) {
        if (_currentSide == RevealSide.left) {
          unawaited(_syncTranslateToRevealSide(writeBack: false));
        }
      })
      ..listen<bool>(shellBlocksHorizontalGesturesProvider, (
        bool? prev,
        bool next,
      ) {
        if (next) {
          _animationController.stop();
          return;
        }
        if (prev ?? false) {
          unawaited(_syncTranslateToRevealSide(writeBack: false));
        }
      })
      ..listen<int>(drawerRevealSyncTriggerProvider, (int? prev, int next) {
        if (ref.read(shellBlocksHorizontalGesturesProvider)) {
          return;
        }
        unawaited(_syncTranslateToRevealSide(writeBack: false));
      });
    final Map<Type, GestureRecognizerFactory> drawerGestures =
        blocksHorizontalGestures
        ? <Type, GestureRecognizerFactory>{}
        : <Type, GestureRecognizerFactory>{
            _DrawerHorizontalDragRecognizer:
                GestureRecognizerFactoryWithHandlers<
                  _DrawerHorizontalDragRecognizer
                >(
                  () => _DrawerHorizontalDragRecognizer(
                    shouldDeferDrawerGesture: _shouldDeferDrawerGesture,
                  ),
                  (recognizer) {
                    recognizer
                      ..onStart = _handleDragStart
                      ..onUpdate = _handleDragUpdate
                      ..onEnd = _handleDragEnd;
                  },
                ),
          };

    return RawGestureDetector(
      gestures: drawerGestures,
      child: Stack(
        fit: StackFit.expand,
        children: [
          RepaintBoundary(child: widget.base),
          AnimatedBuilder(
            animation: _animationController,
            child: IgnorePointer(
              ignoring: isCompactWideDrawerPeekMode(
                context,
                shellLocation: ref.watch(shellLocationProvider),
                revealSide: ref.watch(currentRevealSideProvider),
              ),
              child: RepaintBoundary(child: widget.slider),
            ),
            builder: (context, slider) {
              return Transform.translate(
                offset: Offset(_animationController.value, 0),
                child: slider,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _DrawerHorizontalDragRecognizer extends HorizontalDragGestureRecognizer {
  _DrawerHorizontalDragRecognizer({required this.shouldDeferDrawerGesture});

  final bool Function(PointerDownEvent event) shouldDeferDrawerGesture;

  @override
  void addAllowedPointer(PointerDownEvent event) {
    if (shouldDeferDrawerGesture(event)) {
      resolve(GestureDisposition.rejected);
      return;
    }
    super.addAllowedPointer(event);
  }
}

bool isSidebarDrawerLockedForLocation(String location) {
  if (location == RoutePaths.me || location == RoutePaths.favoritesBase) {
    return true;
  }
  return classifyRoute(location) == RouteKind.channelsRoot &&
      extractGuildId(location) != null &&
      extractChannelId(location) == null;
}

bool isCompactWideDrawerPeekMode(
  BuildContext context, {
  required String shellLocation,
  required RevealSide revealSide,
}) {
  return isCompactWideMobileLayout(context) &&
      !isSidebarDrawerLockedForLocation(shellLocation) &&
      revealSide == RevealSide.left;
}

@visibleForTesting
RevealSide sidebarDrawerTargetForDrag({
  required double translate,
  required double width,
  required double primaryVelocity,
  required double completionThreshold,
  double? peekWidth,
  double flingVelocity = kDrawerSwipeFlingVelocityPxPerSecond,
}) {
  if (width <= 0) {
    return RevealSide.main;
  }
  final double maxReveal = peekWidth == null
      ? width
      : math.min(peekWidth, width);
  if (maxReveal <= 0) {
    return RevealSide.main;
  }
  if (primaryVelocity.abs() >= flingVelocity) {
    return primaryVelocity > 0 ? RevealSide.left : RevealSide.main;
  }
  final positionFraction = translate / maxReveal;
  return positionFraction >= completionThreshold
      ? RevealSide.left
      : RevealSide.main;
}
