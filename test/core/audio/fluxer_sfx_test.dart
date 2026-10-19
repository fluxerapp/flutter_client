import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/audio/app_media_audio_session.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_session.dart';
import 'package:fluxer_app/core/audio/enums/fluxer_sfx_clip.dart';
import 'package:fluxer_app/core/audio/fluxer_sfx.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fluxer_sfx_test.mocks.dart';

const MethodChannel _androidNotificationsChannel = MethodChannel(
  'fluxer_app/android_notifications',
);

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
    test('message clips use the notification context', () {
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

  group('android audio attributes', () {
    test('message sounds mix with other media as notifications', () {
      final AudioContextAndroid android = kNotificationSfxContext.android;
      expect(android.usageType, AndroidUsageType.notification);
      expect(android.contentType, AndroidContentType.sonification);
      expect(android.audioFocus, AndroidAudioFocus.none);
    });

    test('only the incoming ring loop plays as a ringtone', () {
      expect(
        kIncomingRingLoopContext.android.usageType,
        AndroidUsageType.notificationRingtone,
      );
      expect(
        kSessionFeedbackSfxContext.android.usageType,
        isNot(AndroidUsageType.notificationRingtone),
      );
    });
  });

  group('shouldRestorePreferredAudioAfterOneShot', () {
    test('only incoming ring restores preferred audio session', () {
      expect(
        shouldRestorePreferredAudioAfterOneShot(kNotificationSfxContext),
        isFalse,
      );
      expect(
        shouldRestorePreferredAudioAfterOneShot(kIncomingRingLoopContext),
        isTrue,
      );
      expect(
        shouldRestorePreferredAudioAfterOneShot(kSessionFeedbackSfxContext),
        isFalse,
      );
    });
  });

  group('playOneShot', () {
    test('uses notification context for message sounds', () async {
      when(mockOneShotPlayer.setAudioContext(any)).thenAnswer((_) async {
        return;
      });
      when(mockOneShotPlayer.setReleaseMode(any)).thenAnswer((_) async {
        return;
      });
      when(mockOneShotPlayer.stop()).thenAnswer((_) async {
        return;
      });
      when(mockOneShotPlayer.setVolume(any)).thenAnswer((_) async {
        return;
      });
      when(mockOneShotPlayer.play(any)).thenAnswer((_) async {
        return;
      });

      await sfx.playOneShot(FluxerSfxClip.message);

      verify(
        mockOneShotPlayer.setAudioContext(kNotificationSfxContext),
      ).called(1);
    });

    test(
      'reapplies notification context for back to back message sounds',
      () async {
        when(mockOneShotPlayer.setAudioContext(any)).thenAnswer((_) async {
          return;
        });
        when(mockOneShotPlayer.setReleaseMode(any)).thenAnswer((_) async {
          return;
        });
        when(mockOneShotPlayer.stop()).thenAnswer((_) async {
          return;
        });
        when(mockOneShotPlayer.setVolume(any)).thenAnswer((_) async {
          return;
        });
        when(mockOneShotPlayer.play(any)).thenAnswer((_) async {
          return;
        });

        await sfx.playOneShot(FluxerSfxClip.message);
        await sfx.playOneShot(FluxerSfxClip.message);

        verify(
          mockOneShotPlayer.setAudioContext(kNotificationSfxContext),
        ).called(2);
      },
    );

    test('uses session feedback context for voice ui sounds', () async {
      when(mockOneShotPlayer.setAudioContext(any)).thenAnswer((_) async {
        return;
      });
      when(mockOneShotPlayer.setReleaseMode(any)).thenAnswer((_) async {
        return;
      });
      when(mockOneShotPlayer.stop()).thenAnswer((_) async {
        return;
      });
      when(mockOneShotPlayer.setVolume(any)).thenAnswer((_) async {
        return;
      });
      when(mockOneShotPlayer.play(any)).thenAnswer((_) async {
        return;
      });

      await sfx.playOneShot(FluxerSfxClip.mute);

      verify(
        mockOneShotPlayer.setAudioContext(kSessionFeedbackSfxContext),
      ).called(1);
    });
  });

  group('startLoop', () {
    test(
      'does not play incoming ring when android ringer is silenced',
      () async {
        debugDefaultTargetPlatformOverride = TargetPlatform.android;
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(_androidNotificationsChannel, (
              MethodCall call,
            ) async {
              if (call.method == 'isNotificationSoundSuppressed') {
                return true;
              }
              return null;
            });
        when(mockLoopPlayer.setAudioContext(any)).thenAnswer((_) async {
          return;
        });
        when(mockLoopPlayer.setReleaseMode(any)).thenAnswer((_) async {
          return;
        });
        when(mockLoopPlayer.stop()).thenAnswer((_) async {
          return;
        });
        when(mockLoopPlayer.setVolume(any)).thenAnswer((_) async {
          return;
        });
        when(mockLoopPlayer.play(any)).thenAnswer((_) async {
          return;
        });

        await sfx.startLoop(FluxerSfxClip.incomingRing);

        verifyNever(mockLoopPlayer.play(any));
        debugDefaultTargetPlatformOverride = null;
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(_androidNotificationsChannel, null);
      },
    );

    test('uses incoming ring context for the ring loop', () async {
      when(mockLoopPlayer.setAudioContext(any)).thenAnswer((_) async {
        return;
      });
      when(mockLoopPlayer.setReleaseMode(any)).thenAnswer((_) async {
        return;
      });
      when(mockLoopPlayer.stop()).thenAnswer((_) async {
        return;
      });
      when(mockLoopPlayer.setVolume(any)).thenAnswer((_) async {
        return;
      });
      when(mockLoopPlayer.play(any)).thenAnswer((_) async {
        return;
      });

      await sfx.startLoop(FluxerSfxClip.incomingRing);
      await sfx.startLoop(FluxerSfxClip.incomingRing);

      verify(
        mockLoopPlayer.setAudioContext(kIncomingRingLoopContext),
      ).called(1);
      verify(mockLoopPlayer.setReleaseMode(ReleaseMode.loop)).called(1);
      verify(mockLoopPlayer.stop()).called(1);
      verify(mockLoopPlayer.setVolume(any)).called(2);
      verify(mockLoopPlayer.play(any)).called(1);
    });
  });

  group('stopLoop', () {
    test('restores app media context after stopping the ring', () async {
      when(mockLoopPlayer.stop()).thenAnswer((_) async {
        return;
      });
      when(mockLoopPlayer.setAudioContext(any)).thenAnswer((_) async {
        return;
      });
      when(mockOneShotPlayer.setAudioContext(any)).thenAnswer((_) async {
        return;
      });

      await sfx.stopLoop();

      verify(mockLoopPlayer.stop()).called(1);
      verify(
        mockOneShotPlayer.setAudioContext(kAppMediaAudioContext),
      ).called(1);
      verify(mockLoopPlayer.setAudioContext(kAppMediaAudioContext)).called(1);
    });
  });

  group('Android voice call audio route', () {
    setUp(() {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      ChatAttachmentAudioSession.instance.resetForTest();
      for (final MockAudioPlayer player in <MockAudioPlayer>[
        mockOneShotPlayer,
        mockLoopPlayer,
      ]) {
        when(player.setAudioContext(any)).thenAnswer((_) async {
          return;
        });
        when(player.setReleaseMode(any)).thenAnswer((_) async {
          return;
        });
        when(player.stop()).thenAnswer((_) async {
          return;
        });
        when(player.setVolume(any)).thenAnswer((_) async {
          return;
        });
        when(player.play(any)).thenAnswer((_) async {
          return;
        });
      }
    });

    tearDown(() {
      debugDefaultTargetPlatformOverride = null;
      ChatAttachmentAudioSession.instance.resetForTest();
    });

    test('sounds during a call leave the audio mode and route alone', () async {
      await ChatAttachmentAudioSession.instance.clearForVoiceCall();

      await sfx.playOneShot(FluxerSfxClip.userJoin);
      await sfx.playOneShot(FluxerSfxClip.message);
      await sfx.startLoop(FluxerSfxClip.incomingRing);
      await sfx.stopLoop();

      verifyNever(mockOneShotPlayer.setAudioContext(any));
      verifyNever(mockLoopPlayer.setAudioContext(any));
      verify(mockOneShotPlayer.play(any)).called(2);
      verify(mockLoopPlayer.play(any)).called(1);
    });

    test('the sound context applies again once the call ends', () async {
      await ChatAttachmentAudioSession.instance.clearForVoiceCall();
      await sfx.playOneShot(FluxerSfxClip.message);
      ChatAttachmentAudioSession.instance.restoreAfterVoiceCall();

      await sfx.playOneShot(FluxerSfxClip.message);

      verify(
        mockOneShotPlayer.setAudioContext(kNotificationSfxContext),
      ).called(1);
    });
  });

  group('dispose', () {
    test('disposes both players', () async {
      when(mockLoopPlayer.dispose()).thenAnswer((_) async {
        return;
      });
      when(mockOneShotPlayer.dispose()).thenAnswer((_) async {
        return;
      });

      await sfx.dispose();

      verify(mockLoopPlayer.dispose()).called(1);
      verify(mockOneShotPlayer.dispose()).called(1);
    });
  });
}
