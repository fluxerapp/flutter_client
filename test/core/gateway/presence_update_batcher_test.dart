import 'dart:async';

import 'package:drift/drift.dart' show TableUpdate, TableUpdateQuery;
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/presence_store.dart';
import 'package:fluxer_app/core/gateway/presence_update_batcher.dart';

import '../../helpers/open_test_database.dart';

void main() {
  test('PresenceUpdateBatcher applies current user immediately', () {
    final FluxerDatabase database = openTestDatabase();
    final PresenceUpdateBatcher batcher = PresenceUpdateBatcher(
      database: database,
      currentUserId: 'self',
      batchDelay: const Duration(milliseconds: 100),
    );
    addTearDown(batcher.dispose);
    batcher.enqueue(userId: 'self', status: 'idle');
    expect(presenceStoreFor(database)['self']?.status, 'idle');
  });

  test('PresenceUpdateBatcher coalesces other users into one batch', () async {
    final FluxerDatabase database = openTestDatabase();
    final PresenceStore store = presenceStoreFor(database);
    final PresenceUpdateBatcher batcher = PresenceUpdateBatcher(
      database: database,
      currentUserId: 'self',
      batchDelay: const Duration(milliseconds: 50),
    );
    addTearDown(batcher.dispose);
    var notifications = 0;
    store.listen('u1', () => notifications++);
    batcher
      ..enqueue(userId: 'u1', status: 'online')
      ..enqueue(userId: 'u2', status: 'dnd')
      ..enqueue(userId: 'u1', status: 'idle');
    expect(store['u1'], isNull);
    await Future<void>.delayed(const Duration(milliseconds: 80));
    expect(store['u1']?.status, 'idle');
    expect(store['u2']?.status, 'dnd');
    expect(notifications, 1);
  });

  test('PresenceUpdateBatcher keeps the mobile flag for other users', () async {
    final FluxerDatabase database = openTestDatabase();
    final PresenceUpdateBatcher batcher = PresenceUpdateBatcher(
      database: database,
      currentUserId: 'self',
      batchDelay: const Duration(milliseconds: 50),
    );
    addTearDown(batcher.dispose);
    batcher.enqueue(userId: 'u1', status: 'online', mobile: true);
    await Future<void>.delayed(const Duration(milliseconds: 80));
    expect(presenceStoreFor(database)['u1']?.mobile, isTrue);
  });

  test('PresenceUpdateBatcher stores the user sent with a presence', () async {
    final FluxerDatabase database = openTestDatabase();
    final PresenceUpdateBatcher batcher = PresenceUpdateBatcher(
      database: database,
      currentUserId: 'self',
      batchDelay: const Duration(milliseconds: 50),
    );
    addTearDown(batcher.dispose);
    batcher.enqueue(
      userId: 'u1',
      status: 'dnd',
      user: UsersCompanion.insert(id: 'u1', username: 'friend'),
    );
    await Future<void>.delayed(const Duration(milliseconds: 80));
    final User? user = await database.userDao.getUserById('u1');
    expect(user?.username, 'friend');
    expect(presenceStoreFor(database)['u1']?.status, 'dnd');
  });

  test('presence flushes never write the users table', () async {
    final FluxerDatabase database = openTestDatabase();
    await database.userDao.upsertUsers(<UsersCompanion>[
      UsersCompanion.insert(id: 'u1', username: 'u1'),
    ]);
    await pumpEventQueue();

    fakeAsync((FakeAsync async) {
      final PresenceUpdateBatcher batcher = PresenceUpdateBatcher(
        database: database,
        currentUserId: 'self',
      );
      final List<Set<TableUpdate>> emissions = <Set<TableUpdate>>[];
      final StreamSubscription<Set<TableUpdate>> sub = database
          .tableUpdates(TableUpdateQuery.onTable(database.users))
          .listen(emissions.add);

      batcher
        ..enqueue(userId: 'u1', status: 'online')
        ..enqueue(userId: 'u1', status: 'idle', customStatus: 'brb');
      async
        ..elapse(const Duration(milliseconds: 600))
        ..flushMicrotasks();

      expect(emissions, isEmpty);
      expect(presenceStoreFor(database)['u1']?.customStatus, 'brb');
      unawaited(sub.cancel());
      batcher.dispose();
    });
  });
}
