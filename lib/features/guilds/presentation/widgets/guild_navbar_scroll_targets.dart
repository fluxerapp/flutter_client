import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_scroll_indicator.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_provider.dart';
import 'package:fluxer_app/features/guilds/providers/organized_guild_list_provider.dart';

String guildFolderScrollIndicatorId(int folderId) => 'folder:$folderId';

List<String> guildNavbarScrollIndicatorOrder({
  required Iterable<GuildNavbarItem> items,
  required Set<int> expandedFolderIds,
}) {
  return <String>[
    for (final GuildNavbarItem item in items)
      if (item case final GuildNavbarGuild guildItem)
        guildItem.guild.id
      else if (item case final GuildNavbarFolder folder)
        if (expandedFolderIds.contains(folder.id))
          for (final Guild guild in folder.guilds) guild.id
        else
          guildFolderScrollIndicatorId(folder.id),
  ];
}

Map<String, List<Guild>> guildNavbarScrollIndicatorFolderGuilds(
  Iterable<GuildNavbarItem> items,
) {
  return <String, List<Guild>>{
    for (final GuildNavbarItem item in items)
      if (item case final GuildNavbarFolder folder)
        guildFolderScrollIndicatorId(folder.id): folder.guilds,
  };
}

GuildScrollIndicatorSeverity? guildNavbarScrollIndicatorSeverity({
  required String id,
  required Map<String, List<Guild>> folderGuilds,
  required Map<String, GuildReadStateEntry> readStates,
}) {
  final List<Guild>? guilds = folderGuilds[id];
  if (guilds != null) {
    return _folderSeverity(guilds, readStates);
  }
  return _guildSeverity(readStates[id]);
}

GuildScrollIndicatorSeverity? _folderSeverity(
  List<Guild> guilds,
  Map<String, GuildReadStateEntry> readStates,
) {
  var hasUnread = false;
  for (final Guild guild in guilds) {
    final GuildScrollIndicatorSeverity? severity = _guildSeverity(
      readStates[guild.id],
    );
    if (severity == GuildScrollIndicatorSeverity.mention) {
      return severity;
    }
    if (severity == GuildScrollIndicatorSeverity.unread) {
      hasUnread = true;
    }
  }
  return hasUnread ? GuildScrollIndicatorSeverity.unread : null;
}

GuildScrollIndicatorSeverity? _guildSeverity(GuildReadStateEntry? unread) {
  if (unread == null) {
    return null;
  }
  if (unread.mentionCount > 0) {
    return GuildScrollIndicatorSeverity.mention;
  }
  if (unread.hasUnread) {
    return GuildScrollIndicatorSeverity.unread;
  }
  return null;
}
