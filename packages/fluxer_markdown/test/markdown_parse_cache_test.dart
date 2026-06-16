import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_features.dart';
import 'package:fluxer_markdown/src/parsing/markdown_parse_cache.dart';
import 'package:fluxer_markdown/src/parsing/markdown_preprocessor.dart';

void main() {
  group('MarkdownParseCache', () {
    test('computes once and returns identical value on hit', () {
      final cache = MarkdownParseCache<String, List<int>>();
      var computeCount = 0;
      final first = cache.resolve('a', () {
        computeCount++;
        return <int>[1, 2, 3];
      });
      final second = cache.resolve('a', () {
        computeCount++;
        return <int>[9, 9, 9];
      });
      expect(computeCount, 1);
      expect(identical(first, second), isTrue);
    });

    test('evicts the eldest entry when over capacity', () {
      final cache = MarkdownParseCache<String, List<int>>(maxEntries: 2);
      var aComputes = 0;
      List<int> resolveA() => cache.resolve('a', () {
        aComputes++;
        return <int>[aComputes];
      });

      resolveA(); // a inserted (eldest)
      cache
        ..resolve('b', () => <int>[0])
        ..resolve('c', () => <int>[0]); // overflow -> evicts 'a'
      resolveA(); // recomputed

      expect(aComputes, 2);
    });

    test('hit moves entry to most-recent so it survives later overflow', () {
      final cache = MarkdownParseCache<String, List<int>>(maxEntries: 2);
      var aComputes = 0;
      List<int> resolveA() => cache.resolve('a', () {
        aComputes++;
        return <int>[aComputes];
      });

      resolveA(); // a (eldest)
      cache.resolve('b', () => <int>[0]); // b
      resolveA(); // hit -> a becomes most-recent, b now eldest
      cache.resolve('c', () => <int>[0]); // overflow -> evicts b, keeps a
      resolveA(); // still cached

      expect(aComputes, 1);
    });
  });

  group('FluxerMarkdownFeatures value equality', () {
    test('two forContext results for the same context are equal', () {
      final a = FluxerMarkdownFeatures.forContext(
        FluxerMarkdownContext.standardWithJumbo,
      );
      final b = FluxerMarkdownFeatures.forContext(
        FluxerMarkdownContext.standardWithJumbo,
      );
      expect(a, equals(b));
      expect(a.hashCode, equals(b.hashCode));
    });

    test('different contexts are not equal', () {
      final a = FluxerMarkdownFeatures.forContext(
        FluxerMarkdownContext.standardWithJumbo,
      );
      final b = FluxerMarkdownFeatures.forContext(
        FluxerMarkdownContext.restrictedUserBio,
      );
      expect(a, isNot(equals(b)));
    });
  });

  group('wired parse caches', () {
    test('parseFluxerMarkdownSegments returns identical list on cache hit', () {
      final features = FluxerMarkdownFeatures.forContext(
        FluxerMarkdownContext.standardWithJumbo,
      );
      const text = '> [!NOTE]\n> hello world';
      final first = parseFluxerMarkdownSegments(text, features);
      final second = parseFluxerMarkdownSegments(text, features);
      expect(identical(first, second), isTrue);
    });

    test('preprocessFluxerMarkdown is stable across calls', () {
      final features = FluxerMarkdownFeatures.forContext(
        FluxerMarkdownContext.standardWithJumbo,
      );
      const input = r'¯\_(ツ)_/¯';
      final first = preprocessFluxerMarkdown(input, features);
      final second = preprocessFluxerMarkdown(input, features);
      expect(first, second);
      expect(identical(first, second), isTrue);
    });
  });
}
