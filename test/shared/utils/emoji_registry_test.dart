import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:fluxer_app/shared/utils/emoji_utils.dart'
    show kSkinToneSurrogates;

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
    expect(EmojiRegistry.entryByName('dog')?.spriteIndex, 563);
    expect(EmojiRegistry.entryByName('fox')?.spriteIndex, 569);
    expect(EmojiRegistry.entryByName('lion_face')?.spriteIndex, 574);
    expect(EmojiRegistry.entryByName('pig')?.spriteIndex, 590);
    expect(EmojiRegistry.entryByName('frog')?.spriteIndex, 647);
  });

  test('loads synced emoji counts', () {
    expect(EmojiRegistry.allEmojis.length, 1940);
    expect(
      EmojiRegistry.allEmojis.where((EmojiEntry e) => e.hasDiversity).length,
      330,
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

  test('resolves skin tones 1-5 to the uniform variants', () {
    for (final EmojiEntry entry in EmojiRegistry.allEmojis.where(
      (EmojiEntry e) => e.hasDiversity,
    )) {
      for (int i = 0; i < kSkinToneSurrogates.length; i++) {
        final String toned = EmojiRegistry.resolveSkinToneSurrogates(
          entry,
          kSkinToneSurrogates[i],
        );
        final Set<String> tones = kSkinToneSurrogates
            .where(toned.contains)
            .toSet();
        expect(tones, {kSkinToneSurrogates[i]}, reason: entry.primaryName);
      }
    }
    expect(EmojiRegistry.resolveSync('handshake::skin-tone-6'), isNull);
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
