import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await EmojiRegistry.preload();
  });

  test('parses keywords from the asset', () {
    final EmojiEntry? grinning = EmojiRegistry.entryByName('grinning');
    expect(grinning, isNotNull);
    expect(grinning!.keywords, contains('happy'));
    expect(grinning.keywordsLower, contains('happy'));
  });

  test('ranks an exact name match first', () {
    final List<EmojiEntry> results = EmojiRegistry.search('smile');
    expect(results, isNotEmpty);
    expect(results.first.primaryName, 'smile');
  });

  test('finds an emoji by a keyword synonym not present in its name', () {
    // "happy" is a keyword of `grinning` but not part of its shortcode.
    final List<EmojiEntry> results = EmojiRegistry.search('happy');
    expect(results.any((EmojiEntry e) => e.names.contains('grinning')), isTrue);
  });

  test('returns empty for a blank query', () {
    expect(EmojiRegistry.search('   '), isEmpty);
  });

  test('matches web sprite indices for nature emojis', () {
    expect(EmojiRegistry.entryByName('dog')?.spriteIndex, 559);
    expect(EmojiRegistry.entryByName('fox')?.spriteIndex, 565);
    expect(EmojiRegistry.entryByName('lion_face')?.spriteIndex, 570);
    expect(EmojiRegistry.entryByName('pig')?.spriteIndex, 586);
    expect(EmojiRegistry.entryByName('frog')?.spriteIndex, 643);
  });

  test('loads synced emoji counts', () {
    expect(EmojiRegistry.allEmojis.length, 1932);
    expect(
      EmojiRegistry.allEmojis.where((EmojiEntry e) => e.hasDiversity).length,
      323,
    );
  });

  test('resolves skin tone surrogates from skins array', () {
    final EmojiEntry? wave = EmojiRegistry.entryByName('wave');
    expect(wave, isNotNull);
    final String toned = EmojiRegistry.resolveSkinToneSurrogates(
      wave!,
      '\u{1F3FD}',
    );
    expect(toned, isNot(equals(wave.surrogates)));
    expect(toned.contains('\u{1F3FD}'), isTrue);
  });

  test('resolves shortcut aliases', () {
    expect(EmojiRegistry.resolveSync('<3'), EmojiRegistry.resolveSync('heart'));
  });

  test('matches heart with and without variation selector', () {
    final regex = EmojiRegistry.unicodeEmojiRegexSync;
    expect(regex, isNotNull);
    expect(regex!.hasMatch('❤️'), isTrue);
    expect(regex.hasMatch('❤'), isTrue);
  });
}
