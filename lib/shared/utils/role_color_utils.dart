import 'package:image/image.dart' show Color;

/// Default @everyone-style role color when no custom color is set.
const int kDefaultGuildRoleColorArgb = 0xFF99AAB5;

/// Guild role colors from the API are 24-bit RGB values. Flutter [Color]
/// expects ARGB, so raw values render with zero alpha unless the high byte
/// is set.
int? opaqueRoleColorInt(int? color) {
  if (color == null || color == 0) {
    return null;
  }
  return color | 0xFF000000;
}

/// Resolves a guild role color to an opaque ARGB int, using [kDefaultGuildRoleColorArgb]
/// when the role has no custom color.
int guildRoleColorInt(int color) {
  return opaqueRoleColorInt(color == 0 ? null : color) ??
      kDefaultGuildRoleColorArgb;
}
