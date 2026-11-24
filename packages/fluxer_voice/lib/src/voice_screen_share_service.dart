import 'package:flutter/foundation.dart';
import 'package:fluxer_voice/src/screen_share_service.g.dart';

class FluxerVoiceScreenShareService {
  FluxerVoiceScreenShareService._();

  static final FluxerVoiceScreenShareService instance =
      FluxerVoiceScreenShareService._();

  static const Duration _startTimeout = Duration(seconds: 10);

  VoiceScreenShareServiceHostApi _api = VoiceScreenShareServiceHostApi();

  bool get _isRequired =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.android;

  Future<bool> start({required String title, required String text}) async {
    if (!_isRequired) {
      return true;
    }
    try {
      return await _api
          .start(NativeScreenShareNotification(title: title, text: text))
          .timeout(_startTimeout);
    } on Object {
      return false;
    }
  }

  Future<void> stop() async {
    if (!_isRequired) {
      return;
    }
    try {
      await _api.stop();
    } on Object {
      return;
    }
  }

  Future<bool> isRunning() async {
    if (!_isRequired) {
      return true;
    }
    try {
      return await _api.isRunning();
    } on Object {
      return false;
    }
  }

  @visibleForTesting
  void debugOverridePlatform({required VoiceScreenShareServiceHostApi api}) {
    _api = api;
  }
}
