import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/audio/app_media_audio_session.dart';
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
  late StreamController<void> oneShotCompleteController;

  setUp(() {
    mockLoopPlayer = MockAudioPlayer();
    mockOneShotPlayer = MockAudioPlayer();
    oneShotCompleteController = StreamController<void>.broadcast();
    when(
      mockOneShotPlayer.onPlayerComplete,
    ).thenAnswer((_) => oneShotCompleteController.stream);
    sfx = FluxerSFX(
      loopPlayer: mockLoopPlayer,
      oneShotPlayer: mockOneShotPlayer,
    );
  });

  tearDown(() async {
    await oneShotCompleteController.close();
  });

  group('audioContextForSfxClip', () {
    test('notification clips use ambient or ringtone context', () {
      expect(
        audioContextForSfxClip(
          FluxerSfxClip.message,
          ignoreRingerPolicy: false,
          isIncomingRingLoop: false,
        ),
        kNotificationSfxContext,
      );
    });

    test('session feedback clips use media mixable context', () {
      expect(
        audioContextForSfxClip(
          FluxerSfxClip.mute,
          ignoreRingerPolicy: false,
          isIncomingRingLoop: false,
        ),
        kSessionFeedbackSfxContext,
      );
    });

    test('preview playback can ignore ringer policy', () {
      expect(
        audioContextForSfxClip(
          FluxerSfxClip.message,
          ignoreRingerPolicy: true,
          isIncomingRingLoop: false,
        ),
        kSessionFeedbackSfxContext,
      );
    });
  });

  group('shouldRestoreAppMediaAudioAfterSfxContext', () {
    test('only incoming ring restores app media audio', () {
      expect(
        shouldRestoreAppMediaAudioAfterSfxContext(kNotificationSfxContext),
        isFalse,
      );
      expect(
        shouldRestoreAppMediaAudioAfterSfxContext(kIncomingRingLoopContext),
        isTrue,
      );
      expect(
        shouldRestoreAppMediaAudioAfterSfxContext(kSessionFeedbackSfxContext),
        isFalse,
      );
    });
  });

  group('playOneShot', () {
    test('uses notification context for message sounds', () async {
      when(mockOneShotPlayer.setAudioContext(any)).thenAnswer((_) async {});
      when(mockOneShotPlayer.setReleaseMode(any)).thenAnswer((_) async {});
      when(mockOneShotPlayer.stop()).thenAnswer((_) async {});
      when(mockOneShotPlayer.setVolume(any)).thenAnswer((_) async {});
      when(mockOneShotPlayer.play(any)).thenAnswer((_) async {});

      await sfx.playOneShot(FluxerSfxClip.message);

      verify(
        mockOneShotPlayer.setAudioContext(kNotificationSfxContext),
      ).called(1);
    });

    test('uses session feedback context for voice ui sounds', () async {
      when(mockOneShotPlayer.setAudioContext(any)).thenAnswer((_) async {});
      when(mockOneShotPlayer.setReleaseMode(any)).thenAnswer((_) async {});
      when(mockOneShotPlayer.stop()).thenAnswer((_) async {});
      when(mockOneShotPlayer.setVolume(any)).thenAnswer((_) async {});
      when(mockOneShotPlayer.play(any)).thenAnswer((_) async {});

      await sfx.playOneShot(FluxerSfxClip.mute);

      verify(
        mockOneShotPlayer.setAudioContext(kSessionFeedbackSfxContext),
      ).called(1);
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
    test('restores app media context after stopping the ring', () async {
      when(mockLoopPlayer.stop()).thenAnswer((_) async {});
      when(mockLoopPlayer.setAudioContext(any)).thenAnswer((_) async {});
      when(mockOneShotPlayer.setAudioContext(any)).thenAnswer((_) async {});

      await sfx.stopLoop();

      verify(mockLoopPlayer.stop()).called(1);
      verify(
        mockOneShotPlayer.setAudioContext(kAppMediaAudioContext),
      ).called(1);
      verify(mockLoopPlayer.setAudioContext(kAppMediaAudioContext)).called(1);
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
