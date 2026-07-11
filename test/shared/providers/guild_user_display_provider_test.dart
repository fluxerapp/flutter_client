import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_dart/export.dart';

import '../../helpers/open_test_database.dart';

const String _guildMemberResponseJson = '''
{
  "user": {
    "id": "user-1",
    "username": "alice",
    "discriminator": "0000",
    "global_name": null,
    "avatar": null,
    "avatar_color": null,
    "flags": 0
  },
  "roles": [],
  "joined_at": "2026-01-01T00:00:00.000Z",
  "mute": false,
  "deaf": false
}
''';

class _ControlledGuildMemberAdapter implements HttpClientAdapter {
  final Completer<void> requestStarted = Completer<void>();
  final Completer<ResponseBody> _response = Completer<ResponseBody>();

  int requestCount = 0;
  RequestOptions? lastRequest;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) {
    requestCount++;
    lastRequest = options;
    if (!requestStarted.isCompleted) {
      requestStarted.complete();
    }
    return _response.future;
  }

  void completeRequest() {
    if (_response.isCompleted) {
      return;
    }
    _response.complete(
      ResponseBody.fromString(
        _guildMemberResponseJson,
        200,
        statusMessage: 'OK',
        headers: <String, List<String>>{
          Headers.contentTypeHeader: <String>[Headers.jsonContentType],
        },
      ),
    );
  }

  @override
  void close({bool force = false}) {}
}

FluxerClient _clientWithAdapter(_ControlledGuildMemberAdapter adapter) {
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://test.fluxer.invalid/v1'))
    ..httpClientAdapter = adapter;
  addTearDown(dio.close);
  return FluxerClient(dio);
}

void main() {
  test(
    'guildUserDisplayProvider does not touch ref after dispose mid-fetch',
    () async {
      final db = openTestDatabase();
      final adapter = _ControlledGuildMemberAdapter();
      final errors = <Object>[];

      final zoneCompleted = Completer<void>();
      final Future<void> zoneFuture = runZonedGuarded<Future<void>>(() async {
        final container = ProviderContainer(
          overrides: [
            fluxerDatabaseProvider.overrideWithValue(db),
            fluxerClientProvider.overrideWithValue(_clientWithAdapter(adapter)),
          ],
        );
        try {
          final initial = container.read(
            guildUserDisplayProvider(('user-1', 'guild-1')),
          );
          expect(initial.isLoading, isTrue);
          await adapter.requestStarted.future;
          expect(
            adapter.lastRequest?.uri.path,
            '/v1/guilds/guild-1/members/user-1',
          );

          final memberCached = db.memberDao
              .watchMemberByUserId('user-1', 'guild-1')
              .firstWhere((member) => member != null)
              .timeout(const Duration(seconds: 5));
          container.dispose();
          adapter.completeRequest();
          await memberCached;
          await pumpEventQueue();
        } finally {
          adapter.completeRequest();
          container.dispose();
          zoneCompleted.complete();
        }
      }, (error, _) => errors.add(error))!;
      unawaited(zoneFuture);
      await zoneCompleted.future;

      expect(adapter.requestCount, 1);
      expect(errors, isEmpty);
    },
  );

  test(
    'guildUserDisplayProvider scopes in-flight fetches to each container',
    () async {
      final db = openTestDatabase();
      final firstAdapter = _ControlledGuildMemberAdapter();
      final secondAdapter = _ControlledGuildMemberAdapter();
      final firstContainer = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(db),
          fluxerClientProvider.overrideWithValue(
            _clientWithAdapter(firstAdapter),
          ),
        ],
      );
      final secondContainer = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(db),
          fluxerClientProvider.overrideWithValue(
            _clientWithAdapter(secondAdapter),
          ),
        ],
      );

      try {
        firstContainer.read(guildUserDisplayProvider(('user-1', 'guild-1')));
        await firstAdapter.requestStarted.future;

        secondContainer.read(guildUserDisplayProvider(('user-1', 'guild-1')));
        await pumpEventQueue();
        expect(secondAdapter.requestCount, 1);

        firstContainer.read(guildUserDisplayProvider(('user-1', 'guild-1')));
        expect(firstAdapter.requestCount, 1);

        final memberCached = db.memberDao
            .watchMemberByUserId('user-1', 'guild-1')
            .firstWhere((member) => member != null)
            .timeout(const Duration(seconds: 5));
        firstAdapter.completeRequest();
        secondAdapter.completeRequest();
        await memberCached;
      } finally {
        firstAdapter.completeRequest();
        secondAdapter.completeRequest();
        firstContainer.dispose();
        secondContainer.dispose();
        await pumpEventQueue();
      }
    },
  );

  test('guildUserDisplayProvider re-emits when the watched user row '
      'changes', () async {
    final db = openTestDatabase();
    await db.userDao.upsertUser(
      UsersCompanion.insert(id: 'user-1', username: 'alice'),
    );

    final container = ProviderContainer(
      overrides: [fluxerDatabaseProvider.overrideWithValue(db)],
    );
    addTearDown(container.dispose);

    final names = <String?>[];
    final sub = container.listen(
      guildUserDisplayProvider(('user-1', null)),
      (previous, next) => names.add(next.value?.displayName),
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
    final db = openTestDatabase();
    await db.userDao.upsertUser(
      UsersCompanion.insert(id: 'user-1', username: 'alice'),
    );

    final container = ProviderContainer(
      overrides: [fluxerDatabaseProvider.overrideWithValue(db)],
    );
    addTearDown(container.dispose);

    var notifyCount = 0;
    final sub = container.listen(
      guildUserDisplayProvider(('user-1', null)),
      (previous, next) => notifyCount++,
    );
    addTearDown(sub.close);

    // Let the watched stream settle to its first data emission.
    await pumpEventQueue();
    final initial = container.read(guildUserDisplayProvider(('user-1', null)));
    expect(initial.value?.displayName, 'alice');
    final baseline = notifyCount;

    // A presence-only write changes the user row but no display field, so the
    // recomputed GuildUserDisplay is value-equal and must not notify.
    await db.userDao.updateUserPresence('user-1', status: 'idle');
    await pumpEventQueue();
    expect(
      notifyCount,
      baseline,
      reason: 'presence-only change should be deduped by value equality',
    );

    // A real display-field change (username -> displayName) must propagate.
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
}
