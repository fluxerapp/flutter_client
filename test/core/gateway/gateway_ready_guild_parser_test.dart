import 'dart:isolate';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/gateway/gateway_ready_guild_parser.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:fluxer_dart/gateway_client/event_parser.dart';

Map<String, Object?> _guild(String id, {bool withEmoji = false}) =>
    <String, Object?>{
      'id': id,
      'properties': <String, Object?>{
        'id': id,
        'name': 'Guild $id',
        'owner_id': '100',
        'features': <Object?>[],
      },
      'channels': <Object?>[
        <String, Object?>{'id': '${id}1', 'type': 0, 'guild_id': id},
      ],
      'members': <Object?>[
        <String, Object?>{
          'user': <String, Object?>{'id': '100'},
          'roles': <String>[],
          'joined_at': '2026-01-01T00:00:00.000Z',
          'mute': false,
          'deaf': false,
        },
      ],
      'roles': <Object?>[
        <String, Object?>{
          'id': '${id}9',
          'name': 'Role',
          'color': 0,
          'position': 0,
          'permissions': '0',
          'hoist': false,
          'mentionable': false,
        },
      ],
      'emojis': <Object?>[
        if (withEmoji)
          <String, Object?>{'id': '${id}5', 'name': 'wave', 'animated': false},
      ],
      'stickers': <Object?>[],
      'member_count': 3,
      'online_count': 1,
    };

ReadyEvent _ready() =>
    const EventParser().parse('READY', <String, Object?>{
          'session_id': 'session-1',
          'user': <String, Object?>{'id': '100', 'username': 'me'},
          'users': <Object?>[
            <String, Object?>{'id': '100', 'username': 'me'},
          ],
          'user_settings': <String, Object?>{
            'guild_folders': <Object?>[
              <String, Object?>{
                'id': 1,
                'guild_ids': <String>['20', '10'],
              },
            ],
          },
          'guilds': <Object?>[
            _guild('10', withEmoji: true),
            _guild('20'),
            _guild('30'),
          ],
        })
        as ReadyEvent;

void main() {
  test('builds rows for every READY guild', () {
    final ReadyEvent ready = _ready();
    expect(ready.guilds, hasLength(3));

    final ReadyGuildRows rows = buildReadyGuildRows(ready);

    expect(rows.servers.map((s) => s.id.value), <String>['10', '20', '30']);
    expect(rows.servers.map((s) => s.position.value), <int>[1, 0, 2]);
    expect(rows.channels, hasLength(3));
    expect(rows.roles, hasLength(3));
    expect(rows.members, hasLength(3));
    expect(rows.memberUsers.first.username.value, 'me');
    expect(rows.cachedUsers.single.id.value, '100');
    expect(rows.emojis['10'], hasLength(1));
    expect(rows.emojis['20'], isEmpty);
    expect(rows.channelIdsByGuildId['10'], <String>{'101'});
    expect(rows.roleIdsByGuildId['20'], <String>{'209'});
    expect(rows.joinedThreads.keys, <String>['10', '20', '30']);
  });

  test('rows built on a worker isolate come back intact', () async {
    final ReadyEvent ready = _ready();

    final ReadyGuildRows rows = await Isolate.run(
      () => buildReadyGuildRows(ready),
    );

    expect(rows.servers, hasLength(3));
    expect(rows.members, hasLength(3));
  });

  test('prefers rows prepared by the gateway worker', () {
    final ReadyEvent ready = _ready();
    final ReadyGuildRows prepared = buildReadyGuildRows(ready);

    expect(readyGuildRowsFor(ready.withPrepared(prepared)), same(prepared));
    expect(readyGuildRowsFor(ready).servers, hasLength(3));
  });
}
