import 'package:audioplayers/audioplayers.dart';
import 'package:fluxer_app/core/audio/enums/fluxer_sfx_clip.dart';

const double _kDefaultSfxVolume = 0.4;
final AudioContext _kNotificationSfxContext = AudioContext(
  android: const AudioContextAndroid(
    contentType: AndroidContentType.sonification,
    usageType: AndroidUsageType.notificationRingtone,
    audioFocus: AndroidAudioFocus.none,
  ),
  iOS: AudioContextIOS(category: AVAudioSessionCategory.ambient),
);
final AudioContext _kSessionFeedbackSfxContext = AudioContext(
  android: const AudioContextAndroid(
    contentType: AndroidContentType.sonification,
    usageType: AndroidUsageType.assistanceSonification,
    audioFocus: AndroidAudioFocus.none,
  ),
  iOS: AudioContextIOS(options: const {AVAudioSessionOptions.mixWithOthers}),
);
final AudioContext _kInterruptingIncomingRingContext = AudioContext(
  android: const AudioContextAndroid(
    contentType: AndroidContentType.sonification,
    usageType: AndroidUsageType.notificationRingtone,
    audioFocus: AndroidAudioFocus.gainTransient,
  ),
  iOS: AudioContextIOS(category: AVAudioSessionCategory.ambient),
);

AudioContext _audioContextForClip(
  FluxerSfxClip clip, {
  required bool ignoreRingerPolicy,
  required bool isIncomingRingLoop,
}) {
  if (isIncomingRingLoop) {
    return _kInterruptingIncomingRingContext;
  }
  if (ignoreRingerPolicy || !clip.respectsRinger) {
    return _kSessionFeedbackSfxContext;
  }
  return _kNotificationSfxContext;
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

  Future<void> playOneShot(
    FluxerSfxClip clip, {
    double volume = _kDefaultSfxVolume,
    bool ignoreRingerPolicy = false,
  }) async {
    try {
      final AudioContext context = _audioContextForClip(
        clip,
        ignoreRingerPolicy: ignoreRingerPolicy,
        isIncomingRingLoop: false,
      );
      if (_lastOneShotContext != context) {
        await _oneShotPlayer.setAudioContext(context);
        _lastOneShotContext = context;
      }
      await _oneShotPlayer.setReleaseMode(ReleaseMode.release);
      await _oneShotPlayer.stop();
      await _oneShotPlayer.setVolume(_clampVolume(volume));
      await _oneShotPlayer.play(AssetSource(_relativeAssetPath(clip.assetKey)));
    } on Object {
      // Intentionally swallow: SFX must not break callers.
    }
  }

  Future<void> startLoop(
    FluxerSfxClip clip, {
    double volume = _kDefaultSfxVolume,
  }) async {
    if (_activeLoopClip == clip && _loopPlaybackActive) {
      return;
    }
    _activeLoopClip = clip;
    try {
      final AudioContext context = _audioContextForClip(
        clip,
        ignoreRingerPolicy: false,
        isIncomingRingLoop: clip == FluxerSfxClip.incomingRing,
      );
      if (_lastLoopContext != context) {
        await _loopPlayer.setAudioContext(context);
        _lastLoopContext = context;
      }
      await _loopPlayer.setReleaseMode(ReleaseMode.loop);
      await _loopPlayer.stop();
      await _loopPlayer.setVolume(_clampVolume(volume));
      await _loopPlayer.play(AssetSource(_relativeAssetPath(clip.assetKey)));
      _loopPlaybackActive = true;
    } on Object {
      _activeLoopClip = null;
      _loopPlaybackActive = false;
    }
  }

  Future<void> stopLoop() async {
    _activeLoopClip = null;
    _loopPlaybackActive = false;
    try {
      await _loopPlayer.stop();
    } on Object {
      // Intentionally swallow.
    }
  }

  Future<void> dispose() async {
    _lastOneShotContext = null;
    _lastLoopContext = null;
    await _loopPlayer.dispose();
    await _oneShotPlayer.dispose();
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
