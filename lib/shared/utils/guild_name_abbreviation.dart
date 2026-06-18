const int kGuildIconInitialsMaxLength = 4;

String guildNameInitials(String raw) {
  final String value = raw.trim();
  if (value.isEmpty) {
    return '';
  }
  final List<String> words = value
      .split(RegExp(r'\s+'))
      .where((String word) => word.isNotEmpty)
      .toList();
  return words
      .map((String word) => String.fromCharCode(word.runes.first))
      .join();
}

/// Number of untruncated initials for a name.
int guildNameInitialsLength(String raw) => guildNameInitials(raw).runes.length;

/// Truncated variant. Empty input resolves to `'?'`.
String abbreviateGuildName(
  String raw, {
  int maxLength = kGuildIconInitialsMaxLength,
}) {
  if (maxLength <= 0) {
    return '';
  }
  final String initials = guildNameInitials(raw);
  if (initials.isEmpty) {
    return '?';
  }
  return String.fromCharCodes(initials.runes.take(maxLength));
}
