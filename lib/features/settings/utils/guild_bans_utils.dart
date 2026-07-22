import 'package:fluxer_app/features/settings/domain/guild/guild_ban_entry.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';
import 'package:fluxer_dart/export.dart';

class GuildBansUtils {
  GuildBansUtils._();

  static String buildUserTag(UserPartialResponse user) {
    return '${user.username}#${user.discriminator}';
  }

  static String buildSearchHaystack(UserPartialResponse user, String? reason) {
    final String displayName = resolveDisplayName(
      username: user.username,
      globalName: user.globalName,
    );
    final String tag = buildUserTag(user);
    final String reasonText = reason?.trim() ?? '';
    return '$displayName ${user.username} $tag $reasonText'.toLowerCase();
  }

  static List<int> filterBanIndices(List<GuildBanEntry> bans, String query) {
    final String trimmed = query.trim().toLowerCase();
    if (trimmed.isEmpty) {
      return List<int>.generate(bans.length, (int index) => index);
    }
    final List<int> indices = <int>[];
    for (int index = 0; index < bans.length; index++) {
      if (bans[index].searchHaystack.contains(trimmed)) {
        indices.add(index);
      }
    }
    return indices;
  }

  static List<GuildBanEntry> sortBanEntries(List<GuildBanEntry> entries) {
    return List<GuildBanEntry>.from(entries)..sort(
      (GuildBanEntry a, GuildBanEntry b) =>
          b.ban.bannedAt.compareTo(a.ban.bannedAt),
    );
  }
}
