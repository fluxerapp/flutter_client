import 'package:fluxer_app/features/chat/data/message_translation_source.dart';
import 'package:fluxer_app/features/chat/domain/message_translation.dart';
import 'package:local_translation/local_translation.dart';

class LocalDeviceTranslationSource implements MessageTranslationSource {
  LocalDeviceTranslationSource({LocalTranslation? plugin})
    : _plugin = plugin ?? LocalTranslation();

  final LocalTranslation _plugin;

  @override
  Future<bool> isAvailable() => _plugin.isSupported();

  @override
  Future<String?> detectLanguage(String text) async {
    try {
      final LanguageDetection detection = await _plugin.detectLanguage(text);
      final String? code = detection.languageCode?.trim();
      if (code == null || code.isEmpty || code.toLowerCase() == 'und') {
        return null;
      }
      return code;
    } on LocalTranslationException {
      return null;
    }
  }

  @override
  Future<TranslatedText> translate({
    required String text,
    required String targetLanguage,
  }) async {
    try {
      final TranslationResult result = await _plugin.translate(
        text,
        targetLanguage: targetLanguage,
      );
      return TranslatedText(
        translatedContent: result.translatedText,
        sourceLanguageCode: result.sourceLanguage ?? '',
        targetLanguageCode: result.targetLanguage,
      );
    } on LocalTranslationException catch (error) {
      switch (error.code) {
        case LocalTranslationErrorCode.unsupportedPlatform:
          throw const MessageTranslationUnavailableException();
        case LocalTranslationErrorCode.unsupportedLanguagePair:
          throw const MessageTranslationUnsupportedLanguageException();
        case LocalTranslationErrorCode.cancelled:
          throw const MessageTranslationCancelledException();
        case LocalTranslationErrorCode.unknown:
          throw const MessageTranslationFailedException();
      }
    }
  }
}
