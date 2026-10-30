class GuildRoleIconFieldUpdate {
  const GuildRoleIconFieldUpdate.image(this.icon) : unicodeEmoji = null;

  const GuildRoleIconFieldUpdate.unicodeEmoji(this.unicodeEmoji) : icon = null;

  const GuildRoleIconFieldUpdate.clear() : icon = null, unicodeEmoji = null;

  final String? icon;
  final String? unicodeEmoji;

  bool get isClear => icon == null && unicodeEmoji == null;
  bool get isImage => icon != null && icon!.isNotEmpty;
  bool get isUnicodeEmoji => unicodeEmoji != null && unicodeEmoji!.isNotEmpty;
}
