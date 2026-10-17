import 'package:fluxer_markdown/src/utils/ansi_palette.dart';
import 'package:material_ui/material_ui.dart';

final RegExp _ansiEscapePattern = RegExp(
  r'(?:\x1B\[|\u241B\[|\u009b)([0-9;:]*)m',
);

final RegExp _ansiCodeDelimiter = RegExp('[;:]');

final List<Color> _ansiColor256Table = _buildAnsiColor256Table();

List<Color> _buildAnsiColor256Table() {
  final List<Color> table = <Color>[
    const Color(0xFF1E1E1E),
    const Color(0xFFF44747),
    const Color(0xFF6A9955),
    const Color(0xFFD7BA7D),
    const Color(0xFF569CD6),
    const Color(0xFFC586C0),
    const Color(0xFF4EC9B0),
    const Color(0xFFD4D4D4),
    const Color(0xFF808080),
    const Color(0xFFF44747),
    const Color(0xFF6A9955),
    const Color(0xFFD7BA7D),
    const Color(0xFF569CD6),
    const Color(0xFFC586C0),
    const Color(0xFF4EC9B0),
    const Color(0xFFFFFFFF),
  ];
  for (var r = 0; r < 6; r++) {
    for (var g = 0; g < 6; g++) {
      for (var b = 0; b < 6; b++) {
        final int rv = r == 0 ? 0 : 55 + r * 40;
        final int gv = g == 0 ? 0 : 55 + g * 40;
        final int bv = b == 0 ? 0 : 55 + b * 40;
        table.add(Color.fromARGB(255, rv, gv, bv));
      }
    }
  }
  for (var i = 0; i < 24; i++) {
    final int v = 8 + i * 10;
    table.add(Color.fromARGB(255, v, v, v));
  }
  return table;
}

class _AnsiState {
  _AnsiState();

  var bold = false;
  var blink = false;
  var conceal = false;
  var dim = false;
  var doubleUnderline = false;
  var italic = false;
  var inverse = false;
  var underline = false;
  var strikethrough = false;
  AnsiFg? fgSlot;
  AnsiBg? bgSlot;
  Color? fgColor;
  Color? bgColor;

  void reset() {
    bold = false;
    blink = false;
    conceal = false;
    dim = false;
    doubleUnderline = false;
    italic = false;
    inverse = false;
    underline = false;
    strikethrough = false;
    fgSlot = null;
    bgSlot = null;
    fgColor = null;
    bgColor = null;
  }

  bool get isEmpty =>
      !bold &&
      !blink &&
      !conceal &&
      !dim &&
      !doubleUnderline &&
      !italic &&
      !inverse &&
      !underline &&
      !strikethrough &&
      fgSlot == null &&
      bgSlot == null &&
      fgColor == null &&
      bgColor == null;
}

List<InlineSpan> parseAnsiTextSpans(
  String text,
  TextStyle baseStyle, {
  required AnsiPalette palette,
}) {
  final _AnsiState state = _AnsiState();
  final List<InlineSpan> spans = <InlineSpan>[];
  var lastIndex = 0;
  TextStyle? activeStyle;

  void flushText(String chunk) {
    if (chunk.isEmpty) {
      return;
    }
    final TextStyle style = activeStyle ?? baseStyle;
    if (spans.isNotEmpty && spans.last is TextSpan) {
      final TextSpan last = spans.last as TextSpan;
      if (last.style == style && last.children == null) {
        spans[spans.length - 1] = TextSpan(
          text: '${last.text}$chunk',
          style: style,
        );
        return;
      }
    }
    spans.add(TextSpan(text: chunk, style: style));
  }

  for (final RegExpMatch match in _ansiEscapePattern.allMatches(text)) {
    if (match.start > lastIndex) {
      flushText(text.substring(lastIndex, match.start));
    }
    final String rawCodes = match.group(1) ?? '';
    final List<int> codes = <int>[];
    if (rawCodes.isEmpty) {
      codes.add(0);
    } else {
      for (final String part in rawCodes.split(_ansiCodeDelimiter)) {
        if (part.isEmpty) {
          continue;
        }
        final int? value = int.tryParse(part);
        if (value != null) {
          codes.add(value);
        }
      }
    }
    _applyAnsiCodes(state, codes);
    activeStyle = state.isEmpty
        ? null
        : _styleFromState(state, baseStyle, palette);
    lastIndex = match.end;
  }
  if (lastIndex < text.length) {
    flushText(text.substring(lastIndex));
  }
  return spans;
}

TextStyle _styleFromState(
  _AnsiState state,
  TextStyle baseStyle,
  AnsiPalette palette,
) {
  AnsiFg? fgSlot = state.fgSlot;
  AnsiBg? bgSlot = state.bgSlot;
  Color? fgColor = state.fgColor;
  Color? bgColor = state.bgColor;

  if (state.inverse) {
    final AnsiFg? swappedFg = bgSlot != null ? kAnsiBgToFg[bgSlot] : null;
    final AnsiBg? swappedBg = fgSlot != null ? kAnsiFgToBg[fgSlot] : null;
    final Color? swappedFgColor = bgColor;
    final Color? swappedBgColor = fgColor;
    fgSlot = swappedFg;
    bgSlot = swappedBg;
    fgColor =
        swappedFgColor ?? (swappedFg != null ? null : palette.codeBlockBg);
    bgColor =
        swappedBgColor ?? (swappedBg != null ? null : palette.textPrimary);
  }

  if (state.conceal) {
    fgSlot = null;
    fgColor = Colors.transparent;
  }

  final Color? resolvedFg =
      fgColor ?? palette.colorForFg(fgSlot) ?? baseStyle.color;
  final Color? resolvedBg =
      bgColor ?? palette.colorForBg(bgSlot) ?? baseStyle.backgroundColor;

  var decorations = baseStyle.decoration ?? TextDecoration.none;
  var decorationStyle = baseStyle.decorationStyle;
  if (state.underline) {
    decorations = TextDecoration.combine(<TextDecoration>[
      decorations,
      TextDecoration.underline,
    ]);
  }
  if (state.doubleUnderline) {
    decorations = TextDecoration.combine(<TextDecoration>[
      decorations,
      TextDecoration.underline,
    ]);
    decorationStyle = TextDecorationStyle.double;
  }
  if (state.strikethrough) {
    decorations = TextDecoration.combine(<TextDecoration>[
      decorations,
      TextDecoration.lineThrough,
    ]);
  }

  var style = baseStyle.copyWith(
    color: resolvedFg,
    backgroundColor: resolvedBg,
    fontWeight: state.bold ? FontWeight.bold : baseStyle.fontWeight,
    fontStyle: state.italic ? FontStyle.italic : baseStyle.fontStyle,
    decoration: decorations == TextDecoration.none ? null : decorations,
    decorationStyle: decorationStyle,
  );

  if (state.dim && resolvedFg != null) {
    style = style.copyWith(
      color: resolvedFg.withValues(alpha: resolvedFg.a * 0.6),
    );
  }

  return style;
}

({Color? color, int consumed}) _parseExtendedColor(List<int> codes, int index) {
  if (index >= codes.length) {
    return (color: null, consumed: 1);
  }
  final int mode = codes[index];
  if (mode == 5 && index + 1 < codes.length) {
    final int colorIndex = codes[index + 1];
    if (colorIndex >= 0 && colorIndex < _ansiColor256Table.length) {
      return (color: _ansiColor256Table[colorIndex], consumed: 2);
    }
    return (color: null, consumed: 2);
  }
  if (mode == 2 && index + 3 < codes.length) {
    final int r = codes[index + 1].clamp(0, 255);
    final int g = codes[index + 2].clamp(0, 255);
    final int b = codes[index + 3].clamp(0, 255);
    return (color: Color.fromARGB(255, r, g, b), consumed: 4);
  }
  return (color: null, consumed: 1);
}

void _applyAnsiCodes(_AnsiState state, List<int> codes) {
  var i = 0;
  while (i < codes.length) {
    final int code = codes[i];
    if (code == 0) {
      state.reset();
      i++;
      continue;
    }
    if (code == 1) {
      state.bold = true;
    } else if (code == 5 || code == 6) {
      state.blink = true;
    } else if (code == 2) {
      state.dim = true;
    } else if (code == 3) {
      state.italic = true;
    } else if (code == 4) {
      state.doubleUnderline = false;
      state.underline = true;
    } else if (code == 7) {
      state.inverse = true;
    } else if (code == 8) {
      state.conceal = true;
    } else if (code == 9) {
      state.strikethrough = true;
    } else if (code == 21) {
      state.underline = false;
      state.doubleUnderline = true;
    } else if (code == 22) {
      state.bold = false;
      state.dim = false;
    } else if (code == 23) {
      state.italic = false;
    } else if (code == 24) {
      state.doubleUnderline = false;
      state.underline = false;
    } else if (code == 25) {
      state.blink = false;
    } else if (code == 27) {
      state.inverse = false;
    } else if (code == 28) {
      state.conceal = false;
    } else if (code == 29) {
      state.strikethrough = false;
    } else if (code == 39) {
      state.fgSlot = null;
      state.fgColor = null;
    } else if (code == 49) {
      state.bgSlot = null;
      state.bgColor = null;
    } else if (kAnsiStandardForegroundCodes.containsKey(code)) {
      state.fgSlot = kAnsiStandardForegroundCodes[code];
      state.fgColor = null;
    } else if (kAnsiStandardBackgroundCodes.containsKey(code)) {
      state.bgSlot = kAnsiStandardBackgroundCodes[code];
      state.bgColor = null;
    } else if (code == 38) {
      final ({Color? color, int consumed}) result = _parseExtendedColor(
        codes,
        i + 1,
      );
      if (result.color != null) {
        state
          ..fgColor = result.color
          ..fgSlot = null;
      }
      i += result.consumed;
    } else if (code == 48) {
      final ({Color? color, int consumed}) result = _parseExtendedColor(
        codes,
        i + 1,
      );
      if (result.color != null) {
        state
          ..bgColor = result.color
          ..bgSlot = null;
      }
      i += result.consumed;
    }
    i++;
  }
}
