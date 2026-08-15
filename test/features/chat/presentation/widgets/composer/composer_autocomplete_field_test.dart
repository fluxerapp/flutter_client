import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_autocomplete_field.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/chat/service/composer_autocomplete_trigger.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/ui/input/emoji_text_editing_controller.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../../helpers/open_test_database.dart';
import '../../../../../helpers/test_l10n.dart';

class _FakeGuilds extends GuildListViewModel {
  _FakeGuilds(this._guilds);

  final List<Guild> _guilds;

  @override
  GuildListViewState build() => GuildListViewState(guilds: _guilds);
}

/// Pumps an emoji-only [ComposerAutocompleteField] in bio configuration
/// (no channel, emoji trigger only) wrapping a plain `TextField`.
Future<EmojiTextEditingController> _pumpBioField(
  WidgetTester tester, {
  required FluxerDatabase db,
  List<GuildEmojiEntry> custom = const <GuildEmojiEntry>[],
  VoidCallback? onApplied,
  Widget Function(TextEditingController controller, FocusNode focusNode)?
  childBuilder,
  double? width,
}) async {
  final controller = EmojiTextEditingController();
  addTearDown(controller.dispose);
  final focusNode = FocusNode();
  addTearDown(focusNode.dispose);
  final colorTheme = buildDarkColorTheme();

  final Widget field = ComposerAutocompleteField(
    controller: controller,
    focusNode: focusNode,
    allowedTriggers: const <ComposerAutocompleteTriggerKind>{
      ComposerAutocompleteTriggerKind.emoji,
    },
    maxActualLength: 320,
    onApplied: onApplied,
    child:
        childBuilder?.call(controller, focusNode) ??
        TextField(controller: controller, focusNode: focusNode),
  );
  final Widget body = width == null
      ? field
      : Center(
          child: SizedBox(width: width, child: field),
        );

  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        fluxerDatabaseProvider.overrideWithValue(db),
        activeGuildIdProvider.overrideWith((ref) => null),
        guildListViewModelProvider.overrideWith(
          () => _FakeGuilds(const <Guild>[
            Guild(id: 'g1', name: 'Linux Hub', ownerId: 'owner'),
          ]),
        ),
        allGuildEmojisForPickerProvider.overrideWith(
          (ref) => Stream<List<GuildEmojiEntry>>.value(custom),
        ),
      ],
      child: MaterialApp(
        locale: kTestLocale,
        localizationsDelegates: FluxerLocalizations.localizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        home: Scaffold(body: body),
      ),
    ),
  );
  return controller;
}

/// Lets the typing debounce, the custom-emoji stream `.future`, and the
/// open/close fade settle without `pumpAndSettle` (custom-emoji network images
/// never settle).
Future<void> _settleAutocomplete(WidgetTester tester) async {
  await tester.pump(const Duration(milliseconds: 350));
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 150));
}

ComposerAutocompleteFieldState _fieldState(WidgetTester tester) =>
    tester.state<ComposerAutocompleteFieldState>(
      find.byType(ComposerAutocompleteField),
    );

void main() {
  setUpAll(() async {
    await EmojiRegistry.preload();
  });

  testWidgets('bio emoji autocomplete interleaves a custom emoji and labels '
      'its guild', (tester) async {
    final db = openTestDatabase();

    await _pumpBioField(
      tester,
      db: db,
      custom: <GuildEmojiEntry>[
        GuildEmojiEntry(
          id: 'e1',
          name: 'smile',
          animated: false,
          guildId: 'g1',
        ),
      ],
    );

    await tester.enterText(find.byType(TextField), ':smile');
    await _settleAutocomplete(tester);

    // The custom ":smile:" (an exact match) is ranked in and labelled with its
    // guild, alongside the unicode ":smile:".
    expect(find.text('Linux Hub'), findsOneWidget);
    expect(find.text(':smile:'), findsWidgets);
  });

  testWidgets('selecting a suggestion inserts it and closes the menu', (
    tester,
  ) async {
    final db = openTestDatabase();
    var applied = 0;

    final controller = await _pumpBioField(
      tester,
      db: db,
      custom: <GuildEmojiEntry>[
        GuildEmojiEntry(
          id: 'e1',
          name: 'smile',
          animated: false,
          guildId: 'g1',
        ),
      ],
      onApplied: () => applied++,
    );

    await tester.enterText(find.byType(TextField), ':smile');
    await _settleAutocomplete(tester);

    final state = _fieldState(tester);
    expect(state.hasOpenMenu, isTrue);

    state
      ..moveSelection(1)
      ..applyCurrentSelection();
    await tester.pump();

    // The trigger text is replaced by an inline emoji chip, the menu closes,
    // and onApplied fires.
    expect(state.hasOpenMenu, isFalse);
    expect(controller.text.contains(':smile'), isFalse);
    expect(controller.actualText.contains('smile'), isTrue);
    expect(applied, 1);
  });

  testWidgets('disallowed triggers produce no menu', (tester) async {
    final db = openTestDatabase();

    await _pumpBioField(tester, db: db);

    // An emoji-only field ignores @mention and #channel triggers entirely.
    await tester.enterText(find.byType(TextField), '@everyone');
    await _settleAutocomplete(tester);
    expect(_fieldState(tester).hasOpenMenu, isFalse);

    await tester.enterText(find.byType(TextField), '#general');
    await _settleAutocomplete(tester);
    expect(_fieldState(tester).hasOpenMenu, isFalse);
  });

  testWidgets('open autocomplete dismisses immediately when the trigger ends', (
    tester,
  ) async {
    final db = openTestDatabase();

    await _pumpBioField(
      tester,
      db: db,
      custom: <GuildEmojiEntry>[
        GuildEmojiEntry(
          id: 'e1',
          name: 'smile',
          animated: false,
          guildId: 'g1',
        ),
      ],
    );

    await tester.enterText(find.byType(TextField), ':smile');
    await _settleAutocomplete(tester);
    expect(_fieldState(tester).hasOpenMenu, isTrue);

    await tester.enterText(find.byType(TextField), ':smile ');
    await tester.pump();
    expect(_fieldState(tester).hasOpenMenu, isFalse);
  });

  testWidgets('suggestions panel spans the full composer width, not just the '
      'text input flanked by buttons', (tester) async {
    final db = openTestDatabase();

    await _pumpBioField(
      tester,
      db: db,
      width: 480,
      childBuilder: (controller, focusNode) => Row(
        children: <Widget>[
          const SizedBox(width: 48, height: 44),
          Expanded(
            child: TextField(controller: controller, focusNode: focusNode),
          ),
          const SizedBox(width: 48, height: 44),
        ],
      ),
      custom: <GuildEmojiEntry>[
        GuildEmojiEntry(
          id: 'e1',
          name: 'smile',
          animated: false,
          guildId: 'g1',
        ),
      ],
    );

    await tester.enterText(find.byType(TextField), ':smile');
    await _settleAutocomplete(tester);

    expect(_fieldState(tester).hasOpenMenu, isTrue);

    final double panelWidth = tester.getSize(find.byType(ListView)).width;
    final double inputWidth = tester.getSize(find.byType(TextField)).width;
    expect(panelWidth, moreOrLessEquals(480, epsilon: 0.5));
    expect(inputWidth, lessThan(panelWidth));
  });

  testWidgets(
    'inStack mode publishes suggestions to panel host without overlay',
    (tester) async {
      final db = openTestDatabase();
      final host = ComposerAutocompletePanelHost(null);
      addTearDown(host.dispose);
      final scrollController = ScrollController();
      addTearDown(scrollController.dispose);
      final controller = EmojiTextEditingController();
      addTearDown(controller.dispose);
      final focusNode = FocusNode();
      addTearDown(focusNode.dispose);
      final colorTheme = buildDarkColorTheme();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            fluxerDatabaseProvider.overrideWithValue(db),
            activeGuildIdProvider.overrideWith((ref) => null),
            guildListViewModelProvider.overrideWith(
              () => _FakeGuilds(const <Guild>[
                Guild(id: 'g1', name: 'Linux Hub', ownerId: 'owner'),
              ]),
            ),
            allGuildEmojisForPickerProvider.overrideWith(
              (ref) => Stream<List<GuildEmojiEntry>>.value(<GuildEmojiEntry>[
                GuildEmojiEntry(
                  id: 'e1',
                  name: 'smile',
                  animated: false,
                  guildId: 'g1',
                ),
              ]),
            ),
          ],
          child: MaterialApp(
            locale: kTestLocale,
            localizationsDelegates: FluxerLocalizations.localizationsDelegates,
            supportedLocales: FluxerLocalizations.supportedLocales,
            theme: buildFluxerTheme(
              colorTheme: colorTheme,
              textTheme: FluxerTextTheme.fromColors(colorTheme),
              layoutTheme: FluxerLayoutTheme.scaled(),
            ),
            home: Scaffold(
              body: Column(
                children: <Widget>[
                  Expanded(
                    child: ComposerAutocompletePanelStrip(
                      host: host,
                      scrollController: scrollController,
                    ),
                  ),
                  ComposerAutocompleteField(
                    controller: controller,
                    focusNode: focusNode,
                    allowedTriggers: const <ComposerAutocompleteTriggerKind>{
                      ComposerAutocompleteTriggerKind.emoji,
                    },
                    renderMode: AutocompleteRenderMode.inStack,
                    panelHost: host,
                    panelScrollController: scrollController,
                    child: TextField(
                      controller: controller,
                      focusNode: focusNode,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), ':smile');
      await _settleAutocomplete(tester);

      expect(_fieldState(tester).hasOpenMenu, isTrue);
      expect(host.value, isNotNull);
      expect(find.byType(OverlayPortal), findsNothing);
      expect(find.byType(ListView), findsOneWidget);
      expect(find.text('Linux Hub'), findsOneWidget);
    },
  );
}
