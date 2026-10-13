const int kDefaultGuildRoleColorArgb = 0xFF99AAB5;

int? opaqueRoleColorInt(int? color) {
  if (color == null || color == 0) {
    return null;
  }
  return color | 0xFF000000;
}

int guildRoleColorInt(int color) {
  return opaqueRoleColorInt(color == 0 ? null : color) ??
      kDefaultGuildRoleColorArgb;
}
