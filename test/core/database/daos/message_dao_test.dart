import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' hide Message;
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';

import '../../../helpers/open_test_database.dart';

String _snowflakeForUtc(DateTime utc) {
  final int internal = (utc.millisecondsSinceEpoch - kSnowflakeEpochMs) << 22;
  return internal.toString();
}

Message _msg(String id) => Message(
  id: id,
  channelId: 'ch',
  authorId: 'author',
  authorName: 'Author',
  content: 'body',
  timestamp: dateTimeFromUserSnowflakeOrNull(id)!,
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
}
