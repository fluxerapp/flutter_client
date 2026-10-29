import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
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
