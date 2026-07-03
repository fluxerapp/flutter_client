import 'package:flutter/material.dart';

import 'package:fluxer_app/features/ui/input/emoji_inline_token.dart';

/// A token rendered inline inside an [InlineTokenTextEditingController].
///
/// Each token occupies a single private-use sentinel code unit in the editing
/// text; [buildInline] paints it as a chip while [wireText] is substituted back
/// into the outgoing string by [InlineTokenTextEditingController.toWireText].
abstract class InlineToken {
  /// The outgoing wire representation substituted for the token's sentinel.
  String get wireText;

  /// Builds the inline widget shown in place of the token's sentinel.
  Widget buildInline(BuildContext context, TextStyle? baseStyle);
}

/// A [TextEditingController] that maps single private-use sentinel code units
/// to [InlineToken]s, rendering each as a [WidgetSpan] chip while preserving a
/// plain wire string for sending.
///
/// Sentinels are drawn from the BMP Private Use Area (`U+E000` onward) so they
/// never collide with user-typed characters. Tokens whose sentinel leaves the
/// text are pruned automatically when [value] is assigned.
class InlineTokenTextEditingController extends TextEditingController {
  InlineTokenTextEditingController({super.text});

  final Map<String, InlineToken> _tokens = <String, InlineToken>{};
  int _nextSentinelIndex = 0;

  /// Allocates a fresh sentinel for [token] and returns it.
  ///
  /// Callers splice the returned sentinel into the editing text; the token is
  /// retained until that sentinel is removed.
  String allocateToken(InlineToken token) {
    final int codePoint = 0xE000 + _nextSentinelIndex++;
    assert(codePoint <= 0xF8FF, 'Inline token sentinel pool exhausted.');
    final String sentinel = String.fromCharCode(codePoint);
    _tokens[sentinel] = token;
    return sentinel;
  }

  /// Drops every token and resets the sentinel counter.
  void clearTokens() {
    _tokens.clear();
    _nextSentinelIndex = 0;
  }

  /// The editing text with every sentinel expanded to its
  /// [InlineToken.wireText].
  String toWireText() {
    final StringBuffer buffer = StringBuffer();
    for (final int rune in text.runes) {
      final String char = String.fromCharCode(rune);
      final InlineToken? token = _tokens[char];
      buffer.write(token != null ? token.wireText : char);
    }
    return buffer.toString();
  }

  /// The length of [toWireText] without materializing the string.
  int get wireLength => _wireLengthOf(text.runes);

  @override
  set value(TextEditingValue newValue) {
    super.value = newValue;
    _pruneOrphanTokens(newValue.text);
  }

  void _pruneOrphanTokens(String currentText) {
    if (_tokens.isEmpty) {
      return;
    }
    final Set<String> present = <String>{};
    for (final int rune in currentText.runes) {
      present.add(String.fromCharCode(rune));
    }
    _tokens.removeWhere((String key, _) => !present.contains(key));
  }

  /// Inserts [token] at the caret (or end when the selection is invalid),
  /// padding with single spaces when it would abut non-whitespace.
  ///
  /// A trailing space is ensured when [ensureTrailingSpace] is true.
  /// When [maxWireLength] is set the insertion is
  /// skipped if it would push [wireLength] (including any padding spaces) past
  /// the limit.
  void insertToken(
    InlineToken token, {
    int? maxWireLength,
    bool ensureTrailingSpace = false,
  }) {
    final TextSelection sel = selection;
    final int pos = sel.isValid ? sel.baseOffset : text.length;
    final String before = text.substring(0, pos);
    final String after = text.substring(pos);
    final bool needsLeadingSpace =
        before.isNotEmpty && !_isWhitespace(before[before.length - 1]);
    final bool needsTrailingSpace = ensureTrailingSpace
        ? (after.isEmpty || !_isWhitespace(after[0]))
        : (after.isNotEmpty && !_isWhitespace(after[0]));

    if (maxWireLength != null) {
      final int extraSpaces =
          (needsLeadingSpace ? 1 : 0) + (needsTrailingSpace ? 1 : 0);
      if (wireLength + token.wireText.length + extraSpaces > maxWireLength) {
        return;
      }
    }

    final String sentinel = allocateToken(token);
    final StringBuffer insert = StringBuffer();
    if (needsLeadingSpace) {
      insert.write(' ');
    }
    insert.write(sentinel);
    if (needsTrailingSpace) {
      insert.write(' ');
    }
    final String insertStr = insert.toString();
    final String newText = before + insertStr + after;
    value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: pos + insertStr.length),
    );
  }

  /// Replaces `[start, end)` with [token].
  ///
  /// No leading space is added. A trailing space is ensured when
  /// [ensureTrailingSpace] is true. When [maxWireLength] is set the replacement
  /// is skipped if it would exceed the limit.
  void replaceRangeWithToken(
    int start,
    int end,
    InlineToken token, {
    int? maxWireLength,
    bool ensureTrailingSpace = false,
  }) {
    final int removedLength = _wireLengthOf(text.substring(start, end).runes);
    if (maxWireLength != null &&
        wireLength - removedLength + token.wireText.length > maxWireLength) {
      return;
    }

    final String sentinel = allocateToken(token);
    final String before = text.substring(0, start);
    final String after = text.substring(end);
    final bool needsTrailingSpace = ensureTrailingSpace
        ? (after.isEmpty || !_isWhitespace(after[0]))
        : (after.isNotEmpty && !_isWhitespace(after[0]));

    final StringBuffer insert = StringBuffer(sentinel);
    if (needsTrailingSpace) {
      insert.write(' ');
    }
    final String insertStr = insert.toString();
    final String newText = before + insertStr + after;
    value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: start + insertStr.length),
    );
  }

  /// Inserts an emoji selection at the caret as an [EmojiInlineToken].
  ///
  /// [maxActualLength] bounds the resulting [wireLength] (see [insertToken]).
  /// [ensureTrailingSpace] ensures a trailing space at end of the text.
  void insertEmoji(
    String name,
    String surrogates, {
    int? maxActualLength,
    bool ensureTrailingSpace = false,
  }) {
    insertToken(
      EmojiInlineToken(
        displayName: name,
        wireText: buildEmojiWireToken(name, surrogates),
      ),
      maxWireLength: maxActualLength,
      ensureTrailingSpace: ensureTrailingSpace,
    );
  }

  /// Replaces `[start, end)` with an emoji selection as an [EmojiInlineToken].
  ///
  /// [maxActualLength] bounds the resulting [wireLength] (see
  /// [replaceRangeWithToken]).
  void replaceRangeWithEmoji(
    int start,
    int end,
    String name,
    String surrogates, {
    int? maxActualLength,
  }) {
    replaceRangeWithToken(
      start,
      end,
      EmojiInlineToken(
        displayName: name,
        wireText: buildEmojiWireToken(name, surrogates),
      ),
      maxWireLength: maxActualLength,
    );
  }

  int _wireLengthOf(Runes runes) {
    int length = 0;
    for (final int rune in runes) {
      final String char = String.fromCharCode(rune);
      final InlineToken? token = _tokens[char];
      length += token != null ? token.wireText.length : 1;
    }
    return length;
  }

  static bool _isWhitespace(String char) =>
      char == ' ' || char == '\n' || char == '\t';

  static void _appendPlainTextSpans(
    List<InlineSpan> children,
    String text,
    int start,
    int end,
    TextStyle? style,
    TextRange? composing,
    TextStyle? composingStyle,
  ) {
    if (start >= end) {
      return;
    }
    if (composing == null || composingStyle == null) {
      children.add(TextSpan(text: text.substring(start, end), style: style));
      return;
    }
    final int compStart = composing.start.clamp(start, end);
    final int compEnd = composing.end.clamp(start, end);
    if (start < compStart) {
      children.add(
        TextSpan(text: text.substring(start, compStart), style: style),
      );
    }
    if (compStart < compEnd) {
      children.add(
        TextSpan(
          text: text.substring(compStart, compEnd),
          style: composingStyle,
        ),
      );
    }
    if (compEnd < end) {
      children.add(TextSpan(text: text.substring(compEnd, end), style: style));
    }
  }

  static int _nextPlainTextOffset(String text, int index) {
    if (index >= text.length) {
      return index;
    }
    final int codeUnit = text.codeUnitAt(index);
    if (codeUnit >= 0xD800 && codeUnit <= 0xDBFF && index + 1 < text.length) {
      return index + 2;
    }
    return index + 1;
  }

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    required bool withComposing,
    TextStyle? style,
  }) {
    assert(
      !value.composing.isValid || !withComposing || value.isComposingRangeValid,
    );
    final String t = text;
    if (t.isEmpty) {
      return TextSpan(style: style, text: '');
    }
    final bool useComposing =
        withComposing &&
        value.composing.isValid &&
        !value.composing.isCollapsed &&
        value.isComposingRangeValid;
    final TextRange? composing = useComposing ? value.composing : null;
    final TextStyle? composingStyle = useComposing
        ? style?.merge(const TextStyle(decoration: TextDecoration.underline))
        : null;
    final List<InlineSpan> children = <InlineSpan>[];
    int plainStart = 0;
    int index = 0;
    while (index < t.length) {
      final InlineToken? token = _tokens[t[index]];
      if (token != null) {
        _appendPlainTextSpans(
          children,
          t,
          plainStart,
          index,
          style,
          composing,
          composingStyle,
        );
        children.add(
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: token.buildInline(context, style),
          ),
        );
        index += 1;
        plainStart = index;
        continue;
      }
      index = _nextPlainTextOffset(t, index);
    }
    _appendPlainTextSpans(
      children,
      t,
      plainStart,
      t.length,
      style,
      composing,
      composingStyle,
    );
    return TextSpan(style: style, children: children);
  }
}
