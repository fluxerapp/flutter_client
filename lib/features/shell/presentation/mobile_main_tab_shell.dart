import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/shell_navigator_keys.dart';
import 'package:fluxer_app/core/router/shell_popup_route_observer.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/providers/shell_popup_overlay_provider.dart';

class MobileMainTabShell extends StatefulWidget {
  const MobileMainTabShell({
    required this.navigationShell,
    required this.bottomNav,
    super.key,
  });

  final Widget navigationShell;
  final Widget bottomNav;

  @override
  State<MobileMainTabShell> createState() => _MobileMainTabShellState();
}

class _MobileMainTabShellState extends State<MobileMainTabShell> {
  late final ShellPopupRouteObserver _popupObserver;

  @override
  void initState() {
    super.initState();
    _popupObserver = ShellPopupRouteObserver(_syncPopupOverlay);
  }

  void _syncPopupOverlay({required bool hasOverlay}) {
    if (!mounted) {
      return;
    }
    ProviderScope.containerOf(context)
        .read(shellHasPopupOverlayProvider.notifier)
        .setHasOverlay(value: hasOverlay);
  }

  @override
  Widget build(BuildContext context) {
    return _MobileMainTabShellScope(
      navigationShell: widget.navigationShell,
      bottomNav: widget.bottomNav,
      child: Navigator(
        key: shellTabOverlayNavigatorKey,
        observers: <NavigatorObserver>[_popupObserver],
        onGenerateInitialRoutes:
            (NavigatorState navigator, String initialRoute) {
              return <Route<void>>[
                MaterialPageRoute<void>(
                  builder: (_) => const _MobileMainTabShellBody(),
                ),
              ];
            },
      ),
    );
  }
}

class _MobileMainTabShellScope extends InheritedWidget {
  const _MobileMainTabShellScope({
    required this.navigationShell,
    required this.bottomNav,
    required super.child,
  });

  final Widget navigationShell;
  final Widget bottomNav;

  static _MobileMainTabShellScope of(BuildContext context) {
    final _MobileMainTabShellScope? scope = context
        .dependOnInheritedWidgetOfExactType<_MobileMainTabShellScope>();
    assert(scope != null, '_MobileMainTabShellScope not found');
    return scope!;
  }

  @override
  bool updateShouldNotify(_MobileMainTabShellScope oldWidget) {
    return navigationShell != oldWidget.navigationShell ||
        bottomNav != oldWidget.bottomNav;
  }
}

class _MobileMainTabShellBody extends StatelessWidget {
  const _MobileMainTabShellBody();

  @override
  Widget build(BuildContext context) {
    final _MobileMainTabShellScope scope = _MobileMainTabShellScope.of(context);
    return Scaffold(
      backgroundColor: context.colors.backgroundPrimary,
      body: Column(
        children: <Widget>[
          Expanded(child: ClipRect(child: scope.navigationShell)),
          scope.bottomNav,
        ],
      ),
    );
  }
}
