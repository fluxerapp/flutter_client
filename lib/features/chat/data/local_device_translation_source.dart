import 'package:fluxer_app/features/chat/data/message_translation_source.dart';
import 'package:fluxer_app/features/chat/domain/message_translation.dart';
import 'package:local_translation/local_translation.dart';

class LocalDeviceTranslationSource implements MessageTranslationSource {
  LocalDeviceTranslationSource({LocalTranslation? plugin})
    : _plugin = plugin ?? LocalTranslation();

  final LocalTranslation _plugin;

  @override
  String get id => 'local_device';

  @override
  Future<bool> isAvailable() => _plugin.isSupported();

  @override
  Future<String?> detectLanguage(String text) async {
    final LanguageDetection detection = await _plugin.detectLanguage(text);
    final String? code = detection.languageCode?.trim();
    if (code == null || code.isEmpty || code.toLowerCase() == 'und') {
      return null;
    }
    return code;
  }

  @override
  Future<TranslatedText> translate({
    required String text,
    required String targetLanguage,
  }) async {
    final TranslationResult result = await _plugin.translate(
      text,
      targetLanguage: targetLanguage,
    );
    return TranslatedText(
      translatedContent: result.translatedText,
      sourceLanguageCode: result.sourceLanguage ?? '',
      targetLanguageCode: result.targetLanguage,
    );
  }
}
