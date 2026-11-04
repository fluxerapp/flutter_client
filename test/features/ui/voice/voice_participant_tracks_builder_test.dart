import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/voice/voice_participant_tracks_builder.dart';
import 'package:fluxer_app/features/voice/domain/voice_media_participant.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:livekit_client/livekit_client.dart';

class _FakeVideoTrack extends Fake implements VideoTrack {}

class _FakeParticipant extends ChangeNotifier implements VoiceMediaParticipant {
  VideoTrack? camera;

  void emit() => notifyListeners();

  @override
  VideoTrack? get cameraTrack => camera;

  @override
  VideoTrack? get screenShareTrack => null;

  @override
  AudioTrack? get screenShareAudioTrack => null;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  testWidgets('rebuilds only when track identity changes', (
    WidgetTester tester,
  ) async {
    final _FakeParticipant participant = _FakeParticipant();
    final List<VideoTrack?> builds = <VideoTrack?>[];

    await tester.pumpWidget(
      VoiceParticipantTracksBuilder(
        participant: participant,
        isScreenShare: false,
        builder: (BuildContext _, VideoTrack? track, AudioTrack? _) {
          builds.add(track);
          return const SizedBox.shrink();
        },
      ),
    );
    expect(builds, hasLength(1));

    participant.emit();
    await tester.pump();
    expect(builds, hasLength(1));

    final VideoTrack track = _FakeVideoTrack();
    participant
      ..camera = track
      ..emit();
    await tester.pump();
    expect(builds, hasLength(2));
    expect(builds.last, same(track));
  });
}
