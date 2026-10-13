import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/data/discord_template_fetcher.dart';
import 'package:fluxer_app/features/guilds/utils/discord_template_parser.dart';

Map<String, Object?> _discordChannel({
  required int id,
  required int type,
  required String name,
  required int position,
  int? parentId,
  List<Map<String, Object?>> overwrites = const <Map<String, Object?>>[],
}) {
  return <String, Object?>{
    'id': id,
    'type': type,
    'name': name,
    'position': position,
    'topic': null,
    'bitrate': 64000,
    'user_limit': 0,
    'nsfw': false,
    'rate_limit_per_user': 0,
    'parent_id': parentId,
    'default_auto_archive_duration': null,
    'permission_overwrites': overwrites,
    'available_tags': <Object?>[],
    'template': '',
    'default_reaction_emoji': null,
    'default_thread_rate_limit_per_user': null,
    'default_sort_order': null,
    'default_forum_layout': null,
    'default_tag_setting': null,
    'icon_emoji': null,
    'theme_color': null,
  };
}

final Map<String, Object?> _discordTemplateResponse = <String, Object?>{
  'code': 'hgM48av5Q69A',
  'name': 'Friends & Family',
  'description': null,
  'usage_count': 69450,
  'creator_id': '268473310986240001',
  'created_at': '2020-04-02T21:10:38+00:00',
  'updated_at': '2020-05-01T17:57:38+00:00',
  'source_guild_id': '678070694164299796',
  'serialized_source_guild': <String, Object?>{
    'name': 'Friends & Family',
    'description': null,
    'region': 'us-west',
    'verification_level': 0,
    'default_message_notifications': 0,
    'explicit_content_filter': 0,
    'preferred_locale': 'en-US',
    'afk_timeout': 300,
    'system_channel_id': 2,
    'system_channel_flags': 0,
    'icon_hash': null,
    'roles': <Map<String, Object?>>[
      <String, Object?>{
        'id': 0,
        'name': '@everyone',
        'permissions': 104324689,
        'permissions_new': '2248329584434769',
        'color': 0,
        'colors': null,
        'hoist': false,
        'mentionable': false,
        'icon': null,
        'unicode_emoji': null,
      },
      <String, Object?>{
        'id': 1,
        'name': 'Mods',
        'permissions': 8,
        'permissions_new': '8',
        'color': 3447003,
        'colors': null,
        'hoist': true,
        'mentionable': true,
        'icon': null,
        'unicode_emoji': null,
      },
    ],
    'channels': <Map<String, Object?>>[
      _discordChannel(id: 1, type: 4, name: 'Text Channels', position: 1),
      _discordChannel(
        id: 2,
        type: 0,
        name: 'general',
        position: 1,
        parentId: 1,
        overwrites: <Map<String, Object?>>[
          <String, Object?>{
            'id': 1,
            'type': 'role',
            'allow': 1024,
            'deny': '0',
          },
        ],
      ),
      _discordChannel(id: 3, type: 4, name: 'Voice Channels', position: 2),
      _discordChannel(id: 4, type: 2, name: 'Lounge', position: 0, parentId: 3),
      _discordChannel(id: 5, type: 13, name: 'Stage', position: 1, parentId: 3),
    ],
  },
  'is_dirty': null,
};

class _RecordingAdapter implements HttpClientAdapter {
  _RecordingAdapter(this.statusCode, this.body);

  final int statusCode;
  final Object body;
  RequestOptions? lastRequest;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    lastRequest = options;
    return ResponseBody.fromString(
      jsonEncode(body),
      statusCode,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>['application/json'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  test('every template URL form resolves to the template API', () {
    const String code = 'hgM48av5Q69A';
    for (final String input in <String>[
      'discord.new/$code',
      'https://discord.new/$code',
      'http://discord.new/$code',
      'https://discord.new/$code/',
      'https://discord.new/$code?ref=share',
      'discord.com/template/$code',
      'https://discord.com/template/$code',
      'https://www.discord.com/template/$code',
      'https://discord.com/template/$code/',
      'https://discord.com/template/$code?utm_source=x#top',
      'https://discord.com/api/guilds/templates/$code',
      code,
      '  $code\n',
    ]) {
      final String? parsed = parseTemplateCode(input);
      expect(parsed, code, reason: input);
      expect(
        discordTemplateApiUrl(parsed!),
        'https://discord.com/api/guilds/templates/$code',
      );
    }
  });

  test('accepts a real Discord template response', () async {
    final _RecordingAdapter adapter = _RecordingAdapter(
      200,
      _discordTemplateResponse,
    );
    final Dio dio = Dio(
      BaseOptions(
        headers: const <String, dynamic>{'Accept': 'application/json'},
      ),
    )..httpClientAdapter = adapter;

    final DiscordGuildTemplate template = await fetchDiscordGuildTemplate(
      code: parseTemplateCode('https://discord.new/hgM48av5Q69A')!,
      dio: dio,
    );

    expect(
      adapter.lastRequest!.uri.toString(),
      'https://discord.com/api/guilds/templates/hgM48av5Q69A',
    );
    expect(template.name, 'Friends & Family');
    expect(template.sourceGuild.name, 'Friends & Family');
    expect(template.stats.textChannelCount, 1);
    expect(template.stats.voiceChannelCount, 2);
    expect(template.stats.categoryCount, 2);
    expect(template.stats.roleCount, 1);
    expect(
      template.sourceGuild.channels[1].permissionOverwrites!.single.type,
      '0',
    );
  });

  test('reports an unknown template as a network failure', () async {
    final Dio dio = Dio()
      ..httpClientAdapter = _RecordingAdapter(404, <String, Object?>{
        'message': 'Unknown Guild Template',
        'code': 10057,
      });

    await expectLater(
      fetchDiscordGuildTemplate(code: 'missing', dio: dio),
      throwsA(
        isA<DiscordTemplateFetchException>().having(
          (DiscordTemplateFetchException e) => e.kind,
          'kind',
          DiscordTemplateFetchFailureKind.network,
        ),
      ),
    );
  });
}
