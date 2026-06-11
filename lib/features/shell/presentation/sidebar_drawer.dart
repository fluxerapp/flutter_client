import 'dart:async';

import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb, visibleForTesting;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/shell/presentation/swipe_constants.dart';
import 'package:fluxer_app/features/shell/providers/drawer_reveal_sync_trigger_provider.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';
import 'package:fluxer_app/features/shell/providers/shell_blocks_horizontal_gestures_provider.dart';

/// Mobile shell drawer that draws a foreground [slider] over a static [base].
///
/// [base] (sidebar + bottom nav) is the static back layer. [slider] (chat)
/// is drawn on top and translates horizontally to expose the base when
/// [currentRevealSideProvider] is [RevealSide.left]. When [RevealSide.main]
/// the slider covers the entire base.
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
    final progress = _lastWidth <= 0
        ? 0.0
        : _animationController.value / _lastWidth;
    _animationController.value = (progress * width).clamp(0.0, width);
    _lastWidth = width;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  double _goalForSide(RevealSide side, double width) {
    switch (side) {
      case RevealSide.left:
        return width;
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

  bool _isSidebarDrawerLocked() {
    return isSidebarDrawerLockedForLocation(ref.read(currentLocationProvider));
  }

  void _onTranslate(double delta) {
    if (!mounted) {
      return;
    }
    final width = MediaQuery.sizeOf(context).width;
    if (width <= 0) {
      return;
    }
    final minTranslate = _isSidebarDrawerLocked() ? width : 0.0;
    final newTranslate = (_animationController.value + delta).clamp(
      minTranslate,
      width,
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
    final targetSide = sidebarDrawerTargetForDrag(
      translate: _animationController.value,
      width: width,
      primaryVelocity: details.primaryVelocity ?? 0,
      completionThreshold: completionThreshold,
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

  @override
  Widget build(BuildContext context) {
    final bool blocksHorizontalGestures = ref.watch(
      shellBlocksHorizontalGesturesProvider,
    );
    ref.listen<RevealSide>(currentRevealSideProvider, (
      RevealSide? prev,
      RevealSide next,
    ) {
      if (next != _currentSide) {
        unawaited(_moveToState(next, writeBack: false));
      }
    });
    ref.listen<bool>(shellBlocksHorizontalGesturesProvider, (
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
    });
    ref.listen<int>(drawerRevealSyncTriggerProvider, (int? prev, int next) {
      if (ref.read(shellBlocksHorizontalGesturesProvider)) {
        return;
      }
      unawaited(_syncTranslateToRevealSide(writeBack: false));
    });
    final Map<Type, GestureRecognizerFactory> drawerGestures =
        blocksHorizontalGestures
        ? <Type, GestureRecognizerFactory>{}
        : <Type, GestureRecognizerFactory>{
            HorizontalDragGestureRecognizer:
                GestureRecognizerFactoryWithHandlers<
                  HorizontalDragGestureRecognizer
                >(HorizontalDragGestureRecognizer.new, (recognizer) {
                  recognizer
                    ..onStart = _handleDragStart
                    ..onUpdate = _handleDragUpdate
                    ..onEnd = _handleDragEnd;
                }),
          };

    return RawGestureDetector(
      gestures: drawerGestures,
      child: Stack(
        fit: StackFit.expand,
        children: [
          RepaintBoundary(child: widget.base),
          AnimatedBuilder(
            animation: _animationController,
            child: RepaintBoundary(child: widget.slider),
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

@visibleForTesting
bool isSidebarDrawerLockedForLocation(String location) {
  if (location == RoutePaths.me) {
    return true;
  }
  return classifyRoute(location) == RouteKind.channelsRoot &&
      extractGuildId(location) != null &&
      extractChannelId(location) == null;
}

@visibleForTesting
RevealSide sidebarDrawerTargetForDrag({
  required double translate,
  required double width,
  required double primaryVelocity,
  required double completionThreshold,
  double flingVelocity = kDrawerSwipeFlingVelocityPxPerSecond,
}) {
  if (width <= 0) {
    return RevealSide.main;
  }
  if (primaryVelocity.abs() >= flingVelocity) {
    return primaryVelocity > 0 ? RevealSide.left : RevealSide.main;
  }
  final positionFraction = translate / width;
  return positionFraction >= completionThreshold
      ? RevealSide.left
      : RevealSide.main;
}
