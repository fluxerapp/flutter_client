import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/utils/discord_template_parser.dart';

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
            <String, Object?>{'id': 0, 'name': '@everyone'},
            <String, Object?>{'id': 1, 'name': 'Mods'},
          ],
      'channels':
          channels ??
          <Map<String, Object?>>[
            <String, Object?>{
              'id': 1,
              'type': 0,
              'name': 'general',
              'position': 0,
            },
            <String, Object?>{
              'id': 2,
              'type': 2,
              'name': 'voice',
              'position': 1,
            },
            <String, Object?>{'id': 3, 'type': 4, 'name': 'cat', 'position': 2},
            <String, Object?>{
              'id': 4,
              'type': 5,
              'name': 'announcements',
              'position': 3,
            },
            <String, Object?>{
              'id': 5,
              'type': 13,
              'name': 'stage',
              'position': 4,
            },
            <String, Object?>{
              'id': 6,
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

    test('returns null when required fields are missing', () {
      expect(parseDiscordGuildTemplate(<String, Object?>{}), isNull);
      expect(
        parseDiscordGuildTemplate(<String, Object?>{
          'code': 'abc',
          'name': 'Template',
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
  });
}
