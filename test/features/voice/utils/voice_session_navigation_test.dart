import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_session_navigation.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';

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

  group('voiceCallMinimizePath', () {
    test('returns the guild channel list for a guild call', () {
      expect(voiceCallMinimizePath(voice: guildVoice), RoutePaths.guild('g1'));
    });

    test('returns the dm channel for a dm call', () {
      expect(
        voiceCallMinimizePath(voice: dmVoice),
        RoutePaths.dmChannel('dm1'),
      );
    });
  });

  group('navigateToActiveVoiceSession', () {
    testWidgets('pops settings pages then opens the guild call', (
      tester,
    ) async {
      final GoRouter router = _buildRouter();
      await tester.pumpWidget(
        ProviderScope(
          overrides: [fluxerRouterProvider.overrideWithValue(router)],
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
          overrides: [fluxerRouterProvider.overrideWithValue(router)],
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
