import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/audio/enums/fluxer_sfx_clip.dart';
import 'package:fluxer_app/core/audio/fluxer_sfx.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fluxer_sfx_test.mocks.dart';

@GenerateMocks(<Type>[AudioPlayer])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

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
    test('sets mixable audio context once for all one-shots', () async {
      when(mockOneShotPlayer.setAudioContext(any)).thenAnswer((_) async {});
      when(mockOneShotPlayer.setReleaseMode(any)).thenAnswer((_) async {});
      when(mockOneShotPlayer.stop()).thenAnswer((_) async {});
      when(mockOneShotPlayer.setVolume(any)).thenAnswer((_) async {});
      when(mockOneShotPlayer.play(any)).thenAnswer((_) async {});

      await sfx.playOneShot(FluxerSfxClip.message);
      await sfx.playOneShot(FluxerSfxClip.message);
      await sfx.playOneShot(FluxerSfxClip.directMessage);
      await sfx.playOneShot(FluxerSfxClip.mute, ignoreRingerPolicy: true);

      verify(mockOneShotPlayer.setAudioContext(kMixableSfxContext)).called(1);
      verify(mockOneShotPlayer.setReleaseMode(ReleaseMode.release)).called(4);
      verify(mockOneShotPlayer.stop()).called(4);
      verify(mockOneShotPlayer.setVolume(any)).called(4);
      verify(mockOneShotPlayer.play(any)).called(4);
    });
  });

  group('startLoop', () {
    test('uses incoming ring context for the ring loop', () async {
      when(mockLoopPlayer.setAudioContext(any)).thenAnswer((_) async {});
      when(mockLoopPlayer.setReleaseMode(any)).thenAnswer((_) async {});
      when(mockLoopPlayer.stop()).thenAnswer((_) async {});
      when(mockLoopPlayer.setVolume(any)).thenAnswer((_) async {});
      when(mockLoopPlayer.play(any)).thenAnswer((_) async {});

      await sfx.startLoop(FluxerSfxClip.incomingRing);
      await sfx.startLoop(FluxerSfxClip.incomingRing);

      verify(
        mockLoopPlayer.setAudioContext(kIncomingRingLoopContext),
      ).called(1);
      verify(mockLoopPlayer.setReleaseMode(ReleaseMode.loop)).called(1);
      verify(mockLoopPlayer.stop()).called(1);
      verify(mockLoopPlayer.setVolume(any)).called(1);
      verify(mockLoopPlayer.play(any)).called(1);
    });
  });

  group('stopLoop', () {
    test('restores mixable context after stopping the ring', () async {
      when(mockLoopPlayer.stop()).thenAnswer((_) async {});
      when(mockLoopPlayer.setAudioContext(any)).thenAnswer((_) async {});
      when(mockOneShotPlayer.setAudioContext(any)).thenAnswer((_) async {});

      await sfx.stopLoop();

      verify(mockLoopPlayer.stop()).called(1);
      verify(mockOneShotPlayer.setAudioContext(kMixableSfxContext)).called(1);
      verify(mockLoopPlayer.setAudioContext(kMixableSfxContext)).called(1);
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
