import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:cupertino_ui/cupertino_ui.dart' show CupertinoPageRoute;
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/app/obscuring_overlay_tracker_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/hosted_ui/hosted_ui_background_bleed.dart';
import 'package:fluxer_app/features/shell/hosted_ui/hosted_ui_material_wrap.dart';
import 'package:fluxer_app/features/shell/hosted_ui/iphone_duo_hosted_ui.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

Widget _duoPushPageShell({
  required Color backgroundColor,
  required VoidCallback onBack,
  required Widget child,
}) {
  return Material(
    color: backgroundColor,
    child: HostedUiBackgroundBleed(
      color: backgroundColor,
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, _) {
          if (didPop) {
            return;
          }
          onBack();
        },
        child: child,
      ),
    ),
  );
}

Widget _hostedUiFlowPage({
  required BuildContext context,
  required Color backgroundColor,
  required String title,
  required VoidCallback onBack,
  required Widget body,
}) {
  return _duoPushPageShell(
    backgroundColor: backgroundColor,
    onBack: onBack,
    child: AdaptiveScaffold(
      backgroundColor: backgroundColor,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AdaptiveAppBar(title: title),
      body: hostedUiMaterialWrap(context, color: backgroundColor, child: body),
    ),
  );
}

class FluxerFullscreenFlow {
  FluxerFullscreenFlow._();

  static Future<T?> show<T>(
    BuildContext context, {
    required WidgetBuilder builder,
  }) => _push<T>(context, _FluxerFlowRoute<T>(builder: builder));

  static Future<T?> push<T>(
    BuildContext context, {
    required WidgetBuilder builder,
  }) {
    final Route<T> route = defaultTargetPlatform == TargetPlatform.iOS
        ? CupertinoPageRoute<T>(builder: builder)
        : MaterialPageRoute<T>(builder: builder);
    return _push<T>(context, route);
  }

  static Future<T?> _push<T>(BuildContext context, Route<T> route) {
    final ProviderContainer container = ProviderScope.containerOf(context);
    container.read(obscuringOverlayTrackerProvider.notifier).push();
    return Navigator.of(context, rootNavigator: true)
        .push<T>(route)
        .whenComplete(
          () => container.read(obscuringOverlayTrackerProvider.notifier).pop(),
        );
  }
}

const double _kFlowDismissFlingVelocity = 2;
const double _kFlowDismissCloseProgress = 0.52;
const Duration _kFlowDismissSettleDuration = Duration(milliseconds: 300);

class _FluxerFlowRoute<T> extends MaterialPageRoute<T> {
  _FluxerFlowRoute({required super.builder}) : super(fullscreenDialog: true);

  bool _dragging = false;

  @override
  Widget buildContent(BuildContext context) {
    final Widget page = super.buildContent(context);
    if (defaultTargetPlatform != TargetPlatform.iOS) {
      return page;
    }
    return _FluxerFlowDismissRegion(route: this, child: page);
  }

  double get _height {
    final Size? size = navigator?.context.size;
    if (size == null || size.height <= 0) {
      return 1;
    }
    return size.height;
  }

  bool claimsScrollDrag(ScrollMetrics position, double delta) =>
      isCurrent &&
      (_dragging || (delta > 0 && position.pixels <= position.minScrollExtent));

  void dragBy(double deltaDy) {
    final AnimationController? route = controller;
    final NavigatorState? nav = navigator;
    if (route == null || nav == null || !isCurrent) {
      return;
    }
    if (!_dragging) {
      if (deltaDy <= 0 && route.value >= 1) {
        return;
      }
      _dragging = true;
      nav.didStartUserGesture();
    }
    route.value = (route.value - deltaDy / _height).clamp(0, 1);
  }

  void endDrag(double velocityDy) {
    final AnimationController? route = controller;
    final NavigatorState? nav = navigator;
    if (!_dragging || route == null || nav == null) {
      return;
    }
    _dragging = false;
    final double velocity = velocityDy / _height;
    final bool close = velocity.abs() >= _kFlowDismissFlingVelocity
        ? velocity > 0
        : route.value <= _kFlowDismissCloseProgress;
    if (close) {
      if (isCurrent) {
        nav.pop();
      }
      route.animateBack(
        0,
        duration: _kFlowDismissSettleDuration,
        curve: Curves.easeOut,
      );
    } else {
      route.animateTo(
        1,
        duration: _kFlowDismissSettleDuration,
        curve: Curves.easeOut,
      );
    }
    if (!route.isAnimating) {
      nav.didStopUserGesture();
      return;
    }
    void stopGesture(AnimationStatus status) {
      route.removeStatusListener(stopGesture);
      nav.didStopUserGesture();
    }

    route.addStatusListener(stopGesture);
  }
}

class _FluxerFlowDismissRegion extends StatelessWidget {
  const _FluxerFlowDismissRegion({required this.route, required this.child});

  final _FluxerFlowRoute<Object?> route;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ScrollBehavior behavior = ScrollConfiguration.of(context);
    return FluxerGestureDetector(
      behavior: HitTestBehavior.translucent,
      onVerticalDragUpdate: (DragUpdateDetails details) =>
          route.dragBy(details.delta.dy),
      onVerticalDragEnd: (DragEndDetails details) =>
          route.endDrag(details.primaryVelocity ?? 0),
      onVerticalDragCancel: () => route.endDrag(0),
      child: ScrollConfiguration(
        behavior: behavior.copyWith(
          physics: _FluxerFlowDismissPhysics(
            route,
            parent: behavior.getScrollPhysics(context),
          ),
        ),
        child: child,
      ),
    );
  }
}

class _FluxerFlowDismissPhysics extends ScrollPhysics {
  const _FluxerFlowDismissPhysics(this.route, {super.parent});

  final _FluxerFlowRoute<Object?> route;

  @override
  _FluxerFlowDismissPhysics applyTo(ScrollPhysics? ancestor) {
    return _FluxerFlowDismissPhysics(route, parent: buildParent(ancestor));
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    if (position.axisDirection == AxisDirection.down &&
        route.claimsScrollDrag(position, offset)) {
      route.dragBy(offset);
      return 0;
    }
    return super.applyPhysicsToUserOffset(position, offset);
  }

  @override
  Simulation? createBallisticSimulation(
    ScrollMetrics position,
    double velocity,
  ) {
    if (position.axisDirection == AxisDirection.down && route._dragging) {
      route.endDrag(-velocity);
      return super.createBallisticSimulation(position, 0);
    }
    return super.createBallisticSimulation(position, velocity);
  }
}

Page<void> fluxerFlowPage({required LocalKey key, required Widget child}) =>
    MaterialPage<void>(key: key, child: child);

class FluxerFlowNavigator extends StatefulWidget {
  const FluxerFlowNavigator({
    required this.pages,
    required this.onDidRemovePage,
    super.key,
  });

  final List<Page<void>> pages;
  final DidRemovePageCallback onDidRemovePage;

  @override
  State<FluxerFlowNavigator> createState() => _FluxerFlowNavigatorState();
}

class _FluxerFlowNavigatorState extends State<FluxerFlowNavigator> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return NavigatorPopHandler(
      onPopWithResult: (Object? result) {
        _navigatorKey.currentState?.maybePop();
      },
      child: Navigator(
        key: _navigatorKey,
        pages: widget.pages,
        onDidRemovePage: widget.onDidRemovePage,
      ),
    );
  }
}

class FluxerFlowStep extends StatelessWidget {
  const FluxerFlowStep({
    required this.title,
    required this.isFirst,
    required this.onLeading,
    required this.child,
    this.description,
    this.action,
    super.key,
  });

  final String title;
  final String? description;
  final bool isFirst;
  final VoidCallback onLeading;
  final Widget child;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final textStyles = context.textStyles;
    final bool hostedUiFlow = hasIphoneDuoSideStrip(context);
    final Widget pageBody = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (!hostedUiFlow)
          SizedBox(
            height: 48,
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 4),
                child: IconButton(
                  onPressed: onLeading,
                  tooltip: isFirst ? l10n.uiClose : l10n.back,
                  icon: PhosphorIcon(
                    isFirst ? PhosphorIconsBold.x : PhosphorIconsBold.arrowLeft,
                    size: 24,
                    color: colors.textPrimary,
                  ),
                ),
              ),
            ),
          ),
        Expanded(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.fromLTRB(
              16,
              12,
              16,
              16 + MediaQuery.paddingOf(context).bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                if (!hostedUiFlow)
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: textStyles.heading.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      height: 1.25,
                      color: colors.textPrimary,
                    ),
                  ),
                if (description != null) ...<Widget>[
                  if (!hostedUiFlow) const SizedBox(height: 8),
                  Text(
                    description!,
                    textAlign: TextAlign.center,
                    style: textStyles.bodyMedium.copyWith(
                      fontSize: 15,
                      height: 1.35,
                      color: colors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 24),
                ] else if (!hostedUiFlow)
                  const SizedBox(height: 24),
                child,
                if (action != null) ...<Widget>[
                  const SizedBox(height: 24),
                  action!,
                ],
              ],
            ),
          ),
        ),
      ],
    );
    final Widget column = hostedUiFlow
        ? pageBody
        : SafeArea(bottom: false, child: pageBody);
    if (!hostedUiFlow) {
      return Scaffold(
        backgroundColor: colors.backgroundSecondary,
        body: column,
      );
    }
    return _hostedUiFlowPage(
      context: context,
      backgroundColor: colors.backgroundSecondary,
      title: title,
      onBack: onLeading,
      body: column,
    );
  }
}

class FluxerPushPage extends StatelessWidget {
  const FluxerPushPage({
    required this.title,
    required this.body,
    this.closes = false,
    this.onLeading,
    this.trailing,
    this.useHostedAppBar = true,
    super.key,
  });

  final String title;
  final Widget body;
  final bool closes;
  final VoidCallback? onLeading;
  final Widget? trailing;
  final bool useHostedAppBar;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final bool duoSideStrip = hasIphoneDuoSideStrip(context);
    final bool useHostedUiAppBar = duoSideStrip && useHostedAppBar;
    final bool showInPageAppBar = !useHostedUiAppBar;
    final bool showInPageLeading =
        showInPageAppBar && showsInAppShellBackButton(context);
    final VoidCallback leadingAction =
        onLeading ?? () => Navigator.of(context).pop();
    final Widget pageBody = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (showInPageAppBar)
          SizedBox(
            height: 48,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: showInPageLeading ? 88 : 16,
                  ),
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: context.textStyles.heading.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: colors.textPrimary,
                    ),
                  ),
                ),
                if (showInPageLeading)
                  PositionedDirectional(
                    start: 4,
                    child: IconButton(
                      onPressed: leadingAction,
                      tooltip: closes ? l10n.uiClose : l10n.back,
                      icon: PhosphorIcon(
                        closes
                            ? PhosphorIconsBold.x
                            : PhosphorIconsBold.arrowLeft,
                        size: 24,
                        color: colors.textPrimary,
                      ),
                    ),
                  ),
                if (trailing != null)
                  PositionedDirectional(end: 4, child: trailing!),
              ],
            ),
          ),
        Expanded(child: body),
      ],
    );
    final Widget column = duoSideStrip
        ? pageBody
        : SafeArea(bottom: false, child: pageBody);
    if (useHostedUiAppBar) {
      return _hostedUiFlowPage(
        context: context,
        backgroundColor: colors.backgroundSecondary,
        title: title,
        onBack: leadingAction,
        body: column,
      );
    }
    if (!duoSideStrip) {
      return Scaffold(
        backgroundColor: colors.backgroundSecondary,
        body: column,
      );
    }
    return _duoPushPageShell(
      backgroundColor: colors.backgroundSecondary,
      onBack: leadingAction,
      child: AdaptiveScaffold(
        backgroundColor: colors.backgroundSecondary,
        resizeToAvoidBottomInset: false,
        appBar: const AdaptiveAppBar(),
        body: hostedUiMaterialWrap(
          context,
          color: colors.backgroundSecondary,
          child: SafeArea(bottom: false, child: column),
        ),
      ),
    );
  }
}

class FluxerPushPageAction extends StatelessWidget {
  const FluxerPushPageAction({
    required this.label,
    required this.onPressed,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: colors.brandPrimaryLight,
        disabledForegroundColor: colors.brandPrimaryLight.withValues(
          alpha: 0.5,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        minimumSize: const Size(44, 44),
        splashFactory: NoSplash.splashFactory,
        textStyle: context.textStyles.bodyMedium.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      child: Text(label),
    );
  }
}
