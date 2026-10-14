import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart' show Value;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show FluxerDatabase, UsersCompanion;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/accessibility/providers/effective_motion_preferences_provider.dart';
import 'package:fluxer_app/features/chat/data/channel_search_history_repository.dart';
import 'package:fluxer_app/features/chat/data/channel_search_query_parser.dart';
import 'package:fluxer_app/features/chat/data/message_search_repository.dart';
import 'package:fluxer_app/features/chat/domain/channel_search_chip_filters.dart';
import 'package:fluxer_app/features/chat/domain/channel_search_token.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/channel_details_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/search/channel_search_recent_row.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/search/channel_search_suggestions.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/search/channel_search_token_chip.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_details_providers.dart';
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
const String _messageId = '1000000000000000001';

class _FakeAppearance extends AppearancePreferences {
  @override
  AppearancePreferencesState build() =>
      const AppearancePreferencesState(showFavorites: false);
}

final List<MessageSearchQuery> _queries = <MessageSearchQuery>[];

class _RecordingSearch extends ChannelSearch {
  @override
  ChannelSearchState build(String channelId, String? guildId) {
    return ChannelSearchState(
      query: MessageSearchQuery(channelId: channelId, guildId: guildId),
    );
  }

  @override
  Future<void> search({
    MessageSearchQuery? query,
    String? rawQuery,
    String? text,
    ChannelSearchParseHints? hints,
    ChannelSearchParseContext? context,
    MessageSearchScopeFilter? scope,
    MessageSearchSortFilter? sort,
    String? authorId,
    Set<MessageSearchContentFilter>? contentTypes,
    ChannelSearchChipFilters chipFilters = const ChannelSearchChipFilters(),
  }) async {
    final MessageSearchQuery next = query!;
    _queries.add(next);
    if (!next.hasSearchTerms) {
      state = ChannelSearchState(query: next);
      return;
    }
    state = ChannelSearchState(
      query: next,
      hasSearched: true,
      total: 1,
      results: <MessageSearchResultEntry>[
        MessageSearchResultEntry(
          guildId: _guildId,
          message: Message(
            id: _messageId,
            channelId: _channelId,
            authorId: _userId,
            authorName: 'Hampus',
            content: 'fixing this too',
            timestamp: DateTime.utc(2026, 10, 14),
          ),
        ),
      ],
    );
  }
}

Future<ProviderContainer> _container(
  WidgetTester tester, {
  List<Map<String, dynamic>> history = const <Map<String, dynamic>>[],
}) async {
  _queries.clear();
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
      androidAnimatorDurationDisabledProvider.overrideWith(
        (ref) => Stream<bool>.value(false),
      ),
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
      channelSearchProvider(
        _channelId,
        _guildId,
      ).overrideWith(_RecordingSearch.new),
      channelSearchUserSuggestionsProvider.overrideWith(
        (ref, args) => const <ChannelSearchUserSuggestion>[
          ChannelSearchUserSuggestion(
            id: _userId,
            displayName: 'Hampus',
            tag: 'hampus',
          ),
        ],
      ),
    ],
  );
  await tester.runAsync(
    () => container.read(channelSearchHistoryRepositoryProvider.future),
  );
  return container;
}

Future<void> _settle(WidgetTester tester, [int rounds = 8]) async {
  for (int i = 0; i < rounds; i++) {
    await tester.runAsync(() => Future<void>.delayed(Duration.zero));
    await tester.pump(const Duration(milliseconds: 50));
  }
}

Future<Future<ChannelDetailsJumpRequest?>> _open(
  WidgetTester tester,
  ProviderContainer container,
) async {
  late Future<ChannelDetailsJumpRequest?> result;
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
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) => ElevatedButton(
              onPressed: () => result = showChannelSearchPage(
                context,
                channelId: _channelId,
                guildId: _guildId,
              ),
              child: const Text('Open'),
            ),
          ),
        ),
      ),
    ),
  );
  await tester.tap(find.text('Open'));
  await _settle(tester);
  return result;
}

FluxerLocalizations _l10n(WidgetTester tester) =>
    FluxerLocalizations.of(tester.element(find.byType(ChannelSearchPage)));

EditableText _editable(WidgetTester tester) =>
    tester.widget<EditableText>(find.byType(EditableText));

Iterable<ChannelSearchToken> _fieldTokens(WidgetTester tester) => tester
    .widgetList<ChannelSearchTokenChip>(
      find.descendant(
        of: find.byType(ChannelSearchPage),
        matching: find.byType(ChannelSearchTokenChip),
      ),
    )
    .where((ChannelSearchTokenChip chip) => chip.onRemove != null)
    .map((ChannelSearchTokenChip chip) => chip.token);

Future<void> _finish(WidgetTester tester) async {
  await tester.pumpWidget(const SizedBox());
  await tester.pump(const Duration(seconds: 1));
}

Map<String, dynamic> _structuredRecent() => ChannelSearchHistoryEntry.fromQuery(
  contextKey: channelSearchContextKey(channelId: _channelId, guildId: _guildId),
  text: 'release',
  tokens: const <ChannelSearchToken>[
    ChannelSearchToken(
      kind: ChannelSearchTokenKind.from,
      value: _userId,
      label: 'Old name',
    ),
  ],
  scopeIndex: 0,
  sortIndex: 0,
  timestampMs: 1,
).toJson();

void main() {
  testWidgets('an empty focused query shows recents and filter suggestions', (
    tester,
  ) async {
    final ProviderContainer container = await _container(
      tester,
      history: <Map<String, dynamic>>[_structuredRecent()],
    );
    addTearDown(container.dispose);

    await _open(tester, container);
    final FluxerLocalizations l10n = _l10n(tester);

    expect(_editable(tester).focusNode.hasFocus, isTrue);
    expect(_editable(tester).controller.text, isEmpty);
    expect(find.text(l10n.channelHeaderSearchRecentTitle), findsOneWidget);
    expect(find.byType(ChannelSearchRecentRow), findsOneWidget);
    expect(find.text('from: Hampus'), findsOneWidget);
    expect(find.text('from: Old name'), findsNothing);
    expect(find.text('release'), findsOneWidget);
    expect(find.text(l10n.channelSearchFilterFromLabel), findsOneWidget);
    expect(find.text(l10n.channelSearchFilterHasLabel), findsOneWidget);
    await _finish(tester);
  });

  testWidgets('from: lists members and a pick becomes a name chip', (
    tester,
  ) async {
    const MethodChannel pathProvider = MethodChannel(
      'plugins.flutter.io/path_provider',
    );
    final Directory tempDir = Directory.systemTemp.createTempSync('search');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          pathProvider,
          (MethodCall call) async => tempDir.path,
        );
    addTearDown(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(pathProvider, null);
      tempDir.deleteSync(recursive: true);
    });
    final ProviderContainer container = await _container(tester);
    addTearDown(container.dispose);

    await _open(tester, container);
    final FluxerLocalizations l10n = _l10n(tester);

    await tester.tap(find.text(l10n.channelSearchFilterFromLabel));
    await _settle(tester);
    expect(_editable(tester).controller.text, 'from:');
    expect(find.text(l10n.channelHeaderSearchUsersTitle), findsOneWidget);

    await tester.tap(
      find.byKey(const ValueKey<String>('search-user-$_userId')),
    );
    await _settle(tester);

    expect(_editable(tester).controller.text, isEmpty);
    expect(_fieldTokens(tester).single.value, _userId);
    expect(find.text('from: Hampus'), findsOneWidget);
    expect(find.textContaining('11306501'), findsNothing);
    expect(_queries.last.parsed.authorIds, <String>[_userId]);

    await tester.tap(find.byKey(const ValueKey<String>('search-field-clear')));
    await _settle(tester);
    expect(_fieldTokens(tester), isEmpty);
    expect(find.byType(ChannelSearchRecentRow), findsOneWidget);
    expect(find.text('from: Hampus'), findsOneWidget);
    await _finish(tester);
  });

  testWidgets('has: suggests content types and adds the chosen one', (
    tester,
  ) async {
    final ProviderContainer container = await _container(tester);
    addTearDown(container.dispose);

    await _open(tester, container);
    final FluxerLocalizations l10n = _l10n(tester);

    await tester.enterText(find.byType(EditableText), 'cats has:fi');
    await _settle(tester);
    expect(find.text(l10n.channelDetailsSearchContentFile), findsOneWidget);
    expect(find.text(l10n.channelDetailsSearchContentImage), findsNothing);

    await tester.tap(find.text(l10n.channelDetailsSearchContentFile));
    await _settle(tester);

    expect(_editable(tester).controller.text, 'cats');
    expect(
      _fieldTokens(tester).single,
      const ChannelSearchToken(kind: ChannelSearchTokenKind.has, value: 'file'),
    );
    expect(_queries.last.parsed.has, <String>['file']);
    expect(_queries.last.parsed.content, 'cats');
    await _finish(tester);
  });

  testWidgets('chips come off with their x and with backspace', (tester) async {
    final ProviderContainer container = await _container(tester);
    addTearDown(container.dispose);

    await _open(tester, container);
    final FluxerLocalizations l10n = _l10n(tester);

    await tester.enterText(find.byType(EditableText), 'pinned:');
    await _settle(tester);
    await tester.tap(find.text(l10n.channelDetailsSearchPinnedTrue));
    await _settle(tester);
    await tester.enterText(find.byType(EditableText), 'has:image');
    await tester.testTextInput.receiveAction(TextInputAction.search);
    await _settle(tester);
    expect(
      _fieldTokens(tester).map((ChannelSearchToken t) => t.signature),
      <String>['pinned:true', 'has:image'],
    );

    await tester.tap(
      find.byKey(const ValueKey<String>('search-token-remove-has:image')),
    );
    await _settle(tester);
    expect(
      _fieldTokens(tester).map((ChannelSearchToken t) => t.signature),
      <String>['pinned:true'],
    );
    expect(_queries.last.parsed.has, isEmpty);

    await tester.sendKeyEvent(LogicalKeyboardKey.backspace);
    await _settle(tester);
    expect(_fieldTokens(tester), isEmpty);
    expect(_queries.last.hasSearchTerms, isFalse);
    await _finish(tester);
  });

  testWidgets('typing searches after a pause with a skeleton meanwhile', (
    tester,
  ) async {
    final ProviderContainer container = await _container(tester);
    addTearDown(container.dispose);

    await _open(tester, container);
    final int before = _queries.length;

    await tester.enterText(find.byType(EditableText), 'cats');
    await tester.pump();
    expect(
      find.byKey(const ValueKey<String>('search-skeleton')),
      findsOneWidget,
    );
    expect(_queries.length, before);

    await tester.pump(const Duration(milliseconds: 350));
    await _settle(tester);
    expect(_queries.last.parsed.content, 'cats');
    expect(find.byType(MessagePreviewTile), findsOneWidget);
    expect(find.text('Messages (1)'), findsOneWidget);
    await _finish(tester);
  });

  testWidgets('result tabs rerun the search with their filter', (tester) async {
    final ProviderContainer container = await _container(tester);
    addTearDown(container.dispose);

    await _open(tester, container);
    final FluxerLocalizations l10n = _l10n(tester);
    await tester.enterText(find.byType(EditableText), 'cats');
    await tester.pump(const Duration(milliseconds: 350));
    await _settle(tester);

    await tester.tap(find.text(l10n.channelSearchTabFiles));
    await _settle(tester);
    expect(_queries.last.parsed.has, <String>['file']);

    await tester.tap(find.text(l10n.channelSearchTabPins));
    await _settle(tester);
    expect(_queries.last.parsed.has, isEmpty);
    expect(_queries.last.parsed.pinned, isTrue);
    await _finish(tester);
  });

  testWidgets('the field draws one outline and a scope-neutral hint', (
    tester,
  ) async {
    final ProviderContainer container = await _container(tester);
    addTearDown(container.dispose);

    await _open(tester, container);
    final FluxerLocalizations l10n = _l10n(tester);

    final InputDecoration decoration = tester
        .widget<InputDecorator>(
          find.descendant(
            of: find.byType(ChannelSearchPage),
            matching: find.byType(InputDecorator),
          ),
        )
        .decoration;
    expect(decoration.filled, isFalse);
    for (final InputBorder? border in <InputBorder?>[
      decoration.border,
      decoration.enabledBorder,
      decoration.focusedBorder,
    ]) {
      expect(border, InputBorder.none);
    }
    expect(decoration.hintText, l10n.channelDetailsSearchHint);
    await _finish(tester);
  });

  testWidgets('refining a search keeps one recent for it', (tester) async {
    final ProviderContainer container = await _container(
      tester,
      history: <Map<String, dynamic>>[_structuredRecent()],
    );
    addTearDown(container.dispose);

    await _open(tester, container);
    final FluxerLocalizations l10n = _l10n(tester);

    await tester.tap(find.text(l10n.channelSearchFilterFromLabel));
    await _settle(tester);
    await tester.tap(
      find.byKey(const ValueKey<String>('search-user-$_userId')),
    );
    await _settle(tester);
    await tester.enterText(find.byType(EditableText), 'has:link');
    await tester.testTextInput.receiveAction(TextInputAction.search);
    await _settle(tester);

    final List<ChannelSearchHistoryEntry>? saved = await tester.runAsync(
      () async =>
          (await container.read(
            channelSearchHistoryRepositoryProvider.future,
          )).readForContext(
            channelSearchContextKey(channelId: _channelId, guildId: _guildId),
          ),
    );
    expect(
      saved?.map((ChannelSearchHistoryEntry e) => e.query.tokens.length),
      <int>[2, 1],
    );
    expect(saved?.last.query.text, 'release');
    await _finish(tester);
  });

  testWidgets('the search key keeps settled results without a rerun', (
    tester,
  ) async {
    final ProviderContainer container = await _container(tester);
    addTearDown(container.dispose);

    await _open(tester, container);
    await tester.enterText(find.byType(EditableText), 'cats');
    await tester.pump(const Duration(milliseconds: 350));
    await _settle(tester);
    final int before = _queries.length;

    await tester.testTextInput.receiveAction(TextInputAction.search);
    await _settle(tester);

    expect(_queries.length, before);
    expect(find.text('Messages (1)'), findsOneWidget);
    expect(_editable(tester).focusNode.hasFocus, isFalse);
    final List<ChannelSearchHistoryEntry>? saved = await tester.runAsync(
      () async =>
          (await container.read(
            channelSearchHistoryRepositoryProvider.future,
          )).readForContext(
            channelSearchContextKey(channelId: _channelId, guildId: _guildId),
          ),
    );
    expect(saved?.single.query.text, 'cats');
    await _finish(tester);
  });

  testWidgets('tapping a result pops with a jump request', (tester) async {
    final ProviderContainer container = await _container(tester);
    addTearDown(container.dispose);

    final Future<ChannelDetailsJumpRequest?> result = await _open(
      tester,
      container,
    );
    await tester.enterText(find.byType(EditableText), 'fixing');
    await tester.pump(const Duration(milliseconds: 350));
    await _settle(tester);

    ChannelDetailsJumpRequest? request;
    unawaited(result.then((ChannelDetailsJumpRequest? r) => request = r));
    await tester.tap(find.byType(MessagePreviewTile));
    await _settle(tester, 20);

    expect(request?.message.id, _messageId);
    expect(request?.guildId, _guildId);
    expect(find.byType(ChannelSearchPage), findsNothing);
    final List<ChannelSearchHistoryEntry>? saved = await tester.runAsync(
      () async =>
          (await container.read(
            channelSearchHistoryRepositoryProvider.future,
          )).readForContext(
            channelSearchContextKey(channelId: _channelId, guildId: _guildId),
          ),
    );
    expect(saved?.single.query.text, 'fixing');
    await _finish(tester);
  });
}
