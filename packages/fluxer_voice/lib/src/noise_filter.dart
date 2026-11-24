import 'package:flutter/foundation.dart';
import 'package:fluxer_voice/src/noise_filter.g.dart';

class FluxerNoiseFilter {
  FluxerNoiseFilter._();

  static final FluxerNoiseFilter instance = FluxerNoiseFilter._();

  VoiceNoiseFilterHostApi _api = VoiceNoiseFilterHostApi();

  bool get isSupported =>
      !kIsWeb &&
      switch (defaultTargetPlatform) {
        TargetPlatform.android ||
        TargetPlatform.iOS ||
        TargetPlatform.macOS ||
        TargetPlatform.windows ||
        TargetPlatform.linux => true,
        TargetPlatform.fuchsia => false,
      };

  Future<bool> attach() => _guard(() => _api.attach());

  Future<bool> setBackend(NativeNoiseFilterBackend backend) =>
      _guard(() => _api.setBackend(backend));

  Future<NativeNoiseFilterStatus?> status() async {
    if (!isSupported) {
      return null;
    }
    try {
      return await _api.status();
    } on Object {
      return null;
    }
  }

  Future<bool> _guard(Future<bool> Function() call) async {
    if (!isSupported) {
      return false;
    }
    try {
      return await call();
    } on Object {
      return false;
    }
  }

  @visibleForTesting
  void debugOverridePlatform({VoiceNoiseFilterHostApi? api}) {
    _api = api ?? VoiceNoiseFilterHostApi();
  }
}
