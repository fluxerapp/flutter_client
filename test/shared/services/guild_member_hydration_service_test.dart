import 'dart:async';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/features/members/providers/guild_member_chunk_waiter.dart';
import 'package:fluxer_app/shared/services/guild_member_hydration_service.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';

import '../../helpers/open_test_database.dart';

const String _guildMemberResponseJson = '''
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
''';

class _RecordingAdapter implements HttpClientAdapter {
  int requestCount = 0;
  final List<String> requestedPaths = <String>[];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requestCount++;
    requestedPaths.add(options.uri.path);
    return ResponseBody.fromString(
      _guildMemberResponseJson,
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
  return FluxerClient(dio);
}

void main() {
  test('hydrateMembers skips users that already have member rows', () async {
    final FluxerDatabase database = openTestDatabase();
    await database.memberDao.upsertMember(
      MembersCompanion.insert(
        userId: 'cached-user',
        guildId: 'guild-1',
        roleIdsJson: const Value('[]'),
      ),
    );
    final _RecordingAdapter adapter = _RecordingAdapter();
    final GuildMemberHydrationService service = GuildMemberHydrationService(
      database: database,
      client: _clientWithAdapter(adapter),
      chunkWaiter: GuildMemberChunkWaiter(),
      readGateway: () => null,
    );

    await service.hydrateMembers(
      guildId: 'guild-1',
      userIds: <String>['cached-user', 'user-1'],
    );

    expect(adapter.requestCount, 1);
    expect(adapter.requestedPaths.single, '/v1/guilds/guild-1/members/user-1');
    final Member? member = await database.memberDao.getMemberByUserId(
      'user-1',
      'guild-1',
    );
    expect(member?.nick, 'Guild Alice');
  });

  test('hydrateMembers negative-caches failed REST lookups', () async {
    final FluxerDatabase database = openTestDatabase();
    final _FailAdapter adapter = _FailAdapter();
    final GuildMemberHydrationService service = GuildMemberHydrationService(
      database: database,
      client: _clientWithAdapter(adapter),
      chunkWaiter: GuildMemberChunkWaiter(),
      readGateway: () => null,
    );

    await service.hydrateMembers(
      guildId: 'guild-1',
      userIds: <String>['missing-user'],
    );
    await service.hydrateMembers(
      guildId: 'guild-1',
      userIds: <String>['missing-user'],
    );

    expect(adapter.requestCount, 1);
    expect(service.isNonMember('guild-1', 'missing-user'), isTrue);
  });

  test('REST failures other than 404 leave the user unflagged', () async {
    final FluxerDatabase database = openTestDatabase();
    final GuildMemberHydrationService service = GuildMemberHydrationService(
      database: database,
      client: _clientWithAdapter(_FailAdapter(statusCode: 429)),
      chunkWaiter: GuildMemberChunkWaiter(),
      readGateway: () => null,
    );

    await service.hydrateMembers(
      guildId: 'guild-1',
      userIds: <String>['user-1'],
    );

    expect(service.isNonMember('guild-1', 'user-1'), isFalse);
  });

  group('gateway hydration', () {
    test('flags only users missing from the chunk echoing its nonce', () async {
      final FluxerDatabase database = openTestDatabase();
      final GuildMemberChunkWaiter waiter = GuildMemberChunkWaiter();
      final _RecordingAdapter adapter = _RecordingAdapter();
      final _RecordingGateway gateway = _RecordingGateway();
      final List<String> fetched = <String>[];
      final GuildMemberHydrationService service = GuildMemberHydrationService(
        database: database,
        client: _clientWithAdapter(adapter),
        chunkWaiter: waiter,
        readGateway: () => gateway,
      );
      gateway.onRequest = (_RecordedRequest request) async {
        waiter.notifyChunk(
          nonce: 'unrelated',
          chunkCount: 1,
          userIds: const <String>[],
        );
        await database.memberDao.upsertMember(
          MembersCompanion.insert(userId: 'user-1', guildId: 'guild-1'),
        );
        waiter.notifyChunk(
          nonce: request.nonce,
          chunkCount: 1,
          userIds: <String>['user-1'],
        );
      };

      await service.hydrateMembers(
        guildId: 'guild-1',
        userIds: <String>['user-1', 'stranger'],
        onMemberFetched: fetched.add,
      );

      expect(gateway.requests, hasLength(1));
      expect(gateway.requests.single.nonce, isNotEmpty);
      expect(gateway.requests.single.userIds, <String>['user-1', 'stranger']);
      expect(fetched, <String>['user-1']);
      expect(service.isNonMember('guild-1', 'user-1'), isFalse);
      expect(service.isNonMember('guild-1', 'stranger'), isTrue);
      expect(adapter.requestCount, 0);
    });

    test('a dropped request flags nobody and falls back to REST', () async {
      final FluxerDatabase database = openTestDatabase();
      final GuildMemberChunkWaiter waiter = GuildMemberChunkWaiter();
      final _RecordingAdapter adapter = _RecordingAdapter();
      final _RecordingGateway gateway = _RecordingGateway();
      final GuildMemberHydrationService service = GuildMemberHydrationService(
        database: database,
        client: _clientWithAdapter(adapter),
        chunkWaiter: waiter,
        readGateway: () => gateway,
        chunkTimeout: const Duration(milliseconds: 30),
      );
      gateway.onRequest = (_RecordedRequest request) async {
        waiter.notifyChunk(
          nonce: null,
          chunkCount: 1,
          userIds: const <String>[],
        );
      };

      await service.hydrateMembers(
        guildId: 'guild-1',
        userIds: <String>['user-1'],
      );

      expect(gateway.requests, hasLength(1));
      expect(service.isNonMember('guild-1', 'user-1'), isFalse);
      expect(adapter.requestedPaths, <String>[
        '/v1/guilds/guild-1/members/user-1',
      ]);
      expect(
        (await database.memberDao.getMemberByUserId('user-1', 'guild-1'))?.nick,
        'Guild Alice',
      );
    });

    test(
      'a flagged user is looked up again once the flag is cleared',
      () async {
        final FluxerDatabase database = openTestDatabase();
        final _FailAdapter adapter = _FailAdapter();
        final GuildMemberHydrationService service = GuildMemberHydrationService(
          database: database,
          client: _clientWithAdapter(adapter),
          chunkWaiter: GuildMemberChunkWaiter(),
          readGateway: () => null,
        );
        await service.hydrateMembers(
          guildId: 'guild-1',
          userIds: <String>['rejoiner'],
        );
        expect(service.isNonMember('guild-1', 'rejoiner'), isTrue);

        await service.hydrateMembers(
          guildId: 'guild-1',
          userIds: <String>['rejoiner'],
        );
        expect(adapter.requestCount, 1);

        service.clearNonMembers('guild-1', <String>['rejoiner']);
        expect(service.isNonMember('guild-1', 'rejoiner'), isFalse);
        await service.hydrateMembers(
          guildId: 'guild-1',
          userIds: <String>['rejoiner'],
        );

        expect(adapter.requestCount, 2);
      },
    );
  });
}

class _RecordedRequest {
  const _RecordedRequest({required this.userIds, required this.nonce});

  final List<String> userIds;
  final String? nonce;
}

class _RecordingGateway extends GatewayConnection {
  _RecordingGateway() : super(token: 'test', dio: Dio());

  final List<_RecordedRequest> requests = <_RecordedRequest>[];
  Future<void> Function(_RecordedRequest request)? onRequest;

  @override
  GatewayState get state => GatewayState.connected;

  @override
  void requestGuildMembers({
    String? guildId,
    List<String>? guildIds,
    String? query,
    int? limit,
    List<String>? userIds,
    bool? presences,
    String? nonce,
  }) {
    final _RecordedRequest request = _RecordedRequest(
      userIds: userIds ?? const <String>[],
      nonce: nonce,
    );
    requests.add(request);
    unawaited(onRequest?.call(request));
  }
}

class _FailAdapter implements HttpClientAdapter {
  _FailAdapter({this.statusCode = 404});

  final int statusCode;
  int requestCount = 0;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) {
    requestCount++;
    throw DioException(
      requestOptions: options,
      response: Response<dynamic>(
        requestOptions: options,
        statusCode: statusCode,
      ),
      type: DioExceptionType.badResponse,
    );
  }

  @override
  void close({bool force = false}) {}
}
