import 'package:flutter/foundation.dart';
import 'package:fluxer_voice/src/process_activity.g.dart';

class FluxerVoiceProcessActivity {
  FluxerVoiceProcessActivity._();

  static final FluxerVoiceProcessActivity instance =
      FluxerVoiceProcessActivity._();

  VoiceProcessActivityHostApi _api = VoiceProcessActivityHostApi();
  bool _active = false;

  bool get isSupported =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.macOS;

  Future<void> setActive({required bool active}) async {
    if (!isSupported || active == _active) {
      return;
    }
    _active = active;
    try {
      await (active ? _api.begin() : _api.end());
    } on Object {
      return;
    }
  }

  @visibleForTesting
  void debugOverridePlatform({required VoiceProcessActivityHostApi api}) {
    _api = api;
    _active = false;
  }
}
