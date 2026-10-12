import 'dart:math' as math;

import 'package:flutter/widgets.dart' show StringCharacters;

const String kGuildAcronymFallback = '?';
const double kGuildAcronymMinFontSize = 8;
const double _kFixedIconSizeMin = 48;
const double _kFixedIconSizeMax = 64;

final RegExp _possessiveSuffix = RegExp(r"['’]s(?=\s)", unicode: true);
final RegExp _wordRun = RegExp(
  r'[\p{L}\p{N}_][\p{L}\p{N}\p{M}_‌‍]*',
  unicode: true,
);
final RegExp _whitespace = RegExp(r'\s+', unicode: true);

String guildAcronym(String name) {
  return name
      .replaceAll(_possessiveSuffix, '')
      .replaceAllMapped(
        _wordRun,
        (Match match) => match.group(0)!.characters.first,
      )
      .replaceAll(_whitespace, '');
}

int guildAcronymLength(String acronym) => acronym.characters.length;

double _referenceFontSize(int acronymLength) {
  if (acronymLength <= 2) {
    return 16;
  }
  if (acronymLength <= 4) {
    return 14;
  }
  return 12;
}

double _iconScale(double iconSize) {
  if (iconSize < _kFixedIconSizeMin) {
    return iconSize / _kFixedIconSizeMin;
  }
  if (iconSize > _kFixedIconSizeMax) {
    return iconSize / _kFixedIconSizeMax;
  }
  return 1;
}

double guildAcronymFontSize(int acronymLength, double iconSize) {
  return math.max(
    _referenceFontSize(acronymLength) * _iconScale(iconSize),
    kGuildAcronymMinFontSize,
  );
}
