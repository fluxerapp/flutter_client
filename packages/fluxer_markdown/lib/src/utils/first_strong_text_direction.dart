import 'dart:ui' show TextDirection;

final RegExp _strongLetterPattern = RegExp(r'\p{L}', unicode: true);

bool _isRtlCodePoint(int codePoint) {
  return (codePoint >= 0x0590 && codePoint <= 0x08FF) ||
      (codePoint >= 0xFB1D && codePoint <= 0xFDFF) ||
      (codePoint >= 0xFE70 && codePoint <= 0xFEFF) ||
      (codePoint >= 0x10800 && codePoint <= 0x10FFF) ||
      (codePoint >= 0x1E800 && codePoint <= 0x1EFFF);
}

TextDirection? firstStrongTextDirection(String text) {
  final Match? match = _strongLetterPattern.firstMatch(text);
  if (match == null) {
    return null;
  }
  return _isRtlCodePoint(match.group(0)!.runes.first)
      ? TextDirection.rtl
      : TextDirection.ltr;
}
