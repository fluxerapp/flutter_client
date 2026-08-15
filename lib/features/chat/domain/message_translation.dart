class MessageTranslation {
  const MessageTranslation({
    required this.translatedContent,
    required this.sourceLanguageCode,
    required this.sourceContent,
    required this.targetLanguageCode,
    this.showOriginal = false,
  });

  final String translatedContent;
  final String sourceLanguageCode;
  final String sourceContent;
  final String targetLanguageCode;
  final bool showOriginal;

  bool isValidFor(String content) => sourceContent == content;

  MessageTranslation copyWith({
    String? translatedContent,
    String? sourceLanguageCode,
    String? sourceContent,
    String? targetLanguageCode,
    bool? showOriginal,
  }) {
    return MessageTranslation(
      translatedContent: translatedContent ?? this.translatedContent,
      sourceLanguageCode: sourceLanguageCode ?? this.sourceLanguageCode,
      sourceContent: sourceContent ?? this.sourceContent,
      targetLanguageCode: targetLanguageCode ?? this.targetLanguageCode,
      showOriginal: showOriginal ?? this.showOriginal,
    );
  }

  static MessageTranslation? tryParse({
    required String? translatedContent,
    required String? sourceLanguage,
    required String? sourceContent,
    required String? targetLanguage,
    required bool showOriginal,
  }) {
    if (translatedContent == null ||
        sourceLanguage == null ||
        sourceContent == null ||
        targetLanguage == null) {
      return null;
    }
    return MessageTranslation(
      translatedContent: translatedContent,
      sourceLanguageCode: sourceLanguage,
      sourceContent: sourceContent,
      targetLanguageCode: targetLanguage,
      showOriginal: showOriginal,
    );
  }
}

class TranslatedText {
  const TranslatedText({
    required this.translatedContent,
    required this.sourceLanguageCode,
    required this.targetLanguageCode,
  });

  final String translatedContent;
  final String sourceLanguageCode;
  final String targetLanguageCode;
}

class MessageTranslationSnapshot {
  const MessageTranslationSnapshot({required this.content, this.translation});

  final String content;
  final MessageTranslation? translation;
}

class MessageTranslationUnavailableException implements Exception {
  const MessageTranslationUnavailableException();
}

class MessageTranslationFailedException implements Exception {
  const MessageTranslationFailedException();
}
