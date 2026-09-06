import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:fluxer_app/core/audio/fluxer_sfx.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entrance_sound_playback.g.dart';

double entranceSoundPlayerVolume({
  required double masterVolumePercent,
  required int outputVolumePercent,
}) {
  final double volume =
      (masterVolumePercent / 100) * (outputVolumePercent / 100);
  if (volume < 0) {
    return 0;
  }
  if (volume > 1) {
    return 1;
  }
  return volume;
}

class EntranceSoundPlayer {
  EntranceSoundPlayer({AudioPlayer? player})
    : _player = player ?? AudioPlayer();

  final AudioPlayer _player;
  AudioContext? _context;
  int _generation = 0;

  Future<void> play({required String url, double volume = 1}) async {
    if (url.isEmpty) {
      return;
    }
    final int generation = ++_generation;
    try {
      if (_context != kSessionFeedbackSfxContext) {
        await _player.setAudioContext(kSessionFeedbackSfxContext);
        _context = kSessionFeedbackSfxContext;
      }
      if (generation != _generation) {
        return;
      }
      await _player.setReleaseMode(ReleaseMode.release);
      await _player.stop();
      if (generation != _generation) {
        return;
      }
      await _player.setVolume(_clampVolume(volume));
      if (generation != _generation) {
        return;
      }
      await _player.play(UrlSource(url));
    } on Object {
      return;
    }
  }

  Future<void> dispose() async {
    _generation++;
    _context = null;
    await _player.dispose();
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
}

@Riverpod(keepAlive: true)
EntranceSoundPlayer entranceSoundPlayer(Ref ref) {
  final EntranceSoundPlayer player = EntranceSoundPlayer();
  ref.onDispose(() {
    unawaited(player.dispose());
  });
  return player;
}
