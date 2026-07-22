import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_features.dart';
import 'package:fluxer_markdown/src/parsing/fenced_code_block_utils.dart';
import 'package:fluxer_markdown/src/parsing/fluxer_text_unescape.dart';
import 'package:fluxer_markdown/src/parsing/markdown_parse_cache.dart';
import 'package:fluxer_markdown/src/syntaxes/fluxer_markdown_syntaxes.dart';

sealed class FluxerMarkdownSegment {}

final class FluxerTextSegment extends FluxerMarkdownSegment {
  FluxerTextSegment(this.text);
  final String text;
}

final class FluxerAlertSegment extends FluxerMarkdownSegment {
  FluxerAlertSegment({required this.type, required this.body});
  final FluxerAlertType type;
  final String body;
}

final class FluxerSubtextSegment extends FluxerMarkdownSegment {
  FluxerSubtextSegment(this.text);
  final String text;
}

final class FluxerBlockSpoilerSegment extends FluxerMarkdownSegment {
  FluxerBlockSpoilerSegment(this.text);
  final String text;
}

final MarkdownParseCache<(String, FluxerMarkdownFeatures), String>
_preprocessCache =
    MarkdownParseCache<(String, FluxerMarkdownFeatures), String>();

String preprocessFluxerMarkdown(String text, FluxerMarkdownFeatures features) {
  return _preprocessCache.resolve((
    text,
    features,
  ), () => _preprocessFluxerMarkdownUncached(text, features));
}

String _preprocessFluxerMarkdownUncached(
  String text,
  FluxerMarkdownFeatures features,
) {
  final normalizedText = normalizeFencedCodeBlockInlineClosers(
    text,
    allowCodeBlocks: features.allowCodeBlocks,
  );
  final lines = normalizedText.split('\n');
  final output = <String>[];

  for (final line in lines) {
    var next = _normalizeSpacedInlineMarkdown(line);
    next = _preserveAsciiArtBackslashUnderscores(next);
    next = _neutralizeInvalidMaskedLinks(next);
    next = _escapeEmptyInlineFormatting(next);

    if (!features.allowSubtext && next.startsWith('-# ')) {
      next = '\\$next';
    }
    if (!features.allowHeadings && RegExp(r'^\s{0,3}#{1,6}\s').hasMatch(next)) {
      next = '\\$next';
    }
    if (!features.allowLists &&
        RegExp(r'^\s{0,3}([-+*]|\d+\.)\s').hasMatch(next)) {
      next = '\\$next';
    }
    if (features.allowLists && RegExp(r'^\s{0,3}\d+\\\.\s').hasMatch(next)) {
      next = next.replaceFirst(r'\', r'\\');
    }
    if (!features.allowBlockquotes && RegExp(r'^\s{0,3}>').hasMatch(next)) {
      next = '\\$next';
    }
    if (!features.allowMultilineBlockquotes &&
        RegExp(r'^\s{0,3}>>>').hasMatch(next)) {
      next = '\\$next';
    }
    if (!features.allowTables && next.contains('|')) {
      next = next.replaceAllMapped(RegExp(r'(?<!\|)\|(?!\|)'), (_) => r'\|');
    }
    if (!features.allowCodeBlocks && RegExp(r'^\s{0,3}```').hasMatch(next)) {
      next = '\\$next';
    }

    output.add(unescapeFluxerMarkdownLine(next));
  }

  return output.join('\n');
}

String _neutralizeInvalidMaskedLinks(String line) {
  return line.replaceAllMapped(RegExp(r'\[([^\]]*)\]\(([^)]+)\)'), (
    Match match,
  ) {
    final String text = match.group(1) ?? '';
    final String url = match.group(2) ?? '';
    if (blankMarkdownLinkLabelPattern.hasMatch(text) ||
        hasApostropheInMaskedLinkAuthority(url)) {
      final String escapedUrl = url.replaceAll(':', r'\:');
      return r'\[' + text + r'\]\(' + escapedUrl + r'\)';
    }
    return match.group(0)!;
  });
}

String _escapeEmptyInlineFormatting(String text) {
  const Map<String, String> replacements = <String, String>{
    '` `': r'\` \`',
    '`` ``': r'\`\` \`\`',
    '** **': r'\*\* \*\*',
    '__ __': r'\_\_ \_\_',
    '~~ ~~': r'\~\~ \~\~',
    '|| ||': r'\|\| \|\|',
  };
  var current = text;
  for (final MapEntry<String, String> entry in replacements.entries) {
    current = current.replaceAll(entry.key, entry.value);
  }
  return current;
}

String _preserveAsciiArtBackslashUnderscores(String text) {
  return text.replaceAllMapped(
    RegExp(r'(?<=[^\w*])\\(?!\\)_(?=[^\w*])'),
    (_) => r'\\\_',
  );
}

String _normalizeSpacedInlineMarkdown(String text) {
  var current = text;

  for (final marker in const ['***', '___', '**', '__', '~~', '*', '_']) {
    current = _trimInlineMarkerSpacing(current, marker);
  }

  return current;
}

String _trimInlineMarkerSpacing(String text, String marker) {
  final markerChar = RegExp.escape(marker[0]);
  final escapedMarker = RegExp.escape(marker);
  final pattern = RegExp(
    r'(^|\s)'
    '(?<!\\\\)(?<!$markerChar)$escapedMarker(?!$markerChar)'
    r'(\s+)'
    r'([^\n]+?)'
    r'(\s+)'
    '(?<!$markerChar)$escapedMarker(?!$markerChar)'
    r'(?=\s|$|[`~!.,:;?)}\]])',
  );

  return text.replaceAllMapped(pattern, (match) {
    final prefix = match.group(1) ?? '';
    final content = match.group(3);
    if (content == null || content.isEmpty) {
      return match.group(0)!;
    }
    return '$prefix$marker$content$marker';
  });
}

bool _hasVisibleContent(String value) {
  for (final int codeUnit in value.runes) {
    if (codeUnit != 0x20 &&
        codeUnit != 0x09 &&
        codeUnit != 0x0A &&
        codeUnit != 0x0D &&
        codeUnit != 0x200E) {
      return true;
    }
  }
  return false;
}

bool isBlockSpoilerStart(String line) {
  final String trimmed = line.trimLeft();
  if (!trimmed.startsWith('||')) {
    return false;
  }
  return !trimmed.substring(2).contains('||');
}

int? parseBlockSpoilerEnd(List<String> lines, int startIndex) {
  for (var index = startIndex + 1; index < lines.length; index++) {
    final String line = lines[index];
    final int closeIndex = line.indexOf('||');
    if (closeIndex != -1) {
      return index;
    }
  }
  return null;
}

String parseBlockSpoilerBody(List<String> lines, int startIndex, int endIndex) {
  final List<String> bodyLines = <String>[];
  final String firstLine = lines[startIndex];
  final int firstStart = firstLine.indexOf('||');
  if (firstStart != -1) {
    final String firstContent = firstLine.substring(firstStart + 2);
    if (firstContent.isNotEmpty) {
      bodyLines.add(firstContent);
    }
  }
  for (var index = startIndex + 1; index < endIndex; index++) {
    bodyLines.add(lines[index]);
  }
  final String lastLine = lines[endIndex];
  final int closeIndex = lastLine.indexOf('||');
  if (closeIndex > 0) {
    bodyLines.add(lastLine.substring(0, closeIndex));
  }
  return bodyLines.join('\n').trim();
}

final MarkdownParseCache<
  (String, FluxerMarkdownFeatures),
  List<FluxerMarkdownSegment>
>
_segmentCache =
    MarkdownParseCache<
      (String, FluxerMarkdownFeatures),
      List<FluxerMarkdownSegment>
    >();

List<FluxerMarkdownSegment> parseFluxerMarkdownSegments(
  String text,
  FluxerMarkdownFeatures features,
) {
  return _segmentCache.resolve((
    text,
    features,
  ), () => _parseFluxerMarkdownSegmentsUncached(text, features));
}

List<FluxerMarkdownSegment> _parseFluxerMarkdownSegmentsUncached(
  String text,
  FluxerMarkdownFeatures features,
) {
  final openRe = RegExp(
    r'^>\s*\[!(NOTE|TIP|IMPORTANT|WARNING|CAUTION)\]\s*(.*)',
    caseSensitive: false,
  );
  final lineRe = RegExp(r'^>\s?(.*)$');
  final subtextRe = RegExp(r'^-#\s+(.*)$');

  final lines = text.split('\n');
  final segments = <FluxerMarkdownSegment>[];
  final mdBuffer = StringBuffer();

  final _FencedCodeBlockTracker codeBlockTracker = _FencedCodeBlockTracker();
  int i = 0;
  while (i < lines.length) {
    final line = lines[i];
    final wasInsideCodeBlock = codeBlockTracker.inside;
    if (features.allowCodeBlocks) {
      codeBlockTracker.onLine(line);
    }
    if (wasInsideCodeBlock || codeBlockTracker.inside) {
      mdBuffer.writeln(line);
      i++;
      continue;
    }

    if (features.allowSpoilers && isBlockSpoilerStart(line)) {
      final int? endIndex = parseBlockSpoilerEnd(lines, i);
      if (endIndex != null) {
        final pending = mdBuffer.toString().trim();
        if (pending.isNotEmpty) {
          segments.add(FluxerTextSegment(pending));
          mdBuffer.clear();
        }
        final String body = parseBlockSpoilerBody(lines, i, endIndex);
        if (_hasVisibleContent(body)) {
          segments.add(FluxerBlockSpoilerSegment(body));
        } else {
          mdBuffer.writeln(lines.sublist(i, endIndex + 1).join('\n'));
        }
        i = endIndex + 1;
        continue;
      }
    }

    if (features.allowSubtext) {
      final subtextMatch = subtextRe.firstMatch(line);
      if (subtextMatch != null) {
        final String body = (subtextMatch.group(1) ?? '').trim();
        if (!_hasVisibleContent(body)) {
          mdBuffer.writeln(line);
          i++;
          continue;
        }
        final pending = mdBuffer.toString().trim();
        if (pending.isNotEmpty) {
          segments.add(FluxerTextSegment(pending));
          mdBuffer.clear();
        }

        final bodyLines = <String>[body];
        i++;
        while (i < lines.length) {
          final nextSubtextMatch = subtextRe.firstMatch(lines[i]);
          if (nextSubtextMatch == null) {
            break;
          }
          final String nextBody = (nextSubtextMatch.group(1) ?? '').trim();
          if (!_hasVisibleContent(nextBody)) {
            break;
          }
          bodyLines.add(nextBody);
          i++;
        }

        segments.add(FluxerSubtextSegment(bodyLines.join('\n').trim()));
        continue;
      }
    }

    if (features.allowAlerts) {
      final match = openRe.firstMatch(line);
      if (match != null) {
        final pending = mdBuffer.toString().trim();
        if (pending.isNotEmpty) {
          segments.add(FluxerTextSegment(pending));
          mdBuffer.clear();
        }

        final rawType = match.group(1)!;
        final type = tryParseFluxerAlertType(rawType);
        if (type == null) {
          mdBuffer.writeln(line);
          i++;
          continue;
        }

        final inlineText = (match.group(2) ?? '').trim();
        i++;

        final bodyLines = <String>[];
        if (inlineText.isNotEmpty) {
          bodyLines.add(inlineText);
        }
        while (i < lines.length) {
          final bodyMatch = lineRe.firstMatch(lines[i]);
          if (bodyMatch == null) {
            break;
          }
          bodyLines.add(bodyMatch.group(1) ?? '');
          i++;
        }

        segments.add(
          FluxerAlertSegment(type: type, body: bodyLines.join('\n').trim()),
        );
        continue;
      }
    }

    mdBuffer.writeln(line);
    i++;
  }

  final remaining = mdBuffer.toString().trim();
  if (remaining.isNotEmpty) {
    segments.add(FluxerTextSegment(remaining));
  }

  return segments;
}

class _FencedCodeBlockTracker {
  bool inside = false;
  int? _fenceLength;

  void onLine(String line) {
    final String trimmedLeft = line.trimLeft();
    if (!inside) {
      final int? openingLength = parseOpeningBacktickFenceLength(trimmedLeft);
      if (openingLength != null) {
        inside = true;
        _fenceLength = openingLength;
      }
      return;
    }
    if (lineClosesBacktickFence(line, _fenceLength!)) {
      inside = false;
      _fenceLength = null;
    }
  }
}
