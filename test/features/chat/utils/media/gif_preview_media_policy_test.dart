import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/media/gif_preview_media_policy.dart';

void main() {
  test('identifies animated image preview URLs', () {
    expect(isAnimatedImagePreviewUrl('https://media.tenor.com/a.webp'), isTrue);
    expect(
      isAnimatedImagePreviewUrl('https://cdn.example/proxy/a.webp?size=1'),
      isTrue,
    );
    expect(isAnimatedImagePreviewUrl('https://media.tenor.com/a.gif'), isTrue);
    expect(
      isAnimatedImagePreviewUrl('https://cdn.example/proxy/a.gif?size=1'),
      isTrue,
    );
    expect(
      isAnimatedImagePreviewUrl('https://media.tenor.com/a.webm'),
      isFalse,
    );
  });

  test('gates animated image previews behind animated image allowance', () {
    expect(
      gifPreviewShouldLoadImage(
        previewUrl: 'https://media.tenor.com/a.webp',
        sourceUrl: 'https://media.tenor.com/a.webp',
        isAnimatedImagePlaybackAllowed: false,
      ),
      isFalse,
    );
    expect(
      gifPreviewShouldLoadImage(
        previewUrl: 'https://media.tenor.com/a.gif',
        sourceUrl: 'https://media.tenor.com/a.gif',
        isAnimatedImagePlaybackAllowed: false,
      ),
      isFalse,
    );
    expect(
      gifPreviewShouldLoadImage(
        previewUrl: 'https://media.tenor.com/a.png',
        sourceUrl: 'https://media.tenor.com/a.png',
        isAnimatedImagePlaybackAllowed: false,
      ),
      isTrue,
    );
  });
}
