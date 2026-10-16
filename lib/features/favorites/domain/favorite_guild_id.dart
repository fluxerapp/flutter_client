const String favoriteDmGuildId = '@me';

String? resolveFavoriteGuildId({
  required String? channelGuildId,
  required bool isDm,
}) {
  if (channelGuildId != null && channelGuildId.isNotEmpty) {
    return channelGuildId;
  }
  if (isDm) {
    return favoriteDmGuildId;
  }
  return null;
}

bool isFavoriteDmGuildId(String? guildId) {
  final String? trimmed = guildId?.trim();
  return trimmed == null || trimmed.isEmpty || trimmed == favoriteDmGuildId;
}

String? favoriteChannelGuildId({
  required String? storedGuildId,
  required String? channelGuildId,
}) {
  if (channelGuildId != null && channelGuildId.isNotEmpty) {
    return channelGuildId;
  }
  if (isFavoriteDmGuildId(storedGuildId)) {
    return null;
  }
  return storedGuildId;
}
