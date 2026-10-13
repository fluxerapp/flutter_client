import 'dart:async';
import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/swipe_constants.dart';
import 'package:fluxer_app/features/shell/providers/drawer_past_half_screen_provider.dart';
import 'package:fluxer_app/features/shell/providers/drawer_reveal_sync_trigger_provider.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';
import 'package:fluxer_app/features/shell/providers/shell_blocks_horizontal_gestures_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/gestures/horizontal_reveal_physics.dart';
import 'package:fluxer_app/shared/gestures/nested_horizontal_scrollable.dart';

class SidebarDrawer extends ConsumerStatefulWidget {
  final Widget base;
  final Widget slider;
  final String? shellLocation;

  final Duration? revealDuration;
  final Curve revealCurve;
  final Duration? snapBackDuration;
  final Curve snapBackCurve;

  const SidebarDrawer({
    required this.base,
    required this.slider,
    this.shellLocation,
    this.revealDuration,
    this.revealCurve = kHorizontalSwipeCurve,
    this.snapBackDuration,
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
  bool _publishPastHalfScheduled = false;
  double _lastWidth = 0;
  final ValueNotifier<bool> _sliderTickersEnabled = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _baseTickersEnabled = ValueNotifier<bool>(true);

  Duration _revealDuration(BuildContext context) =>
      widget.revealDuration ?? horizontalSwipeRevealDuration(context);

  Duration _snapBackDuration(BuildContext context) =>
      widget.snapBackDuration ?? horizontalSwipeSnapBackDuration(context);

  @override
  void initState() {
    super.initState();
    final String? location = widget.shellLocation;
    final RevealSide? routeSide = location == null
        ? null
        : syncedRevealSideFor(location);
    _currentSide = routeSide ?? ref.read(currentRevealSideProvider);
    if (routeSide != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          ref.read(currentRevealSideProvider.notifier).set(routeSide);
        }
      });
    }
    _animationController = createHorizontalRevealController(vsync: this)
      ..addListener(_schedulePublishPastHalf)
      ..addListener(_syncPaneTickers)
      ..addStatusListener((AnimationStatus _) => _syncPaneTickers());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _syncWidth(MediaQuery.sizeOf(context).width);
    _syncPaneTickers();
  }

  void _syncWidth(double width) {
    if (width <= 0) {
      return;
    }
    if (!_initialTranslateSet) {
      _lastWidth = width;
      _animationController.value = _goalForSide(_currentSide, width);
      _initialTranslateSet = true;
      return;
    }
    if (_lastWidth == width) {
      return;
    }
    _lastWidth = width;
    _animationController.value = _goalForSide(_currentSide, width);
  }

  @override
  void deactivate() {
    final DrawerPastHalfScreen notifier = ref.read(
      drawerPastHalfScreenProvider.notifier,
    );
    super.deactivate();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        return;
      }
      notifier.set(pastHalf: false);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _sliderTickersEnabled.dispose();
    _baseTickersEnabled.dispose();
    super.dispose();
  }

  void _schedulePublishPastHalf() {
    if (_publishPastHalfScheduled) {
      return;
    }
    _publishPastHalfScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _publishPastHalfScheduled = false;
      if (!mounted) {
        return;
      }
      ref
          .read(drawerPastHalfScreenProvider.notifier)
          .set(
            pastHalf: drawerTranslatePastHalfScreen(
              translate: _animationController.value,
              screenWidth: _lastWidth,
            ),
          );
    });
  }

  void _syncPaneTickers() {
    final double translate = _animationController.value;
    final bool atRest = !_animationController.isAnimating;
    _sliderTickersEnabled.value =
        !atRest || _lastWidth <= 0 || translate < _lastWidth;
    _baseTickersEnabled.value = !atRest || translate > 0;
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
    await animateHorizontalReveal(
      _animationController,
      goal,
      isReveal ? _revealDuration(context) : _snapBackDuration(context),
      isReveal ? widget.revealCurve : widget.snapBackCurve,
    );
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
    _animationController.value = applyHorizontalRevealDrag(
      edge: HorizontalRevealEdge.left,
      translate: _animationController.value,
      deltaDx: delta,
      min: minTranslate,
      max: maxTranslate,
    );
  }

  Future<void> _onApplyTranslation(DragEndDetails details) async {
    if (!mounted) {
      return;
    }
    final width = MediaQuery.sizeOf(context).width;
    if (width <= 0) {
      return;
    }
    final completionThreshold = horizontalSwipeCompletionThreshold();
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

  double _peekOverlayT() {
    final double width = MediaQuery.sizeOf(context).width;
    final double maxReveal = _maxRevealTranslate(width);
    if (maxReveal <= 0) {
      return 0;
    }
    return (_animationController.value / maxReveal).clamp(0.0, 1.0);
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
    await animateHorizontalReveal(
      _animationController,
      _goalForSide(side, width),
      _snapBackDuration(context),
      widget.snapBackCurve,
    );
  }

  bool _shouldDeferDrawerGesture(PointerDownEvent event) {
    return isPointerOverShellHorizontalGestureBlock(
      context,
      event.position,
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
        : horizontalRevealDragGestures(
            translateController: _animationController,
            edge: HorizontalRevealEdge.left,
            shouldDefer: _shouldDeferDrawerGesture,
            onDragUpdate: _onTranslate,
            onDragEnd: (DragEndDetails details) {
              unawaited(_onApplyTranslation(details));
            },
          );

    final RevealSide revealSide = ref.watch(currentRevealSideProvider);
    final bool peek = isCompactWideDrawerPeekMode(
      context,
      shellLocation: ref.watch(shellLocationProvider),
      revealSide: revealSide,
    );
    return RawGestureDetector(
      excludeFromSemantics: true,
      gestures: drawerGestures,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ExcludeSemantics(
            excluding: !peek && revealSide == RevealSide.main,
            child: RepaintBoundary(
              child: ValueListenableBuilder<bool>(
                valueListenable: _baseTickersEnabled,
                child: widget.base,
                builder: (BuildContext context, bool enabled, Widget? base) =>
                    TickerMode(enabled: enabled, child: base!),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _animationController,
            child: ExcludeSemantics(
              excluding: !peek && revealSide == RevealSide.left,
              child: ValueListenableBuilder<bool>(
                valueListenable: _sliderTickersEnabled,
                child: SidebarDrawerSliderScope(
                  translate: _animationController,
                  child: _DrawerSliderLayer(slider: widget.slider),
                ),
                builder: (BuildContext context, bool enabled, Widget? slider) =>
                    TickerMode(enabled: enabled, child: slider!),
              ),
            ),
            builder: (context, slider) {
              Widget layer = slider!;
              if (_usesPeekReveal()) {
                final double t = _peekOverlayT();
                if (t > 0) {
                  Widget scrim = ColoredBox(
                    key: kDrawerPeekInactiveScrimKey,
                    color: Color.fromRGBO(
                      0,
                      0,
                      0,
                      kDrawerPeekInactiveScrimOpacity * t,
                    ),
                  );
                  scrim = peek
                      ? GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          excludeFromSemantics: true,
                          onTap: () {
                            unawaited(_moveToState(RevealSide.main));
                          },
                          child: scrim,
                        )
                      : IgnorePointer(child: scrim);
                  layer = Stack(
                    fit: StackFit.expand,
                    children: <Widget>[layer, scrim],
                  );
                }
              }
              return Transform.translate(
                offset: Offset(_animationController.value, 0),
                child: layer,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _DrawerSliderLayer extends ConsumerWidget {
  const _DrawerSliderLayer({required this.slider});

  final Widget slider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RevealSide revealSide = ref.watch(currentRevealSideProvider);
    final bool peek = isCompactWideDrawerPeekMode(
      context,
      shellLocation: ref.watch(shellLocationProvider),
      revealSide: revealSide,
    );
    return ChatOnScreenScope(
      onScreen: peek || revealSide == RevealSide.main,
      child: ChatSwipeToReplyScope(
        enabled: !peek,
        child: IgnorePointer(
          ignoring: peek,
          child: RepaintBoundary(child: slider),
        ),
      ),
    );
  }
}

class SidebarDrawerSliderScope extends InheritedWidget {
  const SidebarDrawerSliderScope({
    required this.translate,
    required super.child,
    super.key,
  });

  final AnimationController translate;

  static bool isPresentingOf(BuildContext context) {
    final AnimationController? translate = context
        .getInheritedWidgetOfExactType<SidebarDrawerSliderScope>()
        ?.translate;
    if (translate == null) {
      return false;
    }
    return translate.value != 0 || translate.isAnimating;
  }

  @override
  bool updateShouldNotify(SidebarDrawerSliderScope oldWidget) {
    return translate != oldWidget.translate;
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

@visibleForTesting
const Key kDrawerPeekInactiveScrimKey = ValueKey<String>('drawer-peek-scrim');

const double kDrawerPeekInactiveScrimOpacity = 0.4;

class ChatSwipeToReplyScope extends InheritedWidget {
  const ChatSwipeToReplyScope({
    required this.enabled,
    required super.child,
    super.key,
  });

  final bool enabled;

  static bool enabledOf(BuildContext context) {
    return context
            .dependOnInheritedWidgetOfExactType<ChatSwipeToReplyScope>()
            ?.enabled ??
        true;
  }

  @override
  bool updateShouldNotify(ChatSwipeToReplyScope oldWidget) {
    return enabled != oldWidget.enabled;
  }
}

class ChatOnScreenScope extends InheritedWidget {
  const ChatOnScreenScope({
    required this.onScreen,
    required super.child,
    super.key,
  });

  final bool onScreen;

  static bool onScreenOf(BuildContext context) {
    return context
            .dependOnInheritedWidgetOfExactType<ChatOnScreenScope>()
            ?.onScreen ??
        true;
  }

  @override
  bool updateShouldNotify(ChatOnScreenScope oldWidget) {
    return onScreen != oldWidget.onScreen;
  }
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
  final bool open = horizontalRevealShouldOpen(
    edge: HorizontalRevealEdge.left,
    translate: translate,
    maxExtent: maxReveal,
    primaryVelocity: primaryVelocity,
    completionThreshold: completionThreshold,
    flingVelocity: flingVelocity,
  );
  return open ? RevealSide.left : RevealSide.main;
}

bool drawerTranslatePastHalfScreen({
  required double translate,
  required double screenWidth,
}) {
  if (screenWidth <= 0) {
    return false;
  }
  return translate > screenWidth * 0.5;
}
