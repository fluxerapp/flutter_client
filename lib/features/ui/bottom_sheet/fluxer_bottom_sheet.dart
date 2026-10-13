import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/obscuring_overlay_tracker_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet_drag.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_sheet_motion.dart';
import 'package:fluxer_app/features/ui/overlay/fluxer_overlay_back_handler.dart';
import 'package:fluxer_app/features/ui/preview/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/radio_group/fluxer_radio_group.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

// ---------------------------------------------------------------------------
// FluxerBottomSheet
// ---------------------------------------------------------------------------

/// Builder that receives the sheet's [BuildContext] and a [close] callback.
typedef FluxerBottomSheetBuilder =
    Widget Function(BuildContext context, VoidCallback close);

/// Builder for scrollable sheets — also receives a [ScrollController] that
/// must be attached to the inner scrollable to coordinate scroll-vs-dismiss.
typedef FluxerScrollableBottomSheetBuilder =
    Widget Function(
      BuildContext context,
      ScrollController scrollController,
      VoidCallback close,
    );

enum FluxerBottomSheetVariant { content, menu }

/// Provides bottom scroll inset for lists inside a [FluxerBottomSheet].
class FluxerBottomSheetScope extends InheritedWidget {
  const FluxerBottomSheetScope({
    required this.bottomScrollPadding,
    required super.child,
    super.key,
  });

  final double bottomScrollPadding;

  static FluxerBottomSheetScope? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FluxerBottomSheetScope>();
  }

  @override
  bool updateShouldNotify(FluxerBottomSheetScope oldWidget) {
    return bottomScrollPadding != oldWidget.bottomScrollPadding;
  }
}

AnimationStyle fluxerBottomSheetAnimationStyle(
  BuildContext context, {
  bool leadBackdrop = false,
}) {
  final FluxerMotionTheme motion = context.motion;
  final bool animated = motion.sheet > Duration.zero;
  final Duration lead = leadBackdrop && animated
      ? kFluxerSheetBackdropLead
      : Duration.zero;
  final Duration duration = motion.sheet + lead;
  return AnimationStyle(
    duration: duration,
    curve: lead > Duration.zero
        ? Interval(
            lead.inMicroseconds / duration.inMicroseconds,
            1,
            curve: motion.sheetCurve,
          )
        : motion.sheetCurve,
    reverseDuration: animated ? kFluxerSheetCloseDuration : Duration.zero,
    reverseCurve: Curves.linear,
  );
}

Future<T?> _pushFluxerSheetRoute<T>(
  BuildContext context, {
  required WidgetBuilder builder,
  required bool useRootNavigator,
  required bool isDismissible,
  required bool useSafeArea,
  required AnimationStyle animationStyle,
}) {
  final NavigatorState navigator = Navigator.of(
    context,
    rootNavigator: useRootNavigator,
  );
  final MaterialLocalizations localizations = MaterialLocalizations.of(context);
  final Route<dynamic>? origin = ModalRoute.of(context);
  final FluxerSheetRoute<dynamic>? last = _lastSheetByNavigator[navigator];
  if (last != null &&
      origin != null &&
      identical(last.origin, origin) &&
      last.isCurrent &&
      last.isEntering) {
    return Future<T?>.value();
  }
  final Duration lead = animationStyle.duration! - context.motion.sheet;
  final FluxerSheetRoute<T> route = FluxerSheetRoute<T>(
    builder: builder,
    navigator: navigator,
    origin: origin,
    inputLockout: animationStyle.duration! > Duration.zero
        ? lead + kFluxerSheetInputLockout
        : Duration.zero,
    capturedThemes: InheritedTheme.capture(
      from: context,
      to: navigator.context,
    ),
    isScrollControlled: true,
    barrierLabel: localizations.scrimLabel,
    barrierOnTapHint: localizations.scrimOnTapHint(
      localizations.bottomSheetLabel,
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    isDismissible: isDismissible,
    modalBarrierColor: context.colors.modalScrim,
    enableDrag: false,
    useSafeArea: useSafeArea,
    sheetAnimationStyle: animationStyle,
  );
  _lastSheetByNavigator[navigator] = route;
  return navigator.push(route);
}

final Expando<FluxerSheetRoute<dynamic>> _lastSheetByNavigator =
    Expando<FluxerSheetRoute<dynamic>>();

void _closeSheet(BuildContext sheetContext) {
  final ModalRoute<dynamic>? route = sheetContext.mounted
      ? ModalRoute.of(sheetContext)
      : null;
  if (route is FluxerSheetRoute) {
    route.closeSelf();
    return;
  }
  if (route != null && route.isActive) {
    Navigator.of(sheetContext).pop();
  }
}

/// Shows a styled modal bottom sheet with the app's standard appearance.
///
/// The sheet builder receives a `close` callback so children can dismiss the
/// sheet without needing their own `Navigator.pop` call.
class FluxerBottomSheet {
  FluxerBottomSheet._();

  static const double scrollableSheetSize = kFluxerBottomSheetFullSize;
  static const double scrollableSheetHalfSize = kFluxerBottomSheetHalfSize;

  /// Bottom inset to append to scrollable content inside a bottom sheet.
  static double scrollBottomPaddingOf(BuildContext context) {
    return FluxerBottomSheetScope.maybeOf(context)?.bottomScrollPadding ?? 0;
  }

  /// Merges [padding] with the bottom sheet scroll bottom inset.
  static EdgeInsets scrollViewPadding(
    BuildContext context, {
    EdgeInsetsGeometry? padding,
  }) {
    final EdgeInsets resolved =
        padding?.resolve(Directionality.of(context)) ?? EdgeInsets.zero;
    final double bottom = scrollBottomPaddingOf(context);
    if (bottom <= 0) {
      return resolved;
    }
    return resolved.copyWith(bottom: resolved.bottom + bottom);
  }

  static double systemBottomInsetOf(BuildContext context) {
    return _fluxerSystemBottomInset(MediaQuery.of(context));
  }

  static double bottomGapOf(BuildContext context) {
    final bool sheetCoversInset =
        _FluxerSheetSurfaceScope.contains(context) &&
        systemBottomInsetOf(context) > 0 &&
        MediaQuery.viewInsetsOf(context).bottom <= 0;
    return sheetCoversInset ? 0 : context.layout.s4;
  }

  static Color cardColorOf(BuildContext context) {
    final FluxerColorTheme colors = context.colors;
    return _FluxerSheetSurfaceScope.contains(context)
        ? colors.backgroundTertiary
        : colors.backgroundSecondaryAlt;
  }

  static double systemEndInsetOf(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    if (isRtl) {
      return math.max(
        mediaQuery.viewPadding.left,
        math.max(mediaQuery.padding.left, mediaQuery.systemGestureInsets.left),
      );
    }
    return math.max(
      mediaQuery.viewPadding.right,
      math.max(mediaQuery.padding.right, mediaQuery.systemGestureInsets.right),
    );
  }

  static Future<T?> _showWithOverlayTracking<T>(
    BuildContext context,
    Future<T?> Function() showSheet,
  ) {
    final ProviderContainer container = ProviderScope.containerOf(context);
    container.read(obscuringOverlayTrackerProvider.notifier).push();
    return showSheet().whenComplete(() {
      container.read(obscuringOverlayTrackerProvider.notifier).pop();
    });
  }

  static Future<T?> show<T>(
    BuildContext context, {
    required FluxerBottomSheetBuilder builder,
    String? title,
    Widget? subtitle,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onBack,
    bool showDragHandle = true,
    bool useRootNavigator = false,
    FluxerBottomSheetVariant variant = FluxerBottomSheetVariant.content,
    ValueNotifier<bool>? canDismissNotifier,
    bool enableDrag = true,
    double? maxHeight,
    bool isDismissible = true,
    bool reserveBottomInset = true,
    bool manageKeyboardInset = true,
  }) {
    final layout = context.layout;

    return _showWithOverlayTracking<T>(
      context,
      () => _pushFluxerSheetRoute<T>(
        context,
        useRootNavigator: useRootNavigator,
        isDismissible: isDismissible,
        animationStyle: fluxerBottomSheetAnimationStyle(context),
        useSafeArea: reserveBottomInset,
        builder: (sheetContext) {
          void close() => _closeSheet(sheetContext);

          final mediaQuery = MediaQuery.of(sheetContext);
          final topPadding = mediaQuery.viewPadding.top;
          final double keyboardInset = manageKeyboardInset
              ? mediaQuery.viewInsets.bottom
              : 0;
          final bottomPadding = _effectiveBottomSheetBottomPadding(
            sheetContext,
            reserveBottomInset,
            keyboardBottomInset: keyboardInset,
          );
          final bool isMenuVariant = variant == FluxerBottomSheetVariant.menu;
          final bool hasHeader = _hasSheetHeader(
            title: title,
            subtitle: subtitle,
            leading: leading,
            trailing: trailing,
            onBack: onBack,
          );

          final content = AnimatedPadding(
            duration: sheetContext.motion.normal,
            curve: sheetContext.motion.curve,
            padding: EdgeInsets.only(bottom: keyboardInset),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: maxHeight != null
                    ? (mediaQuery.size.height - topPadding - layout.s4) *
                          maxHeight
                    : mediaQuery.size.height - topPadding - layout.s4,
              ),
              child: _FluxerBottomSheetDragScope(
                onDismiss: enableDrag ? close : null,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (showDragHandle) const FluxerBottomSheetDragHandle(),
                    if (!showDragHandle && hasHeader)
                      SizedBox(height: layout.s4),
                    if (hasHeader)
                      _FluxerBottomSheetHeaderBlock(
                        title: title ?? '',
                        subtitle: subtitle,
                        leading: leading,
                        trailing: trailing,
                        onBack: onBack,
                        gap: isMenuVariant ? layout.s3 : layout.s2,
                      ),
                    Flexible(
                      child: FluxerBottomSheetDragArea(
                        behavior: HitTestBehavior.translucent,
                        child: _FluxerBottomSheetInsetChild(
                          bottomPadding: bottomPadding,
                          child: isMenuVariant
                              ? Builder(
                                  builder: (scopedContext) =>
                                      builder(scopedContext, close),
                                )
                              : builder(sheetContext, close),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );

          final sheetContent = _FluxerSheetPresentation(
            navigator: Navigator.of(
              sheetContext,
              rootNavigator: useRootNavigator,
            ),
            child: _wrapBottomSheetSurface(
              context: sheetContext,
              child: content,
            ),
          );

          return _buildSheetWithBackHandler(
            child: sheetContent,
            onBack: onBack,
            canDismissNotifier: canDismissNotifier,
          );
        },
      ),
    );
  }

  /// Shows a bottom sheet whose content is scrollable with coordinated
  /// drag-to-dismiss (only dismisses when the scrollable is at the top).
  ///
  /// The sheet snaps to [scrollableSheetHalfSize] or [scrollableSheetSize].
  /// Releasing between those points animates to whichever is closer. Dragging
  /// below the half mark closes the sheet. While the finger is down the sheet
  /// follows past half without resting there.
  ///
  /// Pass [scrollableSheetHalfSize] as [initialChildSize] to open at half
  /// height. The default opens at the full snap.
  ///
  /// The [builder] receives a [ScrollController] that **must** be attached to
  /// the inner scrollable widget for the coordination to work.
  static Future<T?> showScrollable<T>(
    BuildContext context, {
    required FluxerScrollableBottomSheetBuilder builder,
    String? title,
    Widget? subtitle,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onBack,
    bool showDragHandle = true,
    bool useRootNavigator = false,
    double initialChildSize = scrollableSheetSize,
    double minChildSize = 0.4,
    double maxChildSize = scrollableSheetSize,
    ValueNotifier<bool>? canDismissNotifier,
    double? maxHeight,
    bool disableTopPadding = false,
    bool isDismissible = true,
    bool reserveBottomInset = true,
    bool manageKeyboardInset = true,
  }) {
    final layout = context.layout;

    return _showWithOverlayTracking<T>(
      context,
      () => _pushFluxerSheetRoute<T>(
        context,
        useRootNavigator: useRootNavigator,
        isDismissible: isDismissible,
        animationStyle: fluxerBottomSheetAnimationStyle(
          context,
          leadBackdrop:
              isMobileLayout(context) &&
              math.min(initialChildSize, maxHeight ?? maxChildSize) >=
                  kFluxerSheetBackdropMinCoverage,
        ),
        useSafeArea: reserveBottomInset,
        builder: (sheetContext) {
          void close() => _closeSheet(sheetContext);

          final mediaQuery = MediaQuery.of(sheetContext);
          final double keyboardInset = manageKeyboardInset
              ? mediaQuery.viewInsets.bottom
              : 0;
          final bottomPadding = _effectiveBottomSheetBottomPadding(
            sheetContext,
            reserveBottomInset,
            keyboardBottomInset: keyboardInset,
          );
          final double bottomScrollPadding = bottomPadding;
          final bool hasHeader = _hasSheetHeader(
            title: title,
            subtitle: subtitle,
            leading: leading,
            trailing: trailing,
            onBack: onBack,
          );

          final double availableHeight =
              mediaQuery.size.height - mediaQuery.viewPadding.top - layout.s4;
          // maxHeight is a screen-fraction alias for maxChildSize. Applying
          // both to the container and the draggable sheet stacked the limits.
          final double effectiveMaxChildSize = maxHeight ?? maxChildSize;
          final double halfChildSize = scrollableSheetHalfSize.clamp(
            0,
            effectiveMaxChildSize,
          );
          final double effectiveMinChildSize = math.min(
            kFluxerBottomSheetDragMinSize,
            math.min(minChildSize, effectiveMaxChildSize),
          );

          final sheet = _FluxerDraggableScrollableSheet(
            minChildSize: effectiveMinChildSize,
            maxChildSize: effectiveMaxChildSize,
            halfChildSize: halfChildSize,
            initialChildSize: math.min(initialChildSize, effectiveMaxChildSize),
            maxHeight: availableHeight,
            showDragHandle: showDragHandle,
            disableTopPadding: disableTopPadding,
            hasHeader: hasHeader,
            onDismiss: close,
            navigator: Navigator.of(
              sheetContext,
              rootNavigator: useRootNavigator,
            ),
            title: title,
            subtitle: subtitle,
            leading: leading,
            trailing: trailing,
            onBack: onBack,
            bottomInset: keyboardInset,
            bottomScrollPadding: bottomScrollPadding,
            sheetContext: sheetContext,
            builder: builder,
          );

          return _buildSheetWithBackHandler(
            child: sheet,
            onBack: onBack,
            canDismissNotifier: canDismissNotifier,
          );
        },
      ),
    );
  }
}

Widget _buildSheetWithBackHandler({
  required Widget child,
  required VoidCallback? onBack,
  required ValueNotifier<bool>? canDismissNotifier,
}) {
  if (canDismissNotifier == null) {
    return _wrapSheetBackHandler(
      canDismiss: true,
      onBack: onBack,
      child: child,
    );
  }
  return ValueListenableBuilder<bool>(
    valueListenable: canDismissNotifier,
    builder: (BuildContext context, bool canDismiss, Widget? sheetChild) =>
        _wrapSheetBackHandler(
          canDismiss: canDismiss,
          onBack: onBack,
          child: sheetChild!,
        ),
    child: child,
  );
}

Widget _wrapSheetBackHandler({
  required bool canDismiss,
  required VoidCallback? onBack,
  required Widget child,
}) {
  return wrapFluxerOverlayBackHandler(
    canDismiss: canDismiss,
    onBack: onBack,
    onDismiss: null,
    child: child,
  );
}

bool _hasSheetHeader({
  String? title,
  Widget? subtitle,
  Widget? leading,
  Widget? trailing,
  VoidCallback? onBack,
}) {
  return title != null ||
      subtitle != null ||
      leading != null ||
      trailing != null ||
      onBack != null;
}

// ---------------------------------------------------------------------------
// Structural widgets
// ---------------------------------------------------------------------------

double _fluxerSystemBottomInset(MediaQueryData mediaQuery) {
  return math.max(
    mediaQuery.viewPadding.bottom,
    math.max(mediaQuery.padding.bottom, mediaQuery.systemGestureInsets.bottom),
  );
}

double _effectiveBottomSheetBottomPadding(
  BuildContext context,
  bool reserveBottomInset, {
  required double keyboardBottomInset,
}) {
  if (!reserveBottomInset || keyboardBottomInset > 0) {
    return 0;
  }
  return _fluxerSystemBottomInset(MediaQuery.of(context));
}

Widget _wrapBottomSheetSurface({
  required BuildContext context,
  required Widget child,
}) {
  final BottomSheetThemeData bottomSheetTheme = Theme.of(
    context,
  ).bottomSheetTheme;
  final Color surfaceColor = context.colors.backgroundSecondaryAlt;
  return Stack(
    fit: StackFit.passthrough,
    clipBehavior: Clip.none,
    children: <Widget>[
      Positioned(
        left: 0,
        right: 0,
        bottom: -kFluxerSheetOvershootBleed,
        height: kFluxerSheetOvershootBleed,
        child: ColoredBox(color: surfaceColor),
      ),
      Material(
        color: surfaceColor,
        surfaceTintColor: Colors.transparent,
        shape: bottomSheetTheme.shape,
        clipBehavior: bottomSheetTheme.clipBehavior ?? Clip.antiAlias,
        child: _FluxerSheetSurfaceScope(child: child),
      ),
    ],
  );
}

bool _fluxerSheetDrivesBackdrop(BuildContext context) {
  return isMobileLayout(context) && !MediaQuery.disableAnimationsOf(context);
}

class _FluxerSheetPresentation extends StatefulWidget {
  const _FluxerSheetPresentation({
    required this.navigator,
    required this.child,
  });

  final NavigatorState navigator;
  final Widget child;

  @override
  State<_FluxerSheetPresentation> createState() =>
      _FluxerSheetPresentationState();
}

class _FluxerSheetPresentationState extends State<_FluxerSheetPresentation>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<double> _dragOffset = ValueNotifier<double>(0);
  late final AnimationController _settle = AnimationController(
    vsync: this,
    duration: FluxerMotionTheme.sheetDuration,
  )..addListener(_applySettle);
  double _settleFrom = 0;
  Animation<double>? _routeAnimation;
  FluxerSheetBackdropLink? _backdrop;
  ModalRoute<dynamic>? _route;

  @override
  void initState() {
    super.initState();
    _dragOffset.addListener(_reportBackdrop);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_fluxerSheetDrivesBackdrop(context)) {
      _backdrop ??= FluxerSheetBackdropLink(widget.navigator);
    } else {
      _backdrop?.dispose();
      _backdrop = null;
    }
    _route = ModalRoute.of(context);
    final Animation<double>? animation = _route?.animation;
    if (identical(animation, _routeAnimation)) {
      return;
    }
    _routeAnimation?.removeListener(_reportBackdrop);
    _routeAnimation = animation;
    _routeAnimation?.addListener(_reportBackdrop);
  }

  double? get sheetHeight {
    final RenderObject? box = context.findRenderObject();
    return box is RenderBox && box.hasSize ? box.size.height : null;
  }

  @override
  void dispose() {
    _routeAnimation?.removeListener(_reportBackdrop);
    _backdrop?.dispose();
    _settle.dispose();
    _dragOffset.dispose();
    super.dispose();
  }

  void dragBy(double deltaDy) {
    _settle.stop();
    _dragOffset.value = math.max(0, _dragOffset.value + deltaDy);
  }

  void settle() {
    if (_dragOffset.value == 0) {
      return;
    }
    if (MediaQuery.disableAnimationsOf(context)) {
      _dragOffset.value = 0;
      return;
    }
    _settleFrom = _dragOffset.value;
    _settle.forward(from: 0);
  }

  void _applySettle() {
    _dragOffset.value =
        _settleFrom *
        (1 - FluxerMotionTheme.standardSheetCurve.transform(_settle.value));
  }

  void _reportBackdrop() {
    final ModalRoute<dynamic>? route = _route;
    final Animation<double>? animation = _routeAnimation;
    final double? height = sheetHeight;
    if (route == null || animation == null || height == null || height <= 0) {
      return;
    }
    final double offset = math.max(0, _dragOffset.value);
    if (route is FluxerSheetRoute) {
      route.setScrimTravel(1 - offset / height);
    }
    _backdrop?.reportVisibleHeight(
      math.max(0, height - offset),
      fluxerSheetBackdropProgress(animation, route.transitionDuration),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _FluxerSheetDragTranslationScope(
      presentation: this,
      child: ValueListenableBuilder<double>(
        valueListenable: _dragOffset,
        child: widget.child,
        builder: (BuildContext context, double offset, Widget? child) {
          return Transform.translate(offset: Offset(0, offset), child: child);
        },
      ),
    );
  }
}

class _FluxerSheetDragTranslationScope extends InheritedWidget {
  const _FluxerSheetDragTranslationScope({
    required this.presentation,
    required super.child,
  });

  final _FluxerSheetPresentationState presentation;

  static _FluxerSheetPresentationState? maybeOf(BuildContext context) {
    return context
        .getInheritedWidgetOfExactType<_FluxerSheetDragTranslationScope>()
        ?.presentation;
  }

  @override
  bool updateShouldNotify(_FluxerSheetDragTranslationScope oldWidget) => false;
}

class _FluxerSheetSurfaceScope extends InheritedWidget {
  const _FluxerSheetSurfaceScope({required super.child});

  static bool contains(BuildContext context) {
    return context.getInheritedWidgetOfExactType<_FluxerSheetSurfaceScope>() !=
        null;
  }

  @override
  bool updateShouldNotify(_FluxerSheetSurfaceScope oldWidget) => false;
}

class _FluxerBottomSheetInsetChild extends StatelessWidget {
  const _FluxerBottomSheetInsetChild({
    required this.bottomPadding,
    required this.child,
  });

  final double bottomPadding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: child,
    );
  }
}

const double _kDragHandleHitHeight = 28;

/// Sheet extents are fractions of the viewport; below this they are equal.
const double _kSheetSizeEpsilon = 0.001;

/// Pointer travel that counts as a drag. Opening-animation size changes must
/// not be treated as a user drag or a tap will snap-dismiss the sheet.
const double _kSheetPointerDragSlop = 18;

/// Captures downward vertical drags on sheet body content to dismiss the sheet.
///
/// Pair with [NeverScrollableScrollPhysics] (or a scroll view already at the top)
/// so inner scrollables do not claim the drag.
class FluxerBottomSheetDismissDragTarget extends StatelessWidget {
  const FluxerBottomSheetDismissDragTarget({
    required this.onDismiss,
    required this.child,
    super.key,
  });

  final VoidCallback onDismiss;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FluxerBottomSheetDragArea(
      onDismiss: onDismiss,
      behavior: HitTestBehavior.translucent,
      child: child,
    );
  }
}

class _FluxerDraggableScrollableSheet extends StatefulWidget {
  const _FluxerDraggableScrollableSheet({
    required this.minChildSize,
    required this.maxChildSize,
    required this.halfChildSize,
    required this.initialChildSize,
    required this.maxHeight,
    required this.showDragHandle,
    required this.disableTopPadding,
    required this.hasHeader,
    required this.onDismiss,
    required this.navigator,
    required this.title,
    required this.subtitle,
    required this.leading,
    required this.trailing,
    required this.onBack,
    required this.bottomInset,
    required this.bottomScrollPadding,
    required this.sheetContext,
    required this.builder,
  });

  final double minChildSize;
  final double maxChildSize;
  final double halfChildSize;
  final double initialChildSize;
  final double maxHeight;
  final bool showDragHandle;
  final bool disableTopPadding;
  final bool hasHeader;
  final VoidCallback onDismiss;
  final NavigatorState navigator;
  final String? title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onBack;
  final double bottomInset;
  final double bottomScrollPadding;
  final BuildContext sheetContext;
  final FluxerScrollableBottomSheetBuilder builder;

  @override
  State<_FluxerDraggableScrollableSheet> createState() =>
      _FluxerDraggableScrollableSheetState();
}

class _FluxerDraggableScrollableSheetState
    extends State<_FluxerDraggableScrollableSheet> {
  final DraggableScrollableController _sheetController =
      DraggableScrollableController();

  /// True once this route is popping. Stops a leftover pointer snap from
  /// popping the route that replaced this sheet.
  bool _dismissed = false;
  bool _routeDidEnter = false;
  bool _snapQueued = false;
  bool _settleCheckQueued = false;
  int _programmaticMoveUntilUs = 0;
  bool _userResized = false;
  int _activePointers = 0;
  double _pointerDownSize = 0;
  Offset _pointerDownPosition = Offset.zero;
  bool _pointerDragged = false;
  double _lastSize = 0;
  int _lastSizeUs = 0;
  double _sizePerSecond = 0;
  double _releaseDownVelocity = 0;
  Animation<double>? _routeAnimation;
  FluxerSheetBackdropLink? _backdrop;
  ModalRoute<dynamic>? _route;

  @override
  void initState() {
    super.initState();
    _sheetController.addListener(_handleSheetSize);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_fluxerSheetDrivesBackdrop(context)) {
      _backdrop ??= FluxerSheetBackdropLink(widget.navigator);
    } else {
      _backdrop?.dispose();
      _backdrop = null;
    }
    _route = ModalRoute.of(context);
    final Animation<double>? animation = _route?.animation;
    if (identical(animation, _routeAnimation)) {
      return;
    }
    _routeAnimation
      ?..removeStatusListener(_markDismissedIfRouteClosing)
      ..removeListener(_reportBackdrop);
    _routeAnimation = animation;
    _routeAnimation
      ?..addStatusListener(_markDismissedIfRouteClosing)
      ..addListener(_reportBackdrop);
    final AnimationStatus? status = _routeAnimation?.status;
    if (status != null) {
      _markDismissedIfRouteClosing(status);
    }
  }

  @override
  void didUpdateWidget(_FluxerDraggableScrollableSheet oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.bottomInset <= 0 && widget.bottomInset > 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _expandForKeyboard());
    }
  }

  void _expandForKeyboard() {
    if (!mounted ||
        _dismissed ||
        _activePointers > 0 ||
        !_sheetController.isAttached ||
        _sheetController.size >= widget.maxChildSize - _kSheetSizeEpsilon) {
      return;
    }
    final BuildContext? focused = FocusManager.instance.primaryFocus?.context;
    if (focused == null ||
        focused
                .findAncestorStateOfType<
                  _FluxerDraggableScrollableSheetState
                >() !=
            this) {
      return;
    }
    _moveTo(widget.maxChildSize);
  }

  void _moveTo(double target) {
    final FluxerMotionTheme motion = widget.sheetContext.motion;
    if (motion.panel <= Duration.zero) {
      _sheetController.jumpTo(target);
      return;
    }
    _programmaticMoveUntilUs =
        DateTime.now().microsecondsSinceEpoch +
        motion.panel.inMicroseconds +
        Duration.microsecondsPerSecond ~/ 60;
    _sheetController.animateTo(
      target,
      duration: motion.panel,
      curve: motion.curve,
    );
  }

  bool get _programmaticMove =>
      DateTime.now().microsecondsSinceEpoch < _programmaticMoveUntilUs;

  @override
  void dispose() {
    _routeAnimation
      ?..removeStatusListener(_markDismissedIfRouteClosing)
      ..removeListener(_reportBackdrop);
    _backdrop?.dispose();
    _sheetController.removeListener(_handleSheetSize);
    _sheetController.dispose();
    super.dispose();
  }

  void _reportBackdrop() {
    final ModalRoute<dynamic>? route = _route;
    final Animation<double>? animation = _routeAnimation;
    if (route == null || animation == null || !_sheetController.isAttached) {
      return;
    }
    final double restSize = math.min(
      widget.halfChildSize,
      widget.initialChildSize,
    );
    if (route is FluxerSheetRoute && restSize > 0) {
      route.setScrimTravel(_sheetController.size / restSize);
    }
    _backdrop?.reportVisibleHeight(
      _sheetController.pixels,
      fluxerSheetBackdropProgress(animation, route.transitionDuration),
    );
  }

  void _markDismissedIfRouteClosing(AnimationStatus status) {
    if (status == AnimationStatus.forward ||
        status == AnimationStatus.completed) {
      _routeDidEnter = true;
      return;
    }
    // Routes start dismissed. After enter, reverse/dismissed means we're popping.
    if (_routeDidEnter &&
        (status == AnimationStatus.reverse ||
            status == AnimationStatus.dismissed)) {
      _dismissed = true;
    }
  }

  void _handleSheetSize() {
    if (!_sheetController.isAttached) {
      return;
    }
    final int now = DateTime.now().microsecondsSinceEpoch;
    final double size = _sheetController.size;
    if (_lastSizeUs != 0) {
      final double dt = (now - _lastSizeUs) / 1e6;
      if (dt > 0 && dt < 0.1) {
        _sizePerSecond = (size - _lastSize) / dt;
      }
    }
    _lastSize = size;
    _lastSizeUs = now;
    _reportBackdrop();
    _queueSettleCheck();
  }

  void _queueSettleCheck() {
    if (_settleCheckQueued ||
        !_userResized ||
        _activePointers > 0 ||
        _dismissed) {
      return;
    }
    _settleCheckQueued = true;
    final double sizeAtQueue = _sheetController.size;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _settleCheckQueued = false;
      if (!mounted ||
          _dismissed ||
          _activePointers > 0 ||
          !_sheetController.isAttached) {
        return;
      }
      if (_snapQueued ||
          _programmaticMove ||
          (_sheetController.size - sizeAtQueue).abs() > _kSheetSizeEpsilon) {
        _queueSettleCheck();
        return;
      }
      _settleAtSnap();
    });
    WidgetsBinding.instance.ensureVisualUpdate();
  }

  void _settleAtSnap() {
    final double size = _sheetController.size;
    if (size <= 0) {
      return;
    }
    final double? target = fluxerBottomSheetSnapTarget(
      size: size,
      halfSize: widget.halfChildSize,
      fullSize: widget.maxChildSize,
    );
    if (target == null) {
      _dismiss();
      return;
    }
    if ((size - target).abs() < _kSheetSizeEpsilon) {
      return;
    }
    _moveTo(target);
  }

  void _dismiss() {
    if (_dismissed) {
      return;
    }
    _dismissed = true;
    if (!mounted) {
      return;
    }
    widget.onDismiss();
  }

  void _onPointerDown(PointerDownEvent event) {
    _activePointers++;
    _programmaticMoveUntilUs = 0;
    if (_activePointers == 1) {
      _sizePerSecond = 0;
      _releaseDownVelocity = 0;
      _pointerDragged = false;
      _pointerDownPosition = event.position;
      _pointerDownSize = _sheetController.isAttached
          ? _sheetController.size
          : 0;
    }
  }

  void _onPointerMove(PointerMoveEvent event) {
    final Offset travel = event.position - _pointerDownPosition;
    if (travel.dy > _kSheetPointerDragSlop &&
        travel.dy > travel.dx.abs() &&
        MediaQuery.viewInsetsOf(widget.sheetContext).bottom > 0) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
    if (_pointerDragged) {
      return;
    }
    if (travel.distance > _kSheetPointerDragSlop) {
      _pointerDragged = true;
      _userResized = true;
    }
  }

  void _onPointerReleased(PointerEvent event) {
    if (_activePointers > 0) {
      _activePointers--;
    }
    if (_activePointers > 0) {
      return;
    }
    _captureReleaseVelocity();
    _queueSnap();
  }

  void _captureReleaseVelocity() {
    if (!_sheetController.isAttached || _sheetController.size <= 0) {
      _releaseDownVelocity = 0;
      return;
    }
    final double availablePixels =
        _sheetController.pixels / _sheetController.size;
    _releaseDownVelocity = -_sizePerSecond * availablePixels;
  }

  void _queueSnap() {
    if (_snapQueued || _dismissed || !_pointerDragged) {
      return;
    }
    _snapQueued = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _snapQueued = false;
      if (!mounted || _dismissed || !_pointerDragged || _activePointers > 0) {
        return;
      }
      _snapOrDismiss(velocity: _releaseDownVelocity);
    });
    WidgetsBinding.instance.ensureVisualUpdate();
  }

  void _snapOrDismiss({double velocity = 0}) {
    if (_dismissed ||
        !_pointerDragged ||
        !mounted ||
        !_sheetController.isAttached) {
      return;
    }
    final double size = _sheetController.size;
    if (size <= 0) {
      return;
    }
    final bool moved = (size - _pointerDownSize).abs() > _kSheetSizeEpsilon;
    if (!moved && velocity.abs() < kFluxerBottomSheetDismissVelocity) {
      return;
    }
    final double availablePixels = _sheetController.pixels / size;
    final double? target = fluxerBottomSheetSnapTarget(
      size: size,
      halfSize: widget.halfChildSize,
      fullSize: widget.maxChildSize,
      velocity: velocity,
      availablePixels: availablePixels,
    );
    if (target == null) {
      _dismiss();
      return;
    }
    if ((size - target).abs() < _kSheetSizeEpsilon) {
      return;
    }
    _moveTo(target);
  }

  @override
  Widget build(BuildContext context) {
    final layout = widget.sheetContext.layout;
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: widget.maxHeight),
      child: Listener(
        onPointerDown: _onPointerDown,
        onPointerMove: _onPointerMove,
        onPointerUp: _onPointerReleased,
        onPointerCancel: _onPointerReleased,
        child: DraggableScrollableSheet(
          expand: false,
          controller: _sheetController,
          initialChildSize: widget.initialChildSize,
          minChildSize: widget.minChildSize,
          maxChildSize: widget.maxChildSize,
          shouldCloseOnMinExtent: false,
          builder: (context, scrollController) {
            return _wrapBottomSheetSurface(
              context: widget.sheetContext,
              child: AnimatedPadding(
                duration: widget.sheetContext.motion.normal,
                curve: widget.sheetContext.motion.curve,
                padding: EdgeInsets.only(bottom: widget.bottomInset),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final double layoutHeight = math.max(
                      constraints.maxHeight,
                      160,
                    );
                    return OverflowBox(
                      alignment: Alignment.topCenter,
                      minHeight: layoutHeight,
                      maxHeight: layoutHeight,
                      child: SizedBox(
                        height: layoutHeight,
                        child: _FluxerBottomSheetDragScope(
                          sheetController: _sheetController,
                          minChildSize: widget.minChildSize,
                          maxChildSize: widget.maxChildSize,
                          onDismiss: _dismiss,
                          child: Column(
                            children: [
                              if (widget.showDragHandle)
                                FluxerBottomSheetDragHandle(
                                  includeTopPadding: !widget.disableTopPadding,
                                ),
                              if (!widget.showDragHandle && widget.hasHeader)
                                SizedBox(height: layout.s4),
                              if (widget.hasHeader)
                                _FluxerBottomSheetHeaderBlock(
                                  title: widget.title ?? '',
                                  subtitle: widget.subtitle,
                                  leading: widget.leading,
                                  trailing: widget.trailing,
                                  onBack: widget.onBack,
                                  gap: layout.s2,
                                ),
                              Expanded(
                                child: FluxerBottomSheetDragArea(
                                  behavior: HitTestBehavior.translucent,
                                  child: FluxerBottomSheetScope(
                                    bottomScrollPadding:
                                        widget.bottomScrollPadding,
                                    child: Builder(
                                      builder: (scopedContext) =>
                                          widget.builder(
                                            scopedContext,
                                            scrollController,
                                            _dismiss,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _FluxerBottomSheetDragScope extends InheritedWidget {
  const _FluxerBottomSheetDragScope({
    required super.child,
    this.sheetController,
    this.minChildSize = 0,
    this.maxChildSize = 1,
    this.onDismiss,
  });

  final DraggableScrollableController? sheetController;
  final double minChildSize;
  final double maxChildSize;
  final VoidCallback? onDismiss;

  static _FluxerBottomSheetDragScope? maybeOf(BuildContext context) {
    return context.getInheritedWidgetOfExactType<_FluxerBottomSheetDragScope>();
  }

  @override
  bool updateShouldNotify(_FluxerBottomSheetDragScope oldWidget) {
    return sheetController != oldWidget.sheetController ||
        minChildSize != oldWidget.minChildSize ||
        maxChildSize != oldWidget.maxChildSize ||
        onDismiss != oldWidget.onDismiss;
  }
}

class FluxerBottomSheetDragArea extends StatefulWidget {
  const FluxerBottomSheetDragArea({
    required this.child,
    super.key,
    this.sheetController,
    this.minChildSize,
    this.maxChildSize,
    this.onDismiss,
    this.behavior = HitTestBehavior.opaque,
  });

  final Widget child;
  final DraggableScrollableController? sheetController;
  final double? minChildSize;
  final double? maxChildSize;
  final VoidCallback? onDismiss;
  final HitTestBehavior behavior;

  @override
  State<FluxerBottomSheetDragArea> createState() =>
      _FluxerBottomSheetDragAreaState();
}

class _FluxerBottomSheetDragAreaState extends State<FluxerBottomSheetDragArea> {
  double _dragDistance = 0;

  _FluxerBottomSheetDragScope? get _scope =>
      _FluxerBottomSheetDragScope.maybeOf(context);

  DraggableScrollableController? get _controller =>
      widget.sheetController ?? _scope?.sheetController;

  VoidCallback? get _onDismiss => widget.onDismiss ?? _scope?.onDismiss;

  _FluxerSheetPresentationState? get _presentation =>
      _FluxerSheetDragTranslationScope.maybeOf(context);

  bool get _canDrag => _controller != null || _onDismiss != null;

  double get _sheetHeight {
    final double? presented = _presentation?.sheetHeight;
    if (presented != null) {
      return presented;
    }
    final RenderObject? scopeBox = context
        .getElementForInheritedWidgetOfExactType<_FluxerBottomSheetDragScope>()
        ?.findRenderObject();
    return scopeBox is RenderBox && scopeBox.hasSize
        ? scopeBox.size.height
        : MediaQuery.sizeOf(context).height * kFluxerBottomSheetHalfSize;
  }

  void _handleVerticalDragStart(DragStartDetails details) {
    _dragDistance = 0;
  }

  void _handleVerticalDragUpdate(DragUpdateDetails details) {
    _dragDistance += details.delta.dy;
    final DraggableScrollableController? controller = _controller;
    if (controller == null || !controller.isAttached) {
      if (_dragDistance > _kSheetPointerDragSlop &&
          MediaQuery.viewInsetsOf(context).bottom > 0) {
        FocusManager.instance.primaryFocus?.unfocus();
      }
      _presentation?.dragBy(details.delta.dy);
      return;
    }
    final double currentSize = controller.size;
    if (currentSize <= 0) {
      return;
    }
    controller.jumpTo(
      fluxerBottomSheetSizeAfterDrag(
        currentSize: currentSize,
        deltaDy: details.delta.dy,
        availablePixels: controller.pixels / currentSize,
        minChildSize: widget.minChildSize ?? _scope?.minChildSize ?? 0,
        maxChildSize: widget.maxChildSize ?? _scope?.maxChildSize ?? 1,
      ),
    );
  }

  void _handleVerticalDragEnd(DragEndDetails details) {
    final double velocity = details.primaryVelocity ?? 0;
    final double dragDistance = _dragDistance;
    _dragDistance = 0;
    final DraggableScrollableController? controller = _controller;
    if (controller != null && controller.isAttached) {
      return;
    }
    if (fluxerBottomSheetShouldDismissAfterDrag(
      dragDistance: dragDistance,
      velocity: velocity,
      sheetHeight: _sheetHeight,
    )) {
      _onDismiss?.call();
      return;
    }
    _presentation?.settle();
  }

  @override
  Widget build(BuildContext context) {
    return FluxerGestureDetector(
      behavior: widget.behavior,
      onVerticalDragStart: _canDrag ? _handleVerticalDragStart : null,
      onVerticalDragUpdate: _canDrag ? _handleVerticalDragUpdate : null,
      onVerticalDragEnd: _canDrag ? _handleVerticalDragEnd : null,
      child: widget.child,
    );
  }
}

class FluxerBottomSheetDragHandle extends StatelessWidget {
  const FluxerBottomSheetDragHandle({
    super.key,
    this.sheetController,
    this.minChildSize = 0,
    this.maxChildSize = 1,
    this.onDismiss,
    this.includeTopPadding = true,
  });

  final DraggableScrollableController? sheetController;
  final double minChildSize;
  final double maxChildSize;
  final VoidCallback? onDismiss;
  final bool includeTopPadding;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final double topPadding = includeTopPadding ? layout.s2 : 0;
    return FluxerBottomSheetDragArea(
      sheetController: sheetController,
      minChildSize: sheetController == null ? null : minChildSize,
      maxChildSize: sheetController == null ? null : maxChildSize,
      onDismiss: onDismiss,
      child: SizedBox(
        height: topPadding + _kDragHandleHitHeight + layout.s2,
        child: Padding(
          padding: EdgeInsets.only(top: topPadding, bottom: layout.s2),
          child: Center(
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: context.colors.backgroundModifierAccent,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FluxerBottomSheetHeaderBlock extends StatelessWidget {
  const _FluxerBottomSheetHeaderBlock({
    required this.title,
    required this.gap,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onBack,
  });

  final String title;
  final double gap;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return FluxerBottomSheetDragArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FluxerBottomSheetHeader(
            title: title,
            subtitle: subtitle,
            leading: leading,
            trailing: trailing,
            onBack: onBack,
          ),
          SizedBox(height: gap),
        ],
      ),
    );
  }
}

class FluxerBottomSheetHeader extends StatelessWidget {
  final String title;
  final Widget? leading;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onBack;
  final Widget? after;

  const FluxerBottomSheetHeader({
    required this.title,
    super.key,
    this.leading,
    this.subtitle,
    this.trailing,
    this.onBack,
    this.after,
  });

  bool _leadingOccupiesSpace(Widget? widget) {
    if (widget == null) {
      return false;
    }
    if (widget is SizedBox) {
      final double? width = widget.width;
      final double? height = widget.height;
      if (widget.child == null &&
          (width == null || width == 0) &&
          (height == null || height == 0)) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Widget? effectiveLeading = onBack != null
        ? IconButton(
            onPressed: onBack,
            tooltip: l10n.back,
            icon: PhosphorIcon(
              PhosphorIconsBold.caretLeft,
              size: 20,
              color: colors.textPrimary,
            ),
          )
        : _leadingOccupiesSpace(leading)
        ? leading
        : null;

    final bool alignStart = effectiveLeading != null || trailing != null;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: layout.s4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              if (effectiveLeading != null) ...[
                effectiveLeading,
                SizedBox(width: layout.s3),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: alignStart
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: context.textStyles.channelName.copyWith(
                        color: colors.textPrimary,
                      ),
                      textAlign: alignStart
                          ? TextAlign.start
                          : TextAlign.center,
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      DefaultTextStyle.merge(
                        textAlign: alignStart
                            ? TextAlign.start
                            : TextAlign.center,
                        child: subtitle!,
                      ),
                    ],
                  ],
                ),
              ),
              if (trailing != null) ...[SizedBox(width: layout.s3), trailing!],
            ],
          ),
          if (after != null) ...[SizedBox(height: layout.s3), after!],
        ],
      ),
    );
  }
}

class FluxerBottomSheetSubmenuHeader extends StatelessWidget {
  final String title;
  final VoidCallback onBack;

  const FluxerBottomSheetSubmenuHeader({
    required this.title,
    required this.onBack,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FluxerBottomSheetHeader(title: title, onBack: onBack);
  }
}

class FluxerBottomSheetContent extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool scrollable;

  const FluxerBottomSheetContent({
    required this.child,
    super.key,
    this.padding,
    this.scrollable = true,
  });

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final EdgeInsets resolvedPadding = FluxerBottomSheet.scrollViewPadding(
      context,
      padding: padding ?? EdgeInsets.symmetric(horizontal: layout.s4),
    );

    if (!scrollable) {
      return Padding(padding: resolvedPadding, child: child);
    }

    return SingleChildScrollView(padding: resolvedPadding, child: child);
  }
}

class FluxerBottomSheetSection extends StatelessWidget {
  final String? title;
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const FluxerBottomSheetSection({
    required this.child,
    super.key,
    this.title,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: layout.s4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null) ...[
            Padding(
              padding: EdgeInsets.only(bottom: layout.s2),
              child: Text(
                title!,
                style: context.textStyles.label.copyWith(
                  color: colors.textSecondary,
                ),
              ),
            ),
          ],
          child,
        ],
      ),
    );
  }
}

class FluxerBottomSheetFooter extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool showTopBorder;

  const FluxerBottomSheetFooter({
    required this.child,
    super.key,
    this.padding,
    this.showTopBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

    final bool inScrollableSheet =
        FluxerBottomSheetScope.maybeOf(context) != null;

    return DecoratedBox(
      decoration: BoxDecoration(
        border: showTopBorder
            ? Border(
                top: BorderSide(
                  color: colors.backgroundModifierAccent.withValues(alpha: 0.5),
                ),
              )
            : null,
      ),
      child: SafeArea(
        top: false,
        left: false,
        right: false,
        maintainBottomViewPadding: inScrollableSheet,
        child: Padding(
          padding: padding ?? EdgeInsets.all(layout.s4),
          child: child,
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Menu group
// ---------------------------------------------------------------------------

class FluxerMenuGroup extends StatelessWidget {
  final List<Widget> children;
  final bool bordered;

  const FluxerMenuGroup({
    required this.children,
    this.bordered = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) {
      return const SizedBox.shrink();
    }

    final colors = context.colors;
    final layout = context.layout;
    final dividerInset = bordered ? layout.s3 : 16.0;

    return Material(
      color: FluxerBottomSheet.cardColorOf(context),
      surfaceTintColor: Colors.transparent,
      shape: bordered
          ? RoundedRectangleBorder(
              borderRadius: layout.radiusXxl,
              side: BorderSide(color: colors.backgroundModifierAccent),
            )
          : null,
      borderRadius: bordered ? null : layout.radiusXxl,
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: _intersperseDividers(
          children,
          dividerColor: colors.backgroundModifierAccent,
          dividerInset: dividerInset,
        ),
      ),
    );
  }
}

List<Widget> _intersperseDividers(
  List<Widget> items, {
  required Color dividerColor,
  required double dividerInset,
}) {
  final result = <Widget>[];
  for (var i = 0; i < items.length; i++) {
    result.add(items[i]);
    if (i < items.length - 1) {
      result.add(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: dividerInset),
          child: Divider(height: 1, thickness: 1, color: dividerColor),
        ),
      );
    }
  }
  return result;
}

// ---------------------------------------------------------------------------
// Menu items
// ---------------------------------------------------------------------------

class FluxerBottomSheetMenuItem extends StatelessWidget {
  final String label;
  final String? hint;
  final VoidCallback onTap;
  final Widget? leading;
  final IconData? icon;
  final Color? iconColor;
  final bool isDanger;
  final bool isSelected;
  final bool enabled;
  final Widget? trailing;

  const FluxerBottomSheetMenuItem({
    required this.label,
    required this.onTap,
    super.key,
    this.hint,
    this.leading,
    this.icon,
    this.iconColor,
    this.isDanger = false,
    this.isSelected = false,
    this.enabled = true,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final baseColor = isDanger ? colors.menuDangerText : colors.textPrimary;

    return FluxerTappable(
      enabled: enabled,
      onTap: onTap,
      selected: isSelected,
      semanticLabel: hint != null ? '$label. $hint' : label,
      excludeChildSemantics: true,
      builder: (context, states) {
        final isPressed = states.contains(WidgetState.pressed);

        return AnimatedContainer(
          duration: context.motion.fast,
          curve: context.motion.curve,
          color: isPressed ? colors.listItemPressedBg : Colors.transparent,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 56),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  if (leading case final leading?) ...[
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Center(child: leading),
                    ),
                    const SizedBox(width: 12),
                  ] else if (icon != null) ...[
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Center(
                        child: PhosphorIcon(
                          icon!,
                          color: iconColor ?? baseColor,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          label,
                          style: context.textStyles.username.copyWith(
                            color: enabled ? baseColor : colors.textTertiary,
                          ),
                        ),
                        if (hint != null)
                          Text(
                            hint!,
                            style: context.textStyles.timestamp.copyWith(
                              color: colors.textTertiary,
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (trailing != null) ...[
                    const SizedBox(width: 12),
                    trailing!,
                  ] else if (isSelected) ...[
                    const SizedBox(width: 12),
                    PhosphorIcon(
                      PhosphorIconsBold.check,
                      size: 20,
                      color: colors.brandPrimary,
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class FluxerBottomSheetSubmenuItem extends StatelessWidget {
  final String label;
  final String? hint;
  final IconData? icon;
  final Widget? leading;
  final VoidCallback onTap;

  const FluxerBottomSheetSubmenuItem({
    required this.label,
    required this.onTap,
    this.hint,
    this.icon,
    this.leading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FluxerBottomSheetMenuItem(
      label: label,
      hint: hint,
      icon: icon,
      leading: leading,
      onTap: onTap,
      trailing: PhosphorIcon(
        PhosphorIconsBold.caretRight,
        size: 16,
        color: context.colors.textSecondary,
      ),
    );
  }
}

class FluxerBottomSheetMenuRadioItem extends StatelessWidget {
  const FluxerBottomSheetMenuRadioItem({
    required this.label,
    required this.onTap,
    required this.isSelected,
    super.key,
    this.hint,
    this.enabled = true,
  });

  final String label;
  final String? hint;
  final VoidCallback onTap;
  final bool isSelected;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final FluxerColorTheme colors = context.colors;

    return FluxerTappable(
      enabled: enabled,
      onTap: onTap,
      semanticLabel: hint != null ? '$label. $hint' : label,
      excludeChildSemantics: true,
      builder: (BuildContext context, Set<WidgetState> states) {
        final bool isPressed = states.contains(WidgetState.pressed);

        return AnimatedContainer(
          duration: context.motion.fast,
          curve: context.motion.curve,
          color: isPressed ? colors.listItemPressedBg : Colors.transparent,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 56),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          label,
                          style: context.textStyles.username.copyWith(
                            color: enabled
                                ? colors.textPrimary
                                : colors.textTertiary,
                          ),
                        ),
                        if (hint != null)
                          Text(
                            hint!,
                            style: context.textStyles.timestamp.copyWith(
                              color: colors.textTertiary,
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  FluxerRadioIndicator(selected: isSelected),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class FluxerBottomSheetGroupColumn extends StatelessWidget {
  final List<Widget> children;

  const FluxerBottomSheetGroupColumn({required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < children.length; i++) ...[
          children[i],
          if (i < children.length - 1) const SizedBox(height: 16),
        ],
      ],
    );
  }
}

class FluxerBottomSheetCheckboxItem extends StatelessWidget {
  final String label;
  final bool isChecked;
  final VoidCallback onTap;

  const FluxerBottomSheetCheckboxItem({
    required this.label,
    required this.isChecked,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return FluxerTappable(
      onTap: onTap,
      semanticLabel: label,
      checked: isChecked,
      excludeChildSemantics: true,
      builder: (context, states) {
        return ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 56),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: context.textStyles.username.copyWith(
                      color: colors.textPrimary,
                    ),
                  ),
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isChecked
                          ? colors.brandPrimary
                          : colors.backgroundHeaderSecondary,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(3),
                    color: isChecked ? colors.brandPrimary : Colors.transparent,
                  ),
                  child: isChecked
                      ? Center(
                          child: PhosphorIcon(
                            PhosphorIconsBold.check,
                            size: 12,
                            color: colors.textOnBrandPrimary,
                          ),
                        )
                      : null,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

@FluxerWidgetPreview(name: 'Drag handle', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetDragHandlePreview() {
  return const FluxerBottomSheetDragHandle();
}

@FluxerWidgetPreview(name: 'Header', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetHeaderPreview() {
  return const FluxerBottomSheetHeader(
    title: 'Invite friends',
    subtitle: Text('Share this server with people you trust.'),
  );
}

@FluxerWidgetPreview(name: 'Submenu header', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetSubmenuHeaderPreview() {
  return FluxerBottomSheetSubmenuHeader(
    title: 'Notification settings',
    onBack: () {},
  );
}

@FluxerWidgetPreview(name: 'Content', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetContentPreview() {
  return const FluxerBottomSheetContent(
    scrollable: false,
    child: Text('Sheet body content goes here.'),
  );
}

@FluxerWidgetPreview(name: 'Section', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetSectionPreview() {
  return const FluxerBottomSheetSection(
    title: 'Privacy',
    child: Text('Section children'),
  );
}

@FluxerWidgetPreview(name: 'Footer', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetFooterPreview() {
  return FluxerBottomSheetFooter(
    showTopBorder: true,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(onPressed: () {}, child: const Text('Cancel')),
        const SizedBox(width: 8),
        FilledButton(onPressed: () {}, child: const Text('Save')),
      ],
    ),
  );
}

@FluxerWidgetPreview(name: 'Menu group', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetMenuGroupPreview() {
  return FluxerMenuGroup(
    children: [
      FluxerBottomSheetMenuItem(
        label: 'Edit channel',
        icon: PhosphorIconsBold.pencilSimple,
        onTap: () {},
      ),
      FluxerBottomSheetMenuItem(
        label: 'Delete channel',
        hint: 'Cannot be undone',
        icon: PhosphorIconsBold.trash,
        isDanger: true,
        onTap: () {},
      ),
    ],
  );
}

@FluxerWidgetPreview(name: 'Menu item selected', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetMenuItemSelectedPreview() {
  return FluxerBottomSheetMenuItem(
    label: 'Dark',
    isSelected: true,
    onTap: () {},
  );
}

@FluxerWidgetPreview(name: 'Submenu item', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetSubmenuItemPreview() {
  return FluxerBottomSheetSubmenuItem(
    label: 'Change nickname',
    onTap: () {},
    icon: PhosphorIconsBold.user,
  );
}

@FluxerWidgetPreview(name: 'Checkbox item', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetCheckboxItemPreview() {
  return FluxerBottomSheetCheckboxItem(
    label: 'Mute @mentions',
    isChecked: true,
    onTap: () {},
  );
}

@FluxerWidgetPreview(name: 'Group column', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetGroupColumnPreview() {
  return FluxerBottomSheetGroupColumn(
    children: [
      FluxerBottomSheetMenuItem(label: 'First', onTap: () {}),
      FluxerBottomSheetMenuItem(label: 'Second', onTap: () {}),
    ],
  );
}
