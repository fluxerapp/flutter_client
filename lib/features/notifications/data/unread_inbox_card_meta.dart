import 'package:fluxer_app/core/database/fluxer_database.dart' as drift_db;
import 'package:fluxer_app/features/channels/domain/channel.dart' as domain;
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/notifications/domain/unread_inbox_entry.dart';

const String _kFallbackDmTitle = 'DM';

/// Snapshot of the metadata rendered in an unread-inbox card header: channel
/// title, optional guild line, channel-type icon hint, and the rounded
/// server-icon avatar inputs.
class UnreadInboxCardMeta {
  const UnreadInboxCardMeta({
    required this.channelTitle,
    required this.subtitleLine,
    required this.guildChannelVisualType,
    required this.guildIconDisplayUrl,
    required this.guildUnavailableForIcon,
    required this.guildIconName,
  });

  factory UnreadInboxCardMeta.empty() => const UnreadInboxCardMeta(
    channelTitle: '',
    subtitleLine: '',
    guildChannelVisualType: domain.ChannelType.text,
    guildIconDisplayUrl: null,
    guildUnavailableForIcon: false,
    guildIconName: '',
  );

  final String channelTitle;
  final String subtitleLine;
  final domain.ChannelType guildChannelVisualType;
  final String? guildIconDisplayUrl;
  final bool guildUnavailableForIcon;
  final String guildIconName;
}

/// Resolves the display metadata (title, guild line, and icon inputs) for
/// an [UnreadInboxEntry]. Always returns a usable snapshot — falls back to
/// `'DM'` for unknown DM channels.
Future<UnreadInboxCardMeta> loadUnreadInboxCardMeta(
  drift_db.FluxerDatabase db,
  UnreadInboxEntry entry,
) {
  if (entry.isDm) {
    return _loadDmMeta(db, entry.channelId);
  }
  return _loadGuildChannelMeta(db, entry);
}

Future<UnreadInboxCardMeta> _loadDmMeta(
  drift_db.FluxerDatabase db,
  String channelId,
) async {
  final drift_db.DmChannel? dm = await db.dmChannelDao.getDmChannelById(
    channelId,
  );
  String title = dm?.name?.trim() ?? '';
  if (title.isEmpty && dm != null && dm.recipientId.isNotEmpty) {
    final drift_db.User? user = await db.userDao.getUserById(dm.recipientId);
    title = user?.username ?? _kFallbackDmTitle;
  }
  if (title.isEmpty) {
    title = _kFallbackDmTitle;
  }
  return UnreadInboxCardMeta(
    channelTitle: title,
    subtitleLine: '',
    guildChannelVisualType: domain.ChannelType.text,
    guildIconDisplayUrl: null,
    guildUnavailableForIcon: false,
    guildIconName: '',
  );
}

Future<UnreadInboxCardMeta> _loadGuildChannelMeta(
  drift_db.FluxerDatabase db,
  UnreadInboxEntry entry,
) async {
  final drift_db.Channel? ch = await db.channelDao.getChannelById(
    entry.channelId,
  );
  final domain.Channel? mapped = ch == null ? null : domain.Channel.fromRow(ch);
  final domain.ChannelType visualType = mapped?.type ?? domain.ChannelType.text;

  final drift_db.Server? guild = entry.guildId == null
      ? null
      : await db.guildDao.getServerById(entry.guildId!);

  final String channelName = mapped?.name ?? '?';
  final String? guildLine = guild == null || guild.unavailable
      ? null
      : guild.name;
  final bool guildUnavailable = guild?.unavailable ?? false;

  String? iconUrl;
  String iconName = '';
  if (guild != null && !guildUnavailable) {
    final Guild mappedGuild = Guild.fromRow(guild);
    iconName = mappedGuild.name;
    iconUrl = mappedGuild.hasAnimatedIcon && mappedGuild.animatedIconUrl != null
        ? mappedGuild.animatedIconUrl
        : mappedGuild.iconUrl;
  } else if (guild != null) {
    iconName = guild.name;
  } else {
    iconName = channelName;
  }

  return UnreadInboxCardMeta(
    channelTitle: channelName,
    subtitleLine: guildLine ?? '',
    guildChannelVisualType: visualType,
    guildIconDisplayUrl: guildUnavailable ? null : iconUrl,
    guildUnavailableForIcon: guildUnavailable,
    guildIconName: iconName,
  );
}
