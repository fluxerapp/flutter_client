import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/guild_ownership_warning_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  const Guild ownedGuild = Guild(
    id: 'guild-1',
    name: 'My Community',
    ownerId: 'user-1',
  );

  Widget wrap(Widget child) {
    final colorTheme = buildDarkColorTheme();
    return MaterialApp(
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      home: Scaffold(body: child),
    );
  }

  testWidgets('shows owned community names and transfer instructions', (
    tester,
  ) async {
    await tester.pumpWidget(
      wrap(const GuildOwnershipWarningSheet(ownedGuilds: [ownedGuild])),
    );
    await tester.pumpAndSettle();

    expect(find.text('My Community'), findsOneWidget);
    expect(
      find.textContaining(
        'You cannot delete your account while you own communities',
      ),
      findsOneWidget,
    );
    expect(find.textContaining('Community Settings > General'), findsOneWidget);
  });

  testWidgets('shows remaining count when more than 3 communities owned', (
    tester,
  ) async {
    final List<Guild> guilds = List<Guild>.generate(
      5,
      (int index) => Guild(
        id: 'guild-$index',
        name: 'Community $index',
        ownerId: 'user-1',
      ),
    );

    await tester.pumpWidget(
      wrap(GuildOwnershipWarningSheet(ownedGuilds: guilds)),
    );
    await tester.pumpAndSettle();

    expect(find.text('Community 0'), findsOneWidget);
    expect(find.text('Community 2'), findsOneWidget);
    expect(find.text('Community 3'), findsNothing);
    expect(find.textContaining('and 2 more'), findsOneWidget);
  });
}
