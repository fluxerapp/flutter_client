import 'package:fluxer_app/features/chat/utils/message_content_stripper.dart';

const int _kLanguageDetectionSampleLength = 512;
const int _kDominantScriptSampleLetters = 64;

enum TranslateOfferHint { show, hide, detect }

enum _LetterScript { latin, cjk, arabic, cyrillic, hangul, greek, hebrew, thai }

String languageSubtag(String languageTag) {
  final String normalized = languageTag.trim().toLowerCase().replaceAll(
    '_',
    '-',
  );
  if (normalized.isEmpty) {
    return '';
  }
  return normalized.split('-').first;
}

String languageDetectionSample(String content) {
  final String trimmed = content.trim();
  if (trimmed.length <= _kLanguageDetectionSampleLength) {
    return trimmed;
  }
  return trimmed.substring(0, _kLanguageDetectionSampleLength);
}

/// Custom emoji names read as prose to the script and language checks.
String translatableMessageText(String content) {
  return content.replaceAll(MessageContentPatterns.customEmoji, '').trim();
}

bool isDetectedForeignLanguage(String? detectedLanguage, String appLanguage) {
  final String detected = languageSubtag(detectedLanguage ?? '');
  final String app = languageSubtag(appLanguage);
  if (detected.isEmpty || detected == 'und' || app.isEmpty) {
    return false;
  }
  return detected != app;
}

TranslateOfferHint translateOfferHint(String content, String appLanguage) {
  final _LetterScript? script = _dominantLetterScript(content);
  if (script == null) {
    return TranslateOfferHint.detect;
  }
  final _LetterScript appScript = _scriptForLanguage(appLanguage);
  if (script != appScript) {
    return TranslateOfferHint.show;
  }
  if (script == _LetterScript.latin || script == _LetterScript.cjk) {
    return TranslateOfferHint.detect;
  }
  return TranslateOfferHint.hide;
}

bool shouldOfferMessageTranslate({
  required TranslateOfferHint hint,
  required String appLanguage,
  String? detectedLanguage,
  bool detectedLanguageReady = true,
}) {
  return switch (hint) {
    TranslateOfferHint.show => true,
    TranslateOfferHint.hide => false,
    TranslateOfferHint.detect =>
      detectedLanguageReady &&
          isDetectedForeignLanguage(detectedLanguage, appLanguage),
  };
}

_LetterScript? _letterScriptForRune(int rune) {
  return switch (rune) {
    >= 0x0041 && <= 0x005A => _LetterScript.latin,
    >= 0x0061 && <= 0x007A => _LetterScript.latin,
    >= 0x00C0 && <= 0x024F => _LetterScript.latin,
    >= 0x1E00 && <= 0x1EFF => _LetterScript.latin,
    >= 0x0370 && <= 0x03FF => _LetterScript.greek,
    >= 0x0400 && <= 0x04FF => _LetterScript.cyrillic,
    >= 0x0590 && <= 0x05FF => _LetterScript.hebrew,
    >= 0x0600 && <= 0x06FF => _LetterScript.arabic,
    >= 0x0E00 && <= 0x0E7F => _LetterScript.thai,
    >= 0x3040 && <= 0x30FF => _LetterScript.cjk,
    >= 0x3400 && <= 0x4DBF => _LetterScript.cjk,
    >= 0x4E00 && <= 0x9FFF => _LetterScript.cjk,
    >= 0xAC00 && <= 0xD7AF => _LetterScript.hangul,
    _ => null,
  };
}

_LetterScript? _dominantLetterScript(String content) {
  final Map<_LetterScript, int> counts = <_LetterScript, int>{};
  int total = 0;
  for (final int rune in content.runes) {
    final _LetterScript? script = _letterScriptForRune(rune);
    if (script == null) {
      continue;
    }
    counts[script] = (counts[script] ?? 0) + 1;
    total += 1;
    if (total >= _kDominantScriptSampleLetters) {
      break;
    }
  }
  _LetterScript? best;
  int bestCount = 0;
  for (final MapEntry<_LetterScript, int> entry in counts.entries) {
    if (entry.value > bestCount) {
      best = entry.key;
      bestCount = entry.value;
    }
  }
  return best;
}

_LetterScript _scriptForLanguage(String languageTag) {
  return switch (languageSubtag(languageTag)) {
    'ar' || 'fa' || 'ur' => _LetterScript.arabic,
    'ru' || 'uk' || 'bg' || 'sr' || 'mk' || 'be' => _LetterScript.cyrillic,
    'el' => _LetterScript.greek,
    'he' || 'iw' => _LetterScript.hebrew,
    'ko' => _LetterScript.hangul,
    'th' => _LetterScript.thai,
    'ja' || 'zh' => _LetterScript.cjk,
    _ => _LetterScript.latin,
  };
}
