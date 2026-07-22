import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/features/members/providers/guild_member_chunk_waiter.dart';
import 'package:fluxer_app/shared/services/guild_member_hydration_service.dart';
import 'package:fluxer_dart/export.dart';

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
}

class _FailAdapter implements HttpClientAdapter {
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
      response: Response<dynamic>(requestOptions: options, statusCode: 404),
      type: DioExceptionType.badResponse,
    );
  }

  @override
  void close({bool force = false}) {}
}
