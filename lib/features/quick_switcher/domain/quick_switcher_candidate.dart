import 'package:fluxer_app/features/channels/domain/channel.dart'
    show ChannelType;
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_types.dart';
import 'package:fluxer_app/shared/utils/user_tag.dart';

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
  });

  final String userId;
  final String? dmChannelId;
  final String? avatar;
  final int? avatarColor;
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
    this.channelType = ChannelType.guildText,
  });

  final String channelId;
  final String guildId;
  final bool isVoice;
  final ChannelType channelType;
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
    this.threads = const <QuickSwitcherChannelCandidate>[],
  });

  final List<QuickSwitcherUserCandidate> users;
  final List<QuickSwitcherGroupDmCandidate> groupDms;
  final List<QuickSwitcherChannelCandidate> textChannels;
  final List<QuickSwitcherChannelCandidate> threads;
  final List<QuickSwitcherChannelCandidate> voiceChannels;
  final List<QuickSwitcherGuildCandidate> guilds;
  final List<QuickSwitcherVirtualGuildCandidate> virtualGuilds;
  final List<QuickSwitcherSettingsCandidate> settings;
}

QuickSwitcherUserCandidate quickSwitcherUserCandidateFromFriend(
  Friend friend, {
  String? dmChannelId,
  bool uniqueUsernames = false,
}) {
  final String title = friend.nickname ?? friend.displayName;
  final String subtitle = formatUserTag(
    friend.username,
    friend.discriminator,
    uniqueUsernames: uniqueUsernames,
  );
  return QuickSwitcherUserCandidate(
    id: friend.id,
    title: title,
    subtitle: subtitle,
    userId: friend.id,
    dmChannelId: dmChannelId,
    avatar: friend.avatar,
    avatarColor: friend.avatarColor,
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
