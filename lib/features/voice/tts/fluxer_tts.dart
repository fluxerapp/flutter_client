import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fluxer_app/features/voice/tts/tts_rate_utils.dart';
import 'package:fluxer_app/features/voice/tts/tts_text_formatter.dart';

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

class FluxerTts {
  FluxerTts({FlutterTts? engine}) : _engine = engine ?? FlutterTts();

  final FlutterTts _engine;
  bool _initialized = false;
  bool _isSpeaking = false;
  double? _lastAppliedRate;
  String? _lastAppliedLocale;
  FluxerTtsSpeakingTarget? _currentTarget;
  FluxerTtsSpeakingChanged? onSpeakingChanged;
  void Function()? _onEnd;
  void Function()? _onError;

  bool get isSpeaking => _isSpeaking;

  FluxerTtsSpeakingTarget? get currentTarget => _currentTarget;

  bool isSpeakingMessage(String messageId) {
    return _isSpeaking && _currentTarget?.messageId == messageId;
  }

  Future<bool> isSupported() async {
    await _ensureInitialized();
    try {
      final dynamic languages = await _engine.getLanguages;
      if (languages is List) {
        return languages.isNotEmpty;
      }
      return true;
    } on Object {
      return false;
    }
  }

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
    if (trimmed.isEmpty) {
      return;
    }
    await _ensureInitialized();
    if (interrupt) {
      await stop();
    }
    _onEnd = onEnd;
    _onError = onError;
    _currentTarget = target;
    _setSpeaking(true);
    try {
      await _applyLocaleIfNeeded(locale);
      await _applyRateIfNeeded(rate ?? kDefaultTtsRate);
      await _engine.speak(truncateTtsText(trimmed));
    } on Object {
      _completeSpeech(error: true);
    }
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
    if (!_initialized) {
      return;
    }
    try {
      await _engine.stop();
    } on Object {
      // Ignore stop errors.
    }
    _completeSpeech();
  }

  Future<void> dispose() async {
    await stop();
    _initialized = false;
    onSpeakingChanged = null;
  }

  Future<void> _ensureInitialized() async {
    if (_initialized) {
      return;
    }
    _engine
      ..setStartHandler(() => _setSpeaking(true))
      ..setCompletionHandler(_completeSpeech)
      ..setCancelHandler(_completeSpeech)
      ..setErrorHandler((_) => _completeSpeech(error: true));
    await _configurePlatformAudio();
    _initialized = true;
  }

  Future<void> _configurePlatformAudio() async {
    if (kIsWeb || !(Platform.isIOS || Platform.isMacOS)) {
      return;
    }
    try {
      await _engine.setSharedInstance(true);
      await _engine.setIosAudioCategory(
        IosTextToSpeechAudioCategory.ambient,
        <IosTextToSpeechAudioCategoryOptions>[
          IosTextToSpeechAudioCategoryOptions.allowBluetooth,
          IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
          IosTextToSpeechAudioCategoryOptions.mixWithOthers,
        ],
        IosTextToSpeechAudioMode.voicePrompt,
      );
    } on Object {
      // Fall back to the engine defaults.
    }
  }

  Future<void> _applyRateIfNeeded(double webRate) async {
    final double clamped = clampTtsRate(webRate);
    if (_lastAppliedRate == clamped) {
      return;
    }
    final double engineRate = _mapWebRateToEngine(clamped);
    await _engine.setSpeechRate(engineRate);
    _lastAppliedRate = clamped;
  }

  Future<void> _applyLocaleIfNeeded(String? locale) async {
    final String? normalized = locale?.replaceAll('_', '-');
    if (normalized == null || normalized.isEmpty) {
      return;
    }
    if (_lastAppliedLocale == normalized) {
      return;
    }
    try {
      await _engine.setLanguage(normalized);
      _lastAppliedLocale = normalized;
    } on Object {
      // Keep the previous locale.
    }
  }

  double _mapWebRateToEngine(double webRate) {
    if (kIsWeb) {
      return webRate;
    }
    if (Platform.isIOS || Platform.isMacOS) {
      return (webRate * 0.5).clamp(0.0, 1.0);
    }
    return webRate;
  }

  void _setSpeaking(bool value) {
    if (_isSpeaking == value) {
      return;
    }
    _isSpeaking = value;
    onSpeakingChanged?.call(isSpeaking: value, target: _currentTarget);
  }

  void _completeSpeech({bool error = false}) {
    final void Function()? onEnd = _onEnd;
    final void Function()? onError = _onError;
    _onEnd = null;
    _onError = null;
    _currentTarget = null;
    _setSpeaking(false);
    if (error) {
      onError?.call();
      return;
    }
    onEnd?.call();
  }
}
