import 'package:fluxer_app/features/chat/domain/message_translation.dart';

abstract interface class MessageTranslationSource {
  String get id;

  Future<bool> isAvailable();

  Future<TranslatedText> translate({
    required String text,
    required String targetLanguage,
  });

  Future<String?> detectLanguage(String text);
}
