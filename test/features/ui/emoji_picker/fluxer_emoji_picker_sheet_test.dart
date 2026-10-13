// Root ProviderScope built by a helper; the lint only exempts a
// ProviderScope written inline in pumpWidget.
// ignore_for_file: riverpod_lint/scoped_providers_should_specify_dependencies

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show FluxerDatabase;
import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/emoji_search_bar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_picker_preferences_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/guilds/providers/organized_guild_list_provider.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/emoji_picker/fluxer_emoji_picker_sheet.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';

import '../../../helpers/open_test_database.dart';
import '../../../helpers/sheet_corner_pixels.dart';
import '../../../helpers/test_l10n.dart';

class _FakeDmViewModel extends DmViewModel {
  @override
  DmViewState build() => const DmViewState(
    conversations: [],
    friendsList: [],
    activeTab: FriendsTab.online,
    searchQuery: '',
  );
}

class _FakeOrganizedGuildList extends OrganizedGuildList {
  @override
  List<GuildNavbarItem> build() => const <GuildNavbarItem>[];
}

class _FakeFavoriteEmojiKeys extends FavoriteEmojiKeys {
  @override
  Future<List<String>> build() => Future.value(const <String>[]);
}

class _FakeCollapsedCategories extends CollapsedEmojiPickerCategories {
  @override
  Future<List<String>> build() => Future.value(const <String>[]);
}

Widget _buildTestApp() {
  final colorTheme = buildDarkColorTheme();

  return ProviderScope(
    overrides: [
      fluxerDatabaseProvider.overrideWithValue(_database),
      organizedGuildListProvider.overrideWith(_FakeOrganizedGuildList.new),
      activeGuildIdProvider.overrideWithValue(null),
      dmViewModelProvider.overrideWith(_FakeDmViewModel.new),
      instanceFeatureEnabledProvider(
        LimitKeys.featureGlobalExpressions,
      ).overrideWithValue(false),
      allGuildEmojisForPickerProvider.overrideWith(
        (ref) => Stream<List<GuildEmojiEntry>>.value(const []),
      ),
      rankedEmojiUsageKeysProvider.overrideWithValue(
        const AsyncData<List<String>>(<String>[]),
      ),
      favoriteEmojiKeysProvider.overrideWith(_FakeFavoriteEmojiKeys.new),
      collapsedEmojiPickerCategoriesProvider.overrideWith(
        _FakeCollapsedCategories.new,
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
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
          builder: (BuildContext context) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextButton(
                  onPressed: () => FluxerEmojiPickerSheet.show(
                    context,
                    visibleTabs: const <ExpressionPickerTab>[
                      ExpressionPickerTab.emojis,
                    ],
                  ),
                  child: const Text('open'),
                ),
                TextButton(
                  onPressed: () => FluxerBottomSheet.show<void>(
                    context,
                    builder: (BuildContext context, VoidCallback close) =>
                        const SizedBox(key: _plainSheetContentKey, height: 40),
                  ),
                  child: const Text('plain'),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

late FluxerDatabase _database;

const Key _plainSheetContentKey = Key('plain-sheet-content');

void _useIphoneView(WidgetTester tester) {
  tester.view.physicalSize = const Size(1170, 2532);
  tester.view.devicePixelRatio = 3.0;
  addTearDown(tester.view.reset);
}

Finder get _handleBar => find.descendant(
  of: find.byType(FluxerBottomSheetDragHandle),
  matching: find.byType(FluxerSheetHandleBar),
);

Rect _sheetSurfaceRect(WidgetTester tester) => tester.getRect(
  find
      .ancestor(
        of: find.byType(FluxerBottomSheetDragHandle),
        matching: find.byType(Material),
      )
      .first,
);

({double top, double gap}) _handleSpacing(
  WidgetTester tester,
  Finder firstControl,
) {
  final Rect sheet = _sheetSurfaceRect(tester);
  final Rect bar = tester.getRect(_handleBar);
  final Rect control = tester.getRect(firstControl);
  return (top: bar.top - sheet.top, gap: control.top - bar.bottom);
}

void main() {
  setUp(() {
    _database = openTestDatabase();
  });

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await EmojiRegistry.preload();
  });

  testWidgets('picker sheet keeps content above the OS gesture zone', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1170, 2532);
    tester.view.devicePixelRatio = 3.0;
    tester.view.padding = const FakeViewPadding(bottom: 102);
    tester.view.viewPadding = const FakeViewPadding(bottom: 102);
    addTearDown(tester.view.reset);

    await tester.pumpWidget(_buildTestApp());
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    final double screenHeight = tester.view.physicalSize.height / 3.0;
    final Rect picker = tester.getRect(find.byType(ExpressionPicker));
    // Swipes in the bottom 34pt belong to the OS app switcher: https://feedback.fluxer.com/p/2015
    expect(picker.bottom, lessThanOrEqualTo(screenHeight - 34));
  });

  testWidgets('picker sheet stays flush without a bottom inset', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1170, 2532);
    tester.view.devicePixelRatio = 3.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(_buildTestApp());
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    final double screenHeight = tester.view.physicalSize.height / 3.0;
    final Rect picker = tester.getRect(find.byType(ExpressionPicker));
    expect(picker.bottom, screenHeight);
  });

  testWidgets('reaction picker handle spacing matches the shared sheet', (
    WidgetTester tester,
  ) async {
    _useIphoneView(tester);
    await tester.pumpWidget(_buildTestApp());

    await tester.tap(find.text('plain'));
    await tester.pumpAndSettle();
    final ({double top, double gap}) shared = _handleSpacing(
      tester,
      find.byKey(_plainSheetContentKey),
    );
    Navigator.of(tester.element(find.byKey(_plainSheetContentKey))).pop();
    await tester.pumpAndSettle();

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    expect(_handleBar, findsOneWidget);
    final ({double top, double gap}) picker = _handleSpacing(
      tester,
      find.descendant(
        of: find.byType(EmojiSearchBar),
        matching: find.byType(TextField),
      ),
    );

    expect(shared.top, kFluxerSheetHandleTop);
    expect(shared.gap, kFluxerSheetHandleGap);
    expect(picker.top, shared.top);
    expect(picker.gap, shared.gap);
  }, variant: TargetPlatformVariant.only(TargetPlatform.iOS));

  testWidgets('reaction picker corners show only surface and backdrop', (
    WidgetTester tester,
  ) async {
    _useIphoneView(tester);
    await tester.pumpWidget(_buildTestApp());
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    final BuildContext context = tester.element(find.byType(ExpressionPicker));
    final Color surface = context.colors.backgroundSecondaryAlt;
    final RoundedRectangleBorder shape =
        Theme.of(context).bottomSheetTheme.shape! as RoundedRectangleBorder;
    final double radius = shape.borderRadius
        .resolve(TextDirection.ltr)
        .topLeft
        .x;
    final Rect sheet = _sheetSurfaceRect(tester);
    expect(sheet.left, 0);
    expect(sheet.top, greaterThan(radius));

    final ScreenPixels pixels = await ScreenPixels.capture(tester);
    expect(pixels.at(Offset(4, sheet.top - 3)), isNot(surface));
    expect(
      sheetCornerColorMismatches(
        pixels: pixels,
        sheet: sheet,
        radius: radius,
        surface: surface,
      ),
      isEmpty,
    );
  }, variant: TargetPlatformVariant.only(TargetPlatform.iOS));
}
