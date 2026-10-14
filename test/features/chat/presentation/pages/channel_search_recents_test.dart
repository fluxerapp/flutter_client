import 'dart:convert';

import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show FluxerDatabase, UsersCompanion;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/data/channel_search_history_repository.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/channel_details_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/search/channel_search_recent_row.dart';
import 'package:fluxer_app/features/members/providers/member_list_subscription_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/services/guild_member_hydration_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../helpers/instance_runtime_config_override.dart';
import '../../../../helpers/noop_guild_member_hydration_service.dart';
import '../../../../helpers/open_test_database.dart';
import '../../../../helpers/test_l10n.dart';

const String _guildId = 'guild_1';
const String _channelId = 'chan_1';
const String _userId = '1130650140000000000';

class _FakeAppearance extends AppearancePreferences {
  @override
  AppearancePreferencesState build() =>
      const AppearancePreferencesState(showFavorites: false);
}

Future<ProviderContainer> _container(
  WidgetTester tester,
  List<Map<String, dynamic>> history,
) async {
  SharedPreferences.setMockInitialValues(<String, Object>{
    'channel_search_history_v1': jsonEncode(history),
  });
  final FluxerDatabase database = openTestDatabase();
  await tester.runAsync(
    () => database.userDao.upsertUser(
      UsersCompanion.insert(
        id: _userId,
        username: 'hampus',
        globalName: const Value<String?>('Hampus'),
      ),
    ),
  );
  final ProviderContainer container = ProviderContainer(
    overrides: [
      instanceRuntimeConfigOverride(),
      fluxerDatabaseProvider.overrideWithValue(database),
      guildMemberHydrationServiceProvider.overrideWithValue(
        NoopGuildMemberHydrationService(database: database),
      ),
      appearancePreferencesProvider.overrideWith(_FakeAppearance.new),
      memberListDetailsSubscriptionProvider(
        _guildId,
        _channelId,
        true,
      ).overrideWith((ref) {}),
    ],
  );
  await tester.runAsync(
    () => container.read(channelSearchHistoryRepositoryProvider.future),
  );
  return container;
}

Future<void> _open(WidgetTester tester, ProviderContainer container) async {
  final colorTheme = buildDarkColorTheme();
  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: MaterialApp(
        locale: kTestLocale,
        localizationsDelegates: fluxerLocalizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        home: const ChannelSearchPage(channelId: _channelId, guildId: _guildId),
      ),
    ),
  );
  for (int i = 0; i < 10; i++) {
    await tester.runAsync(() => Future<void>.delayed(Duration.zero));
    await tester.pump();
  }
}

Map<String, dynamic> _legacyFilterOnlyEntry() => <String, dynamic>{
  'contextKey': channelSearchContextKey(
    channelId: _channelId,
    guildId: _guildId,
  ),
  'displayText': '',
  'authorId': _userId,
  'scopeIndex': 0,
  'sortIndex': 0,
  'contentTypeIndices': <int>[],
  'timestampMs': 1,
};

void main() {
  testWidgets('a filter-only recent search shows the user name, not the id', (
    tester,
  ) async {
    final ProviderContainer container = await _container(
      tester,
      <Map<String, dynamic>>[_legacyFilterOnlyEntry()],
    );
    addTearDown(container.dispose);

    await _open(tester, container);

    expect(find.byType(ChannelSearchRecentRow), findsOneWidget);
    expect(find.text('from: Hampus'), findsOneWidget);
    expect(find.textContaining(_userId), findsNothing);
    expect(find.textContaining('11306501'), findsNothing);
  });

  testWidgets('removing a recent search drops its row', (tester) async {
    final ProviderContainer container = await _container(
      tester,
      <Map<String, dynamic>>[_legacyFilterOnlyEntry()],
    );
    addTearDown(container.dispose);

    await _open(tester, container);
    final FluxerLocalizations l10n = FluxerLocalizations.of(
      tester.element(find.byType(ChannelSearchPage)),
    );
    await tester.tap(find.bySemanticsLabel(l10n.channelSearchRemoveRecent));
    for (int i = 0; i < 5; i++) {
      await tester.runAsync(() => Future<void>.delayed(Duration.zero));
      await tester.pump();
    }

    expect(find.byType(ChannelSearchRecentRow), findsNothing);
    await tester.pump(const Duration(seconds: 1));
  });
}
