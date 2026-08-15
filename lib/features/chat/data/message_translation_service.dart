import 'dart:collection';

import 'package:fluxer_app/core/database/daos/message_dao.dart';
import 'package:fluxer_app/features/chat/data/message_translation_source.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_translation.dart';
import 'package:fluxer_app/features/chat/utils/message_translate_offer.dart';

class MessageTranslationService {
  MessageTranslationService({
    required this._messageDao,
    required this._sources,
  });

  static const int _maxCachedDetections = 128;

  final MessageDao _messageDao;
  final List<MessageTranslationSource> _sources;
  final LinkedHashMap<String, String?> _detections =
      LinkedHashMap<String, String?>();

  Future<bool> isAvailable() async {
    return await _firstAvailable() != null;
  }

  Future<String?> detectLanguage(String text) async {
    final String sample = languageDetectionSample(text);
    if (sample.isEmpty) {
      return null;
    }
    if (_detections.containsKey(sample)) {
      return _detections[sample];
    }
    final MessageTranslationSource? source = await _firstAvailable();
    if (source == null) {
      return null;
    }
    try {
      final String? code = await source.detectLanguage(sample);
      _cacheDetection(sample, code);
      return code;
    } on Object {
      _cacheDetection(sample, null);
      return null;
    }
  }

  Future<Message> translateMessage({
    required Message message,
    required String targetLanguage,
  }) async {
    if (message.content.trim().isEmpty) {
      return message;
    }
    final MessageTranslationSource? source = await _firstAvailable();
    if (source == null) {
      throw const MessageTranslationUnavailableException();
    }
    try {
      final TranslatedText result = await source.translate(
        text: message.content,
        targetLanguage: targetLanguage,
      );
      final MessageTranslation translation = MessageTranslation(
        translatedContent: result.translatedContent,
        sourceLanguageCode: result.sourceLanguageCode,
        sourceContent: message.content,
        targetLanguageCode: result.targetLanguageCode,
      );
      await _messageDao.saveTranslation(
        messageId: message.id,
        translation: translation,
      );
      return message.copyWith(translation: translation);
    } on MessageTranslationUnavailableException {
      rethrow;
    } on Object {
      throw const MessageTranslationFailedException();
    }
  }

  Future<Message> setShowOriginal({
    required Message message,
    required bool showOriginal,
  }) async {
    final MessageTranslation? translation = message.translation;
    if (translation == null || !translation.isValidFor(message.content)) {
      return message;
    }
    final MessageTranslation next = translation.copyWith(
      showOriginal: showOriginal,
    );
    await _messageDao.saveTranslation(messageId: message.id, translation: next);
    return message.copyWith(translation: next);
  }

  void _cacheDetection(String sample, String? code) {
    _detections.remove(sample);
    _detections[sample] = code;
    while (_detections.length > _maxCachedDetections) {
      _detections.remove(_detections.keys.first);
    }
  }

  Future<MessageTranslationSource?> _firstAvailable() async {
    for (final MessageTranslationSource source in _sources) {
      if (await source.isAvailable()) {
        return source;
      }
    }
    return null;
  }
}
