import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/chat/utils/emoji_picker_layout_index.dart';
import 'package:fluxer_app/features/chat/utils/emoji_picker_rendering_policy.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await EmojiRegistry.preload();
  });

  test('visibleCustomEmojiIds returns ids intersecting the viewport', () {
    final EmojiPickerLayoutIndex index = buildEmojiPickerLayoutIndex(
      unicodeCategories: const <String, List<EmojiEntry>>{},
      favoriteItems: const <EmojiPickerFavoriteRowItem>[],
      frecentItems: const <FrecentEmojiItem>[],
      guildSections: <MapEntry<String, List<GuildEmojiEntry>>>[
        MapEntry<String, List<GuildEmojiEntry>>(
          'guild-g1',
          List<GuildEmojiEntry>.generate(
            16,
            (int index) => GuildEmojiEntry(
              id: 'emoji-$index',
              name: 'emoji$index',
              animated: index.isEven,
              guildId: 'g1',
            ),
          ),
        ),
      ],
      collapsedCategories: const <String>[],
      columns: 8,
      includeUpsell: false,
    );

    final Set<String> visible = index.visibleCustomEmojiIds(
      scrollOffset: kEmojiPickerHeaderHeight + kEmojiPickerSectionGap,
      viewportHeight: kEmojiPickerCellSize,
    );

    expect(visible, contains('emoji-0'));
    expect(visible, contains('emoji-7'));
    expect(visible, isNot(contains('emoji-8')));
  });

  test('activeCategoryKey tracks the current section', () {
    final EmojiEntry thumbsup = EmojiRegistry.entryByName('thumbsup')!;
    final EmojiPickerLayoutIndex index = buildEmojiPickerLayoutIndex(
      unicodeCategories: <String, List<EmojiEntry>>{
        'people': <EmojiEntry>[thumbsup],
      },
      favoriteItems: const <EmojiPickerFavoriteRowItem>[],
      frecentItems: const <FrecentEmojiItem>[],
      guildSections: const <MapEntry<String, List<GuildEmojiEntry>>>[],
      collapsedCategories: const <String>[],
      columns: 8,
      includeUpsell: false,
    );

    expect(index.activeCategoryKey(0), isNull);
    expect(index.activeCategoryKey(1000), 'people');
  });

  test('animatedCustomEmojiIds respects scroll settle and budget', () {
    final EmojiPickerLayoutIndex index = buildEmojiPickerLayoutIndex(
      unicodeCategories: const <String, List<EmojiEntry>>{},
      favoriteItems: const <EmojiPickerFavoriteRowItem>[],
      frecentItems: const <FrecentEmojiItem>[],
      guildSections: <MapEntry<String, List<GuildEmojiEntry>>>[
        MapEntry<String, List<GuildEmojiEntry>>(
          'guild-g1',
          List<GuildEmojiEntry>.generate(
            16,
            (int index) => GuildEmojiEntry(
              id: 'emoji-$index',
              name: 'emoji$index',
              animated: true,
              guildId: 'g1',
            ),
          ),
        ),
      ],
      collapsedCategories: const <String>[],
      columns: 8,
      includeUpsell: false,
    );

    expect(
      index.animatedCustomEmojiIds(
        scrollOffset: kEmojiPickerHeaderHeight + kEmojiPickerSectionGap,
        viewportHeight: kEmojiPickerCellSize * 2,
        maxAnimated: 2,
        scrollSettled: false,
      ),
      isEmpty,
    );

    final Set<String> animated = index.animatedCustomEmojiIds(
      scrollOffset: kEmojiPickerHeaderHeight + kEmojiPickerSectionGap,
      viewportHeight: kEmojiPickerCellSize * 2,
      maxAnimated: 2,
      scrollSettled: true,
    );

    expect(animated.length, 2);
  });

  test('visibleCustomEmojiIdsForSearchGrid tracks grid rows', () {
    final List<GuildEmojiEntry> customResults = List<GuildEmojiEntry>.generate(
      10,
      (int index) => GuildEmojiEntry(
        id: 'search-$index',
        name: 'search$index',
        animated: true,
        guildId: 'g1',
      ),
    );

    final Set<String> visible = visibleCustomEmojiIdsForSearchGrid(
      customResults: customResults,
      columns: 8,
      scrollOffset: 0,
      viewportHeight: kEmojiPickerCellSize,
    );

    expect(visible.length, 8);
    expect(visible, contains('search-0'));
    expect(visible, isNot(contains('search-8')));
  });

  test('animated emoji policy keeps mobile in-view animation only', () {
    expect(
      emojiPickerAnimateCustomEmojiInGrid(
        isMobile: true,
        emojiAnimated: true,
        isInView: true,
        scrollSettled: true,
      ),
      isTrue,
    );
    expect(
      emojiPickerAnimateCustomEmojiInGrid(
        isMobile: true,
        emojiAnimated: true,
        isInView: true,
        scrollSettled: false,
      ),
      isFalse,
    );
    expect(
      emojiPickerAnimateCustomEmojiInGrid(
        isMobile: false,
        emojiAnimated: true,
        isInView: true,
        scrollSettled: true,
      ),
      isFalse,
    );
    expect(emojiPickerPrefetchAnimatedUrls(isMobile: true), isTrue);
    expect(emojiPickerPrefetchAnimatedUrls(isMobile: false), isFalse);
  });
}
