import 'dart:math' as math;

import 'package:cupertino_ui/cupertino_ui.dart' hide RichText, Text;
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/obscuring_overlay_tracker_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/hosted_ui/iphone_duo_hosted_ui.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_sheet_motion.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_sheet_scroll.dart';
import 'package:fluxer_app/features/ui/overlay/fluxer_overlay_back_handler.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

typedef FluxerScrollablePageSheetBuilder =
    Widget Function(
      BuildContext context,
      ScrollController scrollController,
      VoidCallback close,
    );

enum FluxerPageSheetPresentation { root, nested }

const Color _kPageSheetBarrierColor = Color(0x55000000);
const Duration _kPageSheetSettleDuration = Duration(milliseconds: 300);
const double _kPageSheetFlingVelocity = 2;
const double _kPageSheetCloseProgress = 0.52;
const double _kPageSheetHeaderTop = 8;
const double _kPageSheetHeaderBarHeight = 48;
const double _kPageSheetHeaderIconSize = 22;
const double _kPageSheetHeaderButtonSize = 48;
const double _kPageSheetHeaderTitleGap = 16;
const double _kPageSheetHeaderGlyphInset =
    (_kPageSheetHeaderButtonSize - _kPageSheetHeaderIconSize) / 2;

class FluxerPageSheet {
  FluxerPageSheet._();

  static bool get _useCupertinoPageSheet =>
      defaultTargetPlatform == TargetPlatform.iOS;

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

  static Future<T?> showScrollable<T>(
    BuildContext context, {
    required FluxerScrollablePageSheetBuilder builder,
    String? title,
    Widget? titleTrailing,
    Color? backgroundColor,
    Color? foregroundColor,
    FluxerPageSheetPresentation presentation =
        FluxerPageSheetPresentation.nested,
    ValueNotifier<bool>? canDismissNotifier,
    bool useRootNavigator = true,
  }) {
    return _showWithOverlayTracking<T>(context, () {
      if (_useCupertinoPageSheet) {
        return _showCupertinoScrollable<T>(
          context,
          builder: builder,
          title: title,
          titleTrailing: titleTrailing,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          presentation: presentation,
          canDismissNotifier: canDismissNotifier,
        );
      }
      return _showMaterialScrollable<T>(
        context,
        builder: builder,
        title: title,
        titleTrailing: titleTrailing,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        presentation: presentation,
        canDismissNotifier: canDismissNotifier,
        useRootNavigator: useRootNavigator,
      );
    });
  }

  static Future<T?> _showCupertinoScrollable<T>(
    BuildContext context, {
    required FluxerScrollablePageSheetBuilder builder,
    required FluxerPageSheetPresentation presentation,
    String? title,
    Widget? titleTrailing,
    Color? backgroundColor,
    Color? foregroundColor,
    ValueNotifier<bool>? canDismissNotifier,
  }) {
    if (presentation == FluxerPageSheetPresentation.nested &&
        CupertinoSheetRoute.hasParentSheet(context)) {
      return Navigator.of(context).push<T>(
        CupertinoPageRoute<T>(
          builder: (BuildContext routeContext) {
            return _FluxerPageSheetScrollableHost<T>(
              builder: builder,
              title: title,
              titleTrailing: titleTrailing,
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              presentation: presentation,
              canDismissNotifier: canDismissNotifier,
            );
          },
        ),
      );
    }

    final bool useNestedNavigation =
        presentation == FluxerPageSheetPresentation.root;
    final GlobalKey<NavigatorState> nestedNavigatorKey =
        GlobalKey<NavigatorState>();

    late final _FluxerCupertinoSheetRoute<T> route;
    route = _FluxerCupertinoSheetRoute<T>(
      scrollableBuilder: (BuildContext sheetContext, ScrollController _) {
        final Widget page = _FluxerPageSheetScrollableHost<T>(
          builder: builder,
          title: title,
          titleTrailing: titleTrailing,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          presentation: presentation,
          canDismissNotifier: canDismissNotifier,
          closeSheet: useNestedNavigation,
        );
        return _FluxerPageSheetRouteScope(
          route: route,
          child: useNestedNavigation
              ? _nestedNavigation<T>(nestedNavigatorKey, page)
              : page,
        );
      },
    );
    return Navigator.of(context, rootNavigator: true).push<T>(route);
  }

  static Widget _nestedNavigation<T>(
    GlobalKey<NavigatorState> navigatorKey,
    Widget page,
  ) {
    return NavigatorPopHandler(
      onPopWithResult: (T? result) {
        navigatorKey.currentState!.maybePop();
      },
      child: Navigator(
        key: navigatorKey,
        initialRoute: '/',
        onGenerateInitialRoutes:
            (NavigatorState navigator, String initialRouteName) {
              return <Route<void>>[
                CupertinoPageRoute<void>(
                  builder: (BuildContext context) {
                    return PopScope(
                      canPop: false,
                      onPopInvokedWithResult: (bool didPop, Object? result) {
                        if (didPop) {
                          return;
                        }
                        Navigator.of(context, rootNavigator: true).pop(result);
                      },
                      child: page,
                    );
                  },
                ),
              ];
            },
      ),
    );
  }

  static Future<T?> _showMaterialScrollable<T>(
    BuildContext context, {
    required FluxerScrollablePageSheetBuilder builder,
    required FluxerPageSheetPresentation presentation,
    required bool useRootNavigator,
    String? title,
    Widget? titleTrailing,
    Color? backgroundColor,
    Color? foregroundColor,
    ValueNotifier<bool>? canDismissNotifier,
  }) {
    return Navigator.of(context, rootNavigator: useRootNavigator).push<T>(
      MaterialPageRoute<T>(
        fullscreenDialog: presentation == FluxerPageSheetPresentation.root,
        builder: (BuildContext routeContext) {
          return _FluxerPageSheetScrollableHost<T>(
            builder: builder,
            title: title,
            titleTrailing: titleTrailing,
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            presentation: presentation,
            canDismissNotifier: canDismissNotifier,
          );
        },
      ),
    );
  }
}

class _FluxerCupertinoSheetRoute<T> extends CupertinoSheetRoute<T>
    implements FluxerSheetDragTarget, FluxerSheetBackdropHost {
  _FluxerCupertinoSheetRoute({required super.scrollableBuilder})
    : super(enableDrag: false);

  bool _dragging = false;
  Animation<double>? _coveredBy;
  late Animation<double> _stackedSecondary;
  late final FluxerSheetBackdropProgress _covered =
      FluxerSheetBackdropProgress.of(this);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (!identical(_coveredBy, secondaryAnimation)) {
      _coveredBy = secondaryAnimation;
      _stackedSecondary = AnimationMax<double>(
        secondaryAnimation,
        _covered.animation,
      );
    }
    return ValueListenableBuilder<double>(
      valueListenable: _covered,
      child: super.buildTransitions(
        context,
        animation,
        _stackedSecondary,
        child,
      ),
      builder: (BuildContext context, double depth, Widget? child) =>
          fluxerSheetRecede(depth: math.max(0, depth - 1), child: child!),
    );
  }

  @override
  Color? get barrierColor => _kPageSheetBarrierColor;

  bool get _reducedMotion {
    final NavigatorState? nav = navigator;
    return nav != null && MediaQuery.disableAnimationsOf(nav.context);
  }

  @override
  Duration get transitionDuration =>
      _reducedMotion ? Duration.zero : super.transitionDuration;

  Duration get _settleDuration =>
      _reducedMotion ? Duration.zero : _kPageSheetSettleDuration;

  @override
  DelegatedTransitionBuilder? get delegatedTransition => _recededTransition;

  Widget _recededTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    bool allowSnapshotting,
    Widget? child,
  ) {
    return ValueListenableBuilder<double>(
      valueListenable: _covered,
      child: _dimmedDelegatedTransition(
        context,
        animation,
        secondaryAnimation,
        allowSnapshotting,
        child,
      ),
      builder: (BuildContext context, double depth, Widget? child) =>
          fluxerSheetRecede(depth: depth, child: child!),
    );
  }

  double get _sheetHeight {
    final Size? size = navigator?.context.size;
    if (size == null || size.height <= 0) {
      return 1;
    }
    return size.height * (1 - topGap);
  }

  @override
  bool get canExpand => false;

  @override
  void dragBy(double deltaDy) {
    final AnimationController? sheet = controller;
    final NavigatorState? nav = navigator;
    if (sheet == null || nav == null || !isCurrent) {
      return;
    }
    if (!_dragging) {
      if (deltaDy <= 0 && sheet.value >= 1) {
        return;
      }
      _dragging = true;
      nav.didStartUserGesture();
    }
    sheet.value = (sheet.value - deltaDy / _sheetHeight).clamp(0, 1);
  }

  @override
  void endDrag(double velocityDy) {
    final AnimationController? sheet = controller;
    final NavigatorState? nav = navigator;
    if (!_dragging || sheet == null || nav == null) {
      return;
    }
    _dragging = false;
    final double velocity = velocityDy / _sheetHeight;
    final bool close = velocity.abs() >= _kPageSheetFlingVelocity
        ? velocity > 0
        : sheet.value <= _kPageSheetCloseProgress;
    if (close) {
      if (isCurrent) {
        nav.pop();
      }
      sheet.animateBack(0, duration: _settleDuration, curve: Curves.easeOut);
    } else {
      sheet.animateTo(1, duration: _settleDuration, curve: Curves.easeOut);
    }
    if (!sheet.isAnimating) {
      nav.didStopUserGesture();
      return;
    }
    void stopGesture(AnimationStatus status) {
      sheet.removeStatusListener(stopGesture);
      nav.didStopUserGesture();
    }

    sheet.addStatusListener(stopGesture);
  }
}

Widget _dimmedDelegatedTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  bool allowSnapshotting,
  Widget? child,
) {
  final CupertinoThemeData theme = CupertinoTheme.of(context);
  return CupertinoTheme(
    data: theme.copyWith(brightness: Brightness.light),
    child: Builder(
      builder: (BuildContext lightContext) =>
          CupertinoSheetTransition.delegateTransition(
            lightContext,
            animation,
            secondaryAnimation,
            allowSnapshotting,
            child == null ? null : CupertinoTheme(data: theme, child: child),
          ),
    ),
  );
}

class _FluxerPageSheetRouteScope extends InheritedWidget {
  const _FluxerPageSheetRouteScope({required this.route, required super.child});

  final FluxerSheetDragTarget route;

  static FluxerSheetDragTarget? maybeOf(BuildContext context) {
    return context
        .getInheritedWidgetOfExactType<_FluxerPageSheetRouteScope>()
        ?.route;
  }

  @override
  bool updateShouldNotify(_FluxerPageSheetRouteScope oldWidget) =>
      route != oldWidget.route;
}

class _FluxerPageSheetScrollableHost<T> extends StatefulWidget {
  const _FluxerPageSheetScrollableHost({
    required this.builder,
    required this.presentation,
    this.title,
    this.titleTrailing,
    this.backgroundColor,
    this.foregroundColor,
    this.canDismissNotifier,
    this.closeSheet = false,
  });

  final FluxerScrollablePageSheetBuilder builder;
  final String? title;
  final Widget? titleTrailing;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final FluxerPageSheetPresentation presentation;
  final ValueNotifier<bool>? canDismissNotifier;
  final bool closeSheet;

  @override
  State<_FluxerPageSheetScrollableHost<T>> createState() =>
      _FluxerPageSheetScrollableHostState<T>();
}

class _FluxerPageSheetScrollableHostState<T>
    extends State<_FluxerPageSheetScrollableHost<T>> {
  ScrollController? _scrollController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_scrollController != null) {
      return;
    }
    final FluxerSheetDragTarget? sheet = _FluxerPageSheetRouteScope.maybeOf(
      context,
    );
    _scrollController = sheet == null
        ? ScrollController()
        : FluxerSheetScrollController(sheet, dragsWhenShort: true);
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  void _close() {
    if (widget.closeSheet) {
      CupertinoSheetRoute.popSheet(context);
      return;
    }
    _closePageRoute(context);
  }

  @override
  Widget build(BuildContext context) {
    return _buildPageSheetWithBackHandler(
      canDismissNotifier: widget.canDismissNotifier,
      child: _FluxerPageSheetScaffold(
        title: widget.title,
        titleTrailing: widget.titleTrailing,
        backgroundColor: widget.backgroundColor,
        foregroundColor: widget.foregroundColor,
        presentation: widget.presentation,
        onClose: _close,
        child: widget.builder(context, _scrollController!, _close),
      ),
    );
  }
}

class _FluxerPageSheetScaffold extends StatelessWidget {
  const _FluxerPageSheetScaffold({
    required this.presentation,
    required this.onClose,
    required this.child,
    this.title,
    this.titleTrailing,
    this.backgroundColor,
    this.foregroundColor,
  });

  final String? title;
  final Widget? titleTrailing;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final FluxerPageSheetPresentation presentation;
  final VoidCallback onClose;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final Color barColor =
        backgroundColor ?? context.colors.backgroundSecondary;
    final EdgeInsets sideInsets = hostedUiSideInsets(context);
    return Scaffold(
      backgroundColor: barColor,
      body: Padding(
        padding: sideInsets,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _FluxerPageSheetHeader(
              title: title,
              titleTrailing: titleTrailing,
              foregroundColor: foregroundColor,
              isRoot: presentation == FluxerPageSheetPresentation.root,
              onClose: onClose,
            ),
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FluxerPageSheetHeader extends StatelessWidget {
  const _FluxerPageSheetHeader({
    required this.isRoot,
    required this.onClose,
    this.title,
    this.titleTrailing,
    this.foregroundColor,
  });

  final String? title;
  final Widget? titleTrailing;
  final Color? foregroundColor;
  final bool isRoot;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Color color = foregroundColor ?? context.colors.textPrimary;
    final double gutter = context.layout.pageGutter;
    final FluxerSheetDragTarget? sheet = _FluxerPageSheetRouteScope.maybeOf(
      context,
    );
    final double topInset = sheet == null
        ? MediaQuery.paddingOf(context).top
        : 0;
    final Widget bar = DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: context.colors.backgroundModifierAccent),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: topInset + _kPageSheetHeaderTop),
        child: SizedBox(
          height: _kPageSheetHeaderBarHeight,
          child: Row(
            children: <Widget>[
              SizedBox(width: gutter - _kPageSheetHeaderGlyphInset),
              IconButton(
                onPressed: onClose,
                tooltip: isRoot ? l10n.uiClose : l10n.back,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints.tightFor(
                  width: _kPageSheetHeaderButtonSize,
                  height: _kPageSheetHeaderButtonSize,
                ),
                icon: PhosphorIcon(
                  isRoot ? PhosphorIconsBold.x : PhosphorIconsBold.arrowLeft,
                  size: _kPageSheetHeaderIconSize,
                  color: color,
                ),
              ),
              const SizedBox(
                width: _kPageSheetHeaderTitleGap - _kPageSheetHeaderGlyphInset,
              ),
              Expanded(
                child: title == null
                    ? const SizedBox.shrink()
                    : Text(
                        title!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textStyles.channelName.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: color,
                        ),
                      ),
              ),
              ?titleTrailing,
              SizedBox(width: gutter),
            ],
          ),
        ),
      ),
    );
    if (sheet == null) {
      return bar;
    }
    return FluxerGestureDetector(
      behavior: HitTestBehavior.translucent,
      onVerticalDragUpdate: (DragUpdateDetails details) =>
          sheet.dragBy(details.delta.dy),
      onVerticalDragEnd: (DragEndDetails details) =>
          sheet.endDrag(details.primaryVelocity ?? 0),
      onVerticalDragCancel: () => sheet.endDrag(0),
      child: bar,
    );
  }
}

void _closePageRoute(BuildContext context) {
  if (!context.mounted) {
    return;
  }
  final ModalRoute<dynamic>? route = ModalRoute.of(context);
  if (route == null || !route.isActive) {
    return;
  }
  final NavigatorState navigator = Navigator.of(context);
  if (route.isCurrent) {
    navigator.pop();
    return;
  }
  navigator.removeRoute(route);
}

Widget _buildPageSheetWithBackHandler({
  required Widget child,
  required ValueNotifier<bool>? canDismissNotifier,
}) {
  if (canDismissNotifier == null) {
    return wrapFluxerOverlayBackHandler(
      canDismiss: true,
      onBack: null,
      onDismiss: null,
      child: child,
    );
  }

  return ValueListenableBuilder<bool>(
    valueListenable: canDismissNotifier,
    builder: (BuildContext context, bool canDismiss, Widget? sheetChild) {
      return wrapFluxerOverlayBackHandler(
        canDismiss: canDismiss,
        onBack: null,
        onDismiss: null,
        child: sheetChild!,
      );
    },
    child: child,
  );
}
