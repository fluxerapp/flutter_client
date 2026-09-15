import 'dart:async';

import 'package:media_kit/media_kit.dart';

class MediaKitPlayerLifecycleCoordinator {
  MediaKitPlayerLifecycleCoordinator._();

  static final MediaKitPlayerLifecycleCoordinator instance =
      MediaKitPlayerLifecycleCoordinator._();

  final Set<Player> _players = <Player>{};

  Player createPlayer({PlayerConfiguration? configuration}) {
    final Player player = configuration == null
        ? Player()
        : Player(configuration: configuration);
    _players.add(player);
    return player;
  }

  Future<void> pauseAll() async {
    for (final Player player in _players.toList()) {
      await _safe(player.pause);
    }
  }

  Future<void> stopAndDispose(Player player) async {
    _players.remove(player);
    await _safe(() async {
      await player.pause();
      await player.stop();
    });
    await _safe(() => player.dispose());
  }

  static Future<void> _safe(Future<void> Function() action) async {
    try {
      await action();
    } on Object {
      // Native player may already be tearing down
    }
  }
}

class MediaKitForegroundResumeController {
  bool _pausedForBackground = false;

  void handleAppForegroundChanged({
    required bool isForeground,
    required bool isPlaying,
    required bool canResume,
    required Future<void> Function() onResume,
  }) {
    if (!isForeground && isPlaying) {
      _pausedForBackground = true;
      return;
    }
    if (!isForeground || !_pausedForBackground) {
      return;
    }
    _pausedForBackground = false;
    if (canResume) {
      unawaited(onResume());
    }
  }
}
