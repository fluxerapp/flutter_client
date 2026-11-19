import 'dart:async';
import 'dart:io' show Platform;

import 'package:fluxer_app/core/audio/app_audio_session_restore.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_session.dart';
import 'package:fluxer_app/features/voice/tts/tts_rate_utils.dart';
import 'package:fluxer_app/features/voice/tts/tts_text_formatter.dart';
import 'package:fluxer_voice/fluxer_voice.dart';
import 'package:speak/speak.dart';

class FluxerTtsSpeakingTarget {
  const FluxerTtsSpeakingTarget({
    required this.messageId,
    required this.channelId,
  });

  final String messageId;
  final String channelId;
}

typedef FluxerTtsSpeakingChanged =
    void Function({required bool isSpeaking, FluxerTtsSpeakingTarget? target});

const SpeakAudio _kFluxerTtsAudio = SpeakAudio(
  otherAudio: OtherAudio.mix,
  linger: Duration.zero,
  duringCalls: SpeakDuringCalls.speak,
);

class FluxerTts {
  FluxerTts({Speak? engine})
    : _engine = engine ?? Speak(audio: _kFluxerTtsAudio);

  final Speak _engine;
  bool _disposed = false;
  int _generation = 0;
  bool _isSpeaking = false;
  FluxerTtsSpeakingTarget? _currentTarget;
  FluxerTtsSpeakingChanged? onSpeakingChanged;

  bool isSpeakingMessage(String messageId) {
    return _isSpeaking && _currentTarget?.messageId == messageId;
  }

  Future<bool> isSupported() async => !_disposed && Speak.isSupported;

  Future<void> speak({
    required String text,
    double? rate,
    String? locale,
    FluxerTtsSpeakingTarget? target,
    void Function()? onEnd,
    void Function()? onError,
    bool interrupt = true,
  }) async {
    final String trimmed = text.trim();
    if (trimmed.isEmpty || _disposed || !Speak.isSupported) {
      return;
    }
    if (Platform.isIOS && _isInAppVoiceCallActive()) {
      onError?.call();
      return;
    }
    final int generation = ++_generation;
    if (_isSpeaking) {
      _currentTarget = null;
      _setSpeaking(false);
    }
    _currentTarget = target;
    _setSpeaking(true);
    bool failed = false;
    try {
      final SpeakOutcome outcome = await _say(
        truncateTtsText(trimmed),
        rate: clampTtsRate(rate ?? kDefaultTtsRate),
        language: _normalizeLocale(locale),
        queue: interrupt ? SpeakQueue.interrupt : SpeakQueue.append,
      );
      failed = outcome == SpeakOutcome.blocked;
    } on Object {
      failed = true;
    }
    _completeSpeech(generation, error: failed, onEnd: onEnd, onError: onError);
  }

  Future<void> speakMessage({
    required String messageId,
    required String channelId,
    required String content,
    double? rate,
    String? locale,
  }) async {
    if (isSpeakingMessage(messageId)) {
      await stop();
      return;
    }
    if (content.trim().isEmpty) {
      return;
    }
    await speak(
      text: content,
      rate: rate,
      locale: locale,
      target: FluxerTtsSpeakingTarget(
        messageId: messageId,
        channelId: channelId,
      ),
    );
  }

  Future<void> stop() async {
    if (_disposed || !Speak.isSupported) {
      return;
    }
    try {
      await _engine.stop();
    } on Object {
      return;
    }
  }

  Future<void> dispose() async {
    if (_disposed) {
      return;
    }
    onSpeakingChanged = null;
    _disposed = true;
    try {
      await _engine.dispose();
    } on Object {
      return;
    }
  }

  Future<SpeakOutcome> _say(
    String text, {
    required double rate,
    required String? language,
    required SpeakQueue queue,
  }) async {
    try {
      return await _engine(text, rate: rate, language: language, queue: queue);
    } on SpeakException catch (error) {
      if (language == null || error.error != SpeakError.languageUnavailable) {
        rethrow;
      }
      return await _engine(text, rate: rate, queue: queue);
    }
  }

  String? _normalizeLocale(String? locale) {
    final String? normalized = locale?.replaceAll('_', '-');
    if (normalized == null || normalized.isEmpty) {
      return null;
    }
    return normalized;
  }

  bool _isInAppVoiceCallActive() {
    return ChatAttachmentAudioSession.instance.isVoiceCallActive ||
        FluxerVoiceAudioSession.instance.isActive;
  }

  void _setSpeaking(bool value) {
    if (_isSpeaking == value) {
      return;
    }
    _isSpeaking = value;
    onSpeakingChanged?.call(isSpeaking: value, target: _currentTarget);
  }

  void _completeSpeech(
    int generation, {
    required bool error,
    void Function()? onEnd,
    void Function()? onError,
  }) {
    if (generation == _generation) {
      _currentTarget = null;
      _setSpeaking(false);
      if (Platform.isIOS || Platform.isMacOS) {
        unawaited(Future<void>(restorePreferredAppAudioSession));
      }
    }
    if (error) {
      onError?.call();
      return;
    }
    onEnd?.call();
  }
}
