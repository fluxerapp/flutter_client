bool isInvisibleContentCodePoint(int codePoint) {
  return codePoint == 0x0000 ||
      codePoint == 0x00ad ||
      codePoint == 0x034f ||
      codePoint == 0x061c ||
      codePoint == 0x115f ||
      codePoint == 0x1160 ||
      codePoint == 0x17b4 ||
      codePoint == 0x17b5 ||
      codePoint == 0x180e ||
      (codePoint >= 0x200b && codePoint <= 0x200f) ||
      (codePoint >= 0x202a && codePoint <= 0x202e) ||
      (codePoint >= 0x2060 && codePoint <= 0x2069) ||
      codePoint == 0x2800 ||
      codePoint == 0x3164 ||
      (codePoint >= 0xfe00 && codePoint <= 0xfe0f) ||
      codePoint == 0xfeff ||
      codePoint == 0xffa0 ||
      (codePoint >= 0xe0100 && codePoint <= 0xe01ef);
}

String _codePointToString(int codePoint) {
  if (codePoint <= 0xffff) {
    return String.fromCharCode(codePoint);
  }
  final int offset = codePoint - 0x10000;
  return String.fromCharCodes([
    0xD800 + (offset >> 10),
    0xDC00 + (offset & 0x3FF),
  ]);
}

bool _isIgnorableCodePoint(int codePoint) {
  if (isInvisibleContentCodePoint(codePoint)) {
    return true;
  }
  return _codePointToString(codePoint).trim().isEmpty;
}

bool hasVisibleContent(String value) {
  for (final int codePoint in value.runes) {
    if (_isIgnorableCodePoint(codePoint)) {
      continue;
    }
    return true;
  }
  return false;
}

bool isAutolinkBoundaryCodePoint(int codePoint) {
  if (_isIgnorableCodePoint(codePoint)) {
    return true;
  }
  return '*_~(>'.contains(String.fromCharCode(codePoint));
}
