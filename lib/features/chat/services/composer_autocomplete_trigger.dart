import 'package:flutter/foundation.dart';

/// Autocomplete triggers for composer typeahead.
enum ComposerAutocompleteTriggerKind {
  emojiReaction,
  commandArgMention,
  commandArg,
  mention,
  channel,
  emoji,
  meme,
  gif,
  sticker,
  command,
}

@immutable
class ComposerAutocompleteTrigger {
  const ComposerAutocompleteTrigger({
    required this.kind,
    required this.matchStart,
    required this.matchEnd,
    required this.matchedText,
    this.commandName,
  });

  final ComposerAutocompleteTriggerKind kind;
  final int matchStart;
  final int matchEnd;
  final String matchedText;
  final String? commandName;

  static final RegExp _emojiReaction = RegExp(
    r'^\s*\+:([a-z0-9_+-]*):?$',
    caseSensitive: false,
  );
  static final RegExp _commandArgMention = RegExp(
    r'(^\s*)/(kick|ban|msg|saved)\s+@(\S*)$',
    caseSensitive: false,
  );
  static final RegExp _commandArg = RegExp(
    r'(^\s*)/(kick|ban|msg)\s+(\S*)$',
    caseSensitive: false,
  );
  static final RegExp _mention = RegExp(r'(^|[\s\uE000-\uF8FF])@(\S*)$');
  static final RegExp _channel = RegExp(r'(^|\s)#(\S*)$');
  static final RegExp _emoji = RegExp(
    r'(^|\s):([a-z0-9_+-]{2,})$',
    caseSensitive: false,
  );
  static final RegExp _memeSearch = RegExp(r'(^\s*)/saved\s*(.*)$');
  static final RegExp _gifSearch = RegExp(r'(^\s*)/(gif|klipy)\s*(.*)$');
  static final RegExp _stickerSearch = RegExp(r'(^\s*)/sticker\s*(.*)$');
  static final RegExp _command = RegExp(r'(^\s*)/(\S*)$');

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

    m = _commandArgMention.firstMatch(textUpToCursor);
    if (m != null) {
      return ComposerAutocompleteTrigger(
        kind: ComposerAutocompleteTriggerKind.commandArgMention,
        matchStart: _triggerCharStart(m),
        matchEnd: m.end,
        matchedText: m.group(3) ?? '',
        commandName: m.group(2),
      );
    }

    m = _commandArg.firstMatch(textUpToCursor);
    if (m != null) {
      return ComposerAutocompleteTrigger(
        kind: ComposerAutocompleteTriggerKind.commandArg,
        matchStart: _triggerCharStart(m),
        matchEnd: m.end,
        matchedText: m.group(3) ?? '',
        commandName: m.group(2),
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

    m = _memeSearch.firstMatch(textUpToCursor);
    if (m != null) {
      return ComposerAutocompleteTrigger(
        kind: ComposerAutocompleteTriggerKind.meme,
        matchStart: _triggerCharStart(m),
        matchEnd: m.end,
        matchedText: m.group(2) ?? '',
      );
    }

    m = _gifSearch.firstMatch(textUpToCursor);
    if (m != null) {
      return ComposerAutocompleteTrigger(
        kind: ComposerAutocompleteTriggerKind.gif,
        matchStart: _triggerCharStart(m),
        matchEnd: m.end,
        matchedText: m.group(3) ?? '',
      );
    }

    m = _stickerSearch.firstMatch(textUpToCursor);
    if (m != null) {
      return ComposerAutocompleteTrigger(
        kind: ComposerAutocompleteTriggerKind.sticker,
        matchStart: _triggerCharStart(m),
        matchEnd: m.end,
        matchedText: m.group(2) ?? '',
      );
    }

    m = _command.firstMatch(textUpToCursor);
    if (m != null) {
      return ComposerAutocompleteTrigger(
        kind: ComposerAutocompleteTriggerKind.command,
        matchStart: _triggerCharStart(m),
        matchEnd: m.end,
        matchedText: m.group(2) ?? '',
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
