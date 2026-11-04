import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/domain/voice_media_participant.dart';
import 'package:fluxer_app/features/voice/utils/media/video_subscription.dart';
import 'package:fluxer_app/features/voice/utils/media/voice_video_claims.dart';
import 'package:livekit_client/livekit_client.dart';

class _FakeVideoTrack extends Fake implements VideoTrack {}

class _FakeParticipant extends ChangeNotifier implements VoiceMediaParticipant {
  final List<({TrackSource source, bool wanted, VideoQuality? quality})> video =
      <({TrackSource source, bool wanted, VideoQuality? quality})>[];
  final List<bool> screenAudio = <bool>[];
  VideoTrack? track;
  int listeners = 0;
  bool failNextVideo = false;

  @override
  void addListener(VoidCallback listener) {
    listeners++;
    super.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    listeners--;
    super.removeListener(listener);
  }

  void emit() => notifyListeners();

  @override
  String get identity => 'user_1_conn';

  @override
  String? get userId => '1';

  @override
  bool get hasCamera => true;

  @override
  VideoTrack? get cameraTrack => track;

  @override
  bool get hasScreenShare => true;

  @override
  VideoTrack? get screenShareTrack => track;

  @override
  bool get hasScreenShareAudio => true;

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
  }) async {
    video.add((source: source, wanted: wanted, quality: quality));
    if (failNextVideo) {
      failNextVideo = false;
      throw StateError('failed');
    }
  }

  @override
  Future<void> setScreenShareAudioWanted({required bool wanted}) async {
    screenAudio.add(wanted);
  }
}

void main() {
  testWidgets('highest claimed quality wins', (WidgetTester tester) async {
    final _FakeParticipant participant = _FakeParticipant();
    final VoiceVideoClaims claims = VoiceVideoClaims.of(participant);

    final VoiceVideoClaim low = claims.claim(
      TrackSource.camera,
      quality: VideoQuality.LOW,
    );
    final VoiceVideoClaim high = claims.claim(
      TrackSource.camera,
      quality: VideoQuality.HIGH,
    );
    await tester.pump();
    expect(participant.video.last.quality, VideoQuality.HIGH);

    high.release();
    await tester.pump();
    expect(participant.video.last.quality, VideoQuality.LOW);
    expect(participant.video.last.wanted, isTrue);

    low.release();
    await tester.pump(kVoiceVideoUnsubscribeGrace);
  });

  testWidgets('quality is re-applied when the track arrives', (
    WidgetTester tester,
  ) async {
    final _FakeParticipant participant = _FakeParticipant();
    final VoiceVideoClaim claim = VoiceVideoClaims.of(
      participant,
    ).claim(TrackSource.camera, quality: VideoQuality.LOW);
    await tester.pump();
    expect(participant.video, hasLength(1));

    participant
      ..track = _FakeVideoTrack()
      ..emit();
    await tester.pump();

    expect(participant.video, hasLength(2));
    expect(participant.video.last.quality, VideoQuality.LOW);

    claim.release();
    await tester.pump(kVoiceVideoUnsubscribeGrace);
  });

  testWidgets('unrelated notifications do not resend subscriptions', (
    WidgetTester tester,
  ) async {
    final _FakeParticipant participant = _FakeParticipant();
    final VoiceVideoClaim claim = VoiceVideoClaims.of(
      participant,
    ).claim(TrackSource.camera, quality: VideoQuality.LOW);

    participant
      ..emit()
      ..emit();
    await tester.pump();

    expect(participant.video, hasLength(1));

    claim.release();
    await tester.pump(kVoiceVideoUnsubscribeGrace);
  });

  testWidgets('last release unsubscribes after the grace period', (
    WidgetTester tester,
  ) async {
    final _FakeParticipant participant = _FakeParticipant();
    VoiceVideoClaims.of(
      participant,
    ).claim(TrackSource.camera, quality: VideoQuality.LOW).release();

    expect(participant.video.where((e) => !e.wanted), isEmpty);
    expect(participant.listeners, 1);

    await tester.pump(kVoiceVideoUnsubscribeGrace);

    expect(participant.video.last.wanted, isFalse);
    expect(participant.video.last.source, TrackSource.camera);
    expect(participant.listeners, 0);
  });

  testWidgets('a new claim during the grace period keeps the track', (
    WidgetTester tester,
  ) async {
    final _FakeParticipant participant = _FakeParticipant();
    final VoiceVideoClaims claims = VoiceVideoClaims.of(participant);
    claims.claim(TrackSource.camera, quality: VideoQuality.LOW).release();

    await tester.pump(const Duration(milliseconds: 100));
    final VoiceVideoClaim next = claims.claim(
      TrackSource.camera,
      quality: VideoQuality.LOW,
    );
    await tester.pump(kVoiceVideoUnsubscribeGrace);

    expect(participant.video.where((e) => !e.wanted), isEmpty);

    next.release();
    await tester.pump(kVoiceVideoUnsubscribeGrace);
  });

  testWidgets('screen share claims pair the audio subscription', (
    WidgetTester tester,
  ) async {
    final _FakeParticipant participant = _FakeParticipant();
    final VoiceVideoClaim claim = VoiceVideoClaims.of(
      participant,
    ).claim(TrackSource.screenShareVideo, quality: VideoQuality.HIGH);
    await tester.pump();
    expect(participant.screenAudio, <bool>[true]);

    claim.release();
    await tester.pump(kVoiceVideoUnsubscribeGrace);
    expect(participant.screenAudio, <bool>[true, false]);
  });

  testWidgets('sources are tracked independently', (WidgetTester tester) async {
    final _FakeParticipant participant = _FakeParticipant();
    final VoiceVideoClaims claims = VoiceVideoClaims.of(participant);
    final VoiceVideoClaim camera = claims.claim(
      TrackSource.camera,
      quality: VideoQuality.LOW,
    );
    final VoiceVideoClaim screen = claims.claim(
      TrackSource.screenShareVideo,
      quality: VideoQuality.HIGH,
    );

    camera.release();
    await tester.pump(kVoiceVideoUnsubscribeGrace);

    expect(participant.video.last.source, TrackSource.camera);
    expect(participant.video.last.wanted, isFalse);
    expect(participant.listeners, 1);

    screen.release();
    await tester.pump(kVoiceVideoUnsubscribeGrace);
    expect(participant.listeners, 0);
  });

  testWidgets('a failed subscribe retries on the next notification', (
    WidgetTester tester,
  ) async {
    final _FakeParticipant participant = _FakeParticipant()
      ..failNextVideo = true;
    final VoiceVideoClaim claim = VoiceVideoClaims.of(
      participant,
    ).claim(TrackSource.camera, quality: VideoQuality.LOW);
    await tester.pump();

    participant.emit();
    await tester.pump();

    expect(participant.video, hasLength(2));

    claim.release();
    await tester.pump(kVoiceVideoUnsubscribeGrace);
  });

  testWidgets('claims never call the participant synchronously', (
    WidgetTester tester,
  ) async {
    final _FakeParticipant participant = _FakeParticipant();
    final VoiceVideoClaim claim = VoiceVideoClaims.of(
      participant,
    ).claim(TrackSource.camera, quality: VideoQuality.LOW);

    expect(participant.video, isEmpty);

    await tester.pump();
    expect(participant.video, hasLength(1));

    claim.release();
    await tester.pump(kVoiceVideoUnsubscribeGrace);
  });

  testWidgets('double release is ignored', (WidgetTester tester) async {
    final _FakeParticipant participant = _FakeParticipant();
    final VoiceVideoClaims claims = VoiceVideoClaims.of(participant);
    final VoiceVideoClaim first = claims.claim(
      TrackSource.camera,
      quality: VideoQuality.LOW,
    );
    final VoiceVideoClaim second = claims.claim(
      TrackSource.camera,
      quality: VideoQuality.HIGH,
    );

    first
      ..release()
      ..release();
    await tester.pump();

    expect(participant.video.where((e) => !e.wanted), isEmpty);
    second.update(VideoQuality.MEDIUM);
    await tester.pump();
    expect(participant.video.last.quality, VideoQuality.MEDIUM);
  });
}
