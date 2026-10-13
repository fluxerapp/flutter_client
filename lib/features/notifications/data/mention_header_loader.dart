import 'package:fluxer_app/core/database/fluxer_database.dart' as drift_db;
import 'package:fluxer_app/features/channels/domain/channel.dart' as domain;
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/dm/data/dm_conversation_mapper.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/utils/group_dm_display_name.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/notifications/domain/mention_header.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';

const String _kFallbackDmTitle = 'DM';

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

Future<MentionHeaderResult> loadMentionHeaderForMessage(
  drift_db.FluxerDatabase db,
  Message msg,
) {
  return _loadHeaderForChannelId(db, msg.channelId);
}

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
  if (isDmGroupType(dm.type)) {
    final conversation = await buildDmConversationFromChannelRow(db, dm);
    final String title = resolveGroupDmDisplayName(dm: conversation);
    return MentionHeaderResult(
      header: MentionHeader.dm(title: title, isGroup: true),
      guildIdForPreview: '',
    );
  }
  String title = dm.name?.trim() ?? '';
  if (title.isEmpty && dm.recipientId.isNotEmpty) {
    final drift_db.User? user = await db.userDao.getUserById(dm.recipientId);
    final drift_db.Relationship? relationship = await db.relationshipDao
        .getRelationship(dm.recipientId);
    title = user == null
        ? _kFallbackDmTitle
        : resolveDisplayName(
            friendNickname: relationship?.nickname,
            globalName: user.globalName,
            username: user.username,
          );
  }
  if (title.isEmpty) {
    title = _kFallbackDmTitle;
  }
  return MentionHeaderResult(
    header: MentionHeader.dm(title: title),
    guildIdForPreview: '',
  );
}
