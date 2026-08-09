import 'package:audioplayers/audioplayers.dart';
import 'package:fluxer_app/core/audio/enums/fluxer_sfx_clip.dart';

const double _kDefaultSfxVolume = 0.4;

final AudioContext kMixableSfxContext = AudioContext(
  android: const AudioContextAndroid(
    contentType: AndroidContentType.sonification,
    usageType: AndroidUsageType.notificationRingtone,
    audioFocus: AndroidAudioFocus.none,
  ),
  iOS: AudioContextIOS(category: AVAudioSessionCategory.ambient),
);

final AudioContext kIncomingRingLoopContext = AudioContext(
  android: const AudioContextAndroid(
    contentType: AndroidContentType.sonification,
    usageType: AndroidUsageType.notificationRingtone,
    audioFocus: AndroidAudioFocus.gainTransient,
  ),
  iOS: AudioContextIOS(category: AVAudioSessionCategory.ambient),
);

class FluxerSFX {
  FluxerSFX({AudioPlayer? loopPlayer, AudioPlayer? oneShotPlayer})
    : _loopPlayer = loopPlayer ?? AudioPlayer(),
      _oneShotPlayer = oneShotPlayer ?? AudioPlayer();

  final AudioPlayer _loopPlayer;
  final AudioPlayer _oneShotPlayer;
  FluxerSfxClip? _activeLoopClip;
  bool _loopPlaybackActive = false;
  bool _mixableContextReady = false;

  Future<void> playOneShot(
    FluxerSfxClip clip, {
    double volume = _kDefaultSfxVolume,
    bool ignoreRingerPolicy = false,
  }) async {
    try {
      await _ensureMixableAudioContext();
      await _oneShotPlayer.setReleaseMode(ReleaseMode.release);
      await _oneShotPlayer.stop();
      await _oneShotPlayer.setVolume(_clampVolume(volume));
      await _oneShotPlayer.play(AssetSource(_relativeAssetPath(clip.assetKey)));
    } on Object {}
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
        await _loopPlayer.setAudioContext(kIncomingRingLoopContext);
        await _trySetGlobalAudioContext(kIncomingRingLoopContext);
      } else {
        await _ensureMixableAudioContext();
        await _loopPlayer.setAudioContext(kMixableSfxContext);
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
      await _trySetGlobalAudioContext(kMixableSfxContext);
      await _ensureMixableAudioContext();
      await _loopPlayer.setAudioContext(kMixableSfxContext);
    } on Object {}
  }

  Future<void> dispose() async {
    _mixableContextReady = false;
    await _loopPlayer.dispose();
    await _oneShotPlayer.dispose();
  }

  Future<void> _ensureMixableAudioContext() async {
    if (_mixableContextReady) {
      return;
    }
    await _oneShotPlayer.setAudioContext(kMixableSfxContext);
    await _trySetGlobalAudioContext(kMixableSfxContext);
    _mixableContextReady = true;
  }

  Future<void> _trySetGlobalAudioContext(AudioContext context) async {
    try {
      await AudioPlayer.global.setAudioContext(context);
    } on Object {}
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
