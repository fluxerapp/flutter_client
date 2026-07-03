import 'package:fluxer_app/features/settings/utils/guild_bans_utils.dart';
import 'package:fluxer_dart/export.dart';

class GuildBanEntry {
  const GuildBanEntry({required this.ban, required this.searchHaystack});

  final GuildBanResponse ban;
  final String searchHaystack;

  String get userId => ban.user.id;

  factory GuildBanEntry.fromResponse(GuildBanResponse response) {
    return GuildBanEntry(
      ban: response,
      searchHaystack: GuildBansUtils.buildSearchHaystack(
        response.user,
        response.reason,
      ),
    );
  }
}
