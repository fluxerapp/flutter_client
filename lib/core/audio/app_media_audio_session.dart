import 'dart:io';

import 'package:audio_session/audio_session.dart' as audio_session;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_session.dart';
import 'package:fluxer_app/core/audio/system_voice_call_guard.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_voice/fluxer_voice.dart';

final AudioContext kAppMediaAudioContext = AudioContext(
  android: const AudioContextAndroid(audioFocus: AndroidAudioFocus.none),
  iOS: AudioContextIOS(
    options: const <AVAudioSessionOptions>{AVAudioSessionOptions.mixWithOthers},
  ),
);

const audio_session.AudioSessionConfiguration kAppMediaAudioSessionConfig =
    audio_session.AudioSessionConfiguration(
      avAudioSessionCategory: audio_session.AVAudioSessionCategory.playback,
      avAudioSessionCategoryOptions:
          audio_session.AVAudioSessionCategoryOptions.mixWithOthers,
      androidAudioAttributes: audio_session.AndroidAudioAttributes(
        contentType: audio_session.AndroidAudioContentType.music,
        usage: audio_session.AndroidAudioUsage.media,
      ),
      androidAudioFocusGainType:
          audio_session.AndroidAudioFocusGainType.gainTransientMayDuck,
    );

const audio_session.AudioSessionConfiguration kMixableIdleAudioSessionConfig =
    audio_session.AudioSessionConfiguration(
      avAudioSessionCategory: audio_session.AVAudioSessionCategory.ambient,
      avAudioSessionCategoryOptions:
          audio_session.AVAudioSessionCategoryOptions.mixWithOthers,
    );

const audio_session.AudioSessionConfiguration
kRingerRespectingSfxAudioSessionConfig =
    audio_session.AudioSessionConfiguration(
      avAudioSessionCategory: audio_session.AVAudioSessionCategory.ambient,
      avAudioSessionCategoryOptions:
          audio_session.AVAudioSessionCategoryOptions.mixWithOthers,
      androidAudioAttributes: audio_session.AndroidAudioAttributes(
        contentType: audio_session.AndroidAudioContentType.sonification,
        usage: audio_session.AndroidAudioUsage.notification,
      ),
      androidAudioFocusGainType:
          audio_session.AndroidAudioFocusGainType.gainTransientMayDuck,
    );

bool voiceCallOwnsAndroidAudioRoute() {
  return defaultTargetPlatform == TargetPlatform.android &&
      (ChatAttachmentAudioSession.instance.isVoiceCallActive ||
          FluxerVoiceAudioSession.instance.isActive);
}

Future<bool> applyAudioPlayerContext(
  AudioPlayer player,
  AudioContext context,
) async {
  if (voiceCallOwnsAndroidAudioRoute()) {
    return false;
  }
  if (await isExternalSystemVoiceCallActive()) {
    return false;
  }
  await player.setAudioContext(context);
  return true;
}

enum AppAudioSessionPlatform {
  ios,
  android,
  other;

  static AppAudioSessionPlatform get current {
    if (Platform.isIOS) {
      return AppAudioSessionPlatform.ios;
    }
    if (Platform.isAndroid) {
      return AppAudioSessionPlatform.android;
    }
    return AppAudioSessionPlatform.other;
  }
}

class AppMediaAudioSession {
  AppMediaAudioSession({
    required this.platform,
    required this.setGlobalAudioContext,
    required this.configureSession,
    required this.setSessionActive,
    required this.isClaimedElsewhere,
    Future<bool> Function()? isExternalCallActive,
  }) : _isExternalCallActive =
           isExternalCallActive ?? isExternalSystemVoiceCallActive;

  static final AppMediaAudioSession instance = AppMediaAudioSession(
    platform: AppAudioSessionPlatform.current,
    setGlobalAudioContext: (AudioContext context) async {
      await AudioPlayer.global.setAudioContext(context);
    },
    configureSession:
        (audio_session.AudioSessionConfiguration configuration) async {
          final audio_session.AudioSession session =
              await audio_session.AudioSession.instance;
          await session.configure(configuration);
        },
    setSessionActive: ({required bool active}) async {
      final audio_session.AudioSession session =
          await audio_session.AudioSession.instance;
      await session.setActive(active);
    },
    isClaimedElsewhere: () =>
        ChatAttachmentAudioSession.instance.isVoiceCallActive ||
        FluxerVoiceAudioSession.instance.isActive ||
        ChatAttachmentAudioSession.instance.hasActivePlayback,
  );

  final AppAudioSessionPlatform platform;
  final Future<void> Function(AudioContext context) setGlobalAudioContext;
  final Future<void> Function(
    audio_session.AudioSessionConfiguration configuration,
  )
  configureSession;
  final Future<void> Function({required bool active}) setSessionActive;
  final bool Function() isClaimedElsewhere;
  final Future<bool> Function() _isExternalCallActive;

  bool _foreground = false;
  Future<void> _queue = Future<void>.value();

  bool get _isMobile => platform != AppAudioSessionPlatform.other;

  bool get _isIOS => platform == AppAudioSessionPlatform.ios;

  Future<bool> _shouldManageSession() async {
    if (isClaimedElsewhere()) {
      return false;
    }
    if (await _isExternalCallActive()) {
      return false;
    }
    return true;
  }

  Future<void> configure() {
    if (!_isMobile) {
      return Future<void>.value();
    }
    return _enqueue(() async {
      if (!await _shouldManageSession()) {
        return;
      }
      await _applyGlobalAudioContext();
      await configureSession(kAppMediaAudioSessionConfig);
    });
  }

  Future<void> setForeground({required bool foreground}) {
    if (!_isMobile || foreground == _foreground) {
      return Future<void>.value();
    }
    _foreground = foreground;
    return _enqueue(() => _applyForegroundTransition(foreground));
  }

  /// Re-applies the foreground media session when an external call no longer
  /// blocks configuration (for example after returning from the system dialer).
  Future<void> syncForegroundSession() {
    if (!_isMobile || !_foreground) {
      return Future<void>.value();
    }
    return _enqueue(() => _applyForegroundTransition(true));
  }

  Future<void> _applyForegroundTransition(bool foreground) async {
    if (foreground) {
      if (!await _shouldManageSession()) {
        return;
      }
      await _applyGlobalAudioContext();
      await configureSession(kAppMediaAudioSessionConfig);
      if (_isIOS) {
        await setSessionActive(active: true);
      }
      return;
    }
    if (_isIOS) {
      if (isClaimedElsewhere()) {
        return;
      }
      await _releaseNow();
    }
  }

  Future<void> release() {
    if (!_isMobile) {
      return Future<void>.value();
    }
    return _enqueue(_releaseNow);
  }

  Future<void> _releaseNow() async {
    if (!await _shouldManageSession()) {
      return;
    }
    await _applyGlobalAudioContext();
    await setSessionActive(active: false);
    if (!_isIOS) {
      return;
    }
    if (_foreground) {
      await configureSession(kAppMediaAudioSessionConfig);
      await setSessionActive(active: true);
      return;
    }
    await configureSession(kMixableIdleAudioSessionConfig);
  }

  Future<void> _applyGlobalAudioContext() async {
    try {
      await setGlobalAudioContext(kAppMediaAudioContext);
    } on Object catch (error, stackTrace) {
      talker.warning(
        '[AudioSession] Failed to set the media audio context',
        error,
        stackTrace,
      );
    }
  }

  Future<void> _enqueue(Future<void> Function() operation) {
    final Future<void> next = _queue.then((_) async {
      try {
        await operation();
      } on Object catch (error, stackTrace) {
        talker.warning(
          '[AudioSession] Failed to update the app audio session',
          error,
          stackTrace,
        );
      }
    });
    _queue = next;
    return next;
  }
}
