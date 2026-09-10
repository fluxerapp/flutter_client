import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/features/ui/voice/voice_call_avatar.dart';
import 'package:fluxer_app/features/ui/voice/voice_participant_media_tile.dart';
import 'package:fluxer_app/features/ui/voice/voice_stream_preview_image.dart';
import 'package:fluxer_app/features/voice/utils/voice_video_subscription.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:riverpod/src/framework.dart' show Override;
import 'package:visibility_detector/visibility_detector.dart';

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
  final Dio dio = Dio();
  dio.httpClientAdapter = _PreviewBytesAdapter(const <int>[
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
    ProviderScope(
      overrides: overrides,
      child: MaterialApp(
        home: Scaffold(body: SizedBox(width: 160, height: 160, child: tile)),
      ),
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
        room: null,
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
        room: null,
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
}
