import 'package:fluxer_markdown/src/parsing/fluxer_code_fence_language.dart';
import 'package:markdown/markdown.dart' as md;

class FluxerFencedCodeBlockSyntax extends md.BlockSyntax {
  const FluxerFencedCodeBlockSyntax();

  static final RegExp _pattern = RegExp(r'^( {0,3})(`{3,})(.*)$');

  @override
  RegExp get pattern => _pattern;

  @override
  bool canParse(md.BlockParser parser) {
    return _pattern.hasMatch(parser.current.content);
  }

  @override
  md.Node parse(md.BlockParser parser) {
    final Match match = _pattern.firstMatch(parser.current.content)!;
    final String fence = match.group(2)!;
    final String info = match.group(3) ?? '';
    final int fenceLength = fence.length;
    final String closingFence = '`' * fenceLength;

    final int? inlineClose = _findInlineClosingFence(info, closingFence);
    if (inlineClose != null) {
      final String inlineContent = info.substring(0, inlineClose);
      if (!_hasVisibleContent(inlineContent)) {
        return md.Element.text('p', parser.current.content);
      }
      parser.advance();
      return md.Element('pre', <md.Node>[
        md.Element('code', <md.Node>[md.Text(inlineContent)]),
      ]);
    }

    final String? language = parseCodeFenceLanguage(info);
    final StringBuffer content = StringBuffer();
    if (language == null && info.isNotEmpty) {
      content
        ..write(info)
        ..write('\n');
    }
    parser.advance();
    while (!parser.isDone) {
      final String line = parser.current.content;
      final String trimmed = line.trimLeft();
      final int? closeIndex = _findClosingFenceStart(trimmed, closingFence);
      if (closeIndex != null) {
        final int leadingSpaces = line.length - trimmed.length;
        final String prefix = line.substring(0, leadingSpaces + closeIndex);
        if (prefix.trim().isNotEmpty) {
          content
            ..write(prefix.substring(leadingSpaces))
            ..write('\n');
        }
        parser.advance();
        break;
      }
      content
        ..write(line)
        ..write('\n');
      parser.advance();
    }

    if (!_hasVisibleContent(content.toString())) {
      return md.Element.text('p', '```$info\n```');
    }

    final md.Element code = md.Element('code', <md.Node>[
      md.Text(content.toString()),
    ]);
    if (language != null) {
      code.attributes['class'] = 'language-$language';
    }
    return md.Element('pre', <md.Node>[code]);
  }

  int? _findInlineClosingFence(String text, String closingFence) {
    final int index = text.indexOf(closingFence);
    if (index == -1) {
      return null;
    }
    return index;
  }

  int? _findClosingFenceStart(String trimmed, String closingFence) {
    if (trimmed == closingFence) {
      return 0;
    }
    if (trimmed.startsWith(closingFence)) {
      final String trailing = trimmed.substring(closingFence.length);
      if (trailing.trim().isEmpty) {
        return 0;
      }
    }
    final int index = trimmed.indexOf(closingFence);
    if (index == -1) {
      return null;
    }
    return index;
  }

  bool _hasVisibleContent(String value) {
    for (final int codeUnit in value.codeUnits) {
      if (codeUnit != 0x20 &&
          codeUnit != 0x09 &&
          codeUnit != 0x0A &&
          codeUnit != 0x0D) {
        return true;
      }
    }
    return false;
  }
}
