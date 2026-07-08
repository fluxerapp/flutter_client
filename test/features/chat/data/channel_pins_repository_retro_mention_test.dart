import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/features/chat/data/channel_pins_repository.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';

import '../../../helpers/open_test_database.dart';

String _snowflakeForUtc(DateTime utc) {
  final int internal = (utc.millisecondsSinceEpoch - kSnowflakeEpochMs) << 22;
  return internal.toString();
}

Map<String, Object?> _pinJson({
  required String id,
  required String channelId,
  required bool mentionEveryone,
}) => <String, Object?>{
  'message': <String, Object?>{
    'id': id,
    'channel_id': channelId,
    'author': <String, Object?>{
      'id': 'other',
      'username': 'someone',
      'discriminator': '0001',
      'global_name': null,
      'avatar': null,
      'avatar_color': null,
      'flags': 0,
    },
    'type': 0,
    'flags': 0,
    'content': 'message $id',
    'timestamp': dateTimeFromUserSnowflakeOrNull(id)!.toIso8601String(),
    'pinned': true,
    'mention_everyone': mentionEveryone,
    'tts': false,
    'mentions': <Object?>[],
    'mention_roles': <Object?>[],
  },
  'pinned_at': DateTime.utc(2026, 5, 6, 13).toIso8601String(),
};

class _PinAdapter implements HttpClientAdapter {
  _PinAdapter(this.pins);
  final List<Map<String, Object?>> pins;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    return ResponseBody.fromString(
      jsonEncode(<String, Object?>{'items': pins, 'has_more': false}),
      200,
      headers: {
        Headers.contentTypeHeader: ['application/json'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  test(
    'listPinnedMessages refreshes mentionCount when pins contain a mention',
    () async {
      final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 10));
      final mentionId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      final db = openTestDatabase();
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(ackId),
          mentionCount: const Value(0),
          stickyUnreadMessageId: const Value('sticky-1'),
          manual: const Value(true),
        ),
      );
      final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
        ..httpClientAdapter = _PinAdapter([
          _pinJson(
            id: mentionId,
            channelId: 'channel-1',
            mentionEveryone: true,
          ),
        ]);
      final repo = ChannelPinsRepository(FluxerClient(dio), db, 'me');

      await repo.listPinnedMessages(channelId: 'channel-1');

      final readState = await db.readStateDao.getReadState('channel-1');
      expect(readState?.mentionCount, 1);
      expect(readState?.stickyUnreadMessageId, 'sticky-1');
      expect(readState?.manual, isTrue);
      expect(readState?.lastMessageId, ackId);
    },
  );

  test(
    'listPinnedMessages does not touch readState when no pinned mention',
    () async {
      final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 10));
      final pinId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      final db = openTestDatabase();
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(ackId),
          mentionCount: const Value(0),
        ),
      );
      final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
        ..httpClientAdapter = _PinAdapter([
          _pinJson(id: pinId, channelId: 'channel-1', mentionEveryone: false),
        ]);
      final repo = ChannelPinsRepository(FluxerClient(dio), db, 'me');

      await repo.listPinnedMessages(channelId: 'channel-1');

      final readState = await db.readStateDao.getReadState('channel-1');
      expect(readState?.mentionCount, 0);
    },
  );
}
