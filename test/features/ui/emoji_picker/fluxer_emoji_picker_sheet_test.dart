import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_picker_preferences_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/guilds/providers/organized_guild_list_provider.dart';
import 'package:fluxer_app/features/ui/emoji_picker/fluxer_emoji_picker_sheet.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:material_ui/material_ui.dart';

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
      locale: kTestLocale,
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(
        body: Builder(
          builder: (BuildContext context) => Center(
            child: TextButton(
              onPressed: () => FluxerEmojiPickerSheet.show(
                context,
                visibleTabs: const <ExpressionPickerTab>[
                  ExpressionPickerTab.emojis,
                ],
              ),
              child: const Text('open'),
            ),
          ),
        ),
      ),
    ),
  );
}

void main() {
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
    // Below this line, horizontal swipes belong to the OS app switcher (#628).
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
}
