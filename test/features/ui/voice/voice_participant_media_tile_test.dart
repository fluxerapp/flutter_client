import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/voice/voice_call_avatar.dart';
import 'package:fluxer_app/features/ui/voice/voice_participant_media_tile.dart';
import 'package:fluxer_app/features/voice/utils/voice_video_subscription.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 160,
            height: 160,
            child: VoiceParticipantMediaTile(
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
              authToken: null,
              omitVideoTrack: true,
            ),
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.pump(kVoiceVideoUnsubscribeGrace);
    expect(find.byType(VoiceCallAvatar), findsOneWidget);
    expect(find.byType(VideoTrackRenderer), findsNothing);
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(kVoiceVideoUnsubscribeGrace);
  });
}
