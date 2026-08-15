import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/app_startup_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/auth/domain/required_action_flow.dart';
import 'package:fluxer_app/features/auth/presentation/required_action_modal.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

class RequiredActionGate extends ConsumerStatefulWidget {
  const RequiredActionGate({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<RequiredActionGate> createState() => _RequiredActionGateState();
}

class _RequiredActionGateState extends ConsumerState<RequiredActionGate> {
  bool _isPresenting = false;
  bool _tryShowScheduled = false;
  VoidCallback? _routeListener;
  GoRouter? _listenerRouter;

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
    if (location == '/loading' ||
        location == '/reconnecting' ||
        location == '/login') {
      return false;
    }
    return isAuthenticated;
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
        unawaited(_syncModal());
      }
    });
  }

  Future<void> _syncModal() async {
    if (!mounted || !_areGatesOpen()) {
      return;
    }
    final List<String> requiredActions = ref.read(
      userSettingsViewModelProvider.select(
        (UserSettingsViewState s) => s.requiredActions,
      ),
    );
    final RequiredActionFlow? flow = resolveRequiredActionFlow(requiredActions);
    final BuildContext? modalContext = rootNavigatorKey.currentContext;
    if (flow == null) {
      if (modalContext != null && RequiredActionModal.isOpen(modalContext)) {
        Navigator.of(modalContext, rootNavigator: true).pop();
      }
      _isPresenting = false;
      return;
    }
    if (_isPresenting || modalContext == null || !modalContext.mounted) {
      return;
    }
    if (RequiredActionModal.isOpen(modalContext)) {
      return;
    }
    _isPresenting = true;
    try {
      await RequiredActionModal.show(modalContext, flow: flow);
    } finally {
      _isPresenting = false;
      if (mounted) {
        _scheduleTryShow();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final GoRouter router = ref.watch(fluxerRouterProvider);
    _attachRouteListener(router);
    ref
      ..listen(appStartupProvider, (_, _) => _scheduleTryShow())
      ..listen(authStateProvider, (_, _) => _scheduleTryShow())
      ..listen(gatewayReadyProvider, (_, _) => _scheduleTryShow())
      ..listen(
        userSettingsViewModelProvider.select(
          (UserSettingsViewState s) => s.requiredActions,
        ),
        (_, _) => _scheduleTryShow(),
      );
    return widget.child;
  }
}
