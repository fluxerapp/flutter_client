import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/threads/data/threads_repository.dart';
import 'package:fluxer_dart/export.dart' show FluxerClient;

import '../../helpers/open_test_database.dart';

class _JsonAdapter implements HttpClientAdapter {
  _JsonAdapter(this.body);

  final Map<String, Object?> body;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<List<int>>? requestStream,
    Future<void>? cancelFuture,
  ) async => ResponseBody.fromString(
    jsonEncode(body),
    200,
    headers: <String, List<String>>{
      Headers.contentTypeHeader: <String>[Headers.jsonContentType],
    },
  );

  @override
  void close({bool force = false}) {}
}

Map<String, Object?> _archivedThread(String id) => <String, Object?>{
  'id': id,
  'type': 11,
  'guild_id': 'g1',
  'parent_id': 'c1',
  'owner_id': 'owner',
  'name': 'thread $id',
  'last_message_id': '9$id',
  'last_pin_timestamp': null,
  'rate_limit_per_user': 0,
  'flags': 0,
  'thread_metadata': <String, Object?>{
    'archived': true,
    'auto_archive_duration': 1440,
    'archive_timestamp': '2026-10-01T00:00:00.000Z',
    'locked': false,
    'create_timestamp': '2026-09-30T00:00:00.000Z',
  },
  'message_count': 3,
  'total_message_sent': 3,
  'member_count': 2,
};

void main() {
  test(
    'an archived page stores its threads with tails and the own membership',
    () async {
      final db.FluxerDatabase database = openTestDatabase();
      final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.test'))
        ..httpClientAdapter = _JsonAdapter(<String, Object?>{
          'threads': <Object?>[_archivedThread('t1'), _archivedThread('t2')],
          'members': <Object?>[
            <String, Object?>{
              'id': 't2',
              'user_id': 'me',
              'join_timestamp': '2026-09-30T01:00:00.000Z',
              'flags': 2,
              'muted': false,
              'mute_config': null,
            },
          ],
          'has_more': true,
        });
      final ThreadsRepository repository = ThreadsRepository(
        FluxerClient(dio),
        database,
      );

      final ArchivedThreadPage page = await repository.listArchived(
        guildId: 'g1',
        parentId: 'c1',
        scope: ArchivedThreadScope.public,
      );

      expect(page.hasMore, isTrue);
      expect(
        <String>[for (final Channel t in page.threads) t.id],
        <String>['t1', 't2'],
      );
      expect(page.threads.first.threadArchived, isTrue);
      final db.Channel? stored = await database.channelDao.getChannelById('t2');
      expect(stored?.lastMessageId, '9t2');
      expect(stored?.threadArchived, isTrue);
      expect(await database.threadDao.getMember('t1'), isNull);
      expect((await database.threadDao.getMember('t2'))?.flags, 2);
    },
  );
}
