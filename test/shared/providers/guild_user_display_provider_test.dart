import 'dart:async';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/members/providers/guild_member_chunk_waiter.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/services/guild_member_hydration_service.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_dart/export.dart';

import '../../helpers/open_test_database.dart';

class _NoopHydrationService extends GuildMemberHydrationService {
  _NoopHydrationService({required super.database})
    : super(
        client: FluxerClient(
          Dio(BaseOptions(baseUrl: 'https://test.fluxer.invalid/v1')),
        ),
        chunkWaiter: GuildMemberChunkWaiter(),
        readGateway: () => null,
      );

  @override
  void requestHydration({
    required String guildId,
    required Iterable<String> userIds,
    void Function(String userId)? onMemberFetched,
  }) {}
}

class _RecordingAdapter implements HttpClientAdapter {
  int requestCount = 0;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requestCount++;
    return ResponseBody.fromString(
      '''
{
  "user": {
    "id": "user-1",
    "username": "alice",
    "discriminator": "0000",
    "global_name": "Global Alice",
    "avatar": null,
    "avatar_color": null,
    "flags": 0
  },
  "nick": "Guild Alice",
  "roles": [],
  "joined_at": "2026-01-01T00:00:00.000Z",
  "mute": false,
  "deaf": false
}
''',
      200,
      statusMessage: 'OK',
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>[Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

FluxerClient _clientWithAdapter(HttpClientAdapter adapter) {
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://test.fluxer.invalid/v1'))
    ..httpClientAdapter = adapter;
  addTearDown(dio.close);
  return FluxerClient(dio);
}

void main() {
  test(
    'guildUserDisplayProvider prefers guild nick over global name',
    () async {
      final FluxerDatabase db = openTestDatabase();
      await db.userDao.upsertUser(
        UsersCompanion.insert(
          id: 'user-1',
          username: 'alice',
          globalName: const Value('Global Alice'),
        ),
      );
      await db.memberDao.upsertMember(
        MembersCompanion.insert(
          userId: 'user-1',
          guildId: 'guild-1',
          nick: const Value('Guild Alice'),
          roleIdsJson: const Value('[]'),
        ),
      );

      final ProviderContainer container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(db),
          guildMemberHydrationServiceProvider.overrideWithValue(
            _NoopHydrationService(database: db),
          ),
        ],
      );
      addTearDown(container.dispose);

      final List<String?> names = <String?>[];
      final ProviderSubscription<AsyncValue<GuildUserDisplay?>> sub = container
          .listen(
            guildUserDisplayProvider(('user-1', 'guild-1')),
            (
              AsyncValue<GuildUserDisplay?>? previous,
              AsyncValue<GuildUserDisplay?> next,
            ) => names.add(next.value?.displayName),
            fireImmediately: true,
          );
      addTearDown(sub.close);
      await pumpEventQueue();

      expect(names.last, 'Guild Alice');
    },
  );

  test(
    'guildUserDisplayProvider does not call REST directly when member is missing',
    () async {
      final FluxerDatabase db = openTestDatabase();
      final _RecordingAdapter adapter = _RecordingAdapter();
      await db.userDao.upsertUser(
        UsersCompanion.insert(
          id: 'user-1',
          username: 'alice',
          globalName: const Value('Global Alice'),
        ),
      );

      await db.userDao.watchUserById('user-1').first;

      final ProviderContainer container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(db),
          fluxerClientProvider.overrideWithValue(_clientWithAdapter(adapter)),
          guildMemberHydrationServiceProvider.overrideWithValue(
            _NoopHydrationService(database: db),
          ),
        ],
      );
      addTearDown(container.dispose);

      final List<String?> names = <String?>[];
      final ProviderSubscription<AsyncValue<GuildUserDisplay?>> sub = container
          .listen(
            guildUserDisplayProvider(('user-1', 'guild-1')),
            (
              AsyncValue<GuildUserDisplay?>? previous,
              AsyncValue<GuildUserDisplay?> next,
            ) => names.add(next.value?.displayName),
            fireImmediately: true,
          );
      addTearDown(sub.close);
      await pumpEventQueue();

      expect(adapter.requestCount, 0);
      expect(names.last, 'Global Alice');
    },
  );

  test('guildUserDisplayProvider re-emits when the watched user row '
      'changes', () async {
    final FluxerDatabase db = openTestDatabase();
    await db.userDao.upsertUser(
      UsersCompanion.insert(id: 'user-1', username: 'alice'),
    );

    final ProviderContainer container = ProviderContainer(
      overrides: [fluxerDatabaseProvider.overrideWithValue(db)],
    );
    addTearDown(container.dispose);

    final List<String?> names = <String?>[];
    final ProviderSubscription<AsyncValue<GuildUserDisplay?>> sub = container
        .listen(
          guildUserDisplayProvider(('user-1', null)),
          (
            AsyncValue<GuildUserDisplay?>? previous,
            AsyncValue<GuildUserDisplay?> next,
          ) => names.add(next.value?.displayName),
          fireImmediately: true,
        );
    addTearDown(sub.close);

    await pumpEventQueue();
    expect(names.last, 'alice');

    await db.userDao.upsertUser(
      UsersCompanion.insert(id: 'user-1', username: 'alice2'),
    );
    await pumpEventQueue();
    expect(names.last, 'alice2');
  });

  test('guildUserDisplayProvider dedupes presence-only changes but '
      'notifies on display changes', () async {
    final FluxerDatabase db = openTestDatabase();
    await db.userDao.upsertUser(
      UsersCompanion.insert(id: 'user-1', username: 'alice'),
    );

    final ProviderContainer container = ProviderContainer(
      overrides: [fluxerDatabaseProvider.overrideWithValue(db)],
    );
    addTearDown(container.dispose);

    var notifyCount = 0;
    final ProviderSubscription<AsyncValue<GuildUserDisplay?>> sub = container
        .listen(
          guildUserDisplayProvider(('user-1', null)),
          (
            AsyncValue<GuildUserDisplay?>? previous,
            AsyncValue<GuildUserDisplay?> next,
          ) => notifyCount++,
        );
    addTearDown(sub.close);

    await pumpEventQueue();
    final AsyncValue<GuildUserDisplay?> initial = container.read(
      guildUserDisplayProvider(('user-1', null)),
    );
    expect(initial.value?.displayName, 'alice');
    final int baseline = notifyCount;

    await db.userDao.updateUserPresence('user-1', status: 'idle');
    await pumpEventQueue();
    expect(
      notifyCount,
      baseline,
      reason: 'presence-only change should be deduped by value equality',
    );

    await db.userDao.upsertUser(
      UsersCompanion.insert(id: 'user-1', username: 'alice2'),
    );
    await pumpEventQueue();
    expect(
      notifyCount,
      greaterThan(baseline),
      reason: 'display-field change must still notify',
    );
  });

  test(
    'hydration service updates provider when member row is written',
    () async {
      final FluxerDatabase db = openTestDatabase();
      final _RecordingAdapter adapter = _RecordingAdapter();
      await db.userDao.upsertUser(
        UsersCompanion.insert(
          id: 'user-1',
          username: 'alice',
          globalName: const Value('Global Alice'),
        ),
      );

      await db.userDao.watchUserById('user-1').first;

      final GuildMemberHydrationService service = GuildMemberHydrationService(
        database: db,
        client: _clientWithAdapter(adapter),
        chunkWaiter: GuildMemberChunkWaiter(),
        readGateway: () => null,
      );

      final ProviderContainer container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(db),
          guildMemberHydrationServiceProvider.overrideWithValue(service),
        ],
      );
      addTearDown(container.dispose);

      final List<String?> names = <String?>[];
      final ProviderSubscription<AsyncValue<GuildUserDisplay?>> sub = container
          .listen(
            guildUserDisplayProvider(('user-1', 'guild-1')),
            (
              AsyncValue<GuildUserDisplay?>? previous,
              AsyncValue<GuildUserDisplay?> next,
            ) => names.add(next.value?.displayName),
            fireImmediately: true,
          );
      addTearDown(sub.close);

      await service.hydrateMembers(
        guildId: 'guild-1',
        userIds: <String>['user-1'],
      );
      await pumpEventQueue();

      expect(names.last, 'Guild Alice');
    },
  );
}
