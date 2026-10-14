import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_bottom_sheet_stats.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../helpers/test_l10n.dart';

class _FakeGuilds extends GuildListViewModel {
  _FakeGuilds(this._guilds);
  final List<Guild> _guilds;
  @override
  GuildListViewState build() => GuildListViewState(guilds: _guilds);
}

Future<void> _pump(WidgetTester tester, Guild guild) async {
  final colorTheme = buildDarkColorTheme();
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        guildListViewModelProvider.overrideWith(() => _FakeGuilds([guild])),
      ],
      child: MaterialApp(
        locale: kTestLocale,
        localizationsDelegates: fluxerLocalizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        home: Scaffold(
          body: GuildBottomSheetStats(guildId: guild.id, fallbackGuild: guild),
        ),
      ),
    ),
  );
  await tester.pump();
}

void main() {
  testWidgets('a single member reads as one member', (tester) async {
    await _pump(
      tester,
      const Guild(
        id: 'g1',
        name: 'Solo',
        ownerId: 'u1',
        memberCount: 1,
        onlineCount: 1,
      ),
    );

    expect(find.text('1 online'), findsOneWidget);
    expect(find.text('1 member'), findsOneWidget);
  });

  testWidgets('larger counts are grouped and pluralised', (tester) async {
    await _pump(
      tester,
      const Guild(
        id: 'g1',
        name: 'Busy',
        ownerId: 'u1',
        memberCount: 1200,
        onlineCount: 3400,
      ),
    );

    expect(find.text('3,400 online'), findsOneWidget);
    expect(find.text('1,200 members'), findsOneWidget);
  });
}
