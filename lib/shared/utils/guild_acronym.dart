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

const double kGuildAcronymFitPadding = 4;
const List<double> _kReferenceFontSizes = <double>[16, 14, 12];

double _referenceFontSize(int acronymLength) {
  if (acronymLength <= 2) {
    return _kReferenceFontSizes[0];
  }
  if (acronymLength <= 4) {
    return _kReferenceFontSizes[1];
  }
  return _kReferenceFontSizes[2];
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

double guildAcronymFitWidth(double iconSize) {
  final double padding =
      kGuildAcronymFitPadding * math.min(_iconScale(iconSize), 1);
  return math.max(iconSize - padding * 2, 0);
}

double fitGuildAcronymFontSize({
  required int acronymLength,
  required double iconSize,
  required double Function(double fontSize) measureWidth,
}) {
  final double available = guildAcronymFitWidth(iconSize);
  final double scale = _iconScale(iconSize);
  final double start = _referenceFontSize(acronymLength);
  double fontSize = guildAcronymFontSize(acronymLength, iconSize);
  double width = measureWidth(fontSize);
  for (final double reference in _kReferenceFontSizes) {
    if (width <= available || fontSize <= kGuildAcronymMinFontSize) {
      return fontSize;
    }
    if (reference >= start) {
      continue;
    }
    fontSize = math.max(reference * scale, kGuildAcronymMinFontSize);
    width = measureWidth(fontSize);
  }
  if (width <= available || width <= 0) {
    return fontSize;
  }
  return math.max(fontSize * available / width, kGuildAcronymMinFontSize);
}
