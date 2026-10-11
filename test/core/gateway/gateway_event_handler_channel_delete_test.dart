import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/gateway_event_handler.dart';
import 'package:fluxer_dart/gateway_client/event_parser.dart';

import '../../helpers/open_test_database.dart';

const String _guildId = '1558633981610557440';
const String _channelId = '1558633981610557445';

Map<String, Object?> _channelJson() => <String, Object?>{
  'content_warning_level': 0,
  'content_warning_text': null,
  'guild_id': _guildId,
  'id': _channelId,
  'last_message_id': null,
  'last_pin_timestamp': null,
  'name': 'second',
  'nsfw': false,
  'nsfw_override': null,
  'parent_id': null,
  'permission_overwrites': <Object?>[],
  'position': 2,
  'rate_limit_per_user': 0,
  'topic': null,
  'type': 0,
};

Future<Channel?> _waitForChannel(
  FluxerDatabase database, {
  required bool present,
}) async {
  for (int i = 0; i < 50; i++) {
    final Channel? channel = await database.channelDao.getChannelById(
      _channelId,
    );
    if ((channel != null) == present) {
      return channel;
    }
    await Future<void>.delayed(const Duration(milliseconds: 10));
  }
  return database.channelDao.getChannelById(_channelId);
}

void main() {
  late FluxerDatabase database;
  late GatewayEventHandler handler;
  const EventParser parser = EventParser();

  setUp(() {
    database = openTestDatabase();
    handler = GatewayEventHandler(database: database, currentUserId: '100');
  });

  tearDown(() => database.close());

  test(
    'CHANNEL_DELETE sent when view is revoked removes the channel',
    () async {
      await handler.handle(parser.parse('CHANNEL_CREATE', _channelJson()));
      expect(await _waitForChannel(database, present: true), isNotNull);

      await handler.handle(
        parser.parse('CHANNEL_DELETE', <String, Object?>{
          'guild_id': _guildId,
          'id': _channelId,
        }),
      );

      expect(await _waitForChannel(database, present: false), isNull);
    },
  );

  test('CHANNEL_DELETE notifies only once the channel row is gone', () async {
    final List<Future<Channel?>> rowsAtNotify = <Future<Channel?>>[];
    final GatewayEventHandler notifyingHandler = GatewayEventHandler(
      database: database,
      currentUserId: '100',
      onChannelDelete: (String channelId) =>
          rowsAtNotify.add(database.channelDao.getChannelById(channelId)),
    );
    await notifyingHandler.handle(
      parser.parse('CHANNEL_CREATE', _channelJson()),
    );
    expect(await _waitForChannel(database, present: true), isNotNull);

    await notifyingHandler.handle(
      parser.parse('CHANNEL_DELETE', <String, Object?>{
        'guild_id': _guildId,
        'id': _channelId,
      }),
    );
    await _waitForChannel(database, present: false);
    await Future<void>.delayed(const Duration(milliseconds: 20));

    expect(rowsAtNotify, hasLength(1));
    expect(await rowsAtNotify.single, isNull);
  });
}
