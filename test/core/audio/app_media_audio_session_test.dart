import 'dart:async';

import 'package:audio_session/audio_session.dart';
import 'package:audioplayers/audioplayers.dart' as audioplayers;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/audio/app_media_audio_session.dart';

void main() {
  late List<Object> calls;
  late bool claimedElsewhere;
  late Completer<void>? setActiveGate;

  AppMediaAudioSession buildSession({
    required AppAudioSessionPlatform platform,
  }) {
    return AppMediaAudioSession(
      platform: platform,
      setGlobalAudioContext: (audioplayers.AudioContext context) async {
        calls.add(context);
      },
      configureSession: (AudioSessionConfiguration configuration) async {
        calls.add(configuration);
      },
      setSessionActive: ({required bool active}) async {
        final Completer<void>? gate = setActiveGate;
        if (gate != null) {
          await gate.future;
        }
        calls.add(active ? 'active' : 'inactive');
      },
      isClaimedElsewhere: () => claimedElsewhere,
    );
  }

  setUp(() {
    calls = <Object>[];
    claimedElsewhere = false;
    setActiveGate = null;
  });

  group('iOS', () {
    test(
      'startup configures the media session without activating it',
      () async {
        final AppMediaAudioSession session = buildSession(
          platform: AppAudioSessionPlatform.ios,
        );

        await session.configure();

        expect(calls, <Object>[
          kAppMediaAudioContext,
          kAppMediaAudioSessionConfig,
        ]);
      },
    );

    test('entering the foreground activates the mixable media session so the '
        'volume buttons control media volume', () async {
      final AppMediaAudioSession session = buildSession(
        platform: AppAudioSessionPlatform.ios,
      );

      await session.setForeground(foreground: true);

      expect(calls, <Object>[
        kAppMediaAudioContext,
        kAppMediaAudioSessionConfig,
        'active',
      ]);
      expect(
        kAppMediaAudioSessionConfig.avAudioSessionCategory,
        AVAudioSessionCategory.playback,
      );
      expect(
        kAppMediaAudioSessionConfig.avAudioSessionCategoryOptions,
        AVAudioSessionCategoryOptions.mixWithOthers,
      );
    });

    test(
      'a repeated foreground sync does not touch the session again',
      () async {
        final AppMediaAudioSession session = buildSession(
          platform: AppAudioSessionPlatform.ios,
        );

        await session.setForeground(foreground: true);
        calls.clear();
        await session.setForeground(foreground: true);

        expect(calls, isEmpty);
      },
    );

    test('a background launch leaves the session inactive', () async {
      final AppMediaAudioSession session = buildSession(
        platform: AppAudioSessionPlatform.ios,
      );

      await session.setForeground(foreground: false);

      expect(calls, isEmpty);
    });

    test('entering the background releases the session for mixing', () async {
      final AppMediaAudioSession session = buildSession(
        platform: AppAudioSessionPlatform.ios,
      );

      await session.setForeground(foreground: true);
      calls.clear();
      await session.setForeground(foreground: false);

      expect(calls, <Object>[
        kAppMediaAudioContext,
        'inactive',
        kMixableIdleAudioSessionConfig,
      ]);
    });

    test(
      'releasing after a sound in the foreground reactivates the media session',
      () async {
        final AppMediaAudioSession session = buildSession(
          platform: AppAudioSessionPlatform.ios,
        );

        await session.setForeground(foreground: true);
        calls.clear();
        await session.release();

        expect(calls, <Object>[
          kAppMediaAudioContext,
          'inactive',
          kAppMediaAudioSessionConfig,
          'active',
        ]);
      },
    );

    test('releasing in the background leaves the session inactive', () async {
      final AppMediaAudioSession session = buildSession(
        platform: AppAudioSessionPlatform.ios,
      );

      await session.release();

      expect(calls, <Object>[
        kAppMediaAudioContext,
        'inactive',
        kMixableIdleAudioSessionConfig,
      ]);
    });

    test('a voice call or attachment playback keeps the session through '
        'foreground changes', () async {
      final AppMediaAudioSession session = buildSession(
        platform: AppAudioSessionPlatform.ios,
      );
      claimedElsewhere = true;

      await session.setForeground(foreground: true);
      await session.setForeground(foreground: false);

      expect(calls, isEmpty);
    });

    test(
      'a quick foreground then background settles on the released session',
      () async {
        final AppMediaAudioSession session = buildSession(
          platform: AppAudioSessionPlatform.ios,
        );
        final Completer<void> gate = Completer<void>();
        setActiveGate = gate;

        final Future<void> foreground = session.setForeground(foreground: true);
        final Future<void> background = session.setForeground(
          foreground: false,
        );
        gate.complete();
        await Future.wait(<Future<void>>[foreground, background]);

        expect(calls, <Object>[
          kAppMediaAudioContext,
          kAppMediaAudioSessionConfig,
          'active',
          kAppMediaAudioContext,
          'inactive',
          kMixableIdleAudioSessionConfig,
        ]);
      },
    );
  });

  group('Android', () {
    test(
      'entering the foreground configures without requesting audio focus',
      () async {
        final AppMediaAudioSession session = buildSession(
          platform: AppAudioSessionPlatform.android,
        );

        await session.setForeground(foreground: true);
        await session.setForeground(foreground: false);

        expect(calls, <Object>[
          kAppMediaAudioContext,
          kAppMediaAudioSessionConfig,
        ]);
      },
    );

    test('releasing abandons focus without reconfiguring', () async {
      final AppMediaAudioSession session = buildSession(
        platform: AppAudioSessionPlatform.android,
      );

      await session.setForeground(foreground: true);
      calls.clear();
      await session.release();

      expect(calls, <Object>[kAppMediaAudioContext, 'inactive']);
    });
  });

  test('desktop never touches an audio session', () async {
    final AppMediaAudioSession session = buildSession(
      platform: AppAudioSessionPlatform.other,
    );

    await session.configure();
    await session.setForeground(foreground: true);
    await session.release();
    await session.setForeground(foreground: false);

    expect(calls, isEmpty);
  });
}
