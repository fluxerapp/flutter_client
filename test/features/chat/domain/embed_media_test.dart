import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';

void main() {
  group('EmbedMedia.isAnimated', () {
    test('is true when the animated flag bit is set', () {
      const media = EmbedMedia(
        url: 'https://x/a.webp',
        flags: kEmbedMediaAnimatedFlag,
      );
      expect(media.isAnimated, isTrue);
    });

    test('is true for image/gif content type regardless of case', () {
      const media = EmbedMedia(
        url: 'https://x/a.gif',
        contentType: 'image/GIF',
      );
      expect(media.isAnimated, isTrue);
    });

    test('is false for a plain static image', () {
      const media = EmbedMedia(
        url: 'https://x/a.png',
        contentType: 'image/png',
      );
      expect(media.isAnimated, isFalse);
    });

    test('is false with no flags and no content type', () {
      const media = EmbedMedia(url: 'https://x/a.png');
      expect(media.isAnimated, isFalse);
    });
  });

  test('round-trips contentType and flags through JSON', () {
    const media = EmbedMedia(
      url: 'https://x/a.webp',
      proxyUrl: 'https://cdn/a.webp',
      width: 100,
      height: 80,
      contentType: 'image/webp',
      flags: kEmbedMediaAnimatedFlag,
    );

    final restored = EmbedMedia.fromJson(media.toJson());

    expect(restored.contentType, 'image/webp');
    expect(restored.flags, kEmbedMediaAnimatedFlag);
    expect(restored.proxyUrl, 'https://cdn/a.webp');
    expect(restored.width, 100);
    expect(restored.height, 80);
  });

  test('defaults flags to zero when absent from JSON', () {
    final media = EmbedMedia.fromJson(const {'url': 'https://x/a.png'});
    expect(media.flags, 0);
    expect(media.contentType, isNull);
    expect(media.isAnimated, isFalse);
  });
}
