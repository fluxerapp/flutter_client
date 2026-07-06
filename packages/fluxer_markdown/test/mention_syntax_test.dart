import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/syntaxes/fluxer_markdown_syntaxes.dart';
import 'support/markdown_parse_test_helper.dart';

void main() {
  final features = MarkdownParseTestHelper.featuresFor(
    FluxerMarkdownContext.standardWithJumbo,
  );

  group('mention syntax', () {
    test('parses user mention with ping variant', () {
      final nodes = MarkdownParseTestHelper.parseInline('<@!123>', features);
      expect(
        MarkdownParseTestHelper.containsTag(nodes, FluxerUserMentionSyntax.tag),
        isTrue,
      );
    });

    test('parses channel mention', () {
      final nodes = MarkdownParseTestHelper.parseInline('<#456>', features);
      expect(
        MarkdownParseTestHelper.containsTag(
          nodes,
          FluxerChannelMentionSyntax.tag,
        ),
        isTrue,
      );
    });

    test('parses role mention', () {
      final nodes = MarkdownParseTestHelper.parseInline('<@&789>', features);
      expect(
        MarkdownParseTestHelper.containsTag(nodes, FluxerRoleMentionSyntax.tag),
        isTrue,
      );
    });

    test('parses everyone and here mentions', () {
      final nodes = MarkdownParseTestHelper.parseInline(
        '@everyone @here',
        features,
      );
      expect(
        MarkdownParseTestHelper.containsTag(
          nodes,
          FluxerEveryoneMentionSyntax.tag,
        ),
        isTrue,
      );
    });

    test('parses command mention', () {
      final nodes = MarkdownParseTestHelper.parseInline(
        '</ping:123456789012345678>',
        features,
      );
      expect(
        MarkdownParseTestHelper.containsTag(
          nodes,
          FluxerCommandMentionSyntax.tag,
        ),
        isTrue,
      );
    });

    test('parses guild navigation tokens', () {
      final nodes = MarkdownParseTestHelper.parseInline(
        '<id:customize> <id:linked-roles:99>',
        features,
      );
      expect(
        MarkdownParseTestHelper.containsTag(
          nodes,
          FluxerGuildNavigationSyntax.tag,
        ),
        isTrue,
      );
    });

    test('mention inside spoiler still parses', () {
      final nodes = MarkdownParseTestHelper.parseInline('||<@123>||', features);
      expect(MarkdownParseTestHelper.containsTag(nodes, 'spoiler'), isTrue);
      expect(
        MarkdownParseTestHelper.containsTag(nodes, FluxerUserMentionSyntax.tag),
        isTrue,
      );
    });
  });
}
