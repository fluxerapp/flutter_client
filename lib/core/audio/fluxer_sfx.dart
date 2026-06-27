import 'package:audioplayers/audioplayers.dart';
import 'package:fluxer_app/core/audio/enums/fluxer_sfx_clip.dart';

const double _kDefaultSfxVolume = 0.4;
final AudioContext _kOneShotSfxContext = AudioContext(
  android: const AudioContextAndroid(
    contentType: AndroidContentType.sonification,
    usageType: AndroidUsageType.notificationRingtone,
    audioFocus: AndroidAudioFocus.none,
  ),
  iOS: AudioContextIOS(category: AVAudioSessionCategory.ambient),
);
final AudioContext _kInterruptingIncomingRingContext = AudioContext(
  android: const AudioContextAndroid(
    contentType: AndroidContentType.sonification,
    usageType: AndroidUsageType.notificationRingtone,
    audioFocus: AndroidAudioFocus.gainTransient,
  ),
  iOS: AudioContextIOS(category: AVAudioSessionCategory.ambient),
);

class FluxerSFX {
  FluxerSFX() : _loopPlayer = AudioPlayer(), _oneShotPlayer = AudioPlayer();

  final AudioPlayer _loopPlayer;
  final AudioPlayer _oneShotPlayer;
  FluxerSfxClip? _activeLoopClip;
  bool _loopPlaybackActive = false;

  Future<void> playOneShot(
    FluxerSfxClip clip, {
    double volume = _kDefaultSfxVolume,
  }) async {
    try {
      await _oneShotPlayer.setAudioContext(_kOneShotSfxContext);
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
      if (clip == FluxerSfxClip.incomingRing) {
        await _loopPlayer.setAudioContext(_kInterruptingIncomingRingContext);
      } else {
        await _loopPlayer.setAudioContext(_kOneShotSfxContext);
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
