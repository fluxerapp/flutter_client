import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/providers/voice_track_handoff_provider.dart';
import 'package:fluxer_app/features/voice/utils/connection/media_teardown.dart';
import 'package:fluxer_app/features/voice/utils/media/track_renderer_cache.dart';
import 'package:fluxer_app/features/voice/utils/screen_share/screen_share_audio_session.dart';
import 'package:livekit_client/livekit_client.dart';

const VoiceSessionState _connected = VoiceSessionState(
  isConnected: true,
  channelId: 'voice-1',
  guildId: 'g1',
);

class _DrivenVoiceSession extends VoiceSession {
  VoiceSessionState get current => state;

  set current(VoiceSessionState next) => state = next;

  Future<void> drain() => drainVoiceMediaHandoffs(ref);

  Object readRenderers() => ref.read(voiceTrackRendererCacheProvider);

  Object readScreenShareAudio() =>
      ref.read(voiceScreenShareAudioSessionProvider);
}

class _RecordingRenderers extends VoiceTrackRendererCache<RTCVideoRenderer> {
  _RecordingRenderers(this.events, {this.drainError})
    : super(
        create: () => throw UnimplementedError(),
        dispose: (RTCVideoRenderer _) async {},
      );

  final List<String> events;
  final Exception? drainError;

  @override
  void markSessionActive() {
    events.add('renderers active');
    super.markSessionActive();
  }

  @override
  void markSessionEnded() {
    events.add('renderers ended');
    super.markSessionEnded();
  }

  @override
  Future<void> drain() async {
    events.add('renderers drained');
    final Exception? error = drainError;
    if (error != null) {
      throw error;
    }
  }
}

class _RecordingAudio extends VoiceScreenShareAudioSession<AudioTrack> {
  _RecordingAudio(this.events)
    : super(start: (AudioTrack _) async {}, stop: (AudioTrack _) async {});

  final List<String> events;

  @override
  void markSessionActive() {
    events.add('audio active');
    super.markSessionActive();
  }

  @override
  void markSessionEnded() {
    events.add('audio ended');
    super.markSessionEnded();
  }

  @override
  Future<void> drain() async {
    events.add('audio drained');
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('the session can drain the handoff caches it drives', () async {
    final ProviderContainer container = ProviderContainer(
      overrides: [
        blockedUserIdsProvider.overrideWithValue(const <String>{}),
        voiceSessionProvider.overrideWith(_DrivenVoiceSession.new),
      ],
    );
    addTearDown(container.dispose);
    container
      ..read(voiceTrackRendererCacheProvider)
      ..read(voiceScreenShareAudioSessionProvider);
    final _DrivenVoiceSession session =
        (container.read(voiceSessionProvider.notifier) as _DrivenVoiceSession)
          ..current = _connected;

    expect(session.readRenderers, returnsNormally);
    expect(session.readScreenShareAudio, returnsNormally);
    await expectLater(session.drain(), completes);
  });

  group('with recording caches', () {
    late List<String> events;

    _DrivenVoiceSession start({Exception? drainError}) {
      events = <String>[];
      final ProviderContainer container = ProviderContainer(
        overrides: [
          blockedUserIdsProvider.overrideWithValue(const <String>{}),
          voiceSessionProvider.overrideWith(_DrivenVoiceSession.new),
          voiceTrackRendererCacheProvider.overrideWithValue(
            _RecordingRenderers(events, drainError: drainError),
          ),
          voiceScreenShareAudioSessionProvider.overrideWithValue(
            _RecordingAudio(events),
          ),
        ],
      );
      addTearDown(container.dispose);
      return container.read(voiceSessionProvider.notifier)
          as _DrivenVoiceSession;
    }

    test('joining and leaving mark both caches', () {
      final _DrivenVoiceSession session = start();
      expect(events, isEmpty);

      session.current = _connected;
      expect(events, <String>['renderers active', 'audio active']);

      events.clear();
      session.current = const VoiceSessionState();
      expect(events, <String>['renderers ended', 'audio ended']);

      events.clear();
      session.current = const VoiceSessionState(channelId: 'voice-1');
      expect(events, isEmpty);

      session.current = _connected;
      expect(events, <String>['renderers active', 'audio active']);
    });

    test('a failing drain does not stop the teardown', () async {
      final _DrivenVoiceSession session = start(
        drainError: Exception('drain failed'),
      );

      await expectLater(session.drain(), completes);
      expect(
        events,
        containsAll(<String>['renderers drained', 'audio drained']),
      );
    });
  });
}
