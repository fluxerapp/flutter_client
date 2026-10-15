import 'dart:async';
import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/obscuring_overlay_tracker_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet_drag.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_sheet_motion.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_sheet_scroll.dart';
import 'package:fluxer_app/features/ui/overlay/fluxer_overlay_back_handler.dart';
import 'package:fluxer_app/features/ui/preview/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/radio_group/fluxer_radio_group.dart';
import 'package:fluxer_app/features/ui/selected_check/fluxer_selected_check.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

typedef FluxerBottomSheetBuilder =
    Widget Function(BuildContext context, VoidCallback close);

typedef FluxerScrollableBottomSheetBuilder =
    Widget Function(
      BuildContext context,
      ScrollController scrollController,
      VoidCallback close,
    );

enum FluxerBottomSheetVariant { content, menu }

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
  Color? barrierColor,
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
    modalBarrierColor: barrierColor ?? kFluxerSheetScrimColor,
    enableDrag: false,
    useSafeArea: useSafeArea,
    sheetAnimationStyle: animationStyle,
  );
  _lastSheetByNavigator[navigator] = route;
  return navigator.push(route);
}

final Expando<FluxerSheetRoute<dynamic>> _lastSheetByNavigator =
    Expando<FluxerSheetRoute<dynamic>>();

void closeFluxerSheetOpenedFrom(
  BuildContext context, {
  bool useRootNavigator = false,
}) {
  final NavigatorState? navigator = Navigator.maybeOf(
    context,
    rootNavigator: useRootNavigator,
  );
  final FluxerSheetRoute<dynamic>? last = navigator == null
      ? null
      : _lastSheetByNavigator[navigator];
  if (last == null || !identical(last.origin, ModalRoute.of(context))) {
    return;
  }
  last.closeSelf();
}

Future<void> handOffFluxerSheet(BuildContext context) {
  final NavigatorState? navigator = Navigator.maybeOf(context);
  final FluxerSheetRoute<dynamic>? closing = navigator == null
      ? null
      : _lastSheetByNavigator[navigator];
  closing?.holdScrimForHandoff();
  final Animation<double>? exit = closing?.animation;
  bool settled() =>
      exit!.status != AnimationStatus.reverse ||
      exit.value <= kFluxerSheetHandoffRemaining;
  if (exit == null || settled()) {
    return Future<void>.value();
  }
  final Completer<void> done = Completer<void>();
  void check() {
    if (settled()) {
      exit.removeListener(check);
      done.complete();
    }
  }

  exit.addListener(check);
  return done.future;
}

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

class FluxerBottomSheet {
  FluxerBottomSheet._();

  static const double scrollableSheetSize = kFluxerBottomSheetFullSize;
  static const double scrollableSheetHalfSize = kFluxerBottomSheetHalfSize;

  static double scrollBottomPaddingOf(BuildContext context) {
    return FluxerBottomSheetScope.maybeOf(context)?.bottomScrollPadding ?? 0;
  }

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

  static bool isInSheet(BuildContext context) {
    return _FluxerSheetSurfaceScope.contains(context);
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
    Color? barrierColor,
  }) {
    final layout = context.layout;

    return _showWithOverlayTracking<T>(
      context,
      () => _pushFluxerSheetRoute<T>(
        context,
        useRootNavigator: useRootNavigator,
        isDismissible: isDismissible,
        barrierColor: barrierColor,
        animationStyle: fluxerBottomSheetAnimationStyle(context),
        useSafeArea: reserveBottomInset,
        builder: (sheetContext) {
          void close() => _closeSheet(sheetContext);

          final bool isMenuVariant = variant == FluxerBottomSheetVariant.menu;
          final bool hasHeader = _hasSheetHeader(
            title: title,
            subtitle: subtitle,
            leading: leading,
            trailing: trailing,
            onBack: onBack,
          );

          final Widget content = _FluxerSheetKeyboardInset(
            enabled: manageKeyboardInset,
            builder: (BuildContext insetContext, double keyboardInset) {
              final mediaQuery = MediaQuery.of(insetContext);
              final double maxContentHeight =
                  mediaQuery.size.height -
                  mediaQuery.viewPadding.top -
                  layout.s4;
              final bottomPadding = _effectiveBottomSheetBottomPadding(
                insetContext,
                reserveBottomInset,
                keyboardBottomInset: keyboardInset,
              );
              return Padding(
                padding: EdgeInsets.only(bottom: keyboardInset),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: maxHeight != null
                        ? maxContentHeight * maxHeight
                        : maxContentHeight,
                  ),
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
              );
            },
          );

          final sheetContent = _FluxerSheetPresentation(
            navigator: Navigator.of(
              sheetContext,
              rootNavigator: useRootNavigator,
            ),
            enableDrag: enableDrag,
            onDismiss: close,
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
    bool isDismissible = true,
    bool reserveBottomInset = true,
    bool manageKeyboardInset = true,
    double? sheetHeight,
    AnimationStyle? animationStyle,
    Color? barrierColor,
  }) {
    final layout = context.layout;
    final bool cardBackdrop = sheetHeight == null;
    final double effectiveMaxChildSize = sheetHeight != null
        ? 1
        : maxHeight ?? maxChildSize;
    final double effectiveInitialChildSize = sheetHeight != null
        ? 1
        : math.min(initialChildSize, effectiveMaxChildSize);
    final bool parallax =
        cardBackdrop &&
        _fluxerSheetOpensFullHeight(
          initialChildSize: effectiveInitialChildSize,
          maxChildSize: effectiveMaxChildSize,
        );

    return _showWithOverlayTracking<T>(
      context,
      () => _pushFluxerSheetRoute<T>(
        context,
        useRootNavigator: useRootNavigator,
        isDismissible: isDismissible,
        barrierColor: barrierColor,
        animationStyle:
            animationStyle ??
            fluxerBottomSheetAnimationStyle(
              context,
              leadBackdrop: parallax && _fluxerSheetDrivesBackdrop(context),
            ),
        useSafeArea: reserveBottomInset,
        builder: (sheetContext) {
          void close() => _closeSheet(sheetContext);

          final bool hasHeader = _hasSheetHeader(
            title: title,
            subtitle: subtitle,
            leading: leading,
            trailing: trailing,
            onBack: onBack,
          );

          final Widget sheet = _FluxerSheetKeyboardInset(
            enabled: manageKeyboardInset,
            builder: (BuildContext insetContext, double keyboardInset) {
              final mediaQuery = MediaQuery.of(insetContext);
              final double availableHeight =
                  sheetHeight ??
                  mediaQuery.size.height -
                      mediaQuery.viewPadding.top -
                      layout.s4;
              final double halfChildSize = cardBackdrop
                  ? scrollableSheetHalfSize.clamp(0, effectiveMaxChildSize)
                  : effectiveMaxChildSize;
              return FluxerDraggableScrollableSheet(
                minChildSize: math.min(
                  kFluxerBottomSheetDragMinSize,
                  math.min(minChildSize, effectiveMaxChildSize),
                ),
                maxChildSize: effectiveMaxChildSize,
                halfChildSize: halfChildSize,
                initialChildSize: effectiveInitialChildSize,
                maxHeight: availableHeight,
                fitContent: cardBackdrop,
                showDragHandle: showDragHandle,
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
                bottomScrollPadding: _effectiveBottomSheetBottomPadding(
                  insetContext,
                  reserveBottomInset,
                  keyboardBottomInset: keyboardInset,
                ),
                sheetContext: sheetContext,
                builder: builder,
              );
            },
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

bool _fluxerSheetOpensFullHeight({
  required double initialChildSize,
  required double maxChildSize,
}) {
  return initialChildSize >= maxChildSize - _kSheetSizeEpsilon &&
      maxChildSize >= kFluxerBottomSheetFullSize - _kSheetSizeEpsilon;
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
  if (!reserveBottomInset) {
    return 0;
  }
  return math.max(
    0,
    _fluxerSystemBottomInset(MediaQuery.of(context)) - keyboardBottomInset,
  );
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
  return isMobileLayout(context) &&
      Theme.of(context).platform != TargetPlatform.android &&
      !MediaQuery.disableAnimationsOf(context);
}

class _FluxerSheetKeyboardInset extends StatefulWidget {
  const _FluxerSheetKeyboardInset({
    required this.enabled,
    required this.builder,
  });

  final bool enabled;
  final Widget Function(BuildContext context, double keyboardInset) builder;

  @override
  State<_FluxerSheetKeyboardInset> createState() =>
      _FluxerSheetKeyboardInsetState();
}

class _FluxerSheetKeyboardInsetState extends State<_FluxerSheetKeyboardInset> {
  Animation<double>? _routeAnimation;
  bool _closing = false;
  double _inset = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Animation<double>? animation = ModalRoute.of(context)?.animation;
    if (identical(animation, _routeAnimation)) {
      return;
    }
    _routeAnimation?.removeStatusListener(_handleRouteStatus);
    _routeAnimation = animation?..addStatusListener(_handleRouteStatus);
    _closing = _isClosing(animation?.status);
  }

  @override
  void dispose() {
    _routeAnimation?.removeStatusListener(_handleRouteStatus);
    super.dispose();
  }

  static bool _isClosing(AnimationStatus? status) {
    return status == AnimationStatus.reverse;
  }

  void _handleRouteStatus(AnimationStatus status) {
    final bool closing = _isClosing(status);
    if (closing != _closing) {
      setState(() => _closing = closing);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_closing) {
      _inset = widget.enabled ? MediaQuery.viewInsetsOf(context).bottom : 0;
    }
    return widget.builder(context, _inset);
  }
}

class _FluxerSheetPresentation extends StatefulWidget {
  const _FluxerSheetPresentation({
    required this.navigator,
    required this.enableDrag,
    required this.onDismiss,
    required this.child,
  });

  final NavigatorState navigator;
  final bool enableDrag;
  final VoidCallback onDismiss;
  final Widget child;

  @override
  State<_FluxerSheetPresentation> createState() =>
      _FluxerSheetPresentationState();
}

class _FluxerSheetPresentationState extends State<_FluxerSheetPresentation>
    with SingleTickerProviderStateMixin
    implements FluxerSheetDragTarget {
  final ValueNotifier<double> _dragOffset = ValueNotifier<double>(0);
  final ValueNotifier<double> _recede = ValueNotifier<double>(0);
  late final FluxerSheetScrollController _scrollController =
      FluxerSheetScrollController(this);
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
      _backdrop ??= FluxerSheetBackdropLink(
        widget.navigator,
        route: ModalRoute.of(context),
        onCovered: _reportBackdrop,
      );
    } else {
      _backdrop?.dispose();
      _backdrop = null;
      _recede.value = 0;
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

  double? get _sheetHeight {
    final RenderObject? box = context.findRenderObject();
    return box is RenderBox && box.hasSize ? box.size.height : null;
  }

  @override
  void dispose() {
    _routeAnimation?.removeListener(_reportBackdrop);
    _backdrop?.dispose();
    _settle.dispose();
    _scrollController.dispose();
    _dragOffset.dispose();
    _recede.dispose();
    super.dispose();
  }

  @override
  bool get canExpand => false;

  @override
  void dragBy(double deltaDy) {
    if (!widget.enableDrag) {
      return;
    }
    _settle.stop();
    if (deltaDy > 0 && MediaQuery.viewInsetsOf(context).bottom > 0) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
    _dragOffset.value = math.max(0, _dragOffset.value + deltaDy);
  }

  @override
  void endDrag(double velocityDy) {
    if (!widget.enableDrag) {
      return;
    }
    final double offset = _dragOffset.value;
    if (offset > 0 &&
        fluxerBottomSheetShouldDismissAfterDrag(
          dragDistance: offset,
          velocity: velocityDy,
          sheetHeight: _sheetHeight ?? double.infinity,
        )) {
      widget.onDismiss();
      return;
    }
    _settleBack();
  }

  void _settleBack() {
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
    final double? height = _sheetHeight;
    if (route == null || animation == null || height == null || height <= 0) {
      return;
    }
    final double travel = (1 - _dragOffset.value / height).clamp(0, 1);
    if (route is FluxerSheetRoute) {
      route.setScrimTravel(travel);
    }
    final FluxerSheetBackdropLink? backdrop = _backdrop;
    if (backdrop == null) {
      return;
    }
    if (!backdrop.covers(height)) {
      _recede.value = 0;
      backdrop.report(0);
      return;
    }
    final double depth = backdrop.depth;
    _recede.value = depth;
    backdrop.report(
      fluxerSheetBackdropProgress(animation, route.transitionDuration) *
          travel *
          (1 + depth),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _FluxerSheetDragTargetScope(
      target: this,
      child: PrimaryScrollController(
        controller: _scrollController,
        child: ValueListenableBuilder<double>(
          valueListenable: _recede,
          child: ValueListenableBuilder<double>(
            valueListenable: _dragOffset,
            child: widget.child,
            builder: (BuildContext context, double offset, Widget? child) {
              return Transform.translate(
                offset: Offset(0, offset),
                child: child,
              );
            },
          ),
          builder: (BuildContext context, double depth, Widget? child) =>
              fluxerSheetRecede(depth: depth, child: child!),
        ),
      ),
    );
  }
}

class _FluxerSheetDragTargetScope extends InheritedWidget {
  const _FluxerSheetDragTargetScope({
    required this.target,
    required super.child,
  });

  final FluxerSheetDragTarget target;

  static FluxerSheetDragTarget? maybeOf(BuildContext context) {
    return context
        .getInheritedWidgetOfExactType<_FluxerSheetDragTargetScope>()
        ?.target;
  }

  @override
  bool updateShouldNotify(_FluxerSheetDragTargetScope oldWidget) =>
      target != oldWidget.target;
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

const double kFluxerSheetHandleTop = 8;
const double kFluxerSheetHandleGap = 18;
const double kFluxerSheetHandleWidth = 36;
const double kFluxerSheetHandleThickness = 4;
const double kFluxerSheetHandleHeight =
    kFluxerSheetHandleTop + kFluxerSheetHandleThickness + kFluxerSheetHandleGap;

const double _kSheetSizeEpsilon = 0.001;

class FluxerDraggableScrollableSheet extends StatefulWidget {
  const FluxerDraggableScrollableSheet({
    required this.minChildSize,
    required this.maxChildSize,
    required this.halfChildSize,
    required this.initialChildSize,
    required this.maxHeight,
    required this.fitContent,
    required this.showDragHandle,
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
    super.key,
  });

  final double minChildSize;
  final double maxChildSize;
  final double halfChildSize;
  final double initialChildSize;
  final double maxHeight;
  final bool fitContent;
  final bool showDragHandle;
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
  State<FluxerDraggableScrollableSheet> createState() =>
      _FluxerDraggableScrollableSheetState();
}

class _FluxerDraggableScrollableSheetState
    extends State<FluxerDraggableScrollableSheet>
    with SingleTickerProviderStateMixin
    implements FluxerSheetDragTarget {
  late final AnimationController _size = AnimationController.unbounded(
    vsync: this,
    value: widget.initialChildSize,
  )..addListener(_reportBackdrop);
  final ValueNotifier<double> _recede = ValueNotifier<double>(0);
  late final FluxerSheetScrollController _scrollController =
      FluxerSheetScrollController(
        this,
        dragsWhenShort: true,
        onContentExtent: widget.fitContent ? _handleContentExtent : null,
      );

  bool _dismissed = false;
  bool _routeDidEnter = false;
  bool _dragging = false;
  bool _fitScheduled = false;
  bool _shown = false;
  double _available = 0;
  double _layoutHeight = 0;
  double _contentHeight = 0;
  late double _restingSize = widget.initialChildSize;
  Animation<double>? _routeAnimation;
  FluxerSheetBackdropLink? _backdrop;
  ModalRoute<dynamic>? _route;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _shown = true);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_topSnapIsFull && _fluxerSheetDrivesBackdrop(context)) {
      _backdrop ??= FluxerSheetBackdropLink(
        widget.navigator,
        route: ModalRoute.of(context),
        onCovered: _reportBackdrop,
      );
    } else {
      _backdrop?.dispose();
      _backdrop = null;
      _recede.value = 0;
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
  void didUpdateWidget(FluxerDraggableScrollableSheet oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.bottomInset <= 0 && widget.bottomInset > 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _expandForKeyboard());
    } else if (widget.bottomInset < oldWidget.bottomInset) {
      _scheduleFit();
    }
  }

  double get _maxSize {
    if (_contentHeight <= 0 || _available <= 0) {
      return widget.maxChildSize;
    }
    return math.min(
      widget.maxChildSize,
      (_contentHeight + widget.bottomInset) / _available,
    );
  }

  double get _halfSize => math.min(widget.halfChildSize, _maxSize);

  double get _restSize =>
      math.min(_halfSize, math.min(widget.initialChildSize, _maxSize));

  void _handleContentExtent(double viewportExtent, double contentExtent) {
    if ((contentExtent - viewportExtent).abs() < 0.5) {
      return;
    }
    final double height = _layoutHeight - viewportExtent + contentExtent;
    if (height <= _contentHeight + 0.5) {
      return;
    }
    _contentHeight = height;
    _scheduleFit(jump: !_shown);
  }

  void _scheduleFit({bool jump = false}) {
    if (_fitScheduled) {
      return;
    }
    _fitScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fitScheduled = false;
      if (!mounted || _dismissed || _dragging) {
        return;
      }
      final double target = math.min(_restingSize, _maxSize);
      if ((_size.value - target).abs() >= _kSheetSizeEpsilon) {
        if (jump) {
          _size.value = target;
        } else {
          _moveTo(target);
        }
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _routeAnimation
      ?..removeStatusListener(_markDismissedIfRouteClosing)
      ..removeListener(_reportBackdrop);
    _backdrop?.dispose();
    _size.dispose();
    _recede.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  bool get _topSnapIsFull =>
      widget.maxChildSize >= kFluxerBottomSheetFullSize - _kSheetSizeEpsilon &&
      widget.halfChildSize < widget.maxChildSize - _kSheetSizeEpsilon;

  void _expandForKeyboard() {
    if (!mounted || _dismissed || _dragging || !canExpand) {
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
    _restingSize = _maxSize;
    _moveTo(_restingSize);
  }

  void _moveTo(double target) {
    final FluxerMotionTheme motion = widget.sheetContext.motion;
    if (motion.panel <= Duration.zero) {
      _size.value = target;
      return;
    }
    _size.animateTo(target, duration: motion.panel, curve: motion.curve);
  }

  void _markDismissedIfRouteClosing(AnimationStatus status) {
    if (status == AnimationStatus.forward ||
        status == AnimationStatus.completed) {
      _routeDidEnter = true;
      return;
    }
    if (_routeDidEnter &&
        (status == AnimationStatus.reverse ||
            status == AnimationStatus.dismissed)) {
      _dismissed = true;
    }
  }

  void _reportBackdrop() {
    final ModalRoute<dynamic>? route = _route;
    final Animation<double>? animation = _routeAnimation;
    if (route == null || animation == null) {
      return;
    }
    final double restSize = _restSize;
    final double travel = restSize > 0
        ? (_size.value / restSize).clamp(0, 1)
        : 1;
    if (route is FluxerSheetRoute) {
      route.setScrimTravel(travel);
    }
    final FluxerSheetBackdropLink? backdrop = _backdrop;
    if (backdrop == null) {
      return;
    }
    final double fullness =
        ((_size.value - widget.halfChildSize) /
                (widget.maxChildSize - widget.halfChildSize))
            .clamp(0, 1);
    final double depth = backdrop.depth * fullness;
    _recede.value = depth;
    backdrop.report(
      fluxerSheetBackdropProgress(animation, route.transitionDuration) *
          fullness *
          (1 + depth),
    );
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

  @override
  bool get canExpand => _size.value < _maxSize - _kSheetSizeEpsilon;

  @override
  void dragBy(double deltaDy) {
    if (_dismissed || _available <= 0) {
      return;
    }
    _dragging = true;
    if (deltaDy > 0 && MediaQuery.viewInsetsOf(context).bottom > 0) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
    _size.value = fluxerBottomSheetSizeAfterDrag(
      currentSize: _size.value,
      deltaDy: deltaDy,
      availablePixels: _available,
      minChildSize: widget.minChildSize,
      maxChildSize: _maxSize,
    );
  }

  @override
  void endDrag(double velocityDy) {
    _dragging = false;
    if (_dismissed || _available <= 0) {
      return;
    }
    final double size = _size.value;
    final double? target = fluxerBottomSheetSnapTarget(
      size: size,
      halfSize: _halfSize,
      fullSize: _maxSize,
      velocity: velocityDy,
      availablePixels: _available,
    );
    if (target == null) {
      _dismiss();
      return;
    }
    _restingSize = target;
    if ((size - target).abs() < _kSheetSizeEpsilon) {
      return;
    }
    _moveTo(target);
  }

  @override
  Widget build(BuildContext context) {
    final layout = widget.sheetContext.layout;
    final Widget surface = _wrapBottomSheetSurface(
      context: widget.sheetContext,
      child: Padding(
        padding: EdgeInsets.only(bottom: widget.bottomInset),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double restHeight =
                _restSize * _available - widget.bottomInset;
            final double layoutHeight = math.max(
              constraints.maxHeight,
              math.max(
                restHeight,
                math.min(160, _maxSize * _available - widget.bottomInset),
              ),
            );
            _layoutHeight = layoutHeight;
            return OverflowBox(
              alignment: Alignment.topCenter,
              minHeight: layoutHeight,
              maxHeight: layoutHeight,
              child: SizedBox(
                height: layoutHeight,
                child: Column(
                  children: [
                    if (widget.showDragHandle)
                      const FluxerBottomSheetDragHandle(),
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
                          bottomScrollPadding: widget.bottomScrollPadding,
                          child: Builder(
                            builder: (scopedContext) => widget.builder(
                              scopedContext,
                              _scrollController,
                              _dismiss,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
    return _FluxerSheetDragTargetScope(
      target: this,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          _available = math.min(widget.maxHeight, constraints.maxHeight);
          return ValueListenableBuilder<double>(
            valueListenable: _recede,
            child: AnimatedBuilder(
              animation: _size,
              child: surface,
              builder: (BuildContext context, Widget? child) => SizedBox(
                height: math.max(0, _size.value * _available),
                child: child,
              ),
            ),
            builder: (BuildContext context, double depth, Widget? child) =>
                fluxerSheetRecede(depth: depth, child: child!),
          );
        },
      ),
    );
  }
}

class FluxerBottomSheetDragArea extends StatefulWidget {
  const FluxerBottomSheetDragArea({
    required this.child,
    super.key,
    this.onDismiss,
    this.behavior = HitTestBehavior.opaque,
  });

  final Widget child;
  final VoidCallback? onDismiss;
  final HitTestBehavior behavior;

  @override
  State<FluxerBottomSheetDragArea> createState() =>
      _FluxerBottomSheetDragAreaState();
}

class _FluxerBottomSheetDragAreaState extends State<FluxerBottomSheetDragArea> {
  double _dragDistance = 0;

  FluxerSheetDragTarget? get _target =>
      _FluxerSheetDragTargetScope.maybeOf(context);

  bool get _canDrag => _target != null || widget.onDismiss != null;

  void _handleVerticalDragStart(DragStartDetails details) {
    _dragDistance = 0;
  }

  void _handleVerticalDragUpdate(DragUpdateDetails details) {
    final FluxerSheetDragTarget? target = _target;
    if (target != null) {
      target.dragBy(details.delta.dy);
      return;
    }
    _dragDistance += details.delta.dy;
  }

  void _handleVerticalDragEnd(DragEndDetails details) {
    final double velocity = details.primaryVelocity ?? 0;
    final FluxerSheetDragTarget? target = _target;
    if (target != null) {
      target.endDrag(velocity);
      return;
    }
    final double distance = _dragDistance;
    _dragDistance = 0;
    if (fluxerBottomSheetShouldDismissAfterDrag(
      dragDistance: distance,
      velocity: velocity,
      sheetHeight: context.size?.height ?? double.infinity,
    )) {
      widget.onDismiss?.call();
    }
  }

  void _handleVerticalDragCancel() {
    _target?.endDrag(0);
  }

  @override
  Widget build(BuildContext context) {
    return FluxerGestureDetector(
      behavior: widget.behavior,
      onVerticalDragStart: _canDrag ? _handleVerticalDragStart : null,
      onVerticalDragUpdate: _canDrag ? _handleVerticalDragUpdate : null,
      onVerticalDragEnd: _canDrag ? _handleVerticalDragEnd : null,
      onVerticalDragCancel: _canDrag ? _handleVerticalDragCancel : null,
      child: widget.child,
    );
  }
}

class FluxerBottomSheetDragHandle extends StatelessWidget {
  const FluxerBottomSheetDragHandle({super.key, this.onDismiss});

  final VoidCallback? onDismiss;

  @override
  Widget build(BuildContext context) {
    return FluxerBottomSheetDragArea(
      onDismiss: onDismiss,
      child: const SizedBox(
        height: kFluxerSheetHandleHeight,
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: kFluxerSheetHandleTop),
            child: FluxerSheetHandleBar(),
          ),
        ),
      ),
    );
  }
}

class FluxerSheetHandleBar extends StatelessWidget {
  const FluxerSheetHandleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kFluxerSheetHandleWidth,
      height: kFluxerSheetHandleThickness,
      decoration: BoxDecoration(
        color: context.colors.backgroundModifierAccent,
        borderRadius: BorderRadius.circular(kFluxerSheetHandleThickness / 2),
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
      padding: EdgeInsets.symmetric(horizontal: layout.pageGutter),
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
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
      padding: padding ?? EdgeInsets.symmetric(horizontal: layout.pageGutter),
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
      padding: padding ?? EdgeInsets.symmetric(horizontal: layout.pageGutter),
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
          padding:
              padding ??
              EdgeInsets.symmetric(
                horizontal: layout.pageGutter,
                vertical: layout.s4,
              ),
          child: child,
        ),
      ),
    );
  }
}

class FluxerMenuGroup extends StatelessWidget {
  final List<Widget> children;

  const FluxerMenuGroup({required this.children, super.key});

  static bool isGrouped(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_FluxerMenuGroupScope>() !=
      null;

  static Widget ensureGrouped(BuildContext context, Widget row) =>
      isGrouped(context) ? row : FluxerMenuGroup(children: [row]);

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) {
      return const SizedBox.shrink();
    }

    final layout = context.layout;

    return Material(
      color: FluxerBottomSheet.cardColorOf(context),
      surfaceTintColor: Colors.transparent,
      borderRadius: layout.radiusXxl,
      clipBehavior: Clip.antiAlias,
      child: _FluxerMenuGroupScope(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _intersperseDividers(
            children,
            dividerColor: context.colors.backgroundModifierAccent,
            dividerInset: layout.groupRowInset,
          ),
        ),
      ),
    );
  }
}

class _FluxerMenuGroupScope extends InheritedWidget {
  const _FluxerMenuGroupScope({required super.child});

  @override
  bool updateShouldNotify(_FluxerMenuGroupScope oldWidget) => false;
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
  final bool? toggled;
  final Color? labelColor;

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
    this.toggled,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final baseColor =
        labelColor ?? (isDanger ? colors.menuDangerText : colors.textPrimary);

    return FluxerTappable(
      enabled: enabled,
      onTap: onTap,
      selected: isSelected,
      toggled: toggled,
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
              padding: EdgeInsets.symmetric(
                horizontal: context.layout.groupRowInset,
                vertical: 14,
              ),
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
                    const FluxerSelectedCheck(),
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
              padding: EdgeInsets.symmetric(
                horizontal: context.layout.groupRowInset,
                vertical: 14,
              ),
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
            padding: EdgeInsets.symmetric(
              horizontal: context.layout.groupRowInset,
              vertical: 14,
            ),
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
