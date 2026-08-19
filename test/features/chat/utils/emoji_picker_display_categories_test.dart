import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/emoji_picker_display_categories.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await EmojiRegistry.preload();
  });

  test('moves the heart cluster to the start of symbols', () {
    final Map<String, List<EmojiEntry>> display = emojiPickerDisplayCategories(
      EmojiRegistry.categories,
    );
    final List<String> symbolNames = display['symbols']!
        .map((EmojiEntry emoji) => emoji.primaryName)
        .toList(growable: false);
    final List<String> peopleNames = display['people']!
        .map((EmojiEntry emoji) => emoji.primaryName)
        .toList(growable: false);

    expect(
      symbolNames.take(kEmojiPickerSymbolHeartNames.length).toList(),
      kEmojiPickerSymbolHeartNames,
    );
    expect(peopleNames, isNot(contains('heart')));
    expect(peopleNames, isNot(contains('cupid')));
    expect(peopleNames, contains('heart_eyes'));
    expect(peopleNames, contains('heart_hands'));
    expect(peopleNames, contains('anatomical_heart'));
    expect(
      display['activity']!.map((EmojiEntry emoji) => emoji.primaryName),
      contains('hearts'),
    );
    expect(
      display['symbols']!.first.spriteIndex,
      EmojiRegistry.entryByName('heart')!.spriteIndex,
    );
    expect(EmojiRegistry.entryByName('heart')!.category, 'people');
  });

  test('does not mutate the registry categories', () {
    final List<EmojiEntry> people = EmojiRegistry.categories['people']!;
    final int peopleCount = people.length;
    final Map<String, List<EmojiEntry>> display = emojiPickerDisplayCategories(
      EmojiRegistry.categories,
    );

    expect(EmojiRegistry.categories['people']!.length, peopleCount);
    expect(
      EmojiRegistry.categories['people']!.any(
        (EmojiEntry emoji) => emoji.names.contains('heart'),
      ),
      isTrue,
    );
    expect(identical(display['people'], people), isFalse);
  });

  test('returns the input map when no hearts are present', () {
    final EmojiEntry thumbsup = EmojiRegistry.entryByName('thumbsup')!;
    final Map<String, List<EmojiEntry>> categories = <String, List<EmojiEntry>>{
      'people': <EmojiEntry>[thumbsup],
    };

    expect(
      identical(emojiPickerDisplayCategories(categories), categories),
      isTrue,
    );
  });
}
