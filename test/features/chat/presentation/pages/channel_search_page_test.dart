import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show FluxerDatabase;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/data/message_search_repository.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/channel_details_sheet.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_details_providers.dart';
import 'package:fluxer_app/features/members/providers/member_list_subscription_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../../helpers/instance_runtime_config_override.dart';
import '../../../../helpers/open_test_database.dart';
import '../../../../helpers/test_l10n.dart';

const String _guildId = 'guild_1';
const String _channelId = 'chan_1';

class _FakeAppearance extends AppearancePreferences {
  @override
  AppearancePreferencesState build() =>
      const AppearancePreferencesState(showFavorites: false);
}

class _SeededSearch extends ChannelSearch {
  @override
  ChannelSearchState build(String channelId, String? guildId) {
    return ChannelSearchState(
      query: MessageSearchQuery(
        channelId: channelId,
        guildId: guildId,
        rawQuery: 'hello',
      ),
      hasSearched: true,
      total: 3,
      results: <MessageSearchResultEntry>[
        for (int i = 0; i < 3; i += 1)
          MessageSearchResultEntry(
            guildId: guildId,
            message: Message(
              id: '100000000000000000$i',
              channelId: channelId,
              authorId: '1000000000000000009',
              authorName: 'Author',
              content: 'hello $i',
              timestamp: DateTime.utc(2024),
            ),
          ),
      ],
    );
  }
}

ProviderContainer _container(
  FluxerDatabase database, {
  bool seedSearch = false,
}) {
  final List<Override> overrides = <Override>[
    instanceRuntimeConfigOverride(),
    fluxerDatabaseProvider.overrideWithValue(database),
    appearancePreferencesProvider.overrideWith(_FakeAppearance.new),
    memberListDetailsSubscriptionProvider(
      _guildId,
      _channelId,
      true,
    ).overrideWith((ref) {}),
    if (seedSearch)
      channelSearchProvider(
        _channelId,
        _guildId,
      ).overrideWith(_SeededSearch.new),
  ];
  return ProviderContainer(overrides: overrides);
}

Widget _host(ProviderContainer container, {required Widget child}) {
  final colorTheme = buildDarkColorTheme();
  return UncontrolledProviderScope(
    container: container,
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(body: child),
    ),
  );
}

Future<void> _openPage(WidgetTester tester, ProviderContainer container) async {
  await tester.pumpWidget(
    _host(
      container,
      child: Builder(
        builder: (BuildContext context) => ElevatedButton(
          onPressed: () => showChannelSearchPage(
            context,
            channelId: _channelId,
            guildId: _guildId,
          ),
          child: const Text('Open'),
        ),
      ),
    ),
  );
  await tester.tap(find.text('Open'));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('search opens as a full page without a sheet handle', (
    tester,
  ) async {
    final FluxerDatabase database = openTestDatabase();
    final ProviderContainer container = _container(database);
    addTearDown(container.dispose);

    await _openPage(tester, container);

    expect(find.byType(ChannelSearchPage), findsOneWidget);
    expect(find.byType(DraggableScrollableSheet), findsNothing);
    expect(find.byType(FluxerBottomSheetDragHandle), findsNothing);

    final FluxerLocalizations l10n = FluxerLocalizations.of(
      tester.element(find.byType(ChannelSearchPage)),
    );
    expect(
      find.widgetWithText(AppBar, l10n.channelDetailsSearchTitle),
      findsOneWidget,
    );
    expect(find.text(l10n.channelDetailsSearchEmptyTitle), findsOneWidget);
  });

  testWidgets('search back button pops the page', (tester) async {
    final FluxerDatabase database = openTestDatabase();
    final ProviderContainer container = _container(database);
    addTearDown(container.dispose);

    await _openPage(tester, container);
    expect(find.byType(ChannelSearchPage), findsOneWidget);

    final FluxerLocalizations l10n = FluxerLocalizations.of(
      tester.element(find.byType(ChannelSearchPage)),
    );
    await tester.tap(find.byTooltip(l10n.back));
    await tester.pumpAndSettle();

    expect(find.byType(ChannelSearchPage), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('search results fill a body list view', (tester) async {
    final FluxerDatabase database = openTestDatabase();
    final ProviderContainer container = _container(database, seedSearch: true);
    addTearDown(container.dispose);

    await _openPage(tester, container);

    expect(find.byType(MessagePreviewTile), findsWidgets);
    expect(find.byType(ListView), findsWidgets);
    expect(find.byType(DraggableScrollableSheet), findsNothing);
  });
}
