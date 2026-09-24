import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/widgets/emoji_asset_image_provider.dart';

void main() {
  const String grinning = 'https://cdn.example/emoji/1f600.svg?v=9';
  const String crying = 'https://cdn.example/emoji/1f622.svg?v=9';
  const ImageConfiguration hidpi = ImageConfiguration(devicePixelRatio: 3);

  test('same emoji at the same size resolves to one image cache key', () async {
    final EmojiAssetImageKey first = await const EmojiAssetImageProvider(
      url: grinning,
      size: 22,
    ).obtainKey(hidpi);
    final EmojiAssetImageKey second = await const EmojiAssetImageProvider(
      url: grinning,
      size: 22,
    ).obtainKey(hidpi);

    expect(first, second);
    expect(first.hashCode, second.hashCode);
  });

  test('inline and jumbo sizes of one emoji do not share a key', () async {
    final EmojiAssetImageKey inline = await const EmojiAssetImageProvider(
      url: grinning,
      size: 22,
    ).obtainKey(hidpi);
    final EmojiAssetImageKey jumbo = await const EmojiAssetImageProvider(
      url: grinning,
      size: 48,
    ).obtainKey(hidpi);

    expect(inline == jumbo, isFalse);
    expect(inline.targetPixels, 66);
    expect(jumbo.targetPixels, 144);
  });

  test('different emoji at the same size do not share a key', () async {
    final EmojiAssetImageKey first = await const EmojiAssetImageProvider(
      url: grinning,
      size: 22,
    ).obtainKey(hidpi);
    final EmojiAssetImageKey second = await const EmojiAssetImageProvider(
      url: crying,
      size: 22,
    ).obtainKey(hidpi);

    expect(first == second, isFalse);
  });

  test('target pixels follow the device pixel ratio', () async {
    final EmojiAssetImageKey ldpi = await const EmojiAssetImageProvider(
      url: grinning,
      size: 22,
    ).obtainKey(const ImageConfiguration(devicePixelRatio: 1));
    final EmojiAssetImageKey hidpiKey = await const EmojiAssetImageProvider(
      url: grinning,
      size: 22,
    ).obtainKey(hidpi);

    expect(ldpi.targetPixels, 22);
    expect(hidpiKey.targetPixels, 66);
  });
}
