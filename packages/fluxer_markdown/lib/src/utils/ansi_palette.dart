import 'package:material_ui/material_ui.dart';

enum AnsiFg {
  black,
  red,
  green,
  yellow,
  blue,
  magenta,
  cyan,
  white,
  brightBlack,
  brightRed,
  brightGreen,
  brightYellow,
  brightBlue,
  brightMagenta,
  brightCyan,
  brightWhite,
}

enum AnsiBg {
  black,
  red,
  green,
  yellow,
  blue,
  magenta,
  cyan,
  white,
  brightBlack,
  brightRed,
  brightGreen,
  brightYellow,
  brightBlue,
  brightMagenta,
  brightCyan,
  brightWhite,
}

const Map<int, AnsiFg> kAnsiStandardForegroundCodes = <int, AnsiFg>{
  30: AnsiFg.black,
  31: AnsiFg.red,
  32: AnsiFg.green,
  33: AnsiFg.yellow,
  34: AnsiFg.blue,
  35: AnsiFg.magenta,
  36: AnsiFg.cyan,
  37: AnsiFg.white,
  90: AnsiFg.brightBlack,
  91: AnsiFg.brightRed,
  92: AnsiFg.brightGreen,
  93: AnsiFg.brightYellow,
  94: AnsiFg.brightBlue,
  95: AnsiFg.brightMagenta,
  96: AnsiFg.brightCyan,
  97: AnsiFg.brightWhite,
};

const Map<int, AnsiBg> kAnsiStandardBackgroundCodes = <int, AnsiBg>{
  40: AnsiBg.black,
  41: AnsiBg.red,
  42: AnsiBg.green,
  43: AnsiBg.yellow,
  44: AnsiBg.blue,
  45: AnsiBg.magenta,
  46: AnsiBg.cyan,
  47: AnsiBg.white,
  100: AnsiBg.brightBlack,
  101: AnsiBg.brightRed,
  102: AnsiBg.brightGreen,
  103: AnsiBg.brightYellow,
  104: AnsiBg.brightBlue,
  105: AnsiBg.brightMagenta,
  106: AnsiBg.brightCyan,
  107: AnsiBg.brightWhite,
};

const Map<AnsiFg, AnsiBg> kAnsiFgToBg = <AnsiFg, AnsiBg>{
  AnsiFg.black: AnsiBg.black,
  AnsiFg.red: AnsiBg.red,
  AnsiFg.green: AnsiBg.green,
  AnsiFg.yellow: AnsiBg.yellow,
  AnsiFg.blue: AnsiBg.blue,
  AnsiFg.magenta: AnsiBg.magenta,
  AnsiFg.cyan: AnsiBg.cyan,
  AnsiFg.white: AnsiBg.white,
  AnsiFg.brightBlack: AnsiBg.brightBlack,
  AnsiFg.brightRed: AnsiBg.brightRed,
  AnsiFg.brightGreen: AnsiBg.brightGreen,
  AnsiFg.brightYellow: AnsiBg.brightYellow,
  AnsiFg.brightBlue: AnsiBg.brightBlue,
  AnsiFg.brightMagenta: AnsiBg.brightMagenta,
  AnsiFg.brightCyan: AnsiBg.brightCyan,
  AnsiFg.brightWhite: AnsiBg.brightWhite,
};

const Map<AnsiBg, AnsiFg> kAnsiBgToFg = <AnsiBg, AnsiFg>{
  AnsiBg.black: AnsiFg.black,
  AnsiBg.red: AnsiFg.red,
  AnsiBg.green: AnsiFg.green,
  AnsiBg.yellow: AnsiFg.yellow,
  AnsiBg.blue: AnsiFg.blue,
  AnsiBg.magenta: AnsiFg.magenta,
  AnsiBg.cyan: AnsiFg.cyan,
  AnsiBg.white: AnsiFg.white,
  AnsiBg.brightBlack: AnsiFg.brightBlack,
  AnsiBg.brightRed: AnsiFg.brightRed,
  AnsiBg.brightGreen: AnsiFg.brightGreen,
  AnsiBg.brightYellow: AnsiFg.brightYellow,
  AnsiBg.brightBlue: AnsiFg.brightBlue,
  AnsiBg.brightMagenta: AnsiFg.brightMagenta,
  AnsiBg.brightCyan: AnsiFg.brightCyan,
  AnsiBg.brightWhite: AnsiFg.brightWhite,
};

class AnsiPalette {
  const AnsiPalette({
    required this.foreground,
    required this.background,
    required this.codeBlockBg,
    required this.textPrimary,
  });

  final Map<AnsiFg, Color> foreground;
  final Map<AnsiBg, Color> background;
  final Color codeBlockBg;
  final Color textPrimary;

  Color? colorForFg(AnsiFg? slot) => slot == null ? null : foreground[slot];

  Color? colorForBg(AnsiBg? slot) => slot == null ? null : background[slot];

  static AnsiPalette fallback({required bool isDark}) {
    return fromThemeTokens(
      isDark: isDark,
      textCode: isDark ? const Color(0xFFD4D4D4) : const Color(0xFF6B3A4A),
      bgCodeBlock: isDark ? const Color(0xFF1E1E1E) : const Color(0xFFFFFFFF),
      textPrimary: isDark ? const Color(0xFFFFFFFF) : const Color(0xFF060607),
      textSecondary: isDark ? const Color(0xFFB5BAC1) : const Color(0xFF4E5058),
      textTertiary: isDark ? const Color(0xFF80848E) : const Color(0xFF6D6F78),
    );
  }

  static AnsiPalette fromThemeTokens({
    required bool isDark,
    required Color textCode,
    required Color bgCodeBlock,
    required Color textPrimary,
    required Color textSecondary,
    required Color textTertiary,
    double saturationFactor = 1,
  }) {
    if (isDark) {
      return _dark(
        textCode: textCode,
        bgCodeBlock: bgCodeBlock,
        textPrimary: textPrimary,
        textSecondary: textSecondary,
        textTertiary: textTertiary,
        saturationFactor: saturationFactor,
      );
    }
    return _light(
      textCode: textCode,
      bgCodeBlock: bgCodeBlock,
      textPrimary: textPrimary,
      textSecondary: textSecondary,
      textTertiary: textTertiary,
      saturationFactor: saturationFactor,
    );
  }

  static AnsiPalette _dark({
    required Color textCode,
    required Color bgCodeBlock,
    required Color textPrimary,
    required Color textSecondary,
    required Color textTertiary,
    required double saturationFactor,
  }) {
    final Map<AnsiFg, Color> fg = <AnsiFg, Color>{
      AnsiFg.black: _themeMix(
        textTertiary,
        _themeHsl(0, 0, 12, saturationFactor),
        0.72,
      ),
      AnsiFg.red: _themeMix(
        textCode,
        _themeHsl(0, 88, 62, saturationFactor),
        0.92,
      ),
      AnsiFg.green: _themeMix(
        textCode,
        _themeHsl(99, 29, 47, saturationFactor),
        0.92,
      ),
      AnsiFg.yellow: _themeMix(
        textCode,
        _themeHsl(41, 53, 67, saturationFactor),
        0.92,
      ),
      AnsiFg.blue: _themeMix(
        textCode,
        _themeHsl(207, 61, 59, saturationFactor),
        0.92,
      ),
      AnsiFg.magenta: _themeMix(
        textCode,
        _themeHsl(305, 35, 65, saturationFactor),
        0.92,
      ),
      AnsiFg.cyan: _themeMix(
        textCode,
        _themeHsl(168, 53, 55, saturationFactor),
        0.92,
      ),
      AnsiFg.white: _themeMix(
        textSecondary,
        _themeHsl(0, 0, 83, saturationFactor),
        0.88,
      ),
      AnsiFg.brightBlack: _themeMix(
        textTertiary,
        _themeHsl(0, 0, 50, saturationFactor),
        0.86,
      ),
      AnsiFg.brightRed: _themeMix(
        textPrimary,
        _themeHsl(0, 88, 62, saturationFactor),
        0.94,
      ),
      AnsiFg.brightGreen: _themeMix(
        textPrimary,
        _themeHsl(99, 29, 47, saturationFactor),
        0.88,
      ),
      AnsiFg.brightYellow: _themeMix(
        textPrimary,
        _themeHsl(41, 53, 67, saturationFactor),
        0.94,
      ),
      AnsiFg.brightBlue: _themeMix(
        textPrimary,
        _themeHsl(207, 61, 59, saturationFactor),
        0.94,
      ),
      AnsiFg.brightMagenta: _themeMix(
        textPrimary,
        _themeHsl(305, 35, 65, saturationFactor),
        0.94,
      ),
      AnsiFg.brightCyan: _themeMix(
        textPrimary,
        _themeHsl(168, 53, 55, saturationFactor),
        0.94,
      ),
      AnsiFg.brightWhite: textPrimary,
    };

    final Map<AnsiBg, Color> bg = <AnsiBg, Color>{
      AnsiBg.black: _themeMix(
        bgCodeBlock,
        _themeHsl(0, 0, 12, saturationFactor),
        0.88,
      ),
      AnsiBg.red: _themeMix(
        bgCodeBlock,
        _themeHsl(0, 88, 62, saturationFactor),
        0.88,
      ),
      AnsiBg.green: _themeMix(
        bgCodeBlock,
        _themeHsl(99, 29, 47, saturationFactor),
        0.88,
      ),
      AnsiBg.yellow: _themeMix(
        bgCodeBlock,
        _themeHsl(41, 53, 67, saturationFactor),
        0.88,
      ),
      AnsiBg.blue: _themeMix(
        bgCodeBlock,
        _themeHsl(207, 61, 59, saturationFactor),
        0.88,
      ),
      AnsiBg.magenta: _themeMix(
        bgCodeBlock,
        _themeHsl(305, 35, 65, saturationFactor),
        0.88,
      ),
      AnsiBg.cyan: _themeMix(
        bgCodeBlock,
        _themeHsl(168, 53, 55, saturationFactor),
        0.88,
      ),
      AnsiBg.white: _themeMix(
        bgCodeBlock,
        _themeHsl(0, 0, 83, saturationFactor),
        0.88,
      ),
      AnsiBg.brightBlack: _themeMix(
        bgCodeBlock,
        _themeHsl(0, 0, 50, saturationFactor),
        0.88,
      ),
      AnsiBg.brightRed: _themeMix(
        bgCodeBlock,
        _themeHsl(0, 88, 62, saturationFactor),
        0.92,
      ),
      AnsiBg.brightGreen: _themeMix(
        bgCodeBlock,
        _themeHsl(99, 29, 47, saturationFactor),
        0.92,
      ),
      AnsiBg.brightYellow: _themeMix(
        bgCodeBlock,
        _themeHsl(41, 53, 67, saturationFactor),
        0.92,
      ),
      AnsiBg.brightBlue: _themeMix(
        bgCodeBlock,
        _themeHsl(207, 61, 59, saturationFactor),
        0.92,
      ),
      AnsiBg.brightMagenta: _themeMix(
        bgCodeBlock,
        _themeHsl(305, 35, 65, saturationFactor),
        0.92,
      ),
      AnsiBg.brightCyan: _themeMix(
        bgCodeBlock,
        _themeHsl(168, 53, 55, saturationFactor),
        0.92,
      ),
      AnsiBg.brightWhite: _themeMix(
        bgCodeBlock,
        _themeHsl(0, 0, 100, saturationFactor),
        0.92,
      ),
    };

    return AnsiPalette(
      foreground: fg,
      background: bg,
      codeBlockBg: bgCodeBlock,
      textPrimary: textPrimary,
    );
  }

  static AnsiPalette _light({
    required Color textCode,
    required Color bgCodeBlock,
    required Color textPrimary,
    required Color textSecondary,
    required Color textTertiary,
    required double saturationFactor,
  }) {
    final Map<AnsiFg, Color> fg = <AnsiFg, Color>{
      AnsiFg.black: textPrimary,
      AnsiFg.red: _themeMix(
        textCode,
        _themeHsl(0, 62, 50, saturationFactor),
        0.92,
      ),
      AnsiFg.green: _themeMix(
        textCode,
        _themeHsl(120, 100, 25, saturationFactor),
        0.92,
      ),
      AnsiFg.yellow: _themeMix(
        textCode,
        _themeHsl(37, 52, 31, saturationFactor),
        0.92,
      ),
      AnsiFg.blue: _themeMix(
        textCode,
        _themeHsl(211, 95, 33, saturationFactor),
        0.92,
      ),
      AnsiFg.magenta: _themeMix(
        textCode,
        _themeHsl(288, 100, 43, saturationFactor),
        0.92,
      ),
      AnsiFg.cyan: _themeMix(
        textCode,
        _themeHsl(192, 95, 38, saturationFactor),
        0.92,
      ),
      AnsiFg.white: _themeMix(
        textSecondary,
        _themeHsl(0, 0, 33, saturationFactor),
        0.88,
      ),
      AnsiFg.brightBlack: _themeMix(
        textTertiary,
        _themeHsl(0, 0, 40, saturationFactor),
        0.88,
      ),
      AnsiFg.brightRed: _themeMix(
        textPrimary,
        _themeHsl(0, 62, 50, saturationFactor),
        0.92,
      ),
      AnsiFg.brightGreen: _themeMix(
        textPrimary,
        _themeHsl(120, 82, 44, saturationFactor),
        0.90,
      ),
      AnsiFg.brightYellow: _themeMix(
        textPrimary,
        _themeHsl(62, 100, 36, saturationFactor),
        0.90,
      ),
      AnsiFg.brightBlue: _themeMix(
        textPrimary,
        _themeHsl(211, 95, 33, saturationFactor),
        0.92,
      ),
      AnsiFg.brightMagenta: _themeMix(
        textPrimary,
        _themeHsl(300, 95, 38, saturationFactor),
        0.92,
      ),
      AnsiFg.brightCyan: _themeMix(
        textPrimary,
        _themeHsl(192, 95, 38, saturationFactor),
        0.92,
      ),
      AnsiFg.brightWhite: _themeMix(
        textPrimary,
        _themeHsl(0, 0, 65, saturationFactor),
        0.86,
      ),
    };

    final Map<AnsiBg, Color> bg = <AnsiBg, Color>{
      AnsiBg.black: _themeMix(
        bgCodeBlock,
        _themeHsl(0, 0, 0, saturationFactor),
        0.86,
      ),
      AnsiBg.red: _themeMix(
        bgCodeBlock,
        _themeHsl(0, 62, 50, saturationFactor),
        0.86,
      ),
      AnsiBg.green: _themeMix(
        bgCodeBlock,
        _themeHsl(120, 100, 25, saturationFactor),
        0.86,
      ),
      AnsiBg.yellow: _themeMix(
        bgCodeBlock,
        _themeHsl(37, 52, 31, saturationFactor),
        0.86,
      ),
      AnsiBg.blue: _themeMix(
        bgCodeBlock,
        _themeHsl(211, 95, 33, saturationFactor),
        0.86,
      ),
      AnsiBg.magenta: _themeMix(
        bgCodeBlock,
        _themeHsl(288, 100, 43, saturationFactor),
        0.86,
      ),
      AnsiBg.cyan: _themeMix(
        bgCodeBlock,
        _themeHsl(192, 95, 38, saturationFactor),
        0.86,
      ),
      AnsiBg.white: _themeMix(
        bgCodeBlock,
        _themeHsl(0, 0, 90, saturationFactor),
        0.86,
      ),
      AnsiBg.brightBlack: _themeMix(
        bgCodeBlock,
        _themeHsl(0, 0, 40, saturationFactor),
        0.88,
      ),
      AnsiBg.brightRed: _themeMix(
        bgCodeBlock,
        _themeHsl(0, 62, 50, saturationFactor),
        0.88,
      ),
      AnsiBg.brightGreen: _themeMix(
        bgCodeBlock,
        _themeHsl(120, 82, 44, saturationFactor),
        0.88,
      ),
      AnsiBg.brightYellow: _themeMix(
        bgCodeBlock,
        _themeHsl(62, 100, 36, saturationFactor),
        0.88,
      ),
      AnsiBg.brightBlue: _themeMix(
        bgCodeBlock,
        _themeHsl(211, 95, 33, saturationFactor),
        0.88,
      ),
      AnsiBg.brightMagenta: _themeMix(
        bgCodeBlock,
        _themeHsl(300, 95, 38, saturationFactor),
        0.88,
      ),
      AnsiBg.brightCyan: _themeMix(
        bgCodeBlock,
        _themeHsl(192, 95, 38, saturationFactor),
        0.88,
      ),
      AnsiBg.brightWhite: _themeMix(
        bgCodeBlock,
        _themeHsl(0, 0, 100, saturationFactor),
        0.92,
      ),
    };

    return AnsiPalette(
      foreground: fg,
      background: bg,
      codeBlockBg: bgCodeBlock,
      textPrimary: textPrimary,
    );
  }
}

Color _themeMix(Color base, Color accent, double accentWeight) =>
    Color.lerp(base, accent, accentWeight)!;

Color _themeHsl(
  double h,
  double sPercent,
  double lPercent,
  double saturationFactor,
) {
  final double s = (sPercent / 100 * saturationFactor).clamp(0.0, 1.0);
  return HSLColor.fromAHSL(1, h, s, lPercent / 100).toColor();
}
