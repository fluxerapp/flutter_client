import 'dart:async';

import 'package:fluxer_app/core/talker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:window_manager/window_manager.dart';

part 'voice_desktop_fullscreen_provider.g.dart';

@Riverpod(keepAlive: true)
class VoiceDesktopFullscreen extends _$VoiceDesktopFullscreen
    with WindowListener {
  bool _ownsWindowFullscreen = false;
  bool _listening = false;

  @override
  bool build() {
    ref.onDispose(_stopListening);
    return false;
  }

  Future<void> toggle() => state ? exit() : enter();

  Future<void> enter() async {
    if (!ref.mounted || state) {
      return;
    }
    state = true;
    if (!_listening) {
      windowManager.addListener(this);
      _listening = true;
    }
    try {
      if (!await windowManager.isFullScreen()) {
        _ownsWindowFullscreen = true;
        await windowManager.setFullScreen(true);
      }
    } on Object catch (error) {
      talker.debug('[Voice] Entering window full screen failed: $error');
    }
  }

  Future<void> exit() async {
    if (!ref.mounted || !state) {
      return;
    }
    state = false;
    _stopListening();
    if (!_ownsWindowFullscreen) {
      return;
    }
    _ownsWindowFullscreen = false;
    try {
      if (await windowManager.isFullScreen()) {
        await windowManager.setFullScreen(false);
      }
    } on Object catch (error) {
      talker.debug('[Voice] Leaving window full screen failed: $error');
    }
  }

  @override
  void onWindowLeaveFullScreen() {
    if (!_ownsWindowFullscreen || !ref.mounted) {
      return;
    }
    _ownsWindowFullscreen = false;
    unawaited(exit());
  }

  void _stopListening() {
    if (_listening) {
      windowManager.removeListener(this);
      _listening = false;
    }
  }
}
