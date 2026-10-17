import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/sheets/duplicate_channel_sheet.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;

import '../../../helpers/pump_fluxer_app.dart';
import '../../../helpers/test_l10n.dart';

const String _overwrites =
    '[{"id":"g1","type":0,"allow":"0","deny":"1024"},'
    '{"id":"u7","type":1,"allow":"1024","deny":"0"}]';

Map<String, dynamic> _json(ChannelCreateRequest request) =>
    jsonDecode(jsonEncode(request.toJson())) as Map<String, dynamic>;

Future<BuildContext> _pumpHost(WidgetTester tester) async {
  await tester.binding.setSurfaceSize(const Size(390, 844));
  addTearDown(() => tester.binding.setSurfaceSize(null));
  late BuildContext host;
  await tester.pumpWidget(
    pumpFluxerApp(
      child: Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            host = context;
            return const SizedBox.shrink();
          },
        ),
      ),
    ),
  );
  return host;
}

void main() {
  group('buildDuplicateChannelRequest', () {
    test('copies type, category and permission overwrites', () {
      const Channel source = Channel(
        id: 'c1',
        guildId: 'g1',
        name: 'general',
        type: ChannelType.guildAnnouncement,
        topic: 'not copied',
        parentId: 'cat1',
        nsfw: true,
        rateLimitPerUser: 30,
        permissionOverwritesJson: _overwrites,
      );

      final Map<String, dynamic> body = _json(
        buildDuplicateChannelRequest(source, name: 'general-copy'),
      );

      expect(body['name'], 'general-copy');
      expect(body['type'], ChannelType.guildAnnouncement.wireValue);
      expect(body['parent_id'], 'cat1');
      expect(body['permission_overwrites'], <Map<String, dynamic>>[
        <String, dynamic>{'id': 'g1', 'type': 0, 'allow': '0', 'deny': '1024'},
        <String, dynamic>{'id': 'u7', 'type': 1, 'allow': '1024', 'deny': '0'},
      ]);
      expect(body.containsKey('topic'), isFalse);
      expect(body['nsfw'], isNot(isTrue));
      expect(body.containsKey('rate_limit_per_user'), isFalse);
      expect(body.containsKey('bitrate'), isFalse);
    });

    test('copies bitrate and limits from a voice channel', () {
      const Channel source = Channel(
        id: 'v1',
        guildId: 'g1',
        name: 'Lounge',
        type: ChannelType.guildVoice,
        bitrate: 96000,
        userLimit: 12,
        voiceConnectionLimit: 3,
      );

      final Map<String, dynamic> body = _json(
        buildDuplicateChannelRequest(source, name: 'Lounge'),
      );

      expect(body['type'], ChannelType.guildVoice.wireValue);
      expect(body['bitrate'], 96000);
      expect(body['user_limit'], 12);
      expect(body['voice_connection_limit'], 3);
      expect(body['permission_overwrites'], isEmpty);
    });

    test('copies the url of a link channel', () {
      const Channel source = Channel(
        id: 'l1',
        guildId: 'g1',
        name: 'docs',
        type: ChannelType.guildLink,
        url: 'https://fluxer.app/docs',
      );

      final Map<String, dynamic> body = _json(
        buildDuplicateChannelRequest(source, name: 'docs'),
      );

      expect(body['type'], ChannelType.guildLink.wireValue);
      expect(body['url'], 'https://fluxer.app/docs');
    });
  });

  group('DuplicateChannelSheet', () {
    const Channel source = Channel(
      id: 'c1',
      guildId: 'g1',
      name: 'general',
      parentId: 'cat1',
    );

    testWidgets('prefills the name and returns the created channel', (
      WidgetTester tester,
    ) async {
      final BuildContext host = await _pumpHost(tester);
      ChannelCreateRequest? sent;
      const Channel created = Channel(id: 'c2', guildId: 'g1', name: 'copy');

      final Future<Channel?> result = DuplicateChannelSheet.show(
        host,
        channel: source,
        onCreate: (ChannelCreateRequest request) async {
          sent = request;
          return created;
        },
      );
      await pumpFluxerFrames(tester);

      expect(find.text(testL10n.channelMenuDuplicateChannel), findsOneWidget);
      expect(
        find.text(testL10n.channelDuplicateHelper('#general')),
        findsOneWidget,
      );
      expect(
        tester.widget<EditableText>(find.byType(EditableText)).controller.text,
        'general',
      );

      await tester.enterText(find.byType(EditableText), ' copy ');
      await tester.tap(find.text(testL10n.guildNavbarCreateChannel));
      await pumpFluxerFrames(tester);

      expect(await result, same(created));
      expect(_json(sent!)['name'], 'copy');
      expect(_json(sent!)['parent_id'], 'cat1');
    });

    testWidgets('keeps the sheet open and shows the error when it fails', (
      WidgetTester tester,
    ) async {
      final BuildContext host = await _pumpHost(tester);

      final Future<Channel?> result = DuplicateChannelSheet.show(
        host,
        channel: source,
        onCreate: (ChannelCreateRequest _) async => throw DioException(
          requestOptions: RequestOptions(path: '/guilds/g1/channels'),
          response: Response<Map<String, dynamic>>(
            requestOptions: RequestOptions(path: '/guilds/g1/channels'),
            statusCode: 400,
            data: <String, dynamic>{
              'code': 'MAX_GUILD_CHANNELS',
              'message': 'Maximum number of channels reached',
            },
          ),
        ),
      );
      await pumpFluxerFrames(tester);

      await tester.tap(find.text(testL10n.guildNavbarCreateChannel));
      await pumpFluxerFrames(tester);

      expect(find.text('Maximum number of channels reached'), findsOneWidget);
      expect(find.text(testL10n.channelMenuDuplicateChannel), findsOneWidget);

      await tester.tap(find.text(testL10n.cancel));
      await pumpFluxerFrames(tester);
      expect(await result, isNull);
    });

    testWidgets('a voice channel explains which settings carry over', (
      WidgetTester tester,
    ) async {
      final BuildContext host = await _pumpHost(tester);

      final Future<Channel?> result = DuplicateChannelSheet.show(
        host,
        channel: const Channel(
          id: 'v1',
          guildId: 'g1',
          name: 'Lounge',
          type: ChannelType.guildVoice,
        ),
        onCreate: (ChannelCreateRequest _) async => throw UnimplementedError(),
      );
      await pumpFluxerFrames(tester);

      expect(
        find.text(testL10n.channelDuplicateVoiceHelper('#Lounge')),
        findsOneWidget,
      );

      await Navigator.of(host).maybePop();
      await pumpFluxerFrames(tester);
      expect(await result, isNull);
    });
  });
}
