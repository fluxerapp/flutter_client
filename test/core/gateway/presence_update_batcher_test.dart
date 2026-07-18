import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/presence_update_batcher.dart';

import '../../helpers/open_test_database.dart';

void main() {
  test('PresenceUpdateBatcher applies current user immediately', () async {
    final FluxerDatabase database = openTestDatabase();
    final PresenceUpdateBatcher batcher = PresenceUpdateBatcher(
      database: database,
      currentUserId: 'self',
      batchDelay: const Duration(milliseconds: 100),
    );
    addTearDown(batcher.dispose);
    await database.userDao.upsertUser(
      UsersCompanion.insert(id: 'self', username: 'self'),
    );
    batcher.enqueue(userId: 'self', status: 'idle');
    await Future<void>.delayed(Duration.zero);
    final User? user = await database.userDao.getUserById('self');
    expect(user?.status, 'idle');
  });

  test('PresenceUpdateBatcher coalesces other users into one batch', () async {
    final FluxerDatabase database = openTestDatabase();
    final PresenceUpdateBatcher batcher = PresenceUpdateBatcher(
      database: database,
      currentUserId: 'self',
      batchDelay: const Duration(milliseconds: 50),
    );
    addTearDown(batcher.dispose);
    await database.userDao.upsertUsers([
      UsersCompanion.insert(id: 'u1', username: 'u1'),
      UsersCompanion.insert(id: 'u2', username: 'u2'),
    ]);
    batcher
      ..enqueue(userId: 'u1', status: 'online')
      ..enqueue(userId: 'u2', status: 'dnd')
      ..enqueue(userId: 'u1', status: 'idle');
    await Future<void>.delayed(const Duration(milliseconds: 80));
    final User? u1 = await database.userDao.getUserById('u1');
    final User? u2 = await database.userDao.getUserById('u2');
    expect(u1?.status, 'idle');
    expect(u2?.status, 'dnd');
  });

  test('PresenceUpdateBatcher persists mobile flag for other users', () async {
    final FluxerDatabase database = openTestDatabase();
    final PresenceUpdateBatcher batcher = PresenceUpdateBatcher(
      database: database,
      currentUserId: 'self',
      batchDelay: const Duration(milliseconds: 50),
    );
    addTearDown(batcher.dispose);
    await database.userDao.upsertUser(
      UsersCompanion.insert(id: 'u1', username: 'u1'),
    );
    batcher.enqueue(userId: 'u1', status: 'online', mobile: true);
    await Future<void>.delayed(const Duration(milliseconds: 80));
    final User? user = await database.userDao.getUserById('u1');
    expect(user?.mobile, isTrue);
  });
}
