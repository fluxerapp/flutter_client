import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_connection_actions.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod/src/framework.dart' show Override;

const String _userId = 'self';
const String _guildId = 'g1';
const String _channelId = 'voice-1';
const String _otherConnectionId = 'conn-desktop';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    const MethodChannel permissionChannel = MethodChannel(
      'flutter.baseflow.com/permissions/methods',
    );
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(permissionChannel, (
          MethodCall methodCall,
        ) async {
          switch (methodCall.method) {
            case 'checkPermissionStatus':
            case 'checkServiceStatus':
              return 1;
            case 'requestPermissions':
              return <int, int>{0: 1};
            default:
              return null;
          }
        });
  });

  tearDown(() async {
    const MethodChannel permissionChannel = MethodChannel(
      'flutter.baseflow.com/permissions/methods',
    );
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(permissionChannel, null);
  });

  group('sendVoiceStateDisconnect', () {
    testWidgets('sends muted deaf disconnect for the target connection', (
      WidgetTester tester,
    ) async {
      final _RecordingGateway gateway = _RecordingGateway();
      addTearDown(gateway.dispose);

      await tester.pumpWidget(
        ProviderScope(
          overrides: <Override>[
            gatewayConnectionProvider.overrideWithValue(gateway),
          ],
          child: MaterialApp(
            home: Scaffold(
              body: Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return ElevatedButton(
                    onPressed: () {
                      sendVoiceStateDisconnect(
                        ref,
                        guildId: _guildId,
                        connectionId: _otherConnectionId,
                      );
                    },
                    child: const Text('Disconnect'),
                  );
                },
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Disconnect'));
      await tester.pump();

      expect(gateway.voiceStateUpdates, hasLength(1));
      final GatewayVoiceStateUpdate update = gateway.voiceStateUpdates.single;
      expect(update.guildId, _guildId);
      expect(update.connectionId, _otherConnectionId);
      expect(update.selfMute, isTrue);
      expect(update.selfDeaf, isTrue);
      expect(update.selfVideo, isFalse);
      expect(update.selfStream, isFalse);
    });
  });

  group('joinVoiceChannelWithConfirmation', () {
    testWidgets('joins directly when no other devices are connected', (
      WidgetTester tester,
    ) async {
      final _RecordingGateway gateway = _RecordingGateway();
      final _RecordingVoiceSession voiceSession = _RecordingVoiceSession();
      addTearDown(gateway.dispose);

      await _pumpJoinHarness(
        tester,
        gateway: gateway,
        voiceSession: voiceSession,
        voiceStates: const <String, VoiceState>{},
      );

      await tester.tap(find.text('Join'));
      await tester.pumpAndSettle();

      expect(find.text('Voice Connection Confirmation'), findsNothing);
      expect(voiceSession.connectCallCount, 1);
      expect(gateway.voiceStateUpdates, isEmpty);
    });

    testWidgets('cancel leaves voice and sends no disconnect', (
      WidgetTester tester,
    ) async {
      final _RecordingGateway gateway = _RecordingGateway();
      final _RecordingVoiceSession voiceSession = _RecordingVoiceSession();
      addTearDown(gateway.dispose);

      await _pumpJoinHarness(
        tester,
        gateway: gateway,
        voiceSession: voiceSession,
        voiceStates: _otherDeviceVoiceStates(),
      );

      await tester.tap(find.text('Join'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Do nothing, I don\'t want to join').last);
      await tester.pumpAndSettle();

      expect(voiceSession.connectCallCount, 0);
      expect(gateway.voiceStateUpdates, isEmpty);
    });

    testWidgets('switch disconnects other devices then joins', (
      WidgetTester tester,
    ) async {
      final _RecordingGateway gateway = _RecordingGateway();
      final _RecordingVoiceSession voiceSession = _RecordingVoiceSession();
      addTearDown(gateway.dispose);

      await _pumpJoinHarness(
        tester,
        gateway: gateway,
        voiceSession: voiceSession,
        voiceStates: _otherDeviceVoiceStates(),
      );

      await tester.tap(find.text('Join'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Switch to This Device').last);
      await tester.pumpAndSettle();

      expect(gateway.voiceStateUpdates, hasLength(1));
      expect(gateway.voiceStateUpdates.single.connectionId, _otherConnectionId);
      expect(voiceSession.connectCallCount, 1);
    });

    testWidgets('just join connects without disconnecting other devices', (
      WidgetTester tester,
    ) async {
      final _RecordingGateway gateway = _RecordingGateway();
      final _RecordingVoiceSession voiceSession = _RecordingVoiceSession();
      addTearDown(gateway.dispose);

      await _pumpJoinHarness(
        tester,
        gateway: gateway,
        voiceSession: voiceSession,
        voiceStates: _otherDeviceVoiceStates(),
      );

      await tester.tap(find.text('Join'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Just Join (Keep Other Connections)').last);
      await tester.pumpAndSettle();

      expect(gateway.voiceStateUpdates, isEmpty);
      expect(voiceSession.connectCallCount, 1);
    });
  });
}

Map<String, VoiceState> _otherDeviceVoiceStates() {
  return <String, VoiceState>{
    _otherConnectionId: VoiceState(
      userId: _userId,
      channelId: _channelId,
      guildId: _guildId,
      connectionId: _otherConnectionId,
    ),
  };
}

Future<void> _pumpJoinHarness(
  WidgetTester tester, {
  required _RecordingGateway gateway,
  required _RecordingVoiceSession voiceSession,
  required Map<String, VoiceState> voiceStates,
}) async {
  final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> branchNavigatorKey =
      GlobalKey<NavigatorState>();
  final colorTheme = buildDarkColorTheme();

  await tester.pumpWidget(
    ProviderScope(
      overrides: <Override>[
        gatewayConnectionProvider.overrideWithValue(gateway),
        currentUserIdProvider.overrideWithValue(_userId),
        voiceStatesMapProvider.overrideWithValue(voiceStates),
        voiceSessionProvider.overrideWith(() => voiceSession),
      ],
      child: MaterialApp(
        navigatorKey: rootNavigatorKey,
        localizationsDelegates: FluxerLocalizations.localizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        home: Navigator(
          key: branchNavigatorKey,
          onGenerateRoute: (RouteSettings settings) {
            return MaterialPageRoute<void>(
              builder: (BuildContext branchContext) {
                return Scaffold(
                  body: Consumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                          return ElevatedButton(
                            onPressed: () {
                              unawaited(
                                joinVoiceChannelWithConfirmation(
                                  ref: ref,
                                  guildId: _guildId,
                                  channelId: _channelId,
                                  context: branchContext,
                                ),
                              );
                            },
                            child: const Text('Join'),
                          );
                        },
                  ),
                );
              },
            );
          },
        ),
      ),
    ),
  );
}

class _RecordingGateway extends GatewayConnection {
  _RecordingGateway()
    : super(
        token: 'test-token',
        dio: Dio(BaseOptions(baseUrl: 'https://api.test')),
      );

  final List<GatewayVoiceStateUpdate> voiceStateUpdates =
      <GatewayVoiceStateUpdate>[];

  @override
  bool updateVoiceState(GatewayVoiceStateUpdate update) {
    voiceStateUpdates.add(update);
    return true;
  }
}

class _RecordingVoiceSession extends VoiceSession {
  int connectCallCount = 0;

  @override
  VoiceSessionState build() => const VoiceSessionState();

  @override
  Future<void> connectToVoiceChannel({
    required String? guildId,
    required String channelId,
    bool startOutgoingCall = false,
    bool ringSilently = false,
    List<String>? outboundRingRecipients,
    bool initialSelfMute = false,
    bool initialSelfDeaf = false,
    bool initialSelfVideo = false,
  }) async {
    connectCallCount++;
  }
}
