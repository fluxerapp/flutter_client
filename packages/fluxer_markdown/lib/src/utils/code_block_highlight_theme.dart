import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_highlight/themes/vs2015.dart';

Map<String, TextStyle> sanitizeCodeBlockHighlightTheme(
  Map<String, TextStyle> theme,
) {
  return theme.map((String key, TextStyle style) {
    return MapEntry(
      key,
      style.copyWith(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
      ),
    );
  });
}

final Map<String, TextStyle> kGithubCodeBlockHighlightTheme =
    sanitizeCodeBlockHighlightTheme(githubTheme);

final Map<String, TextStyle> kVs2015CodeBlockHighlightTheme =
    sanitizeCodeBlockHighlightTheme(vs2015Theme);
