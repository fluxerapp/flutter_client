import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/emoji_picker_content.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_picker_preferences_provider.dart';
import 'package:fluxer_app/features/chat/utils/emoji_picker_rendering_policy.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/guilds/providers/organized_guild_list_provider.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/shared/utils/emoji_image_cache.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../../helpers/test_l10n.dart';

class _FakeDmViewModel extends DmViewModel {
  @override
  DmViewState build() => const DmViewState(
    conversations: [],
    friendsList: [],
    activeTab: FriendsTab.online,
    searchQuery: '',
  );
}

class _FakeGuildListViewModel extends GuildListViewModel {
  @override
  GuildListViewState build() => const GuildListViewState(
    guilds: [Guild(id: 'g1', name: 'One', ownerId: 'owner')],
  );
}

class _FakeOrganizedGuildList extends OrganizedGuildList {
  @override
  List<GuildNavbarItem> build() => [
    const GuildNavbarGuild(
      guild: Guild(id: 'g1', name: 'One', ownerId: 'owner'),
    ),
  ];
}

class _FakeFavoriteEmojiKeys extends FavoriteEmojiKeys {
  @override
  Future<List<String>> build() => Future.value(const <String>[]);
}

class _FakeCollapsedCategories extends CollapsedEmojiPickerCategories {
  @override
  Future<List<String>> build() => Future.value(const <String>[]);
}

Widget _buildTestApp({
  required Widget child,
  required List<GuildEmojiEntry> allGuildEmojis,
  required List<String> rankedUsageKeys,
}) {
  final colorTheme = buildDarkColorTheme();

  return ProviderScope(
    overrides: [
      organizedGuildListProvider.overrideWith(_FakeOrganizedGuildList.new),
      activeGuildIdProvider.overrideWithValue('g1'),
      dmViewModelProvider.overrideWith(_FakeDmViewModel.new),
      instanceFeatureEnabledProvider(
        LimitKeys.featureGlobalExpressions,
      ).overrideWithValue(false),
      channelMessagePermissionsProvider(
        'channel-1',
      ).overrideWith((ref) => Future.value(ChannelMessagePermissions.all)),
      allGuildEmojisForPickerProvider.overrideWith(
        (ref) => Stream<List<GuildEmojiEntry>>.value(allGuildEmojis),
      ),
      rankedEmojiUsageKeysProvider.overrideWithValue(
        AsyncData<List<String>>(rankedUsageKeys),
      ),
      favoriteEmojiKeysProvider.overrideWith(_FakeFavoriteEmojiKeys.new),
      guildListViewModelProvider.overrideWith(_FakeGuildListViewModel.new),
      guildByIdProvider('g1').overrideWith(
        (ref) async => const Guild(id: 'g1', name: 'One', ownerId: 'owner'),
      ),
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
      home: Scaffold(body: Center(child: child)),
    ),
  );
}

final _customEmoji = GuildEmojiEntry(
  id: 'custom-1',
  name: 'party',
  animated: false,
  guildId: 'g1',
);

final _animatedCustomEmoji = GuildEmojiEntry(
  id: 'custom-animated',
  name: 'dance',
  animated: true,
  guildId: 'g1',
);

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await EmojiRegistry.preload();
  });

  testWidgets(
    'renders a recent custom emoji in the frequently used section when it is available',
    (tester) async {
      await tester.pumpWidget(
        _buildTestApp(
          allGuildEmojis: [_customEmoji],
          rankedUsageKeys: const ['unicode:thumbsup', 'custom:g1:custom-1'],
          child: const SizedBox(
            width: 400,
            height: 400,
            child: EmojiPickerContent(channelId: 'channel-1'),
          ),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('Frequently Used'), findsOneWidget);
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is CachedEmojiImage && widget.emojiId == 'custom-1',
        ),
        findsWidgets,
      );
    },
  );

  testWidgets(
    'hides a recent custom emoji in the frequently used section when it is not available',
    (tester) async {
      await tester.pumpWidget(
        _buildTestApp(
          allGuildEmojis: const <GuildEmojiEntry>[],
          rankedUsageKeys: const ['unicode:thumbsup', 'custom:g1:custom-1'],
          child: const SizedBox(
            width: 400,
            height: 400,
            child: EmojiPickerContent(channelId: 'channel-1'),
          ),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('Frequently Used'), findsOneWidget);
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is CachedEmojiImage && widget.emojiId == 'custom-1',
        ),
        findsNothing,
      );
    },
  );

  testWidgets(
    'mobile picker requests animated custom emoji assets in the grid',
    (tester) async {
      await tester.pumpWidget(
        _buildTestApp(
          allGuildEmojis: [_animatedCustomEmoji],
          rankedUsageKeys: const <String>[],
          child: const SizedBox(
            width: 400,
            height: 400,
            child: EmojiPickerContent(channelId: 'channel-1', isMobile: true),
          ),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      final CachedEmojiImage image = tester.widget(
        find.byWidgetPredicate(
          (widget) =>
              widget is CachedEmojiImage && widget.emojiId == 'custom-animated',
        ),
      );
      expect(image.animated, isTrue);
      expect(image.requestSize, kCustomEmojiPickerFetchSize);
    },
  );

  testWidgets('long press opens emoji info sheet for custom emoji', (
    tester,
  ) async {
    await tester.pumpWidget(
      _buildTestApp(
        allGuildEmojis: <GuildEmojiEntry>[_customEmoji],
        rankedUsageKeys: const <String>[],
        child: const SizedBox(
          width: 800,
          height: 600,
          child: EmojiPickerContent(channelId: 'channel-1', isMobile: true),
        ),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    final Finder emojiCell = find.bySemanticsLabel('party');
    await tester.scrollUntilVisible(
      emojiCell,
      100,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.pumpAndSettle();

    final Finder pressTarget = find.descendant(
      of: emojiCell,
      matching: find.byType(FluxerGestureDetector),
    );
    expect(pressTarget, findsOneWidget);

    await tester.longPress(pressTarget);
    await tester.pumpAndSettle();

    expect(find.text(':party:'), findsOneWidget);
    expect(find.text(testL10n.emojiInfoCustomGuildDescription), findsOneWidget);
  });

  testWidgets('category sidebar buttons expose tooltip labels', (tester) async {
    await tester.pumpWidget(
      _buildTestApp(
        allGuildEmojis: const <GuildEmojiEntry>[],
        rankedUsageKeys: const <String>[],
        child: const SizedBox(
          width: 400,
          height: 400,
          child: EmojiPickerContent(channelId: 'channel-1'),
        ),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    final FluxerLocalizations l10n = lookupFluxerLocalizations(
      const Locale('en', 'US'),
    );
    expect(find.bySemanticsLabel(l10n.emojiCategoryPeople), findsOneWidget);
  });
}
