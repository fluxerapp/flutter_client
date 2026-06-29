String resolveDisplayName({
  required String username,
  String? guildNickname,
  String? friendNickname,
  String? fallbackDisplayName,
  String? globalName,
}) {
  for (final String? candidate in <String?>[
    guildNickname,
    friendNickname,
    fallbackDisplayName,
    globalName,
  ]) {
    final String? trimmed = candidate?.trim();
    if (trimmed != null && trimmed.isNotEmpty) {
      return trimmed;
    }
  }
  return username;
}
