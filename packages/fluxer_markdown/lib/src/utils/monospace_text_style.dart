import 'package:flutter/painting.dart';

const String kDefaultMonospaceFontFamily = 'monospace';

TextStyle codeTextStyleFrom(
  TextStyle base, {
  TextStyle? codeTextStyle,
  double fontSizeScale = 0.85,
  Color? color,
  Color? backgroundColor,
}) {
  final double scaledFontSize =
      (base.fontSize ?? codeTextStyle?.fontSize ?? 16) * fontSizeScale;
  if (codeTextStyle != null) {
    return codeTextStyle.copyWith(
      fontSize: scaledFontSize,
      color: color ?? codeTextStyle.color ?? base.color,
      backgroundColor: backgroundColor ?? codeTextStyle.backgroundColor,
    );
  }

  return TextStyle(
    inherit: base.inherit,
    color: color ?? base.color,
    backgroundColor: backgroundColor ?? base.backgroundColor,
    fontSize: scaledFontSize,
    fontWeight: base.fontWeight,
    fontStyle: base.fontStyle,
    height: base.height,
    letterSpacing: base.letterSpacing,
    wordSpacing: base.wordSpacing,
    textBaseline: base.textBaseline,
    leadingDistribution: base.leadingDistribution,
    locale: base.locale,
    fontFamily: kDefaultMonospaceFontFamily,
  );
}
