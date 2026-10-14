import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' hide Message;
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_translation.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';

import '../../../helpers/open_test_database.dart';

String _snowflakeForUtc(DateTime utc) {
  final int internal = (utc.millisecondsSinceEpoch - kSnowflakeEpochMs) << 22;
  return internal.toString();
}

Message _msg(
  String id, {
  MessageDeliveryState deliveryState = MessageDeliveryState.sent,
}) => Message(
  id: id,
  channelId: 'ch',
  authorId: 'author',
  authorName: 'Author',
  content: 'body',
  timestamp: dateTimeFromUserSnowflakeOrNull(id)!,
  deliveryState: deliveryState,
);

Message _msgAt(String id, DateTime timestamp) => Message(
  id: id,
  channelId: 'ch',
  authorId: 'author',
  authorName: 'Author',
  content: 'body',
  timestamp: timestamp,
);

void main() {
  final String idA = _snowflakeForUtc(DateTime.utc(2026, 5, 10, 10));
  final String idB = _snowflakeForUtc(DateTime.utc(2026, 5, 10, 11));
  final String idC = _snowflakeForUtc(DateTime.utc(2026, 5, 10, 12));
  final String idD = _snowflakeForUtc(DateTime.utc(2026, 5, 10, 13));

  Future<FluxerDatabase> seed(List<String> ids) async {
    final db = openTestDatabase();
    for (final id in ids) {
      await db.messageDao.upsertMessage(_msg(id).toCompanion());
    }
    return db;
  }

  test('getMessagesAfter returns ascending rows strictly after the '
      'cursor', () async {
    final db = await seed([idA, idB, idC, idD]);
    final after = await db.messageDao.getMessagesAfter('ch', idB);
    expect(after.map((m) => m.id).toList(), [idC, idD]);
  });

  test('getMessagesAfter respects limit, returning the oldest after the '
      'cursor first', () async {
    final db = await seed([idA, idB, idC, idD]);
    final after = await db.messageDao.getMessagesAfter('ch', idA, limit: 2);
    expect(after.map((m) => m.id).toList(), [idB, idC]);
  });

  test('getMessagesAfter returns empty past the newest message', () async {
    final db = await seed([idA]);
    final after = await db.messageDao.getMessagesAfter('ch', idA);
    expect(after, isEmpty);
  });

  test('equal-timestamp rows tie-break by snowflake id across page '
      'cursors', () async {
    final db = openTestDatabase();
    final DateTime ts = DateTime.utc(2026, 5, 10, 10);
    await db.messageDao.upsertMessage(_msgAt('99', ts).toCompanion());
    await db.messageDao.upsertMessage(_msgAt('100', ts).toCompanion());

    final before = await db.messageDao.getMessages('ch', beforeId: '100');
    expect(before.map((m) => m.id).toList(), ['99']);

    final after = await db.messageDao.getMessagesAfter('ch', '99');
    expect(after.map((m) => m.id).toList(), ['100']);
  });

  test('deleteServerMessagesBetween drops sent rows inside the bound and '
      'keeps unsent, newer and other-channel ones', () async {
    final db = await seed([idA, idB, idC, idD]);
    final String pendingId = _snowflakeForUtc(DateTime.utc(2026, 5, 10, 14));
    await db.messageDao.upsertMessage(
      _msg(
        pendingId,
        deliveryState: MessageDeliveryState.sending,
      ).toCompanion(),
    );
    final String otherChannelMessageId = _snowflakeForUtc(
      DateTime.utc(2026, 5, 10, 15),
    );
    await db.messageDao.upsertMessage(
      _msg(otherChannelMessageId).copyWith(channelId: 'other-ch').toCompanion(),
    );

    await db.messageDao.deleteServerMessagesBetween(
      'ch',
      afterId: idB,
      upToId: idC,
    );

    expect(await db.messageDao.getMessage('ch', idA), isNotNull);
    expect(await db.messageDao.getMessage('ch', idB), isNotNull);
    expect(await db.messageDao.getMessage('ch', idC), isNull);
    expect(await db.messageDao.getMessage('ch', idD), isNotNull);
    expect(await db.messageDao.getMessage('ch', pendingId), isNotNull);
    expect(await db.messageDao.getMessages('other-ch'), hasLength(1));
  });

  test('deleteServerMessagesBetween orders ids numerically', () async {
    final db = openTestDatabase();
    final DateTime ts = DateTime.utc(2026, 5, 10, 10);
    await db.messageDao.upsertMessage(_msgAt('99', ts).toCompanion());
    await db.messageDao.upsertMessage(_msgAt('100', ts).toCompanion());

    await db.messageDao.deleteServerMessagesBetween(
      'ch',
      afterId: '99',
      upToId: '100',
    );

    expect(await db.messageDao.getMessage('ch', '99'), isNotNull);
    expect(await db.messageDao.getMessage('ch', '100'), isNull);
  });

  test('newestServerMessageId ignores unsent rows', () async {
    final db = await seed([idA, idB]);
    final String pendingId = _snowflakeForUtc(DateTime.utc(2026, 5, 10, 14));
    await db.messageDao.upsertMessage(
      _msg(
        pendingId,
        deliveryState: MessageDeliveryState.sending,
      ).toCompanion(),
    );

    expect(await db.messageDao.newestServerMessageId('ch'), idB);
    expect(await db.messageDao.newestServerMessageId('other-ch'), null);
  });

  test(
    'watchLastMessage emits the newest row and re-emits on insert',
    () async {
      final db = await seed([idA, idB]);

      final emissions = <String?>[];
      final sub = db.messageDao
          .watchLastMessage('ch')
          .listen((m) => emissions.add(m?.id));
      addTearDown(sub.cancel);

      await pumpEventQueue();
      expect(emissions.last, idB);

      await db.messageDao.upsertMessage(_msg(idC).toCompanion());
      await pumpEventQueue();
      expect(emissions.last, idC);
    },
  );

  test('saveTranslation persists on the message row', () async {
    final db = openTestDatabase();
    await db.messageDao.upsertMessage(_msg(idA).toCompanion());
    await db.messageDao.saveTranslation(
      channelId: 'ch',
      messageId: idA,
      translation: const MessageTranslation(
        translatedContent: 'Hello world',
        sourceLanguageCode: 'de',
        sourceContent: 'body',
        targetLanguageCode: 'en',
      ),
    );

    final stored = await db.messageDao.getMessage('ch', idA);
    final Message parsed = Message.fromRow(stored!);
    expect(parsed.translation?.translatedContent, 'Hello world');
    expect(parsed.translation?.sourceLanguageCode, 'de');
  });

  test('upsert with different content clears translation', () async {
    final db = openTestDatabase();
    final Message original = _msg(idA);
    await db.messageDao.upsertMessage(original.toCompanion());
    await db.messageDao.saveTranslation(
      channelId: 'ch',
      messageId: idA,
      translation: const MessageTranslation(
        translatedContent: 'Hello world',
        sourceLanguageCode: 'de',
        sourceContent: 'body',
        targetLanguageCode: 'en',
      ),
    );

    await db.messageDao.upsertMessage(
      original.copyWith(content: 'edited').toCompanion(),
    );

    final Message parsed = Message.fromRow(
      (await db.messageDao.getMessage('ch', idA))!,
    );
    expect(parsed.content, 'edited');
    expect(parsed.translation, isNull);
  });

  test('upsert with the same content keeps translation', () async {
    final db = openTestDatabase();
    final Message original = _msg(idA);
    await db.messageDao.upsertMessage(original.toCompanion());
    await db.messageDao.saveTranslation(
      channelId: 'ch',
      messageId: idA,
      translation: const MessageTranslation(
        translatedContent: 'Hello world',
        sourceLanguageCode: 'de',
        sourceContent: 'body',
        targetLanguageCode: 'en',
      ),
    );

    await db.messageDao.upsertMessage(original.toCompanion());

    final Message parsed = Message.fromRow(
      (await db.messageDao.getMessage('ch', idA))!,
    );
    expect(parsed.translation?.translatedContent, 'Hello world');
  });

  test('upsert with a null nonce keeps the stored nonce', () async {
    final db = openTestDatabase();
    final Message original = _msg(idA).copyWith(clientNonce: 'nonce-1');
    await db.messageDao.upsertMessage(original.toCompanion());

    await db.messageDao.upsertMessage(
      original.copyWith(clientNonce: null).toCompanion(),
    );

    final Message parsed = Message.fromRow(
      (await db.messageDao.getMessage('ch', idA))!,
    );
    expect(parsed.clientNonce, 'nonce-1');
  });

  test(
    'watchServerMessageCountAfter counts sent rows after the cursor',
    () async {
      final db = await seed([idA, idB, idC]);
      await db.messageDao.upsertMessage(
        _msg(idD, deliveryState: MessageDeliveryState.sending).toCompanion(),
      );
      await db.messageDao.upsertMessage(
        Message(
          id: _snowflakeForUtc(DateTime.utc(2026, 5, 10, 14)),
          channelId: 'other',
          authorId: 'author',
          authorName: 'Author',
          content: 'body',
          timestamp: DateTime.utc(2026, 5, 10, 14),
        ).toCompanion(),
      );

      expect(
        await db.messageDao.watchServerMessageCountAfter('ch', idA).first,
        2,
      );
      expect(
        await db.messageDao.watchServerMessageCountAfter('ch', idC).first,
        0,
      );
    },
  );

  group('a thread starter shares its source message id', () {
    final String sourceId = _snowflakeForUtc(DateTime.utc(2026, 10, 14, 12));
    final Message source = _msg(sourceId).copyWith(content: 'source');
    final Message starter = Message(
      id: sourceId,
      channelId: sourceId,
      authorId: 'author',
      authorName: 'Author',
      content: '',
      timestamp: source.timestamp,
      type: messageTypeThreadStarterMessage,
    );

    Future<FluxerDatabase> seedBoth() async {
      final db = openTestDatabase();
      await db.messageDao.upsertMessage(source.toCompanion());
      await db.messageDao.upsertMessages(<MessagesCompanion>[
        starter.toCompanion(),
      ]);
      return db;
    }

    test('storing the starter keeps the source row in its channel', () async {
      final db = await seedBoth();

      final parentRows = await db.messageDao.getMessages('ch');
      expect(parentRows.map((row) => row.content), <String>['source']);
      expect(
        (await db.messageDao.getMessage('ch', sourceId))?.content,
        'source',
      );
      final threadRows = await db.messageDao.getMessages(sourceId);
      expect(threadRows.map((row) => row.type), <int>[
        messageTypeThreadStarterMessage,
      ]);
    });

    test('channel scoped writes leave the twin row alone', () async {
      final db = await seedBoth();

      await db.messageDao.updateReactions(sourceId, sourceId, '[{"x":1}]');
      await db.messageDao.saveTranslation(
        channelId: sourceId,
        messageId: sourceId,
        translation: null,
      );
      await db.messageDao.deleteMessagesForChannel(sourceId);

      final row = await db.messageDao.getMessage('ch', sourceId);
      expect(row?.content, 'source');
      expect(row?.reactionsJson, '[]');
      expect(await db.messageDao.getMessage(sourceId, sourceId), isNull);
    });

    test('deleting by id only touches the named channel', () async {
      final db = await seedBoth();

      await db.messageDao.deleteMessages('ch', <String>[sourceId]);

      expect(await db.messageDao.getMessage('ch', sourceId), isNull);
      expect(await db.messageDao.getMessage(sourceId, sourceId), isNotNull);
    });

    test('per channel trimming keeps both rows', () async {
      final db = await seedBoth();

      await db.messageDao.keepNewestMessagesPerChannel(1);

      expect(await db.messageDao.getMessage('ch', sourceId), isNotNull);
      expect(await db.messageDao.getMessage(sourceId, sourceId), isNotNull);
    });
  });
}
