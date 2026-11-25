import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/gateway/gateway_reconnect_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/shell/navigation/shell_chat_back.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/providers/drawer/reveal_side_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/connection/session_navigation.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/src/framework.dart' show Override;

void main() {
  const VoiceSessionState guildVoice = VoiceSessionState(
    isConnected: true,
    guildId: 'g1',
    channelId: 'v1',
  );
  const VoiceSessionState dmVoice = VoiceSessionState(
    isConnected: true,
    channelId: 'dm1',
  );

  group('navigateToActiveVoiceSession', () {
    testWidgets('pops settings pages then opens the guild call', (
      tester,
    ) async {
      final GoRouter router = _buildRouter();
      await tester.pumpWidget(
        ProviderScope(
          overrides: <Override>[
            fluxerRouterProvider.overrideWithValue(router),
            ..._voiceNavigationOverrides(),
          ],
          child: MaterialApp.router(routerConfig: router),
        ),
      );
      await tester.pumpAndSettle();
      await _pushSettingsStack(tester);

      navigateToActiveVoiceSession(
        rootNavigatorKey.currentContext!,
        voice: guildVoice,
      );
      await tester.pumpAndSettle();

      expect(find.text('settings'), findsNothing);
      expect(find.text('section'), findsNothing);
      expect(find.text('call'), findsOneWidget);
    });

    testWidgets('pops settings pages then opens the dm call', (tester) async {
      final GoRouter router = _buildRouter();
      await tester.pumpWidget(
        ProviderScope(
          overrides: <Override>[
            fluxerRouterProvider.overrideWithValue(router),
            ..._voiceNavigationOverrides(),
          ],
          child: MaterialApp.router(routerConfig: router),
        ),
      );
      await tester.pumpAndSettle();
      await _pushSettingsStack(tester);

      navigateToActiveVoiceSession(
        rootNavigatorKey.currentContext!,
        voice: dmVoice,
      );
      await tester.pumpAndSettle();

      expect(find.text('settings'), findsNothing);
      expect(find.text('section'), findsNothing);
      expect(find.text('dm-call'), findsOneWidget);
    });
  });

  group('leaveVoiceFromCallView', () {
    testWidgets('reveals the channel list before the leave finishes', (
      tester,
    ) async {
      final Completer<void> teardown = Completer<void>();
      final ProviderContainer container = await _pumpCall(
        tester,
        size: const Size(400, 800),
        teardown: teardown,
      );
      expect(container.read(currentRevealSideProvider), RevealSide.main);

      await tester.tap(find.text('leave'));
      await tester.pump();
      expect(container.read(voiceSessionProvider).isInVoice, isFalse);
      expect(container.read(currentRevealSideProvider), RevealSide.left);

      container.read(currentRevealSideProvider.notifier).set(RevealSide.main);
      teardown.complete();
      await tester.pumpAndSettle();
      expect(container.read(currentRevealSideProvider), RevealSide.main);
    });

    testWidgets('keeps the drawer closed when the list is already visible', (
      tester,
    ) async {
      final ProviderContainer container = await _pumpCall(
        tester,
        size: const Size(1000, 900),
        teardown: Completer<void>()..complete(),
      );
      final BuildContext context = tester.element(find.text('leave'));
      expect(isHandheldVoiceOverlay(context), isTrue);
      expect(shellShowsConcurrentChannelList(context), isTrue);

      await tester.tap(find.text('leave'));
      await tester.pumpAndSettle();
      expect(container.read(voiceSessionProvider).isInVoice, isFalse);
      expect(container.read(currentRevealSideProvider), RevealSide.main);
    });

    testWidgets('leaves without moving the drawer away from the call', (
      tester,
    ) async {
      final ProviderContainer container = await _pumpCall(
        tester,
        size: const Size(400, 800),
        initialLocation: '/channels/g1/text',
        teardown: Completer<void>()..complete(),
      );

      await tester.tap(find.text('leave'));
      await tester.pumpAndSettle();
      expect(container.read(voiceSessionProvider).isInVoice, isFalse);
      expect(container.read(currentRevealSideProvider), RevealSide.main);
    });
  });
}

Future<ProviderContainer> _pumpCall(
  WidgetTester tester, {
  required Size size,
  required Completer<void> teardown,
  String initialLocation = '/channels/g1/v1',
}) async {
  tester.view
    ..physicalSize = size
    ..devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: initialLocation,
    routes: <RouteBase>[
      GoRoute(
        path: '/channels/:guildId/:channelId',
        builder: (BuildContext context, GoRouterState state) => Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) =>
              TextButton(
                onPressed: () =>
                    leaveVoiceFromCallView(context: context, ref: ref),
                child: const Text('leave'),
              ),
        ),
      ),
    ],
  );
  addTearDown(router.dispose);
  final ProviderContainer container = ProviderContainer(
    overrides: <Override>[
      fluxerRouterProvider.overrideWithValue(router),
      authStateProvider.overrideWith(_SignedIn.new),
      gatewayConnectionFailedProvider.overrideWithValue(false),
      voiceSessionProvider.overrideWith(() => _GuildCall(teardown)),
      ..._voiceNavigationOverrides(),
    ],
  );
  addTearDown(container.dispose);
  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: MaterialApp.router(routerConfig: router),
    ),
  );
  await tester.pumpAndSettle();
  return container;
}

class _SignedIn extends AuthState {
  @override
  bool build() => true;
}

class _GuildCall extends VoiceSession {
  _GuildCall(this._teardown);

  final Completer<void> _teardown;

  @override
  VoiceSessionState build() => const VoiceSessionState(
    isConnected: true,
    guildId: 'g1',
    channelId: 'v1',
  );

  @override
  Future<void> leaveVoice({bool endCall = true}) async {
    state = state.copyWith(isConnected: false);
    await _teardown.future;
    state = const VoiceSessionState();
  }
}

GoRouter _buildRouter() {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/you',
    routes: <RouteBase>[
      GoRoute(
        path: '/you',
        builder: (BuildContext context, GoRouterState state) =>
            const Text('you'),
      ),
      GoRoute(
        path: '/channels/@me/:channelId/call',
        builder: (BuildContext context, GoRouterState state) =>
            const Text('dm-call'),
      ),
      GoRoute(
        path: '/channels/:guildId/:channelId',
        builder: (BuildContext context, GoRouterState state) =>
            const Text('call'),
      ),
    ],
  );
}

List<Override> _voiceNavigationOverrides() {
  return <Override>[
    channelListViewModelProvider.overrideWith(_NoOpChannelList.new),
    guildListViewModelProvider.overrideWith(_FakeGuildList.new),
  ];
}

class _NoOpChannelList extends ChannelListViewModel {
  @override
  ChannelListState build() => const ChannelListState(
    guild: null,
    categories: [],
    selectedChannelId: null,
  );

  @override
  bool loadActiveGuild(String guildId) => true;
}

class _FakeGuildList extends GuildListViewModel {
  @override
  GuildListViewState build() => const GuildListViewState(
    guilds: <Guild>[Guild(id: 'g1', name: 'g1')],
  );
}

Future<void> _pushSettingsStack(WidgetTester tester) async {
  rootNavigatorKey.currentState!.push(
    MaterialPageRoute<void>(
      builder: (BuildContext context) => const Text('settings'),
    ),
  );
  await tester.pumpAndSettle();
  rootNavigatorKey.currentState!.push(
    MaterialPageRoute<void>(
      builder: (BuildContext context) => const Text('section'),
    ),
  );
  await tester.pumpAndSettle();
  expect(find.text('section'), findsOneWidget);
}
