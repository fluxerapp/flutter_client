import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/app_startup_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/shell/presentation/sheets/beta_warning_sheet.dart';
import 'package:fluxer_app/features/shell/providers/beta_warning_controller.dart';
import 'package:go_router/go_router.dart';

class BetaWarningLayer extends ConsumerStatefulWidget {
  const BetaWarningLayer({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<BetaWarningLayer> createState() => _BetaWarningLayerState();
}

class _BetaWarningLayerState extends ConsumerState<BetaWarningLayer> {
  bool _isPresenting = false;
  bool _tryShowScheduled = false;
  VoidCallback? _routeListener;
  GoRouter? _listenerRouter;

  @override
  void initState() {
    super.initState();
    _scheduleTryShow();
  }

  @override
  void dispose() {
    final VoidCallback? listener = _routeListener;
    final GoRouter? router = _listenerRouter;
    if (listener != null && router != null) {
      router.routerDelegate.removeListener(listener);
    }
    super.dispose();
  }

  String _readLocation(GoRouter router) {
    final RouteMatchList config = router.routerDelegate.currentConfiguration;
    return config.isNotEmpty ? config.last.matchedLocation : '/';
  }

  bool _isEligibleRoute({
    required String location,
    required bool isAuthenticated,
  }) {
    if (location == '/loading' || location == '/reconnecting') {
      return false;
    }
    if (!isAuthenticated) {
      return location == '/login';
    }
    return location != '/login';
  }

  bool _areGatesOpen() {
    final AsyncValue<void> startup = ref.read(appStartupProvider);
    if (!startup.hasValue) {
      return false;
    }
    final bool isAuthenticated = ref.read(authStateProvider);
    if (isAuthenticated && !ref.read(gatewayReadyProvider)) {
      return false;
    }
    final GoRouter router = ref.read(fluxerRouterProvider);
    final String location = _readLocation(router);
    return _isEligibleRoute(
      location: location,
      isAuthenticated: isAuthenticated,
    );
  }

  void _attachRouteListener(GoRouter router) {
    if (_routeListener != null) {
      return;
    }
    _routeListener = _scheduleTryShow;
    router.routerDelegate.addListener(_routeListener!);
    _listenerRouter = router;
  }

  void _scheduleTryShow() {
    if (_tryShowScheduled) {
      return;
    }
    _tryShowScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _tryShowScheduled = false;
      if (mounted) {
        unawaited(_tryShow());
      }
    });
  }

  Future<void> _tryShow() async {
    if (!mounted || _isPresenting || !_areGatesOpen()) {
      return;
    }
    _isPresenting = true;
    try {
      final bool shouldShow = await ref
          .read(betaWarningControllerProvider.notifier)
          .shouldShow();
      if (!shouldShow || !mounted || !_areGatesOpen()) {
        return;
      }
      final BuildContext? sheetContext = rootNavigatorKey.currentContext;
      if (sheetContext == null || !sheetContext.mounted) {
        return;
      }
      final bool? acknowledged = await showBetaWarningSheet(sheetContext);
      if ((acknowledged ?? false) && mounted) {
        await ref.read(betaWarningControllerProvider.notifier).acknowledge();
      }
    } finally {
      _isPresenting = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final GoRouter router = ref.watch(fluxerRouterProvider);
    _attachRouteListener(router);
    ref
      ..listen(appStartupProvider, (_, _) => _scheduleTryShow())
      ..listen(authStateProvider, (_, _) => _scheduleTryShow())
      ..listen(gatewayReadyProvider, (_, _) => _scheduleTryShow());
    return widget.child;
  }
}
