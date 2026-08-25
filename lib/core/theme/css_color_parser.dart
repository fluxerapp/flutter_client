import 'package:fluxer_app/material_ui.dart';

final RegExp _saturationFactorVarPattern = RegExp(
  r'var\(\s*--saturation-factor\s*\)',
  caseSensitive: false,
);

final RegExp _calcPercentPattern = RegExp(
  r'calc\(\s*([\d.]+)%\s*\*\s*([\d.]+)\s*\)',
  caseSensitive: false,
);

final RegExp _nestedCalcPattern = RegExp(
  r'calc\(\s*([^)]+)\s*\)',
  caseSensitive: false,
);

final RegExp _calcMultiplyExpressionPattern = RegExp(
  r'^([\d.]+)%\s*\*\s*([\d.]+)$',
);

final RegExp _calcPercentOnlyPattern = RegExp(r'^([\d.]+)%$');

final RegExp _importantSuffixPattern = RegExp(
  r'\s*!important\s*$',
  caseSensitive: false,
);

final RegExp _hexColorPattern = RegExp(
  r'^#([0-9A-Fa-f]{3,4}|[0-9A-Fa-f]{6}|[0-9A-Fa-f]{8})$',
);

final RegExp _rgbColorPattern = RegExp(
  r'^rgba?\((.*)\)$',
  caseSensitive: false,
);

final RegExp _hslColorPattern = RegExp(
  r'^hsla?\((.*)\)$',
  caseSensitive: false,
);

final RegExp _srgbColorPattern = RegExp(
  r'^color\(\s*srgb\s+(.*)\)$',
  caseSensitive: false,
);

final RegExp _whitespaceSeparatorPattern = RegExp(r'\s+');

String substituteSaturationVariables(String color, double saturationFactor) {
  String resolved = color.replaceAll(
    _saturationFactorVarPattern,
    saturationFactor.toString(),
  );
  resolved = resolved.replaceAllMapped(_calcPercentPattern, (Match match) {
    final double percent = double.parse(match.group(1)!);
    final double factor = double.parse(match.group(2)!);
    return '${percent * factor}%';
  });
  return _evaluateNestedCalcExpressions(resolved);
}

Color? parseCssColor(String color, {required double saturationFactor}) {
  final String normalized = substituteSaturationVariables(
    _stripCssColorPriority(color),
    saturationFactor,
  );
  return _parseHexColor(normalized) ??
      _parseRgbColor(normalized) ??
      _parseHslColor(normalized) ??
      _parseSrgbColor(normalized);
}

String _evaluateNestedCalcExpressions(String color) {
  return color.replaceAllMapped(_nestedCalcPattern, (Match match) {
    final String expression = match.group(1)!.trim();
    final RegExpMatch? multiplyMatch = _calcMultiplyExpressionPattern
        .firstMatch(expression);
    if (multiplyMatch != null) {
      final double percent = double.parse(multiplyMatch.group(1)!);
      final double factor = double.parse(multiplyMatch.group(2)!);
      return '${percent * factor}%';
    }
    final RegExpMatch? percentOnlyMatch = _calcPercentOnlyPattern.firstMatch(
      expression,
    );
    if (percentOnlyMatch != null) {
      return '${percentOnlyMatch.group(1)}%';
    }
    return match.group(0)!;
  });
}

String _stripCssColorPriority(String color) {
  return color.trim().replaceAll(_importantSuffixPattern, '').trim();
}

Color? _parseHexColor(String color) {
  final RegExpMatch? match = _hexColorPattern.firstMatch(color);
  if (match == null) {
    return null;
  }
  final String value = match.group(1)!;
  if (value.length == 3 || value.length == 4) {
    final String red = value[0];
    final String green = value[1];
    final String blue = value[2];
    final int rgb = int.parse('$red$red$green$green$blue$blue', radix: 16);
    return Color(0xFF000000 | rgb);
  }
  final int rgb = int.parse(value.substring(0, 6), radix: 16);
  return Color(0xFF000000 | rgb);
}

double? _parseCssNumberComponent(String value, double scale) {
  final String trimmed = value.trim();
  if (trimmed.isEmpty) {
    return null;
  }
  if (trimmed.endsWith('%')) {
    final double? percentage = double.tryParse(
      trimmed.substring(0, trimmed.length - 1),
    );
    return percentage == null ? null : (percentage / 100) * scale;
  }
  return double.tryParse(trimmed);
}

List<String> _splitCssColorComponents(String body) {
  final String normalized = body.split('/').first.trim();
  if (normalized.contains(',')) {
    return normalized.split(',');
  }
  return normalized.split(_whitespaceSeparatorPattern);
}

Color? _parseRgbColor(String color) {
  final RegExpMatch? match = _rgbColorPattern.firstMatch(color);
  if (match == null) {
    return null;
  }
  final List<String> parts = _splitCssColorComponents(match.group(1) ?? '');
  if (parts.length < 3) {
    return null;
  }
  final double? red = _parseCssNumberComponent(parts[0], 255);
  final double? green = _parseCssNumberComponent(parts[1], 255);
  final double? blue = _parseCssNumberComponent(parts[2], 255);
  if (red == null || green == null || blue == null) {
    return null;
  }
  return Color.fromARGB(255, red.round(), green.round(), blue.round());
}

Color? _parseHslColor(String color) {
  final RegExpMatch? match = _hslColorPattern.firstMatch(color);
  if (match == null) {
    return null;
  }
  final List<String> parts = _splitCssColorComponents(match.group(1) ?? '');
  if (parts.length < 3) {
    return null;
  }
  final double? hue = double.tryParse(parts[0]);
  final double? saturation = _parseCssNumberComponent(parts[1], 100);
  final double? lightness = _parseCssNumberComponent(parts[2], 100);
  if (hue == null || saturation == null || lightness == null) {
    return null;
  }
  return HSLColor.fromAHSL(
    1,
    hue % 360,
    (saturation / 100).clamp(0.0, 1.0),
    (lightness / 100).clamp(0.0, 1.0),
  ).toColor();
}

Color? _parseSrgbColor(String color) {
  final RegExpMatch? match = _srgbColorPattern.firstMatch(color);
  if (match == null) {
    return null;
  }
  final List<String> parts = _splitCssColorComponents(match.group(1) ?? '');
  if (parts.length < 3) {
    return null;
  }
  final double? red = _parseCssNumberComponent(parts[0], 1);
  final double? green = _parseCssNumberComponent(parts[1], 1);
  final double? blue = _parseCssNumberComponent(parts[2], 1);
  if (red == null || green == null || blue == null) {
    return null;
  }
  return Color.fromARGB(
    255,
    (red * 255).round().clamp(0, 255),
    (green * 255).round().clamp(0, 255),
    (blue * 255).round().clamp(0, 255),
  );
}
