import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_types.dart';

enum QuickSwitcherCandidateType {
  user,
  groupDm,
  textChannel,
  voiceChannel,
  guild,
  virtualGuild,
  settings,
}

sealed class QuickSwitcherCandidate {
  const QuickSwitcherCandidate({
    required this.id,
    required this.title,
    required this.searchValues,
    required this.sortWeight,
    this.subtitle,
  });

  final String id;
  final String title;
  final String? subtitle;
  final List<String> searchValues;
  final int sortWeight;

  QuickSwitcherCandidateType get candidateType;
}

class QuickSwitcherUserCandidate extends QuickSwitcherCandidate {
  const QuickSwitcherUserCandidate({
    required super.id,
    required super.title,
    required super.searchValues,
    required super.sortWeight,
    required this.userId,
    super.subtitle,
    this.dmChannelId,
    this.avatar,
    this.avatarColor,
    this.status,
  });

  final String userId;
  final String? dmChannelId;
  final String? avatar;
  final int? avatarColor;
  final String? status;

  @override
  QuickSwitcherCandidateType get candidateType =>
      QuickSwitcherCandidateType.user;
}

class QuickSwitcherGroupDmCandidate extends QuickSwitcherCandidate {
  const QuickSwitcherGroupDmCandidate({
    required super.id,
    required super.title,
    required super.searchValues,
    required super.sortWeight,
    required this.channelId,
    super.subtitle,
    this.icon,
    this.groupStatus,
    this.groupMembers = const <GroupMemberInfo>[],
  });

  final String channelId;
  final String? icon;
  final String? groupStatus;
  final List<GroupMemberInfo> groupMembers;

  @override
  QuickSwitcherCandidateType get candidateType =>
      QuickSwitcherCandidateType.groupDm;
}

class QuickSwitcherChannelCandidate extends QuickSwitcherCandidate {
  const QuickSwitcherChannelCandidate({
    required super.id,
    required super.title,
    required super.searchValues,
    required super.sortWeight,
    required this.channelId,
    required this.guildId,
    required this.isVoice,
    super.subtitle,
    this.guildName,
    this.guildIcon,
  });

  final String channelId;
  final String guildId;
  final String? guildName;
  final String? guildIcon;
  final bool isVoice;

  @override
  QuickSwitcherCandidateType get candidateType => isVoice
      ? QuickSwitcherCandidateType.voiceChannel
      : QuickSwitcherCandidateType.textChannel;
}

class QuickSwitcherGuildCandidate extends QuickSwitcherCandidate {
  const QuickSwitcherGuildCandidate({
    required super.id,
    required super.title,
    required super.searchValues,
    required super.sortWeight,
    required this.guild,
    super.subtitle,
  });

  final Guild guild;

  @override
  QuickSwitcherCandidateType get candidateType =>
      QuickSwitcherCandidateType.guild;
}

class QuickSwitcherVirtualGuildCandidate extends QuickSwitcherCandidate {
  const QuickSwitcherVirtualGuildCandidate({
    required super.id,
    required super.title,
    required super.searchValues,
    required super.sortWeight,
    required this.virtualGuildType,
    super.subtitle,
  });

  final QuickSwitcherVirtualGuildType virtualGuildType;

  @override
  QuickSwitcherCandidateType get candidateType =>
      QuickSwitcherCandidateType.virtualGuild;
}

class QuickSwitcherSettingsCandidate extends QuickSwitcherCandidate {
  const QuickSwitcherSettingsCandidate({
    required super.id,
    required super.title,
    required super.searchValues,
    required super.sortWeight,
    required this.target,
    super.subtitle,
  });

  final QuickSwitcherSettingsTarget target;

  @override
  QuickSwitcherCandidateType get candidateType =>
      QuickSwitcherCandidateType.settings;
}

// Default results key off channel IDs (recent visits, unread). Maps mirror web.
class QuickSwitcherChannelLookup {
  const QuickSwitcherChannelLookup({
    required this.userByChannelId,
    required this.groupDmByChannelId,
    required this.textChannelById,
    required this.voiceChannelById,
  });

  final Map<String, QuickSwitcherUserCandidate> userByChannelId;
  final Map<String, QuickSwitcherGroupDmCandidate> groupDmByChannelId;
  final Map<String, QuickSwitcherChannelCandidate> textChannelById;
  final Map<String, QuickSwitcherChannelCandidate> voiceChannelById;

  QuickSwitcherCandidate? candidateForChannelId(String channelId) {
    return userByChannelId[channelId] ??
        groupDmByChannelId[channelId] ??
        textChannelById[channelId] ??
        voiceChannelById[channelId];
  }
}

class QuickSwitcherCandidateSets {
  QuickSwitcherCandidateSets({
    required this.users,
    required this.groupDms,
    required this.textChannels,
    required this.voiceChannels,
    required this.guilds,
    required this.virtualGuilds,
    required this.settings,
    QuickSwitcherChannelLookup? lookup,
  }) : lookup =
           lookup ??
           QuickSwitcherChannelLookup(
             userByChannelId: _buildUserByChannelId(users),
             groupDmByChannelId: {
               for (final QuickSwitcherGroupDmCandidate groupDm in groupDms)
                 groupDm.channelId: groupDm,
             },
             textChannelById: {
               for (final QuickSwitcherChannelCandidate channel in textChannels)
                 channel.channelId: channel,
             },
             voiceChannelById: {
               for (final QuickSwitcherChannelCandidate channel
                   in voiceChannels)
                 channel.channelId: channel,
             },
           );

  final List<QuickSwitcherUserCandidate> users;
  final List<QuickSwitcherGroupDmCandidate> groupDms;
  final List<QuickSwitcherChannelCandidate> textChannels;
  final List<QuickSwitcherChannelCandidate> voiceChannels;
  final List<QuickSwitcherGuildCandidate> guilds;
  final List<QuickSwitcherVirtualGuildCandidate> virtualGuilds;
  final List<QuickSwitcherSettingsCandidate> settings;
  final QuickSwitcherChannelLookup lookup;
}

Map<String, QuickSwitcherUserCandidate> _buildUserByChannelId(
  List<QuickSwitcherUserCandidate> users,
) {
  final Map<String, QuickSwitcherUserCandidate> byChannelId =
      <String, QuickSwitcherUserCandidate>{};
  for (final QuickSwitcherUserCandidate user in users) {
    final String? dmChannelId = user.dmChannelId;
    if (dmChannelId == null || dmChannelId.isEmpty) {
      continue;
    }
    byChannelId[dmChannelId] = user;
  }
  return byChannelId;
}

QuickSwitcherUserCandidate quickSwitcherUserCandidateFromFriend(
  Friend friend, {
  String? dmChannelId,
}) {
  final String title = friend.nickname ?? friend.displayName;
  final String subtitle = friend.tag;
  return QuickSwitcherUserCandidate(
    id: friend.id,
    title: title,
    subtitle: subtitle,
    userId: friend.id,
    dmChannelId: dmChannelId,
    avatar: friend.avatar,
    avatarColor: friend.avatarColor,
    status: friend.status,
    searchValues: <String>[
      title,
      subtitle,
      friend.username,
      friend.id,
      if (friend.nickname != null) friend.nickname!,
    ],
    sortWeight: friend.since?.millisecondsSinceEpoch ?? 0,
  );
}
