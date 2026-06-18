import 'package:fluxer_app/core/database/fluxer_database.dart' as drift_db;
import 'package:fluxer_app/features/channels/domain/channel.dart' as domain;
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/notifications/domain/mention_header.dart';

const String _kFallbackDmTitle = 'DM';

/// Whether [msg] points at a still-reachable channel: an existing DM, an
/// existing guild channel without a guild row, or a guild channel whose guild
/// is present and not flagged unavailable.
Future<bool> isChannelReachable(drift_db.FluxerDatabase db, Message msg) async {
  final drift_db.Channel? chRow = await db.channelDao.getChannelById(
    msg.channelId,
  );
  if (chRow == null) {
    final drift_db.DmChannel? dm = await db.dmChannelDao.getDmChannelById(
      msg.channelId,
    );
    return dm != null;
  }
  final String guildId = chRow.guildId;
  if (guildId.isEmpty) {
    return true;
  }
  final drift_db.Server? guild = await db.guildDao.getServerById(guildId);
  return guild != null && !guild.unavailable;
}

/// Variant of [isChannelReachable] for the case where no resolved [Message]
/// exists yet, only a channel id from the feed row.
Future<bool> isBareChannelReachable(
  drift_db.FluxerDatabase db,
  String channelId,
) async {
  final drift_db.Channel? ch = await db.channelDao.getChannelById(channelId);
  if (ch != null) {
    final String guildId = ch.guildId;
    if (guildId.isEmpty) {
      return true;
    }
    final drift_db.Server? guild = await db.guildDao.getServerById(guildId);
    return guild != null && !guild.unavailable;
  }
  final drift_db.DmChannel? dm = await db.dmChannelDao.getDmChannelById(
    channelId,
  );
  return dm != null;
}

/// Build the [MentionHeader] for a known [Message]. Falls back to a generic DM
/// header if neither a guild channel nor a DM channel can be resolved.
Future<MentionHeaderResult> loadMentionHeaderForMessage(
  drift_db.FluxerDatabase db,
  Message msg,
) {
  return _loadHeaderForChannelId(db, msg.channelId);
}

/// Build the [MentionHeader] for a feed row whose underlying message has not
/// been hydrated yet.
Future<MentionHeaderResult> loadMentionHeaderForChannelId(
  drift_db.FluxerDatabase db,
  String channelId,
) {
  return _loadHeaderForChannelId(db, channelId);
}

Future<MentionHeaderResult> _loadHeaderForChannelId(
  drift_db.FluxerDatabase db,
  String channelId,
) async {
  final drift_db.Channel? chRow = await db.channelDao.getChannelById(channelId);
  if (chRow != null) {
    return _buildGuildHeader(db, chRow);
  }
  final drift_db.DmChannel? dm = await db.dmChannelDao.getDmChannelById(
    channelId,
  );
  if (dm == null) {
    return MentionHeaderResult(
      header: MentionHeader.dm(title: _kFallbackDmTitle),
      guildIdForPreview: '',
    );
  }
  return _buildDmHeader(db, dm);
}

Future<MentionHeaderResult> _buildGuildHeader(
  drift_db.FluxerDatabase db,
  drift_db.Channel chRow,
) async {
  final domain.Channel mapped = domain.Channel.fromRow(chRow);
  final drift_db.Server? guild = await db.guildDao.getServerById(
    mapped.guildId,
  );
  final bool isUnavailable = guild?.unavailable ?? false;
  String iconName = '';
  String? iconUrl;
  if (guild != null) {
    final Guild mappedGuild = Guild.fromRow(guild);
    iconName = mappedGuild.name;
    if (!isUnavailable) {
      iconUrl =
          mappedGuild.hasAnimatedIcon && mappedGuild.animatedIconUrl != null
          ? mappedGuild.animatedIconUrl
          : mappedGuild.iconUrl;
    }
  }
  final String guildLine = guild == null || guild.unavailable ? '' : guild.name;
  return MentionHeaderResult(
    header: MentionHeader.guild(
      primary: mapped.name,
      visual: mapped.type,
      secondaryLine: guildLine,
      iconName: iconName,
      isUnavailable: isUnavailable,
      iconUrl: iconUrl,
    ),
    guildIdForPreview: mapped.guildId,
  );
}

Future<MentionHeaderResult> _buildDmHeader(
  drift_db.FluxerDatabase db,
  drift_db.DmChannel dm,
) async {
  String title = dm.name?.trim() ?? '';
  if (title.isEmpty && dm.recipientId.isNotEmpty) {
    final drift_db.User? user = await db.userDao.getUserById(dm.recipientId);
    title = user?.username ?? _kFallbackDmTitle;
  }
  if (title.isEmpty) {
    title = _kFallbackDmTitle;
  }
  return MentionHeaderResult(
    header: MentionHeader.dm(title: title),
    guildIdForPreview: '',
  );
}
