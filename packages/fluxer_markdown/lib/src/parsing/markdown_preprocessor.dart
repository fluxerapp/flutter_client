import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_features.dart';
import 'package:fluxer_markdown/src/parsing/markdown_parse_cache.dart';

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
  final lines = text.split('\n');
  final output = <String>[];

  for (final line in lines) {
    var next = _normalizeSpacedInlineMarkdown(line);
    next = _preserveAsciiArtBackslashUnderscores(next);

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
    if (!features.allowBlockquotes && RegExp(r'^\s{0,3}>').hasMatch(next)) {
      next = '\\$next';
    }
    if (!features.allowTables && next.contains('|')) {
      next = next.replaceAllMapped(RegExp(r'(?<!\|)\|(?!\|)'), (_) => r'\|');
    }
    if (!features.allowCodeBlocks && RegExp(r'^\s{0,3}```').hasMatch(next)) {
      next = '\\$next';
    }

    output.add(next);
  }

  return output.join('\n');
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

  int i = 0;
  while (i < lines.length) {
    if (features.allowSubtext) {
      final subtextMatch = subtextRe.firstMatch(lines[i]);
      if (subtextMatch != null) {
        final pending = mdBuffer.toString().trim();
        if (pending.isNotEmpty) {
          segments.add(FluxerTextSegment(pending));
          mdBuffer.clear();
        }

        final bodyLines = <String>[subtextMatch.group(1) ?? ''];
        i++;
        while (i < lines.length) {
          final nextSubtextMatch = subtextRe.firstMatch(lines[i]);
          if (nextSubtextMatch == null) {
            break;
          }
          bodyLines.add(nextSubtextMatch.group(1) ?? '');
          i++;
        }

        segments.add(FluxerSubtextSegment(bodyLines.join('\n').trim()));
        continue;
      }
    }

    if (features.allowAlerts) {
      final match = openRe.firstMatch(lines[i]);
      if (match != null) {
        final pending = mdBuffer.toString().trim();
        if (pending.isNotEmpty) {
          segments.add(FluxerTextSegment(pending));
          mdBuffer.clear();
        }

        final rawType = match.group(1)!;
        final type = tryParseFluxerAlertType(rawType);
        if (type == null) {
          mdBuffer.writeln(lines[i]);
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

    mdBuffer.writeln(lines[i]);
    i++;
  }

  final remaining = mdBuffer.toString().trim();
  if (remaining.isNotEmpty) {
    segments.add(FluxerTextSegment(remaining));
  }

  return segments;
}
