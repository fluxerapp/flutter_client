import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/data/message_translation_service.dart';
import 'package:fluxer_app/features/chat/data/message_translation_source.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_translation.dart';

import '../../../helpers/open_test_database.dart';

class _FakeSource implements MessageTranslationSource {
  _FakeSource({this.available = true, this.throwOnTranslate = false})
    : detectedLanguage = 'de';

  final bool available;
  final bool throwOnTranslate;
  final String? detectedLanguage;
  int translateCalls = 0;
  int detectCalls = 0;

  @override
  String get id => 'fake';

  @override
  Future<bool> isAvailable() async => available;

  @override
  Future<String?> detectLanguage(String text) async {
    detectCalls += 1;
    return detectedLanguage;
  }

  @override
  Future<TranslatedText> translate({
    required String text,
    required String targetLanguage,
  }) async {
    translateCalls += 1;
    if (throwOnTranslate) {
      throw StateError('translate failed');
    }
    return TranslatedText(
      translatedContent: 'Hello world',
      sourceLanguageCode: 'de',
      targetLanguageCode: targetLanguage,
    );
  }
}

Message _message() => Message(
  id: '1',
  channelId: 'ch',
  authorId: 'author',
  authorName: 'Author',
  content: 'Hallo Welt',
  timestamp: DateTime.utc(2026),
);

void main() {
  group('MessageTranslationService', () {
    test('isAvailable is false when every source is unavailable', () async {
      final db = openTestDatabase();
      final MessageTranslationService service = MessageTranslationService(
        messageDao: db.messageDao,
        sources: <MessageTranslationSource>[_FakeSource(available: false)],
      );

      expect(await service.isAvailable(), isFalse);
    });

    test('skips unavailable sources and does not translate', () async {
      final db = openTestDatabase();
      final _FakeSource source = _FakeSource(available: false);
      final MessageTranslationService service = MessageTranslationService(
        messageDao: db.messageDao,
        sources: <MessageTranslationSource>[source],
      );
      await db.messageDao.upsertMessage(_message().toCompanion());

      await expectLater(
        service.translateMessage(message: _message(), targetLanguage: 'en'),
        throwsA(isA<MessageTranslationUnavailableException>()),
      );
      expect(source.translateCalls, 0);
    });

    test('does not call the source for empty content', () async {
      final db = openTestDatabase();
      final _FakeSource source = _FakeSource();
      final MessageTranslationService service = MessageTranslationService(
        messageDao: db.messageDao,
        sources: <MessageTranslationSource>[source],
      );
      final Message empty = Message(
        id: '1',
        channelId: 'ch',
        authorId: 'author',
        authorName: 'Author',
        content: '   ',
        timestamp: DateTime.utc(2026),
      );

      final Message result = await service.translateMessage(
        message: empty,
        targetLanguage: 'en',
      );

      expect(identical(result, empty), isTrue);
      expect(source.translateCalls, 0);
    });

    test('translates, persists, and returns the cached payload', () async {
      final db = openTestDatabase();
      final MessageTranslationService service = MessageTranslationService(
        messageDao: db.messageDao,
        sources: <MessageTranslationSource>[_FakeSource()],
      );
      await db.messageDao.upsertMessage(_message().toCompanion());

      final Message updated = await service.translateMessage(
        message: _message(),
        targetLanguage: 'en',
      );

      expect(updated.displayedContent, 'Hello world');
      expect(updated.translation?.sourceLanguageCode, 'de');
      expect(updated.translation?.sourceContent, 'Hallo Welt');

      final Message stored = Message.fromRow(
        (await db.messageDao.getMessage('1'))!,
      );
      expect(stored.translation?.translatedContent, 'Hello world');
    });

    test('caches language detection', () async {
      final db = openTestDatabase();
      final _FakeSource source = _FakeSource();
      final MessageTranslationService service = MessageTranslationService(
        messageDao: db.messageDao,
        sources: <MessageTranslationSource>[source],
      );

      expect(await service.detectLanguage('Hallo Welt'), 'de');
      expect(await service.detectLanguage('Hallo Welt'), 'de');
      expect(source.detectCalls, 1);
    });

    test('setShowOriginal persists the toggle', () async {
      final db = openTestDatabase();
      final MessageTranslationService service = MessageTranslationService(
        messageDao: db.messageDao,
        sources: <MessageTranslationSource>[_FakeSource()],
      );
      await db.messageDao.upsertMessage(_message().toCompanion());
      final Message translated = await service.translateMessage(
        message: _message(),
        targetLanguage: 'en',
      );

      final Message showingOriginal = await service.setShowOriginal(
        message: translated,
        showOriginal: true,
      );

      expect(showingOriginal.displayedContent, 'Hallo Welt');
      expect(showingOriginal.translation?.showOriginal, isTrue);
      final Message stored = Message.fromRow(
        (await db.messageDao.getMessage('1'))!,
      );
      expect(stored.translation?.showOriginal, isTrue);
    });

    test('maps plugin failures to MessageTranslationFailedException', () async {
      final db = openTestDatabase();
      final MessageTranslationService service = MessageTranslationService(
        messageDao: db.messageDao,
        sources: <MessageTranslationSource>[
          _FakeSource(throwOnTranslate: true),
        ],
      );
      await db.messageDao.upsertMessage(_message().toCompanion());

      await expectLater(
        service.translateMessage(message: _message(), targetLanguage: 'en'),
        throwsA(isA<MessageTranslationFailedException>()),
      );
    });
  });
}
