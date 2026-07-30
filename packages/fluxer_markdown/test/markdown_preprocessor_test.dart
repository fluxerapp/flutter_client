import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_features.dart';
import 'package:fluxer_markdown/src/parsing/markdown_preprocessor.dart';
import 'package:markdown/markdown.dart' as md;

void main() {
  final FluxerMarkdownFeatures features = FluxerMarkdownFeatures.forContext(
    FluxerMarkdownContext.standardWithJumbo,
  );

  group('preprocessFluxerMarkdown ascii-art backslash underscores', () {
    test('doubles backslash before underscore in shrug', () {
      const String input = r'¯\_(ツ)_/¯';
      final String output = preprocessFluxerMarkdown(input, features);
      expect(output, r'¯\\\_(ツ)_/¯');
    });

    test('leaves word-internal backslash underscore unchanged', () {
      const String input = r'hello\_world';
      final String output = preprocessFluxerMarkdown(input, features);
      expect(output, input);
    });

    test('does not triple-escape already doubled backslash underscore', () {
      const String input = r'\\_';
      final String output = preprocessFluxerMarkdown(input, features);
      expect(output, input);
    });

    test('doubles backslash before underscore in kaomoji', () {
      const String input = r'ヽ\_ノ';
      final String output = preprocessFluxerMarkdown(input, features);
      expect(output, r'ヽ\\\_ノ');
    });
  });

  group('preprocessFluxerMarkdown pipe escaping without tables', () {
    final FluxerMarkdownFeatures bioFeatures =
        FluxerMarkdownFeatures.forContext(
          FluxerMarkdownContext.restrictedUserBio,
        );

    test('preserves spoiler delimiters in user bio', () {
      const String input = '||spoilered text||';
      final String output = preprocessFluxerMarkdown(input, bioFeatures);
      expect(output, input);
    });

    test('escapes table pipes but keeps spoiler delimiters', () {
      const String input = '| not a table | and ||spoiler||';
      final String output = preprocessFluxerMarkdown(input, bioFeatures);
      expect(output, r'\| not a table \| and ||spoiler||');
    });
  });

  group('preprocessFluxerMarkdown markdown parse integration', () {
    test('shrug renders with visible left arm after parse', () {
      const String input = r'¯\_(ツ)_/¯';
      final String processed = preprocessFluxerMarkdown(input, features);
      final md.Document document = md.Document(encodeHtml: false);
      final List<md.Node> nodes = document.parse(processed);
      expect(_collectMarkdownText(nodes), input);
    });
  });

  group('preprocessFluxerMarkdown inline fenced code block closers', () {
    test('splits single-line block with adjacent closing fence', () {
      const String input = '```dart\nvoid main() {}```';
      final String output = preprocessFluxerMarkdown(input, features);
      expect(output, '```dart\nvoid main() {}\n```');
    });

    test(
      'splits multi-line block when only last line has adjacent closing fence',
      () {
        const String input = '```\nline one\nline two```';
        final String output = preprocessFluxerMarkdown(input, features);
        expect(output, '```\nline one\nline two\n```');
      },
    );

    test('splits at trailing fence when content contains backticks', () {
      const String input = '```\nprint("``")```';
      final String output = preprocessFluxerMarkdown(input, features);
      expect(output, '```\nprint("``")\n```');
    });

    test('leaves normal closing fence on its own line unchanged', () {
      const String input = '```dart\nvoid main() {}\n```';
      final String output = preprocessFluxerMarkdown(input, features);
      expect(output, input);
    });

    test('leaves unclosed code blocks unchanged', () {
      const String input = '```dart\nvoid main() {}';
      final String output = preprocessFluxerMarkdown(input, features);
      expect(output, input);
    });

    test(
      'moves same-line trailing text after closing fence to its own line',
      () {
        const String input = '```dart\ncode``` after';
        final String output = preprocessFluxerMarkdown(input, features);
        expect(output, '```dart\ncode\n```\n after');
      },
    );
  });

  group('parseFluxerMarkdownSegments fenced code blocks', () {
    test('does not extract alerts from inside a code block', () {
      const String input = '''
```
> [!NOTE]
Alert syntax stays literal
```''';
      final List<FluxerMarkdownSegment> segments = parseFluxerMarkdownSegments(
        input,
        features,
      );
      expect(segments.length, 1);
      expect(segments.first, isA<FluxerTextSegment>());
      expect((segments.first as FluxerTextSegment).text, input);
    });

    test('does not extract subtext from inside a code block', () {
      const String input = '''
```
-# not subtext
```''';
      final List<FluxerMarkdownSegment> segments = parseFluxerMarkdownSegments(
        input,
        features,
      );
      expect(segments.length, 1);
      expect(segments.first, isA<FluxerTextSegment>());
      expect((segments.first as FluxerTextSegment).text, input);
    });

    test('still extracts alerts outside code blocks', () {
      const String input = '''
```
code
```

> [!NOTE]
> Outside alert''';
      final List<FluxerMarkdownSegment> segments = parseFluxerMarkdownSegments(
        input,
        features,
      );
      expect(segments.length, 2);
      expect(segments.first, isA<FluxerTextSegment>());
      expect(segments.last, isA<FluxerAlertSegment>());
      final FluxerAlertSegment alert = segments.last as FluxerAlertSegment;
      expect(alert.type, FluxerAlertType.note);
      expect(alert.body, 'Outside alert');
    });
  });
}

String _collectMarkdownText(List<md.Node> nodes) {
  final StringBuffer buffer = StringBuffer();
  for (final md.Node node in nodes) {
    if (node is md.Text) {
      buffer.write(node.text);
    } else if (node is md.Element) {
      buffer.write(_collectMarkdownText(node.children ?? const []));
    }
  }
  return buffer.toString();
}
