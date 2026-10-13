import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/utils/discord_template_parser.dart';
import 'package:fluxer_dart/export.dart';

Map<String, Object?> _validTemplateJson({
  String code = 'abcd1234',
  String name = 'Gaming Hub',
  String guildName = 'Gaming',
  List<Map<String, Object?>>? roles,
  List<Map<String, Object?>>? channels,
}) {
  return <String, Object?>{
    'code': code,
    'name': name,
    'serialized_source_guild': <String, Object?>{
      'name': guildName,
      'roles':
          roles ??
          <Map<String, Object?>>[
            <String, Object?>{'id': '0', 'name': '@everyone'},
            <String, Object?>{'id': '1', 'name': 'Mods'},
          ],
      'channels':
          channels ??
          <Map<String, Object?>>[
            <String, Object?>{
              'id': '1',
              'type': 0,
              'name': 'general',
              'position': 0,
            },
            <String, Object?>{
              'id': '2',
              'type': 2,
              'name': 'voice',
              'position': 1,
            },
            <String, Object?>{
              'id': '3',
              'type': 4,
              'name': 'cat',
              'position': 2,
            },
            <String, Object?>{
              'id': '4',
              'type': 5,
              'name': 'announcements',
              'position': 3,
            },
            <String, Object?>{
              'id': '5',
              'type': 13,
              'name': 'stage',
              'position': 4,
            },
            <String, Object?>{
              'id': '6',
              'type': 15,
              'name': 'forum',
              'position': 5,
            },
          ],
    },
  };
}

void main() {
  group('parseTemplateCode', () {
    test('parses discord.new URLs', () {
      expect(parseTemplateCode('https://discord.new/abcd1234'), 'abcd1234');
    });

    test('parses Discord API template URLs', () {
      expect(
        parseTemplateCode('https://discord.com/api/guilds/templates/xyz987'),
        'xyz987',
      );
    });

    test('parses discord.com/template URLs', () {
      expect(
        parseTemplateCode('https://discord.com/template/xyz987'),
        'xyz987',
      );
    });

    test('parses a bare alphanumeric code', () {
      expect(parseTemplateCode('abcd1234'), 'abcd1234');
    });

    test('returns null for empty or invalid input', () {
      expect(parseTemplateCode(''), isNull);
      expect(parseTemplateCode('   '), isNull);
      expect(parseTemplateCode('https://example.com/abcd'), isNull);
      expect(parseTemplateCode('not a code!'), isNull);
    });
  });

  group('isTemplateEveryoneRole', () {
    test('matches a role named @everyone whatever its id', () {
      expect(
        isTemplateEveryoneRole(
          TemplateRole(
            id: '7',
            name: const JsonNullable<String>.of('@everyone'),
          ),
        ),
        isTrue,
      );
    });

    test('matches the role with id 0 whatever its name', () {
      expect(
        isTemplateEveryoneRole(
          TemplateRole(id: '0', name: const JsonNullable<String>.of('Members')),
        ),
        isTrue,
      );
      expect(isTemplateEveryoneRole(TemplateRole(id: '0')), isTrue);
    });

    test('does not match other roles', () {
      expect(
        isTemplateEveryoneRole(
          TemplateRole(id: '7', name: const JsonNullable<String>.of('Mods')),
        ),
        isFalse,
      );
      expect(isTemplateEveryoneRole(TemplateRole(id: '7')), isFalse);
    });
  });

  group('parseDiscordGuildTemplate', () {
    test('parses a valid Discord template payload', () {
      final DiscordGuildTemplate? parsed = parseDiscordGuildTemplate(
        _validTemplateJson(),
      );
      expect(parsed, isNotNull);
      expect(parsed!.name, 'Gaming Hub');
      expect(parsed.sourceGuild.name, 'Gaming');
      expect(parsed.stats.textChannelCount, 2);
      expect(parsed.stats.voiceChannelCount, 2);
      expect(parsed.stats.categoryCount, 1);
      expect(parsed.stats.roleCount, 1);
    });

    test('counts the role with id 0 as everyone whatever its name', () {
      final DiscordGuildTemplate? parsed = parseDiscordGuildTemplate(
        _validTemplateJson(
          roles: <Map<String, Object?>>[
            <String, Object?>{'id': '0', 'name': 'Members'},
            <String, Object?>{'id': '8', 'name': 'Mods'},
            <String, Object?>{'id': '9', 'name': 'Helpers'},
          ],
        ),
      );
      expect(parsed!.stats.roleCount, 2);
    });

    test('returns null when required fields are missing', () {
      expect(parseDiscordGuildTemplate(<String, Object?>{}), isNull);
      expect(
        parseDiscordGuildTemplate(<String, Object?>{
          'code': 'abc',
          'name': 'Template',
        }),
        isNull,
      );
      expect(
        parseDiscordGuildTemplate(<String, Object?>{
          'message': 'Unknown server template',
          'code': 10057,
        }),
        isNull,
      );
    });

    test('returns null when channels are malformed', () {
      expect(
        parseDiscordGuildTemplate(
          _validTemplateJson(
            channels: <Map<String, Object?>>[
              <String, Object?>{'id': 1, 'name': 'general'},
            ],
          ),
        ),
        isNull,
      );
    });

    test('parses Discord numeric entity ids', () {
      final DiscordGuildTemplate? parsed = parseDiscordGuildTemplate(
        <String, Object?>{
          'code': 'abcd1234',
          'name': 'Gaming Hub',
          'serialized_source_guild': <String, Object?>{
            'name': 'Gaming',
            'roles': <Map<String, Object?>>[
              <String, Object?>{'id': 0, 'name': '@everyone'},
            ],
            'channels': <Map<String, Object?>>[
              <String, Object?>{
                'id': 1,
                'type': 0,
                'name': 'general',
                'position': 0,
                'permission_overwrites': <Map<String, Object?>>[
                  <String, Object?>{
                    'id': 2,
                    'type': 0,
                    'allow': '1024',
                    'deny': '0',
                  },
                ],
              },
            ],
          },
        },
      );
      expect(parsed, isNotNull);
    });
    test(
      'keeps names, parents, roles and overwrites in the create request',
      () {
        final DiscordGuildTemplate? parsed = parseDiscordGuildTemplate(
          <String, Object?>{
            'code': 'hgM48av5Q69A',
            'name': 'Friends & Family',
            'serialized_source_guild': <String, Object?>{
              'name': 'Friends & Family',
              'description': null,
              'system_channel_id': 2,
              'roles': <Map<String, Object?>>[
                <String, Object?>{
                  'id': 0,
                  'name': '@everyone',
                  'permissions': 104324689,
                  'permissions_new': '2248329584434769',
                  'unicode_emoji': null,
                },
                <String, Object?>{
                  'id': 3,
                  'name': 'Mods',
                  'permissions': 8192,
                  'permissions_new': '8192',
                  'color': 14988288,
                  'hoist': true,
                  'unicode_emoji': null,
                },
              ],
              'channels': <Map<String, Object?>>[
                <String, Object?>{
                  'id': 1,
                  'type': 4,
                  'name': 'Text Channels',
                  'position': 0,
                  'parent_id': null,
                  'topic': null,
                  'permission_overwrites': <Map<String, Object?>>[],
                },
                <String, Object?>{
                  'id': 2,
                  'type': 0,
                  'name': 'general',
                  'position': 0,
                  'parent_id': 1,
                  'topic': 'Say hi',
                  'permission_overwrites': <Map<String, Object?>>[
                    <String, Object?>{
                      'id': 0,
                      'type': 'role',
                      'allow': 0,
                      'deny': 2048,
                      'allow_new': '0',
                      'deny_new': '2048',
                    },
                    <String, Object?>{
                      'id': 3,
                      'type': 'role',
                      'allow': 2048,
                      'deny': 0,
                    },
                  ],
                },
                <String, Object?>{
                  'id': 5,
                  'type': 2,
                  'name': 'Lounge',
                  'position': 1,
                  'parent_id': null,
                  'bitrate': 64000,
                  'user_limit': 0,
                },
              ],
            },
          },
        );

        final Map<String, Object?> body =
            jsonDecode(
                  jsonEncode(
                    GuildCreateRequest(
                      name: 'Friends & Family',
                      template: parsed!.sourceGuild,
                    ).toJson(),
                  ),
                )
                as Map<String, Object?>;
        final Map<String, Object?> template =
            body['template']! as Map<String, Object?>;
        final List<Map<String, Object?>> roles =
            (template['roles']! as List<Object?>).cast<Map<String, Object?>>();
        final List<Map<String, Object?>> channels =
            (template['channels']! as List<Object?>)
                .cast<Map<String, Object?>>();

        expect(template['system_channel_id'], '2');
        expect(roles.map((Map<String, Object?> role) => role['name']), <String>[
          '@everyone',
          'Mods',
        ]);
        expect(roles[0]['permissions_new'], '2248329584434769');
        expect(roles[1]['permissions'], '8192');
        expect(roles[1]['color'], 14988288);
        expect(
          channels.map((Map<String, Object?> channel) => channel['name']),
          <String>['Text Channels', 'general', 'Lounge'],
        );
        expect(channels[0]['parent_id'], isNull);
        expect(channels[1]['parent_id'], '1');
        expect(channels[1]['topic'], 'Say hi');
        expect(channels[2]['parent_id'], isNull);
        expect(channels[2]['bitrate'], 64000);
        expect(channels[1]['permission_overwrites'], <Map<String, Object?>>[
          <String, Object?>{
            'id': '0',
            'type': '0',
            'allow': '0',
            'deny': '2048',
          },
          <String, Object?>{
            'id': '3',
            'type': '0',
            'allow': '2048',
            'deny': '0',
          },
        ]);
      },
    );
  });
}
