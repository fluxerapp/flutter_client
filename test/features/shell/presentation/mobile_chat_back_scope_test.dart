import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/shell_popup_route_observer.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/shell/presentation/mobile_chat_back_scope.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';
import 'package:fluxer_app/features/shell/providers/shell_popup_overlay_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  testWidgets('mobile back returns to dm home when the drawer is open', (
    tester,
  ) async {
    final router = _routerFor('/channels/guild/channel');
    addTearDown(router.dispose);
    final container = _containerFor(router);

    await tester.pumpWidget(_buildBackScopeApp(container, router));
    await tester.pumpAndSettle();

    expect(container.read(currentRevealSideProvider), RevealSide.main);

    final firstHandled = await tester.binding.handlePopRoute();
    await tester.pump();

    expect(firstHandled, isTrue);
    expect(container.read(currentRevealSideProvider), RevealSide.left);
    expect(
      router.routerDelegate.currentConfiguration.uri.path,
      '/channels/guild/channel',
    );

    container.read(currentRevealSideProvider.notifier).set(RevealSide.left);
    await tester.pump();

    final secondHandled = await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();

    expect(secondHandled, isTrue);
    expect(
      router.routerDelegate.currentConfiguration.uri.path,
      '/channels/@me',
    );
  });

  testWidgets('mobile back closes the expression panel before the drawer', (
    tester,
  ) async {
    final router = _routerFor('/channels/guild/channel');
    addTearDown(router.dispose);
    final container = _containerFor(router);

    await tester.pumpWidget(_buildBackScopeApp(container, router));
    await tester.pumpAndSettle();

    container.read(expressionPanelProvider.notifier).open();
    expect(container.read(expressionPanelProvider), isTrue);
    expect(container.read(currentRevealSideProvider), RevealSide.main);

    final bool handled = await tester.binding.handlePopRoute();
    await tester.pump();

    expect(handled, isTrue);
    expect(container.read(expressionPanelProvider), isFalse);
    expect(container.read(currentRevealSideProvider), RevealSide.main);
  });

  testWidgets('mobile back dismisses an open bottom sheet before the drawer', (
    tester,
  ) async {
    late final ProviderContainer container;
    final ShellPopupRouteObserver popupObserver = ShellPopupRouteObserver(({
      required bool hasOverlay,
    }) {
      container
          .read(shellHasPopupOverlayProvider.notifier)
          .setHasOverlay(value: hasOverlay);
    });
    final router = _routerFor(
      '/channels/guild/channel',
      navigatorObservers: [popupObserver],
    );
    addTearDown(router.dispose);
    container = _containerFor(router);

    await tester.pumpWidget(_buildBackScopeApp(container, router));
    await tester.pumpAndSettle();

    final BuildContext chatContext = tester.element(find.text('chat'));
    unawaited(
      showModalBottomSheet<void>(
        context: chatContext,
        builder: (BuildContext context) => const Text('sheet'),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('sheet'), findsOneWidget);
    expect(container.read(shellHasPopupOverlayProvider), isTrue);
    expect(container.read(currentRevealSideProvider), RevealSide.main);

    final bool handled = await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();

    expect(handled, isTrue);
    expect(find.text('sheet'), findsNothing);
    expect(container.read(shellHasPopupOverlayProvider), isFalse);
    expect(container.read(currentRevealSideProvider), RevealSide.main);
  });
}

GoRouter _routerFor(
  String initialLocation, {
  List<NavigatorObserver> navigatorObservers = const <NavigatorObserver>[],
}) {
  return GoRouter(
    initialLocation: initialLocation,
    observers: navigatorObservers,
    routes: [
      GoRoute(
        path: '/channels/@me',
        builder: (context, state) => const Text('dms'),
      ),
      GoRoute(
        path: '/channels/:guildId',
        builder: (context, state) => const Text('Select a channel'),
        routes: [
          GoRoute(
            path: ':channelId',
            builder: (context, state) =>
                const MobileChatBackScope(child: Text('chat')),
          ),
        ],
      ),
    ],
  );
}

ProviderContainer _containerFor(GoRouter router) {
  final container = ProviderContainer(
    overrides: [fluxerRouterProvider.overrideWithValue(router)],
  );
  addTearDown(container.dispose);
  return container;
}

Widget _buildBackScopeApp(ProviderContainer container, GoRouter router) {
  return UncontrolledProviderScope(
    container: container,
    child: MaterialApp.router(
      routerConfig: router,
      builder: (context, child) => MediaQuery(
        data: const MediaQueryData(size: Size(400, 800)),
        child: child ?? const SizedBox.shrink(),
      ),
    ),
  );
}
