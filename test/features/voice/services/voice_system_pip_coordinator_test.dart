import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart' show MediaStreamTrack;
import 'package:fluxer_app/features/voice/domain/voice_media_participant.dart';
import 'package:fluxer_app/features/voice/providers/voice_system_pip_providers.dart';
import 'package:fluxer_app/features/voice/services/voice_system_pip_coordinator.dart';
import 'package:fluxer_app/features/voice/utils/media/voice_video_claims.dart';
import 'package:fluxer_voice/fluxer_voice.dart';
import 'package:livekit_client/livekit_client.dart';

class _FakeMediaStreamTrack extends Fake implements MediaStreamTrack {
  @override
  String? get id => 'track-1';
}

class _FakeVideoTrack extends Fake implements VideoTrack {
  @override
  String? get sid => 'sid-1';

  @override
  MediaStreamTrack get mediaStreamTrack => _FakeMediaStreamTrack();
}

class _FakeParticipant extends ChangeNotifier implements VoiceMediaParticipant {
  VideoTrack? track = _FakeVideoTrack();

  @override
  String get identity => 'remote';

  @override
  String? get userId => '2';

  @override
  bool get hasCamera => track != null;

  @override
  VideoTrack? get cameraTrack => track;

  @override
  bool get hasScreenShare => false;

  @override
  VideoTrack? get screenShareTrack => null;

  @override
  bool get hasScreenShareAudio => false;

  @override
  AudioTrack? get screenShareAudioTrack => null;

  @override
  VideoDimensions? get screenShareDimensions => null;

  @override
  Iterable<AudioTrack> get voiceAudioTracks => const <AudioTrack>[];

  @override
  bool get directConnectionFailed => false;

  @override
  Future<void> setVideoWanted(
    TrackSource source, {
    required bool wanted,
    VideoQuality? quality,
  }) async {}

  @override
  Future<void> setScreenShareAudioWanted({required bool wanted}) async {}
}

class _RecordingPipApi extends VoicePipHostApi {
  final List<String> calls = <String>[];
  final List<NativePipConfig> configs = <NativePipConfig>[];

  @override
  Future<bool> isSupported() async => true;

  @override
  Future<void> arm(NativePipConfig config) async {
    calls.add('arm');
    configs.add(config);
  }

  @override
  Future<void> disarm() async => calls.add('disarm');

  @override
  Future<void> stop() async => calls.add('stop');
}

class _TestTarget extends Notifier<VoiceSystemPipTarget?> {
  @override
  VoiceSystemPipTarget? build() => null;

  VoiceSystemPipTarget? get target => state;

  set target(VoiceSystemPipTarget? target) => state = target;
}

const Duration _flush = Duration(milliseconds: 1);

final _testTargetProvider =
    NotifierProvider<_TestTarget, VoiceSystemPipTarget?>(_TestTarget.new);

void main() {
  late _RecordingPipApi api;
  late StreamController<NativePipEvent> events;
  late ProviderContainer container;

  setUp(() {
    api = _RecordingPipApi();
    events = StreamController<NativePipEvent>.broadcast();
    FluxerVoicePip.instance.debugOverridePlatform(
      api: api,
      events: () => events.stream,
    );
    container = ProviderContainer(
      overrides: [
        voiceSystemPipTargetProvider.overrideWith(
          (Ref ref) => ref.watch(_testTargetProvider),
        ),
        voiceSystemPipCoordinatorProvider.overrideWith((Ref ref) {
          final VoiceSystemPipCoordinator coordinator =
              VoiceSystemPipCoordinator(ref, enabled: true);
          ref.onDispose(coordinator.dispose);
          return coordinator;
        }),
      ],
    );
  });

  tearDown(() async {
    container.dispose();
    VoiceVideoClaims.debugResetBackgroundFocus();
    FluxerVoicePip.instance.debugOverridePlatform();
    await events.close();
  });

  testWidgets('a read-only coordinator still arms when the target appears', (
    WidgetTester tester,
  ) async {
    container.read(voiceSystemPipCoordinatorProvider);
    await tester.pump(_flush);
    expect(api.calls, isEmpty);

    container.read(_testTargetProvider.notifier).target = VoiceSystemPipTarget(
      tileId: 'conn|camera',
      participant: _FakeParticipant(),
      isScreenShare: false,
    );
    await tester.pump(_flush);

    expect(api.calls, <String>['arm']);
    expect(api.configs.single.source.trackId, 'track-1');

    container.read(_testTargetProvider.notifier).target = null;
    await tester.pump(_flush);
    expect(api.calls, <String>['arm', 'disarm']);
  });

  testWidgets('entering pip locks the tile and leaving clears it', (
    WidgetTester tester,
  ) async {
    container.read(voiceSystemPipCoordinatorProvider);
    container.read(_testTargetProvider.notifier).target = VoiceSystemPipTarget(
      tileId: 'conn|camera',
      participant: _FakeParticipant(),
      isScreenShare: false,
    );
    await tester.pump(_flush);

    events.add(NativePipEvent(active: true, restoreRequested: false));
    await tester.pump(_flush);
    expect(container.read(voiceSystemPipActiveProvider), isTrue);
    expect(container.read(voiceSystemPipLockedTileProvider), 'conn|camera');

    events.add(NativePipEvent(active: false, restoreRequested: false));
    await tester.pump(_flush);
    expect(container.read(voiceSystemPipActiveProvider), isFalse);
    expect(container.read(voiceSystemPipLockedTileProvider), isNull);
    await tester.pump(const Duration(seconds: 2));
  });

  testWidgets('pip closes when the target video goes away', (
    WidgetTester tester,
  ) async {
    final _FakeParticipant participant = _FakeParticipant();
    container.read(voiceSystemPipCoordinatorProvider);
    container.read(_testTargetProvider.notifier).target = VoiceSystemPipTarget(
      tileId: 'conn|camera',
      participant: participant,
      isScreenShare: false,
    );
    await tester.pump(_flush);
    events.add(NativePipEvent(active: true, restoreRequested: false));
    await tester.pump(_flush);

    participant
      ..track = null
      ..notifyListeners();
    await tester.pump(kVoiceSystemPipSyncDebounce);
    await tester.pump(kVoiceSystemPipTargetLossGrace);

    expect(api.calls, contains('stop'));
    await tester.pump(const Duration(seconds: 2));
  });
}
