import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
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

  tearDown(() {
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
                        ProviderScope.containerOf(context, listen: false),
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
      expect(update.isMobile, isFluxerMobileOs);
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
      );

      await tester.tap(find.text('Join'));
      await tester.pumpAndSettle();

      expect(find.text('Voice Connection Confirmation'), findsNothing);
      expect(voiceSession.connectCallCount, 1);
      expect(voiceSession.lastForceJoin, isFalse);
      expect(gateway.voiceStateUpdates, isEmpty);
    });

    testWidgets('joins directly when stale same-platform connection exists', (
      WidgetTester tester,
    ) async {
      final _RecordingGateway gateway = _RecordingGateway();
      final _RecordingVoiceSession voiceSession = _RecordingVoiceSession();
      addTearDown(gateway.dispose);
      WidgetRef? capturedRef;

      gateway.onVoiceStateUpdate = (GatewayVoiceStateUpdate update) {
        if (capturedRef == null || update.connectionId == null) {
          return;
        }
        capturedRef!
            .read(voiceStatesMapProvider.notifier)
            .update(
              VoiceState(
                userId: _userId,
                guildId: _guildId,
                connectionId: update.connectionId,
              ),
            );
      };

      await _pumpJoinHarness(
        tester,
        gateway: gateway,
        voiceSession: voiceSession,
        onRefCaptured: (WidgetRef ref) => capturedRef = ref,
      );

      capturedRef!
          .read(voiceStatesMapProvider.notifier)
          .update(
            VoiceState(
              userId: _userId,
              channelId: _channelId,
              guildId: _guildId,
              connectionId: _otherConnectionId,
              isMobile: isFluxerMobileOs,
            ),
          );

      await tester.tap(find.text('Join'));
      await tester.pumpAndSettle();

      expect(find.text('Voice Connection Confirmation'), findsNothing);
      expect(gateway.voiceStateUpdates, hasLength(1));
      expect(gateway.voiceStateUpdates.single.connectionId, _otherConnectionId);
      expect(voiceSession.connectCallCount, 1);
      expect(voiceSession.lastForceJoin, isFalse);
    });

    testWidgets('cancel leaves voice and sends no disconnect', (
      WidgetTester tester,
    ) async {
      final _RecordingGateway gateway = _RecordingGateway();
      final _RecordingVoiceSession voiceSession = _RecordingVoiceSession();
      addTearDown(gateway.dispose);

      final VoiceJoinResult? result = await _runJoinFromHarness(
        tester,
        gateway: gateway,
        voiceSession: voiceSession,
        initialVoiceStates: _otherDeviceVoiceStates(),
        afterModalOpens: (WidgetTester tester) async {
          await tester.tap(find.text("Do nothing, I don't want to join").last);
          await tester.pumpAndSettle();
        },
      );

      expect(result, VoiceJoinResult.cancelled);
      expect(voiceSession.connectCallCount, 0);
      expect(gateway.voiceStateUpdates, isEmpty);
    });

    testWidgets('switch disconnects other devices then joins with forceJoin', (
      WidgetTester tester,
    ) async {
      final _RecordingGateway gateway = _RecordingGateway();
      final _RecordingVoiceSession voiceSession = _RecordingVoiceSession();
      addTearDown(gateway.dispose);

      final VoiceJoinResult? result = await _runJoinFromHarness(
        tester,
        gateway: gateway,
        voiceSession: voiceSession,
        initialVoiceStates: _otherDeviceVoiceStates(),
        onVoiceStateUpdate: (WidgetRef ref, GatewayVoiceStateUpdate update) {
          final String? connectionId = update.connectionId;
          if (connectionId == null) {
            return;
          }
          ref
              .read(voiceStatesMapProvider.notifier)
              .update(
                VoiceState(
                  userId: _userId,
                  guildId: _guildId,
                  connectionId: connectionId,
                ),
              );
        },
        afterModalOpens: (WidgetTester tester) async {
          await tester.tap(find.text('Switch to This Device').last);
          await tester.pumpAndSettle();
        },
      );

      expect(result, VoiceJoinResult.succeeded);
      expect(gateway.voiceStateUpdates, hasLength(1));
      expect(gateway.voiceStateUpdates.single.connectionId, _otherConnectionId);
      expect(voiceSession.connectCallCount, 1);
      expect(voiceSession.lastForceJoin, isTrue);
    });

    testWidgets('just join connects without disconnecting other devices', (
      WidgetTester tester,
    ) async {
      final _RecordingGateway gateway = _RecordingGateway();
      final _RecordingVoiceSession voiceSession = _RecordingVoiceSession();
      addTearDown(gateway.dispose);

      final VoiceJoinResult? result = await _runJoinFromHarness(
        tester,
        gateway: gateway,
        voiceSession: voiceSession,
        initialVoiceStates: _otherDeviceVoiceStates(),
        afterModalOpens: (WidgetTester tester) async {
          await tester.tap(
            find.text('Just Join (Keep Other Connections)').last,
          );
          await tester.pumpAndSettle();
        },
      );

      expect(result, VoiceJoinResult.succeeded);
      expect(gateway.voiceStateUpdates, isEmpty);
      expect(voiceSession.connectCallCount, 1);
      expect(voiceSession.lastForceJoin, isTrue);
    });

    testWidgets('still joins after caller context unmounts post modal', (
      WidgetTester tester,
    ) async {
      final _RecordingGateway gateway = _RecordingGateway();
      final _RecordingVoiceSession voiceSession = _RecordingVoiceSession();
      addTearDown(gateway.dispose);

      final VoiceJoinResult? result = await _runJoinFromHarness(
        tester,
        gateway: gateway,
        voiceSession: voiceSession,
        initialVoiceStates: _otherDeviceVoiceStates(),
        popBranchAfterModalOpens: true,
        afterModalOpens: (WidgetTester tester) async {
          await tester.tap(
            find.text('Just Join (Keep Other Connections)').last,
          );
          await tester.pumpAndSettle();
        },
      );

      expect(result, VoiceJoinResult.succeeded);
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
      isMobile: !isFluxerMobileOs,
    ),
  };
}

Future<VoiceJoinResult?> _runJoinFromHarness(
  WidgetTester tester, {
  required _RecordingGateway gateway,
  required _RecordingVoiceSession voiceSession,
  required Future<void> Function(WidgetTester tester) afterModalOpens,
  Map<String, VoiceState>? initialVoiceStates,
  void Function(WidgetRef ref, GatewayVoiceStateUpdate update)?
  onVoiceStateUpdate,
  bool popBranchAfterModalOpens = false,
}) async {
  final GlobalKey<NavigatorState> branchNavigatorKey =
      GlobalKey<NavigatorState>();
  final Completer<VoiceJoinResult?> resultCompleter =
      Completer<VoiceJoinResult?>();
  WidgetRef? capturedRef;

  gateway.onVoiceStateUpdate = (GatewayVoiceStateUpdate update) {
    if (onVoiceStateUpdate != null && capturedRef != null) {
      onVoiceStateUpdate(capturedRef!, update);
    }
  };

  await _pumpJoinHarness(
    tester,
    gateway: gateway,
    voiceSession: voiceSession,
    branchNavigatorKey: branchNavigatorKey,
    onRefCaptured: (WidgetRef ref) => capturedRef = ref,
    onJoinPressed: (WidgetRef ref, BuildContext branchContext) {
      unawaited(
        joinVoiceChannelWithConfirmation(
          ref: ref,
          guildId: _guildId,
          channelId: _channelId,
          context: branchContext,
        ).then(resultCompleter.complete),
      );
    },
  );

  if (initialVoiceStates != null && capturedRef != null) {
    for (final VoiceState vs in initialVoiceStates.values) {
      capturedRef!.read(voiceStatesMapProvider.notifier).update(vs);
    }
  }

  await tester.tap(find.text('Join'));
  await tester.pumpAndSettle();

  if (popBranchAfterModalOpens) {
    branchNavigatorKey.currentState?.pop();
    await tester.pumpAndSettle();
  }

  await afterModalOpens(tester);
  return resultCompleter.future;
}

Future<void> _pumpJoinHarness(
  WidgetTester tester, {
  required _RecordingGateway gateway,
  required _RecordingVoiceSession voiceSession,
  GlobalKey<NavigatorState>? branchNavigatorKey,
  void Function(WidgetRef ref)? onRefCaptured,
  void Function(WidgetRef ref, BuildContext branchContext)? onJoinPressed,
}) async {
  final GlobalKey<NavigatorState> branchKey =
      branchNavigatorKey ?? GlobalKey<NavigatorState>();
  final colorTheme = buildDarkColorTheme();

  await tester.pumpWidget(
    ProviderScope(
      overrides: <Override>[
        gatewayConnectionProvider.overrideWithValue(gateway),
        currentUserIdProvider.overrideWithValue(_userId),
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
          key: branchKey,
          onGenerateRoute: (RouteSettings settings) {
            return MaterialPageRoute<void>(
              builder: (BuildContext branchContext) {
                return Scaffold(
                  body: Consumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                          onRefCaptured?.call(ref);
                          return ElevatedButton(
                            onPressed: () {
                              (onJoinPressed ??
                                  (WidgetRef ref, BuildContext ctx) {
                                    unawaited(
                                      joinVoiceChannelWithConfirmation(
                                        ref: ref,
                                        guildId: _guildId,
                                        channelId: _channelId,
                                        context: ctx,
                                      ),
                                    );
                                  })(ref, branchContext);
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

  void Function(GatewayVoiceStateUpdate update)? onVoiceStateUpdate;

  @override
  bool updateVoiceState(GatewayVoiceStateUpdate update) {
    voiceStateUpdates.add(update);
    onVoiceStateUpdate?.call(update);
    return true;
  }
}

class _RecordingVoiceSession extends VoiceSession {
  _RecordingVoiceSession() : _initialState = const VoiceSessionState();

  final VoiceSessionState _initialState;
  int connectCallCount = 0;
  bool? lastForceJoin;

  @override
  VoiceSessionState build() => _initialState;

  @override
  Future<bool> connectToVoiceChannel({
    required String? guildId,
    required String channelId,
    bool startOutgoingCall = false,
    bool ringSilently = false,
    List<String>? outboundRingRecipients,
    bool initialSelfMute = false,
    bool initialSelfDeaf = false,
    bool initialSelfVideo = false,
    bool forceJoin = false,
  }) async {
    connectCallCount++;
    lastForceJoin = forceJoin;
    return true;
  }
}
