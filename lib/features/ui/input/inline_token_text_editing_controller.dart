import 'package:flutter/services.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/features/ui/input/emoji_inline_token.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';

abstract class InlineToken {
  String get wireText;

  Widget buildInline(BuildContext context, TextStyle? baseStyle);
}

class InlineTokenTextEditingController extends TextEditingController {
  InlineTokenTextEditingController({super.text});

  final Map<String, InlineToken> _tokens = <String, InlineToken>{};
  int _nextSentinelIndex = 0;

  String allocateToken(InlineToken token) {
    final int codePoint = 0xE000 + _nextSentinelIndex++;
    assert(codePoint <= 0xF8FF, 'Inline token sentinel pool exhausted.');
    final String sentinel = String.fromCharCode(codePoint);
    _tokens[sentinel] = token;
    return sentinel;
  }

  void clearTokens() {
    _tokens.clear();
    _nextSentinelIndex = 0;
  }

  void replaceWireDisplay({
    required String displayText,
    required Map<String, InlineToken> tokens,
    required int nextSentinelIndex,
    TextSelection? selection,
  }) {
    _tokens
      ..clear()
      ..addAll(tokens);
    _nextSentinelIndex = nextSentinelIndex;
    value = TextEditingValue(
      text: displayText,
      selection:
          selection ?? TextSelection.collapsed(offset: displayText.length),
    );
  }

  String toWireText() => toWireTextRange(0, text.length);

  String toWireTextRange(int start, int end) {
    final StringBuffer buffer = StringBuffer();
    int index = start;
    while (index < end) {
      final InlineToken? token = _tokens[text[index]];
      if (token != null) {
        buffer.write(token.wireText);
        index += 1;
        continue;
      }
      final int next = _nextPlainTextOffset(text, index);
      buffer.write(text.substring(index, next.clamp(index, end)));
      index = next;
    }
    return buffer.toString();
  }

  String wireToDisplayFragment(
    String wire, {
    bool includePlainShortcodes = true,
  }) {
    return substituteEmojiTokens(
      wire,
      allocateToken,
      includePlainShortcodes: includePlainShortcodes,
    );
  }

  int get wireLength => _wireLengthOf(text.runes);

  int wireLengthForDisplayText(String displayText) =>
      _wireLengthOf(displayText.runes);

  @override
  set value(TextEditingValue newValue) {
    final TextEditingValue effectiveValue = _chipRawUnicodeEmoji(
      _sanitizeOrphanPrivateUse(newValue),
    );
    super.value = effectiveValue;
    _pruneOrphanTokens(effectiveValue.text);
  }

  TextEditingValue _chipRawUnicodeEmoji(TextEditingValue value) {
    if (value.composing.isValid) {
      return value;
    }
    final (int start, int end) = _editedWindow(value.text);
    if (start >= end) {
      return value;
    }
    final UnicodeEmojiSubstitution chipped = substituteUnicodeEmojiTokens(
      value.text.substring(start, end),
      allocateToken,
    );
    if (chipped.replaced.isEmpty) {
      return value;
    }
    final List<UnicodeEmojiRange> replaced = chipped.replaced
        .map(
          (UnicodeEmojiRange range) =>
              (start: range.start + start, end: range.end + start),
        )
        .toList(growable: false);
    final String text =
        value.text.substring(0, start) +
        chipped.text +
        value.text.substring(end);
    if (!value.selection.isValid) {
      return value.copyWith(text: text, composing: TextRange.empty);
    }
    return value.copyWith(
      text: text,
      selection: TextSelection(
        baseOffset: _chippedOffset(value.selection.baseOffset, replaced),
        extentOffset: _chippedOffset(value.selection.extentOffset, replaced),
      ),
      composing: TextRange.empty,
    );
  }

  (int, int) _editedWindow(String text) {
    final String previous = super.value.text;
    if (super.value.composing.isValid) {
      return (0, text.length);
    }
    if (previous == text) {
      return (0, 0);
    }
    final int shortest = previous.length < text.length
        ? previous.length
        : text.length;
    int prefix = 0;
    while (prefix < shortest &&
        previous.codeUnitAt(prefix) == text.codeUnitAt(prefix)) {
      prefix++;
    }
    int suffix = 0;
    while (suffix < shortest - prefix &&
        previous.codeUnitAt(previous.length - 1 - suffix) ==
            text.codeUnitAt(text.length - 1 - suffix)) {
      suffix++;
    }

    final int margin = EmojiRegistry.maxUnicodeEmojiLength;
    int start = prefix - margin;
    int end = text.length - suffix + margin;
    start = start < 0 ? 0 : start;
    end = end > text.length ? text.length : end;
    if (start >= end) {
      return (0, 0);
    }
    if (start > 0 && _isLowSurrogate(text.codeUnitAt(start))) {
      start--;
    }
    if (end < text.length && _isLowSurrogate(text.codeUnitAt(end))) {
      end++;
    }
    return (start, end);
  }

  static bool _isLowSurrogate(int codeUnit) =>
      codeUnit >= 0xDC00 && codeUnit <= 0xDFFF;

  static int _chippedOffset(int offset, List<UnicodeEmojiRange> replaced) {
    int shift = 0;
    for (final UnicodeEmojiRange range in replaced) {
      if (offset >= range.end) {
        shift += range.end - range.start - 1;
        continue;
      }
      if (offset > range.start) {
        shift += offset - range.start;
      }
      break;
    }
    return offset - shift;
  }

  bool _containsOrphanPrivateUse(String text) {
    for (final int rune in text.runes) {
      if (rune < 0xE000 || rune > 0xF8FF) {
        continue;
      }
      if (!_tokens.containsKey(String.fromCharCode(rune))) {
        return true;
      }
    }
    return false;
  }

  TextEditingValue _sanitizeOrphanPrivateUse(TextEditingValue value) {
    if (value.text.isEmpty || !_containsOrphanPrivateUse(value.text)) {
      return value;
    }
    final StringBuffer buffer = StringBuffer();
    var inIndex = 0;
    var base = value.selection.baseOffset;
    var extent = value.selection.extentOffset;
    for (final int rune in value.text.runes) {
      final String char = String.fromCharCode(rune);
      if (rune >= 0xE000 && rune <= 0xF8FF && !_tokens.containsKey(char)) {
        if (value.selection.isValid) {
          if (base > inIndex) {
            base -= 1;
          }
          if (extent > inIndex) {
            extent -= 1;
          }
        }
        inIndex += 1;
        continue;
      }
      buffer.write(char);
      inIndex += char.length;
    }
    final String sanitized = buffer.toString();
    if (!value.selection.isValid) {
      return value.copyWith(text: sanitized, composing: TextRange.empty);
    }
    return value.copyWith(
      text: sanitized,
      selection: TextSelection(
        baseOffset: base.clamp(0, sanitized.length),
        extentOffset: extent.clamp(0, sanitized.length),
      ),
      composing: TextRange.empty,
    );
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

  void deleteBackward() {
    final TextSelection sel = selection;
    final int end = sel.isValid ? sel.end : text.length;
    final int start = sel.isValid ? sel.start : text.length;
    if (start != end) {
      value = TextEditingValue(
        text: text.replaceRange(start, end, ''),
        selection: TextSelection.collapsed(offset: start),
      );
      return;
    }
    if (end == 0) {
      return;
    }
    final String before = text.substring(0, end);
    final int removeFrom = before.length - before.characters.last.length;
    value = TextEditingValue(
      text: text.replaceRange(removeFrom, end, ''),
      selection: TextSelection.collapsed(offset: removeFrom),
    );
  }

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

  int _wireLengthOf(Runes runes) {
    int length = 0;
    for (final int rune in runes) {
      final String char = String.fromCharCode(rune);
      final InlineToken? token = _tokens[char];
      length += token != null ? token.wireText.length : char.length;
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
      'composing range must be valid when withComposing is true',
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
        ? _composingStyle(context, style, value)
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
            child: MediaQuery.withNoTextScaling(
              child: token.buildInline(context, style),
            ),
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

  static TextStyle _composingStyle(
    BuildContext context,
    TextStyle? style,
    TextEditingValue value,
  ) {
    final bool inlinePrediction =
        value.selection.isCollapsed &&
        value.composing.start == value.selection.baseOffset;
    if (inlinePrediction) {
      final Color muted =
          Theme.of(context).extension<FluxerColorTheme>()?.textChatMuted ??
          style?.color?.withValues(alpha: 0.45) ??
          Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.45);
      return (style ?? const TextStyle()).merge(
        TextStyle(color: muted, decoration: TextDecoration.none),
      );
    }
    return style?.merge(
          const TextStyle(decoration: TextDecoration.underline),
        ) ??
        const TextStyle(decoration: TextDecoration.underline);
  }
}

class InlineTokenWireLengthFormatter extends TextInputFormatter {
  InlineTokenWireLengthFormatter(
    this.controller, {
    required this.maxWireLength,
  });

  final InlineTokenTextEditingController controller;
  final int maxWireLength;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (controller.wireLengthForDisplayText(newValue.text) <= maxWireLength) {
      return newValue;
    }
    return oldValue;
  }
}
