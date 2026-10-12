import 'dart:math' as math;

import 'package:flutter/widgets.dart' show StringCharacters;

const String kGuildAcronymFallback = '?';
const double kGuildAcronymMinFontSize = 8;
const double _kReferenceIconSize = 48;
const List<double> _kReferenceFontSizes = <double>[18, 18, 16, 14, 12, 10];

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

double guildAcronymFontScale(int acronymLength) {
  final int index = acronymLength.clamp(1, _kReferenceFontSizes.length) - 1;
  return _kReferenceFontSizes[index] / _kReferenceIconSize;
}

double guildAcronymFontSize(int acronymLength, double iconSize) {
  return math.max(
    iconSize * guildAcronymFontScale(acronymLength),
    kGuildAcronymMinFontSize,
  );
}
