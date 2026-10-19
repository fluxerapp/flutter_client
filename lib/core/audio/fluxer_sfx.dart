import 'dart:async';
import 'dart:io';

import 'package:audio_session/audio_session.dart' as audio_session;
import 'package:audioplayers/audioplayers.dart';
import 'package:fluxer_app/core/audio/app_audio_session_restore.dart';
import 'package:fluxer_app/core/audio/app_media_audio_session.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_session.dart';
import 'package:fluxer_app/core/audio/enums/fluxer_sfx_clip.dart';
import 'package:fluxer_app/core/notifications/system_notification_sound_policy.dart';

const double _kDefaultSfxVolume = 0.4;

final AudioContext kNotificationSfxContext = AudioContext(
  android: const AudioContextAndroid(
    contentType: AndroidContentType.sonification,
    usageType: AndroidUsageType.notification,
    audioFocus: AndroidAudioFocus.none,
  ),
  iOS: AudioContextIOS(category: AVAudioSessionCategory.ambient),
);

final AudioContext kSessionFeedbackSfxContext = AudioContext(
  android: const AudioContextAndroid(
    contentType: AndroidContentType.sonification,
    usageType: AndroidUsageType.assistanceSonification,
    audioFocus: AndroidAudioFocus.none,
  ),
  iOS: AudioContextIOS(
    options: const <AVAudioSessionOptions>{AVAudioSessionOptions.mixWithOthers},
  ),
);

final AudioContext kIncomingRingLoopContext = AudioContext(
  android: const AudioContextAndroid(
    contentType: AndroidContentType.sonification,
    usageType: AndroidUsageType.notificationRingtone,
    audioFocus: AndroidAudioFocus.gainTransient,
  ),
  iOS: AudioContextIOS(category: AVAudioSessionCategory.ambient),
);

AudioContext audioContextForSfxClip(
  FluxerSfxClip clip, {
  required bool ignoreRingerPolicy,
  required bool isIncomingRingLoop,
}) {
  if (isIncomingRingLoop) {
    return kIncomingRingLoopContext;
  }
  if (ignoreRingerPolicy || !clip.respectsRinger) {
    return kSessionFeedbackSfxContext;
  }
  return kNotificationSfxContext;
}

bool shouldRestorePreferredAudioAfterOneShot(AudioContext context) {
  return context == kIncomingRingLoopContext;
}

bool usesRingerRespectingAudioContext(AudioContext context) {
  return context == kNotificationSfxContext ||
      context == kIncomingRingLoopContext;
}

Future<void> prepareRingerRespectingAudioSession() async {
  if (!(Platform.isAndroid || Platform.isIOS)) {
    return;
  }
  if (voiceCallOwnsAndroidAudioRoute()) {
    return;
  }
  try {
    final audio_session.AudioSession session =
        await audio_session.AudioSession.instance;
    await session.configure(kRingerRespectingSfxAudioSessionConfig);
    if (Platform.isIOS) {
      await session.setActive(true);
    }
  } on Object {
    return;
  }
}

class FluxerSFX {
  FluxerSFX({AudioPlayer? loopPlayer, AudioPlayer? oneShotPlayer})
    : _loopPlayer = loopPlayer ?? AudioPlayer(),
      _oneShotPlayer = oneShotPlayer ?? AudioPlayer();

  final AudioPlayer _loopPlayer;
  final AudioPlayer _oneShotPlayer;
  FluxerSfxClip? _activeLoopClip;
  bool _loopPlaybackActive = false;
  AudioContext? _lastOneShotContext;
  AudioContext? _lastLoopContext;
  int _oneShotGeneration = 0;

  Future<void> playOneShot(
    FluxerSfxClip clip, {
    double volume = _kDefaultSfxVolume,
    bool ignoreRingerPolicy = false,
  }) async {
    try {
      final AudioContext context = audioContextForSfxClip(
        clip,
        ignoreRingerPolicy: ignoreRingerPolicy,
        isIncomingRingLoop: false,
      );
      await _applyOneShotAudioContext(context);
      await _oneShotPlayer.setReleaseMode(ReleaseMode.release);
      await _oneShotPlayer.stop();
      await _oneShotPlayer.setVolume(_clampVolume(volume));
      final int generation = ++_oneShotGeneration;
      await _oneShotPlayer.play(AssetSource(_relativeAssetPath(clip.assetKey)));
      if (shouldRestorePreferredAudioAfterOneShot(context)) {
        unawaited(_restorePreferredAudioAfterOneShot(generation));
      } else if (context == kNotificationSfxContext) {
        unawaited(_reactivateChatAttachmentAfterNotification(generation));
      }
    } on Object {
      return;
    }
  }

  Future<bool> startLoop(
    FluxerSfxClip clip, {
    double volume = _kDefaultSfxVolume,
  }) async {
    if (_activeLoopClip == clip && _loopPlaybackActive) {
      try {
        await _loopPlayer.setVolume(_clampVolume(volume));
      } on Object {
        return false;
      }
      return true;
    }
    _activeLoopClip = clip;
    try {
      if (await shouldSuppressRingerRespectingSfx(clip)) {
        _activeLoopClip = null;
        return false;
      }
      final AudioContext context = audioContextForSfxClip(
        clip,
        ignoreRingerPolicy: false,
        isIncomingRingLoop: clip == FluxerSfxClip.incomingRing,
      );
      await _applyLoopAudioContext(context);
      await _loopPlayer.setReleaseMode(ReleaseMode.loop);
      await _loopPlayer.stop();
      await _loopPlayer.setVolume(_clampVolume(volume));
      await _loopPlayer.play(AssetSource(_relativeAssetPath(clip.assetKey)));
      _loopPlaybackActive = true;
      return true;
    } on Object {
      _activeLoopClip = null;
      _loopPlaybackActive = false;
      return false;
    }
  }

  Future<void> stopLoop() async {
    _activeLoopClip = null;
    _loopPlaybackActive = false;
    try {
      await _loopPlayer.stop();
      _lastLoopContext = null;
      await _restoreAppMediaAudio();
    } on Object {
      return;
    }
  }

  Future<void> dispose() async {
    _lastOneShotContext = null;
    _lastLoopContext = null;
    await _loopPlayer.dispose();
    await _oneShotPlayer.dispose();
  }

  Future<void> _applyOneShotAudioContext(AudioContext context) async {
    final bool mustReapply =
        usesRingerRespectingAudioContext(context) ||
        _lastOneShotContext != context;
    if (!mustReapply) {
      return;
    }
    if (usesRingerRespectingAudioContext(context)) {
      await prepareRingerRespectingAudioSession();
    }
    if (await applyAudioPlayerContext(_oneShotPlayer, context)) {
      _lastOneShotContext = context;
    }
  }

  Future<void> _applyLoopAudioContext(AudioContext context) async {
    final bool mustReapply =
        usesRingerRespectingAudioContext(context) ||
        _lastLoopContext != context;
    if (!mustReapply) {
      return;
    }
    if (usesRingerRespectingAudioContext(context)) {
      await prepareRingerRespectingAudioSession();
    }
    if (await applyAudioPlayerContext(_loopPlayer, context)) {
      _lastLoopContext = context;
    }
  }

  Future<void> _restorePreferredAudioAfterOneShot(int generation) async {
    if (!await _waitForOneShotCompletion(generation)) {
      return;
    }
    await restorePreferredAppAudioSession();
    _lastOneShotContext = null;
    await applyAudioPlayerContext(_oneShotPlayer, kAppMediaAudioContext);
  }

  Future<void> _reactivateChatAttachmentAfterNotification(
    int generation,
  ) async {
    if (!await _waitForOneShotCompletion(generation)) {
      return;
    }
    await ChatAttachmentAudioSession.instance.reactivateAudioSessionIfActive();
  }

  Future<bool> _waitForOneShotCompletion(int generation) async {
    try {
      await _oneShotPlayer.onPlayerComplete.first;
    } on Object {
      return false;
    }
    if (generation != _oneShotGeneration || _loopPlaybackActive) {
      return false;
    }
    return true;
  }

  Future<void> _restoreAppMediaAudio() async {
    await restorePreferredAppAudioSession();
    _lastOneShotContext = null;
    await applyAudioPlayerContext(_oneShotPlayer, kAppMediaAudioContext);
    await applyAudioPlayerContext(_loopPlayer, kAppMediaAudioContext);
  }

  static double _clampVolume(double volume) {
    if (volume < 0) {
      return 0;
    }
    if (volume > 1) {
      return 1;
    }
    return volume;
  }

  static String _relativeAssetPath(String assetKey) {
    const String prefix = 'assets/';
    if (assetKey.startsWith(prefix)) {
      return assetKey.substring(prefix.length);
    }
    return assetKey;
  }
}
