import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:fluxer_markdown/src/utils/monospace_text_style.dart';
import 'package:material_ui/material_ui.dart';

Map<String, TextStyle> sanitizeCodeBlockHighlightTheme(
  Map<String, TextStyle> theme, {
  TextStyle? codeTextStyle,
}) {
  return theme.map((String key, TextStyle style) {
    if (codeTextStyle != null) {
      return MapEntry(
        key,
        style.copyWith(
          fontFamily: codeTextStyle.fontFamily,
          fontFamilyFallback: codeTextStyle.fontFamilyFallback,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
        ),
      );
    }

    return MapEntry(
      key,
      TextStyle(
        color: style.color,
        backgroundColor: style.backgroundColor,
        fontFamily: kDefaultMonospaceFontFamily,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
      ),
    );
  });
}

Map<String, TextStyle> codeBlockHighlightThemeFor(
  Map<String, TextStyle> theme, {
  TextStyle? codeTextStyle,
}) {
  return sanitizeCodeBlockHighlightTheme(theme, codeTextStyle: codeTextStyle);
}

final Map<String, TextStyle> kGithubCodeBlockHighlightTheme =
    sanitizeCodeBlockHighlightTheme(githubTheme);

final Map<String, TextStyle> kVs2015CodeBlockHighlightTheme =
    sanitizeCodeBlockHighlightTheme(vs2015Theme);
