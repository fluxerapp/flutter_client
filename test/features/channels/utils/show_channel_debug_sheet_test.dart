import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show FluxerDatabase;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/utils/show_channel_debug_sheet.dart';
import 'package:material_ui/material_ui.dart';

import '../../../helpers/open_test_database.dart';
import '../../../helpers/test_l10n.dart';

void main() {
  Future<String> openDebugSheet(
    WidgetTester tester, {
    required String channelId,
    required Future<void> Function(FluxerDatabase db) seed,
  }) async {
    final db = openTestDatabase();
    await seed(db);

    final colorTheme = buildDarkColorTheme();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [fluxerDatabaseProvider.overrideWithValue(db)],
        child: MaterialApp(
          locale: kTestLocale,
          localizationsDelegates: FluxerLocalizations.localizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          theme: buildFluxerTheme(
            colorTheme: colorTheme,
            textTheme: FluxerTextTheme.fromColors(colorTheme),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          home: Consumer(
            builder: (context, ref, _) => Scaffold(
              body: Center(
                child: TextButton(
                  onPressed: () => showChannelDebugSheet(
                    context,
                    ref: ref,
                    channelId: channelId,
                    title: 'Channel Debug',
                  ),
                  child: const Text('open'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    return tester.widget<HighlightView>(find.byType(HighlightView)).source;
  }

  testWidgets('renders the voice channel record as wire-format JSON', (
    tester,
  ) async {
    final json = await openDebugSheet(
      tester,
      channelId: 'voice-1',
      seed: (db) => db.channelDao.upsertChannels([
        const Channel(
          id: 'voice-1',
          guildId: 'g1',
          name: 'voice-room',
          type: ChannelType.guildVoice,
          userLimit: 5,
        ).toCompanion(),
      ]),
    );

    expect(json, contains('"id": "voice-1"'));
    expect(json, contains('"guild_id": "g1"'));
    expect(json, contains('"type": ${ChannelType.guildVoice.wireValue}'));
    expect(json, contains('"user_limit": 5'));
    expect(json, isNot(contains('guildId')));
  });

  testWidgets('renders the link channel record as wire-format JSON', (
    tester,
  ) async {
    final json = await openDebugSheet(
      tester,
      channelId: 'link-1',
      seed: (db) => db.channelDao.upsertChannels([
        const Channel(
          id: 'link-1',
          guildId: 'g1',
          name: 'link-out',
          url: 'https://example.com',
          type: ChannelType.guildLink,
        ).toCompanion(),
      ]),
    );

    expect(json, contains('"id": "link-1"'));
    expect(json, contains('"url": "https://example.com"'));
    expect(json, contains('"type": ${ChannelType.guildLink.wireValue}'));
  });
}
