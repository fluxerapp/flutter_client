import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/audio/enums/fluxer_sfx_clip.dart';
import 'package:fluxer_app/core/audio/fluxer_sfx.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fluxer_sfx_test.mocks.dart';

@GenerateMocks(<Type>[AudioPlayer])
void main() {
  late MockAudioPlayer mockLoopPlayer;
  late MockAudioPlayer mockOneShotPlayer;
  late FluxerSFX sfx;

  setUp(() {
    mockLoopPlayer = MockAudioPlayer();
    mockOneShotPlayer = MockAudioPlayer();
    sfx = FluxerSFX(
      loopPlayer: mockLoopPlayer,
      oneShotPlayer: mockOneShotPlayer,
    );
  });

  group('playOneShot', () {
    test('sets audio context once and reuses it for the same policy', () async {
      when(mockOneShotPlayer.setAudioContext(any)).thenAnswer((_) async {});
      when(mockOneShotPlayer.setReleaseMode(any)).thenAnswer((_) async {});
      when(mockOneShotPlayer.stop()).thenAnswer((_) async {});
      when(mockOneShotPlayer.setVolume(any)).thenAnswer((_) async {});
      when(mockOneShotPlayer.play(any)).thenAnswer((_) async {});

      await sfx.playOneShot(FluxerSfxClip.message);
      await sfx.playOneShot(FluxerSfxClip.message);
      await sfx.playOneShot(FluxerSfxClip.directMessage);

      verify(mockOneShotPlayer.setAudioContext(any)).called(1);
      verify(mockOneShotPlayer.setReleaseMode(ReleaseMode.release)).called(3);
      verify(mockOneShotPlayer.stop()).called(3);
      verify(mockOneShotPlayer.setVolume(any)).called(3);
      verify(mockOneShotPlayer.play(any)).called(3);
    });

    test('changes audio context when policy changes', () async {
      when(mockOneShotPlayer.setAudioContext(any)).thenAnswer((_) async {});
      when(mockOneShotPlayer.setReleaseMode(any)).thenAnswer((_) async {});
      when(mockOneShotPlayer.stop()).thenAnswer((_) async {});
      when(mockOneShotPlayer.setVolume(any)).thenAnswer((_) async {});
      when(mockOneShotPlayer.play(any)).thenAnswer((_) async {});

      await sfx.playOneShot(FluxerSfxClip.message);
      await sfx.playOneShot(FluxerSfxClip.message, ignoreRingerPolicy: true);

      verify(mockOneShotPlayer.setAudioContext(any)).called(2);
    });
  });

  group('startLoop', () {
    test('sets audio context once and reuses it for the same clip', () async {
      when(mockLoopPlayer.setAudioContext(any)).thenAnswer((_) async {});
      when(mockLoopPlayer.setReleaseMode(any)).thenAnswer((_) async {});
      when(mockLoopPlayer.stop()).thenAnswer((_) async {});
      when(mockLoopPlayer.setVolume(any)).thenAnswer((_) async {});
      when(mockLoopPlayer.play(any)).thenAnswer((_) async {});

      await sfx.startLoop(FluxerSfxClip.incomingRing);
      await sfx.startLoop(FluxerSfxClip.incomingRing);

      verify(mockLoopPlayer.setAudioContext(any)).called(1);
      verify(mockLoopPlayer.setReleaseMode(ReleaseMode.loop)).called(1);
      verify(mockLoopPlayer.stop()).called(1);
      verify(mockLoopPlayer.setVolume(any)).called(1);
      verify(mockLoopPlayer.play(any)).called(1);
    });
  });

  group('stopLoop', () {
    test('stops the loop player and resets loop state', () async {
      when(mockLoopPlayer.stop()).thenAnswer((_) async {});

      await sfx.stopLoop();

      verify(mockLoopPlayer.stop()).called(1);
    });
  });

  group('dispose', () {
    test('disposes both players', () async {
      when(mockLoopPlayer.dispose()).thenAnswer((_) async {});
      when(mockOneShotPlayer.dispose()).thenAnswer((_) async {});

      await sfx.dispose();

      verify(mockLoopPlayer.dispose()).called(1);
      verify(mockOneShotPlayer.dispose()).called(1);
    });
  });
}
