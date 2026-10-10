import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/gateway_event_handler.dart';
import 'package:fluxer_dart/gateway_client/event_parser.dart';

import '../../helpers/open_test_database.dart';

const String _guildId = 'g1';
const String _authorId = '300';

Map<String, Object?> _userJson(String id) => <String, Object?>{
  'id': id,
  'username': 'user-$id',
  'discriminator': '0001',
  'global_name': null,
  'avatar': null,
  'avatar_color': null,
  'flags': 0,
};

Map<String, Object?> _memberJson({required String nick}) => <String, Object?>{
  'nick': nick,
  'roles': <String>['role-1'],
  'joined_at': '2026-01-01T00:00:00.000Z',
  'mute': false,
  'deaf': false,
};

Map<String, Object?> _guildMessageJson({required String nick}) =>
    <String, Object?>{
      'id': 'm1',
      'channel_id': 'c1',
      'guild_id': _guildId,
      'author': _userJson(_authorId),
      'member': _memberJson(nick: nick),
      'type': 0,
      'flags': 0,
      'content': 'hello',
      'timestamp': '2026-10-01T00:00:00.000Z',
      'pinned': false,
      'mention_everyone': false,
      'tts': false,
      'mentions': <Object?>[],
      'mention_roles': <Object?>[],
      'embeds': <Object?>[],
      'attachments': <Object?>[],
      'stickers': <Object?>[],
    };

Map<String, Object?> _reactionJson({required String nick}) => <String, Object?>{
  'channel_id': 'c1',
  'message_id': 'm1',
  'user_id': _authorId,
  'guild_id': _guildId,
  'emoji': <String, Object?>{'name': '👍'},
  'member': <String, Object?>{
    ..._memberJson(nick: nick),
    'user': _userJson(_authorId),
  },
};

Future<Member?> _waitForMember(FluxerDatabase database) async {
  for (int i = 0; i < 50; i++) {
    final Member? member = await database.memberDao.getMemberByUserId(
      _authorId,
      _guildId,
    );
    if (member != null) {
      return member;
    }
    await Future<void>.delayed(const Duration(milliseconds: 10));
  }
  return null;
}

void main() {
  late FluxerDatabase database;
  late GatewayEventHandler handler;
  const EventParser parser = EventParser();

  setUp(() {
    database = openTestDatabase();
    handler = GatewayEventHandler(database: database, currentUserId: '100');
  });

  for (final String eventType in <String>['MESSAGE_CREATE', 'MESSAGE_UPDATE']) {
    test('$eventType stores the embedded author member when missing', () async {
      await handler.handle(
        parser.parse(eventType, _guildMessageJson(nick: 'Monty')),
      );

      final Member? member = await _waitForMember(database);
      expect(member?.nick, 'Monty');
    });
  }

  for (final String eventType in <String>[
    'MESSAGE_REACTION_ADD',
    'MESSAGE_REACTION_REMOVE',
  ]) {
    test(
      '$eventType stores the embedded reactor member when missing',
      () async {
        await handler.handle(
          parser.parse(eventType, _reactionJson(nick: 'Monty')),
        );

        final Member? member = await _waitForMember(database);
        expect(member?.nick, 'Monty');
      },
    );
  }

  test('VOICE_STATE_UPDATE stores the embedded member when missing', () async {
    await handler.handle(
      parser.parse('VOICE_STATE_UPDATE', <String, Object?>{
        'user_id': _authorId,
        'channel_id': 'voice-1',
        'guild_id': _guildId,
        'connection_id': 'conn-1',
        'self_mute': false,
        'self_deaf': false,
        'mute': false,
        'deaf': false,
        'member': <String, Object?>{
          ..._memberJson(nick: 'Monty'),
          'user': _userJson(_authorId),
        },
      }),
    );

    final Member? member = await _waitForMember(database);
    expect(member?.nick, 'Monty');
  });

  test(
    'VOICE_STATE_UPDATE stores the embedded user before the state is applied',
    () async {
      final List<Future<List<User>>> usersAtEmit = <Future<List<User>>>[];
      final GatewayEventHandler voiceHandler = GatewayEventHandler(
        database: database,
        currentUserId: '100',
        onVoiceStateUpdate: (_) {
          usersAtEmit.add(database.userDao.getUsersByIds(<String>[_authorId]));
        },
      );

      await voiceHandler.handle(
        parser.parse('VOICE_STATE_UPDATE', <String, Object?>{
          'guild_id': _guildId,
          'channel_id': 'voice-1',
          'user_id': _authorId,
          'connection_id': 'conn-1',
          'session_id': 'session-1',
          'member': <String, Object?>{
            ..._memberJson(nick: 'Monty'),
            'user': _userJson(_authorId),
          },
          'mute': false,
          'deaf': false,
          'self_mute': false,
          'self_deaf': false,
          'self_video': false,
          'self_stream': false,
          'is_mobile': true,
          'suppress': false,
          'viewer_stream_keys': <String>[],
          'e2ee_capable': false,
          'version': 0,
        }),
      );

      expect(usersAtEmit, hasLength(1));
      final List<User> users = await usersAtEmit.single;
      expect(users.map((User user) => user.id), <String>[_authorId]);
    },
  );

  test('an embedded member never overwrites a cached member', () async {
    await handler.handle(
      parser.parse('MESSAGE_CREATE', _guildMessageJson(nick: 'first')),
    );
    expect((await _waitForMember(database))?.nick, 'first');

    await handler.handle(
      parser.parse('MESSAGE_UPDATE', _guildMessageJson(nick: 'second')),
    );
    await Future<void>.delayed(const Duration(milliseconds: 50));

    expect((await _waitForMember(database))?.nick, 'first');
  });
}
