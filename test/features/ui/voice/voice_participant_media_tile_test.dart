import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/features/ui/voice/voice_blocked_participant_placeholder.dart';
import 'package:fluxer_app/features/ui/voice/voice_call_avatar.dart';
import 'package:fluxer_app/features/ui/voice/voice_participant_media_tile.dart';
import 'package:fluxer_app/features/ui/voice/voice_stream_preview_image.dart';
import 'package:fluxer_app/features/voice/domain/voice_media_participant.dart';
import 'package:fluxer_app/features/voice/utils/media/video_subscription.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:riverpod/src/framework.dart' show Override;
import 'package:visibility_detector/visibility_detector.dart';

import '../../../helpers/pump_fluxer_app.dart';

class _PreviewBytesAdapter implements HttpClientAdapter {
  _PreviewBytesAdapter(this.bytes);

  final List<int> bytes;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    return ResponseBody.fromBytes(
      bytes,
      200,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>['image/jpeg'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

Dio _previewDio() {
  final Dio dio = Dio()
    ..httpClientAdapter = _PreviewBytesAdapter(const <int>[
      0xFF,
      0xD8,
      0xFF,
      0xD9,
    ]);
  return dio;
}

Future<void> _pumpTile(
  WidgetTester tester, {
  required VoiceParticipantMediaTile tile,
  List<Override> overrides = const <Override>[],
}) async {
  await tester.pumpWidget(
    pumpFluxerApp(
      overrides: overrides,
      child: Scaffold(body: SizedBox(width: 160, height: 160, child: tile)),
    ),
  );
  await tester.pump();
  await tester.pump(kVoiceVideoUnsubscribeGrace);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
  });

  tearDown(() {
    VisibilityDetectorController.instance.updateInterval = const Duration(
      milliseconds: 500,
    );
  });

  testWidgets('omitted video shows avatar without a renderer', (
    WidgetTester tester,
  ) async {
    await _pumpTile(
      tester,
      tile: const VoiceParticipantMediaTile(
        media: null,
        userId: 'u1',
        currentUserId: 'me',
        localConnectionId: null,
        voice: VoiceState(userId: 'u1', selfVideo: true),
        display: 'Ada',
        backgroundColor: Color(0xFF333333),
        tileSource: VoiceParticipantTileSource.camera,
        isActiveScreenShare: false,
        streamPreviewUrl: null,
        omitVideoTrack: true,
      ),
    );
    expect(find.byType(VoiceCallAvatar), findsOneWidget);
    expect(find.byType(VideoTrackRenderer), findsNothing);
    expect(find.byType(VoiceStreamPreviewImage), findsNothing);
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(kVoiceVideoUnsubscribeGrace);
  });

  testWidgets('unwatched remote stream shows preview image', (
    WidgetTester tester,
  ) async {
    await _pumpTile(
      tester,
      overrides: <Override>[fluxerDioProvider.overrideWithValue(_previewDio())],
      tile: const VoiceParticipantMediaTile(
        media: null,
        userId: 'streamer',
        currentUserId: 'me',
        localConnectionId: 'my-conn',
        voice: VoiceState(
          userId: 'streamer',
          guildId: 'g1',
          channelId: 'c1',
          connectionId: 'stream-conn',
          selfStream: true,
        ),
        display: 'Bea',
        backgroundColor: Color(0xFF333333),
        tileSource: VoiceParticipantTileSource.screenShare,
        isActiveScreenShare: false,
        streamPreviewUrl:
            'https://api.example/v1/streams/g1:c1:stream-conn/preview',
      ),
    );
    expect(find.byType(VoiceStreamPreviewImage), findsOneWidget);
    expect(find.byType(VoiceCallAvatar), findsNothing);
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(kVoiceVideoUnsubscribeGrace);
  });

  testWidgets('a blocked participant stream shows only the placeholder', (
    WidgetTester tester,
  ) async {
    await _pumpTile(
      tester,
      overrides: <Override>[fluxerDioProvider.overrideWithValue(_previewDio())],
      tile: const VoiceParticipantMediaTile(
        media: null,
        userId: 'streamer',
        currentUserId: 'me',
        localConnectionId: 'my-conn',
        voice: VoiceState(
          userId: 'streamer',
          guildId: 'g1',
          channelId: 'c1',
          connectionId: 'stream-conn',
          selfStream: true,
        ),
        display: 'Bea',
        backgroundColor: Color(0xFF333333),
        tileSource: VoiceParticipantTileSource.screenShare,
        isActiveScreenShare: true,
        streamPreviewUrl:
            'https://api.example/v1/streams/g1:c1:stream-conn/preview',
        blocked: true,
      ),
    );
    expect(find.byType(VoiceBlockedParticipantPlaceholder), findsOneWidget);
    expect(find.byType(VoiceStreamPreviewImage), findsNothing);
    expect(find.byType(VoiceCallAvatar), findsNothing);
    expect(find.text('Video from someone you blocked'), findsOneWidget);
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(kVoiceVideoUnsubscribeGrace);
  });

  group('remote camera subscription', () {
    late _FakeParticipant participant;
    late _FakeMediaRoom media;

    VoiceParticipantMediaTile cameraTile({Key? key}) {
      return VoiceParticipantMediaTile(
        key: key,
        media: media,
        userId: 'u1',
        currentUserId: 'me',
        localConnectionId: null,
        voice: const VoiceState(userId: 'u1', selfVideo: true),
        display: 'Ada',
        backgroundColor: const Color(0xFF333333),
        tileSource: VoiceParticipantTileSource.camera,
        isActiveScreenShare: false,
        streamPreviewUrl: null,
      );
    }

    setUp(() {
      participant = _FakeParticipant();
      media = _FakeMediaRoom(participant);
    });

    testWidgets('a watched share subscribes on mount without visibility', (
      WidgetTester tester,
    ) async {
      VisibilityDetectorController.instance.updateInterval = const Duration(
        milliseconds: 500,
      );
      await tester.pumpWidget(
        pumpFluxerApp(
          child: Scaffold(
            body: SizedBox(
              width: 160,
              height: 160,
              child: VoiceParticipantMediaTile(
                media: media,
                userId: 'u1',
                currentUserId: 'me',
                localConnectionId: null,
                voice: const VoiceState(userId: 'u1', selfStream: true),
                display: 'Ada',
                backgroundColor: const Color(0xFF333333),
                tileSource: VoiceParticipantTileSource.screenShare,
                isActiveScreenShare: true,
                streamPreviewUrl: null,
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      expect(participant.wanted, <bool>[true]);

      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump(const Duration(milliseconds: 600));
      await tester.pump(kVoiceVideoUnsubscribeGrace);
    });

    testWidgets('disposing a tile releases the track', (
      WidgetTester tester,
    ) async {
      await _pumpTile(tester, tile: cameraTile());
      await tester.pump();
      expect(participant.wanted, contains(true));
      expect(participant.wanted, isNot(contains(false)));

      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump(kVoiceVideoUnsubscribeGrace);

      expect(participant.wanted.last, isFalse);
    });

    testWidgets('a blocked participant never subscribes', (
      WidgetTester tester,
    ) async {
      await _pumpTile(
        tester,
        tile: VoiceParticipantMediaTile(
          media: media,
          userId: 'u1',
          currentUserId: 'me',
          localConnectionId: null,
          voice: const VoiceState(userId: 'u1', selfStream: true),
          display: 'Ada',
          backgroundColor: const Color(0xFF333333),
          tileSource: VoiceParticipantTileSource.screenShare,
          isActiveScreenShare: true,
          streamPreviewUrl: null,
          blocked: true,
        ),
      );
      await tester.pump();

      expect(participant.wanted, isEmpty);

      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump(kVoiceVideoUnsubscribeGrace);
    });

    testWidgets('remounting a tile keeps the track subscribed', (
      WidgetTester tester,
    ) async {
      VisibilityDetectorController.instance.updateInterval = const Duration(
        milliseconds: 500,
      );
      await tester.pumpWidget(
        pumpFluxerApp(
          child: Scaffold(
            body: SizedBox(
              width: 160,
              height: 160,
              child: cameraTile(key: const ValueKey<int>(1)),
            ),
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 600));
      await tester.pump();
      expect(participant.wanted, <bool>[true]);

      await tester.pumpWidget(
        pumpFluxerApp(
          child: Scaffold(
            body: SizedBox(
              width: 160,
              height: 160,
              child: cameraTile(key: const ValueKey<int>(2)),
            ),
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 600));
      await tester.pump();
      await tester.pump(kVoiceVideoUnsubscribeGrace);

      expect(participant.wanted, isNot(contains(false)));

      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump(kVoiceVideoUnsubscribeGrace);
    });
  });
}

class _FakeMediaRoom implements VoiceMediaRoom {
  _FakeMediaRoom(this.participant);

  final VoiceMediaParticipant participant;

  @override
  Iterable<VoiceMediaParticipant> get participants => <VoiceMediaParticipant>[
    participant,
  ];

  @override
  VoiceMediaParticipant? participantFor({
    required VoiceState voice,
    required String userId,
    required String? currentUserId,
    required String? localConnectionId,
  }) {
    return participant;
  }
}

class _FakeParticipant extends ChangeNotifier implements VoiceMediaParticipant {
  final List<bool> wanted = <bool>[];

  @override
  String get identity => 'user_u1_conn';

  @override
  String? get userId => 'u1';

  @override
  bool get hasCamera => true;

  @override
  VideoTrack? get cameraTrack => null;

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
  }) async {
    this.wanted.add(wanted);
  }

  @override
  Future<void> setScreenShareAudioWanted({required bool wanted}) async {}
}
