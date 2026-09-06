import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/audio/fluxer_sfx.dart';
import 'package:fluxer_app/features/voice/utils/entrance_sound_playback.dart';
import 'package:mockito/mockito.dart';

import '../../../core/audio/fluxer_sfx_test.mocks.dart';

void main() {
  group('entranceSoundPlayerVolume', () {
    test('scales master and output volume and clamps to 0-1', () {
      expect(
        entranceSoundPlayerVolume(
          masterVolumePercent: 100,
          outputVolumePercent: 100,
        ),
        1,
      );
      expect(
        entranceSoundPlayerVolume(
          masterVolumePercent: 50,
          outputVolumePercent: 100,
        ),
        0.5,
      );
      expect(
        entranceSoundPlayerVolume(
          masterVolumePercent: 200,
          outputVolumePercent: 200,
        ),
        1,
      );
      expect(
        entranceSoundPlayerVolume(
          masterVolumePercent: 0,
          outputVolumePercent: 100,
        ),
        0,
      );
    });
  });

  group('EntranceSoundPlayer', () {
    late MockAudioPlayer mockPlayer;
    late EntranceSoundPlayer player;

    setUp(() {
      mockPlayer = MockAudioPlayer();
      when(mockPlayer.setAudioContext(any)).thenAnswer((_) async {});
      when(mockPlayer.setReleaseMode(any)).thenAnswer((_) async {});
      when(mockPlayer.stop()).thenAnswer((_) async {});
      when(mockPlayer.setVolume(any)).thenAnswer((_) async {});
      when(mockPlayer.play(any)).thenAnswer((_) async {});
      when(mockPlayer.dispose()).thenAnswer((_) async {});
      player = EntranceSoundPlayer(player: mockPlayer);
    });

    test(
      'uses mixable session feedback context and does not dispose',
      () async {
        await player.play(url: 'https://cdn.example/a.ogg', volume: 0.4);

        verify(
          mockPlayer.setAudioContext(kSessionFeedbackSfxContext),
        ).called(1);
        verify(mockPlayer.setReleaseMode(ReleaseMode.release)).called(1);
        verify(mockPlayer.stop()).called(1);
        verify(mockPlayer.setVolume(0.4)).called(1);
        verify(mockPlayer.play(any)).called(1);
        verifyNever(mockPlayer.dispose());
      },
    );

    test('skips empty urls', () async {
      await player.play(url: '');
      verifyNever(mockPlayer.play(any));
    });

    test('reuses the audio context on later plays', () async {
      await player.play(url: 'https://cdn.example/a.ogg');
      await player.play(url: 'https://cdn.example/b.ogg');

      verify(mockPlayer.setAudioContext(kSessionFeedbackSfxContext)).called(1);
      verify(mockPlayer.play(any)).called(2);
    });
  });
}
