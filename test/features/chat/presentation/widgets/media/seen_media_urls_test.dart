import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/seen_media_urls.dart';

void main() {
  setUp(SeenMediaUrls.clear);
  tearDown(SeenMediaUrls.clear);

  group('keyOf', () {
    test('keeps urls without a query unchanged', () {
      expect(
        SeenMediaUrls.keyOf('https://media.test/a.webp'),
        'https://media.test/a.webp',
      );
    });

    test('strips signed parameters and keeps the rest in order', () {
      expect(
        SeenMediaUrls.keyOf(
          'https://media.test/a.webp?width=200&mt=abc&height=100&ex=1&is=2&hm=3',
        ),
        'https://media.test/a.webp?width=200&height=100',
      );
    });

    test('drops the query entirely when only signed parameters remain', () {
      expect(
        SeenMediaUrls.keyOf(
          'https://cdn.test/a.png?X-Amz-Signature=s&X-Amz-Date=d&Expires=1#frag',
        ),
        'https://cdn.test/a.png',
      );
    });

    test('matches urls that differ only by their signature', () {
      SeenMediaUrls.mark('https://media.test/a.webp?width=64&mt=first');
      expect(
        SeenMediaUrls.contains('https://media.test/a.webp?width=64&mt=second'),
        isTrue,
      );
      expect(
        SeenMediaUrls.contains('https://media.test/a.webp?width=128&mt=first'),
        isFalse,
      );
    });
  });

  test('ignores empty urls', () {
    SeenMediaUrls.mark('');
    expect(SeenMediaUrls.length, 0);
    expect(SeenMediaUrls.contains(''), isFalse);
  });

  test('evicts the least recently marked url past the limit', () {
    for (int i = 0; i < kSeenMediaUrlsMaxEntries; i++) {
      SeenMediaUrls.mark('https://media.test/$i.webp');
    }
    SeenMediaUrls.mark('https://media.test/0.webp');
    SeenMediaUrls.mark('https://media.test/new.webp');

    expect(SeenMediaUrls.length, kSeenMediaUrlsMaxEntries);
    expect(SeenMediaUrls.contains('https://media.test/0.webp'), isTrue);
    expect(SeenMediaUrls.contains('https://media.test/1.webp'), isFalse);
    expect(SeenMediaUrls.contains('https://media.test/new.webp'), isTrue);
  });
}
