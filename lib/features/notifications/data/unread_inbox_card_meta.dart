import 'package:fluxer_app/core/database/fluxer_database.dart' as drift_db;
import 'package:fluxer_app/features/channels/domain/channel.dart' as domain;
import 'package:fluxer_app/features/dm/data/dm_conversation_mapper.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/notifications/data/mention_header_loader.dart';
import 'package:fluxer_app/features/notifications/domain/mention_header.dart';
import 'package:fluxer_app/features/notifications/domain/unread_inbox_entry.dart';

const String _kFallbackDmTitle = 'DM';

class UnreadInboxCardMeta {
  const UnreadInboxCardMeta({
    required this.channelTitle,
    required this.subtitleLine,
    required this.guildChannelVisualType,
    required this.guildIconDisplayUrl,
    required this.guildUnavailableForIcon,
    required this.guildIconName,
    this.dmUser,
    this.groupDm,
  });

  factory UnreadInboxCardMeta.empty() => const UnreadInboxCardMeta(
    channelTitle: '',
    subtitleLine: '',
    guildChannelVisualType: domain.ChannelType.guildText,
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
  final drift_db.User? dmUser;
  final DmConversation? groupDm;
}

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
  final MentionHeaderResult result = await loadMentionHeaderForChannelId(
    db,
    channelId,
  );
  final String title = result.header.isDm ? result.header.primary : '';
  final drift_db.DmChannel? dm = await db.dmChannelDao.getDmChannelById(
    channelId,
  );
  final bool isGroup = dm != null && isDmGroupType(dm.type);
  return UnreadInboxCardMeta(
    channelTitle: title.isEmpty ? _kFallbackDmTitle : title,
    subtitleLine: '',
    guildChannelVisualType: domain.ChannelType.guildText,
    guildIconDisplayUrl: null,
    guildUnavailableForIcon: false,
    guildIconName: '',
    dmUser: dm == null || isGroup || dm.recipientId.isEmpty
        ? null
        : await db.userDao.getUserById(dm.recipientId),
    groupDm: dm != null && isGroup
        ? await buildDmConversationFromChannelRow(db, dm)
        : null,
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
  final domain.ChannelType visualType =
      mapped?.type ?? domain.ChannelType.guildText;

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
