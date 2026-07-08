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

  test('parses Unicode 17.0 emoji from the asset', () {
    final EmojiEntry? distorted = EmojiRegistry.entryByName('distorted_face');
    expect(distorted, isNotNull);
    expect(distorted!.surrogates, '🫪');
    expect(distorted.keywords, contains('anxiety'));
  });

  test('parses Unicode 16.0 emoji from the asset', () {
    final EmojiEntry? bags = EmojiRegistry.entryByName(
      'face_with_bags_under_eyes',
    );
    expect(bags, isNotNull);
    expect(bags!.surrogates, '🫩');
    expect(bags.keywords, contains('exhausted'));

    final EmojiEntry? fingerprint = EmojiRegistry.entryByName('fingerprint');
    expect(fingerprint, isNotNull);
    expect(fingerprint!.surrogates, '🫆');

    final EmojiEntry? leaflessTree = EmojiRegistry.entryByName('leafless_tree');
    expect(leaflessTree, isNotNull);
    expect(leaflessTree!.surrogates, '🪾');

    final EmojiEntry? rootVegetable = EmojiRegistry.entryByName(
      'root_vegetable',
    );
    expect(rootVegetable, isNotNull);
    expect(rootVegetable!.surrogates, '🫜');

    final EmojiEntry? harp = EmojiRegistry.entryByName('harp');
    expect(harp, isNotNull);
    expect(harp!.surrogates, '🪉');

    final EmojiEntry? shovel = EmojiRegistry.entryByName('shovel');
    expect(shovel, isNotNull);
    expect(shovel!.surrogates, '🪏');

    final EmojiEntry? splatter = EmojiRegistry.entryByName('splatter');
    expect(splatter, isNotNull);
    expect(splatter!.surrogates, '🫟');

    final EmojiEntry? flagCq = EmojiRegistry.entryByName('flag_cq');
    expect(flagCq, isNotNull);
    expect(flagCq!.surrogates, '🇨🇶');
  });

  test('resolves new emoji shortcodes', () {
    expect(EmojiRegistry.resolveSync('treasure_chest'), '🪎');
    expect(EmojiRegistry.resolveSync('ballet_dancer'), isNotNull);
    expect(EmojiRegistry.resolveSync('face_with_bags_under_eyes'), '🫩');
    expect(EmojiRegistry.resolveSync('flag_cq'), '🇨🇶');
  });

  test('marks people wrestling as supporting skin tones', () {
    final EmojiEntry? wrestling = EmojiRegistry.entryByName('people_wrestling');
    expect(wrestling, isNotNull);
    expect(wrestling!.hasDiversity, isTrue);
    expect(wrestling.diversityIndex, isNotNull);
  });
}
