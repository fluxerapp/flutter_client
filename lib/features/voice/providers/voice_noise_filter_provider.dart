import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/settings/providers/preferences/voice_settings_provider.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/utils/audio/processing_profile.dart';
import 'package:fluxer_voice/fluxer_voice.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_noise_filter_provider.g.dart';

@Riverpod(keepAlive: true)
class VoiceNoiseFilter extends _$VoiceNoiseFilter {
  Future<void> _pending = Future<void>.value();
  Set<NoiseSuppressionBackend> _failed = const <NoiseSuppressionBackend>{};
  bool _attachFailed = false;

  @override
  Set<NoiseSuppressionBackend> build() {
    ref.listen<VoiceSettingsState>(voiceSettingsProvider, (
      VoiceSettingsState? previous,
      VoiceSettingsState next,
    ) {
      if (previous == null ||
          requestedNoiseSuppressionBackend(previous) !=
              requestedNoiseSuppressionBackend(next)) {
        unawaited(_applyBackend());
      }
    });
    return FluxerNoiseFilter.instance.isSupported
        ? const <NoiseSuppressionBackend>{}
        : NoiseSuppressionBackend.native;
  }

  Future<void> prepareCapture() async {
    if (!FluxerNoiseFilter.instance.isSupported) {
      return;
    }
    _attachFailed = !await _attach();
    await _applyBackend();
  }

  Future<bool> _attach() async {
    try {
      await WebRTC.initialize(
        options: <String, dynamic>{'logSeverity': 'none'},
      );
    } on Object catch (error) {
      talker.warning('[Voice] Noise filter could not start WebRTC: $error');
      return false;
    }
    final bool attached = await FluxerNoiseFilter.instance.attach();
    if (!attached) {
      talker.warning('[Voice] Noise filter could not attach');
    }
    return attached;
  }

  Future<void> _applyBackend() {
    return _pending = _pending.then((_) async {
      if (!ref.mounted || !FluxerNoiseFilter.instance.isSupported) {
        return;
      }
      final NoiseSuppressionBackend backend = requestedNoiseSuppressionBackend(
        ref.read(voiceSettingsProvider),
      );
      final bool applied = await FluxerNoiseFilter.instance.setBackend(
        _nativeBackend(backend),
      );
      if (!backend.isNative) {
        _publish();
        return;
      }
      if (applied) {
        _failed = _failed.difference(<NoiseSuppressionBackend>{backend});
      } else {
        talker.warning('[Voice] Noise filter ${backend.name} could not start');
        _failed = _failed.union(<NoiseSuppressionBackend>{backend});
        await FluxerNoiseFilter.instance.setBackend(
          NativeNoiseFilterBackend.none,
        );
      }
      _publish();
    });
  }

  void _publish() {
    if (!ref.mounted) {
      return;
    }
    final Set<NoiseSuppressionBackend> unavailable = _attachFailed
        ? NoiseSuppressionBackend.native
        : _failed;
    if (!setEquals(state, unavailable)) {
      state = unavailable;
    }
  }
}

NativeNoiseFilterBackend _nativeBackend(NoiseSuppressionBackend backend) {
  return switch (backend) {
    NoiseSuppressionBackend.none ||
    NoiseSuppressionBackend.standard => NativeNoiseFilterBackend.none,
    NoiseSuppressionBackend.gate => NativeNoiseFilterBackend.gate,
    NoiseSuppressionBackend.rnnoise => NativeNoiseFilterBackend.rnnoise,
  };
}
