import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/app_lock/app_lock_controller.dart';
import 'package:fluxer_app/core/platform/android_app_lock.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/app_lock/presentation/app_lock_screen.dart';
import 'package:fluxer_app/features/ui/background/starfield_background.dart';
import 'package:fluxer_app/material_ui.dart';

class AppLockGate extends ConsumerStatefulWidget {
  const AppLockGate({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<AppLockGate> createState() => _AppLockGateState();
}

class _AppLockGateState extends ConsumerState<AppLockGate> {
  @override
  void initState() {
    super.initState();
    if (!isFluxerNativeMobileOs) {
      return;
    }
    setAndroidAppLockPausedHandler(
      ref.read(appLockControllerProvider.notifier).coverForPrivacy,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        unawaited(ref.read(appLockControllerProvider.notifier).load());
      }
    });
  }

  @override
  void dispose() {
    if (isFluxerNativeMobileOs) {
      setAndroidAppLockPausedHandler(null);
    }
    super.dispose();
  }

  Widget? _overlay(AppLockState lock) {
    if (!lock.loaded) {
      return const StarfieldBackdrop();
    }
    if (!lock.enabled) {
      return null;
    }
    if (lock.isLocked) {
      return const _AppLockNavigator();
    }
    if (lock.isPrivacyCovered) {
      return const StarfieldBackdrop();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (!isFluxerNativeMobileOs) {
      return widget.child;
    }
    ref.listen(
      appLockControllerProvider.select((AppLockState lock) => lock.enabled),
      (_, bool enabled) =>
          unawaited(setAndroidAppLockEnabled(enabled: enabled)),
    );
    final AppLockState lock = ref.watch(appLockControllerProvider);
    final Widget? overlay = _overlay(lock);
    final bool covered = overlay != null;
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        ExcludeSemantics(
          excluding: covered,
          child: ExcludeFocus(
            excluding: lock.enabled && lock.isLocked,
            child: AbsorbPointer(absorbing: covered, child: widget.child),
          ),
        ),
        ?overlay,
      ],
    );
  }
}

class _AppLockNavigator extends ConsumerStatefulWidget {
  const _AppLockNavigator();

  @override
  ConsumerState<_AppLockNavigator> createState() => _AppLockNavigatorState();
}

class _AppLockNavigatorState extends ConsumerState<_AppLockNavigator> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  ChildBackButtonDispatcher? _backDispatcher;

  @override
  void initState() {
    super.initState();
    final BackButtonDispatcher root = ref
        .read(fluxerRouterProvider)
        .backButtonDispatcher;
    if (root is RootBackButtonDispatcher) {
      _backDispatcher = ChildBackButtonDispatcher(root)
        ..addCallback(_onBack)
        ..takePriority();
    }
    unawaited(SystemNavigator.setFrameworkHandlesBack(true));
  }

  @override
  void dispose() {
    _backDispatcher?.removeCallback(_onBack);
    unawaited(SystemNavigator.setFrameworkHandlesBack(true));
    super.dispose();
  }

  Future<bool> _onBack() async {
    final NavigatorState? navigator = _navigatorKey.currentState;
    if (navigator != null && await navigator.maybePop()) {
      return true;
    }
    await SystemNavigator.pop();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<NavigationNotification>(
      onNotification: (_) => true,
      child: Navigator(
        key: _navigatorKey,
        onGenerateRoute: (RouteSettings settings) => PageRouteBuilder<void>(
          settings: settings,
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
          pageBuilder: (_, _, _) => const AppLockScreen(),
        ),
      ),
    );
  }
}
