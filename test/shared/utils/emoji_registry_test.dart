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
}
