import 'dart:convert';

import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:fluxer_app/shared/utils/emoji_utils.dart';

const Set<String> _plaintextSymbols = {
  '\u2122',
  '\u2122\uFE0F',
  '\u00A9',
  '\u00A9\uFE0F',
  '\u00AE',
  '\u00AE\uFE0F',
};

const Set<String> _specialShortcodes = {'tm', 'copyright', 'registered'};

final RegExp _shortcodePattern = RegExp(r':([\p{L}\p{N}_-]+):', unicode: true);

/// Mirrors the web client's `buildEmojiContext`: newline-joined `S`/`C`/`K`
/// records with UTF-8 byte offsets, consumed by the native parser's
/// `EmojiContext` (rust/src/emoji.rs).
String buildFluxerEmojiContextTsv(String input) {
  final buffer = StringBuffer();
  _appendStandardRecords(buffer, input);
  _appendShortcodeRecords(buffer, input);
  return buffer.toString();
}

void _appendStandardRecords(StringBuffer buffer, String input) {
  final RegExp? emojiPattern = EmojiRegistry.unicodeEmojiRegexSync;
  if (emojiPattern == null) {
    return;
  }
  var utf16Cursor = 0;
  var byteCursor = 0;
  for (final Match match in emojiPattern.allMatches(input)) {
    final String candidate = match.group(0)!;
    byteCursor += utf8.encode(input.substring(utf16Cursor, match.start)).length;
    utf16Cursor = match.start;
    if (!_plaintextSymbols.contains(candidate)) {
      final EmojiEntry? entry =
          EmojiRegistry.entryBySurrogates(candidate) ??
          EmojiRegistry.entryBySurrogates(_stripTrailingVs16(candidate));
      if (entry != null) {
        final int byteLength = utf8.encode(candidate).length;
        buffer.writeln(
          [
            'S',
            '$byteCursor',
            '$byteLength',
            candidate,
            entry.primaryName,
            emojiToCodePoints(candidate),
          ].join('\t'),
        );
      }
    }
  }
}

void _appendShortcodeRecords(StringBuffer buffer, String input) {
  final seen = <String>{};
  for (final Match match in _shortcodePattern.allMatches(input)) {
    final String name = match.group(1)!;
    if (_specialShortcodes.contains(name)) {
      continue;
    }
    if (seen.add('C:$name')) {
      final String? raw = EmojiRegistry.resolveSync(name);
      if (raw != null) {
        buffer.writeln(
          ['C', name, raw, emojiToCodePoints(raw)].join('\t'),
        );
      }
    }
    for (var tone = 1; tone <= 5; tone++) {
      if (!seen.add('K:$name:$tone')) {
        continue;
      }
      final String? raw = EmojiRegistry.resolveSync('$name::skin-tone-$tone');
      if (raw != null) {
        buffer.writeln(
          ['K', name, '$tone', raw, emojiToCodePoints(raw)].join('\t'),
        );
      }
    }
  }
}

String _stripTrailingVs16(String candidate) =>
    candidate.endsWith('\uFE0F')
    ? candidate.substring(0, candidate.length - 1)
    : candidate;
