import 'package:flutter/foundation.dart';

/// Autocomplete triggers for @mentions, #channels, and colon emoji names.
enum ComposerAutocompleteTriggerKind { emojiReaction, mention, channel, emoji }

@immutable
class ComposerAutocompleteTrigger {
  const ComposerAutocompleteTrigger({
    required this.kind,
    required this.matchStart,
    required this.matchEnd,
    required this.matchedText,
  });

  final ComposerAutocompleteTriggerKind kind;
  final int matchStart;
  final int matchEnd;
  final String matchedText;

  static final RegExp _emojiReaction = RegExp(
    r'^\s*\+:([a-z0-9_+-]*):?$',
    caseSensitive: false,
  );
  // Role and display names may contain spaces (e.g. "@Android Alpha").
  static final RegExp _mention = RegExp(r'(^|\s)@([^@\n]*)$');
  static final RegExp _channel = RegExp(r'(^|\s)#(\S*)$');
  static final RegExp _emoji = RegExp(
    r'(^|\s):([a-z0-9_+-]{2,})$',
    caseSensitive: false,
  );

  /// Odd number of ``` fences before [caretIndex] in [fullText] suppresses
  /// autocomplete.
  static bool hasOpenCodeBlockBeforeCaret(String fullText, int caretIndex) {
    final int end = caretIndex < 0
        ? 0
        : (caretIndex > fullText.length ? fullText.length : caretIndex);
    final String prefix = fullText.substring(0, end);
    final RegExp fence = RegExp('```');
    final int count = fence.allMatches(prefix).length;
    return count.isOdd;
  }

  /// Start index of the trigger character (@, #, or :) within a match whose
  /// first group is optional leading whitespace.
  static int _triggerCharStart(RegExpMatch m) {
    final String? leading = m.group(1);
    if (leading == null || leading.isEmpty) {
      return m.start;
    }
    return m.start + leading.length;
  }

  static ComposerAutocompleteTrigger? detect(String textUpToCursor) {
    if (textUpToCursor.isEmpty) {
      return null;
    }
    RegExpMatch? m;

    m = _emojiReaction.firstMatch(textUpToCursor);
    if (m != null) {
      return ComposerAutocompleteTrigger(
        kind: ComposerAutocompleteTriggerKind.emojiReaction,
        matchStart: m.start,
        matchEnd: m.end,
        matchedText: m.group(1) ?? '',
      );
    }

    m = _mention.firstMatch(textUpToCursor);
    if (m != null) {
      return ComposerAutocompleteTrigger(
        kind: ComposerAutocompleteTriggerKind.mention,
        matchStart: _triggerCharStart(m),
        matchEnd: m.end,
        matchedText: m.group(2) ?? '',
      );
    }

    m = _channel.firstMatch(textUpToCursor);
    if (m != null) {
      return ComposerAutocompleteTrigger(
        kind: ComposerAutocompleteTriggerKind.channel,
        matchStart: _triggerCharStart(m),
        matchEnd: m.end,
        matchedText: m.group(2) ?? '',
      );
    }

    m = _emoji.firstMatch(textUpToCursor);
    if (m != null) {
      final String namePart = m.group(2) ?? '';
      if (namePart.length < 2) {
        return null;
      }
      return ComposerAutocompleteTrigger(
        kind: ComposerAutocompleteTriggerKind.emoji,
        matchStart: _triggerCharStart(m),
        matchEnd: m.end,
        matchedText: namePart,
      );
    }

    return null;
  }

  static ComposerAutocompleteTrigger? detectIfAllowed({
    required String fullText,
    required int caretIndex,
  }) {
    final int end = caretIndex < 0
        ? 0
        : (caretIndex > fullText.length ? fullText.length : caretIndex);
    if (hasOpenCodeBlockBeforeCaret(fullText, end)) {
      return null;
    }
    final String upTo = fullText.substring(0, end);
    return detect(upTo);
  }
}
