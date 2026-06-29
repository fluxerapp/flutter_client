import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_build_input.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_candidate.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_types.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';

QuickSwitcherCandidateSets buildQuickSwitcherCandidateSets(
  QuickSwitcherBuildInput input,
) {
  final Map<String, Guild> guildsById = <String, Guild>{
    for (final Guild guild in input.guilds) guild.id: guild,
  };
  final Map<String, String?> friendNicknameById = friendNicknamesById(
    input.friends,
  );
  final Map<String, QuickSwitcherUserCandidate> users =
      <String, QuickSwitcherUserCandidate>{};
  final List<QuickSwitcherGroupDmCandidate> groupDms =
      <QuickSwitcherGroupDmCandidate>[];
  final List<QuickSwitcherChannelCandidate> textChannels =
      <QuickSwitcherChannelCandidate>[];
  final List<QuickSwitcherChannelCandidate> voiceChannels =
      <QuickSwitcherChannelCandidate>[];
  for (final DmConversation convo in input.conversations) {
    if (convo.isGroup) {
      groupDms.add(quickSwitcherGroupDmCandidate(convo));
      continue;
    }
    if (convo.isPersonalNotes) {
      continue;
    }
    final String resolvedName = convo.displayNameWith(
      friendNicknameById[convo.recipientId],
    );
    final QuickSwitcherUserCandidate userCandidate = QuickSwitcherUserCandidate(
      id: convo.recipientId,
      title: resolvedName,
      subtitle: convo.recipientUsername ?? convo.recipientName,
      userId: convo.recipientId,
      dmChannelId: convo.id,
      avatar: convo.recipientAvatar,
      status: convo.recipientStatus,
      searchValues: <String>[
        resolvedName,
        convo.displayName,
        convo.recipientName,
        if (convo.recipientUsername != null) convo.recipientUsername!,
        convo.id,
      ],
      sortWeight: convo.lastMessageTime.millisecondsSinceEpoch,
    );
    users[convo.recipientId] = userCandidate;
  }
  for (final Friend friend in input.friends) {
    if (friend.friendStatus != FriendStatus.accepted) {
      continue;
    }
    users.putIfAbsent(
      friend.id,
      () => quickSwitcherUserCandidateFromFriend(
        friend,
        dmChannelId: _dmChannelIdForUser(input.conversations, friend.id),
      ),
    );
  }
  for (final Member member in input.guildMembers) {
    if (member.id == input.currentUserId) {
      continue;
    }
    final String memberName = resolveDisplayName(
      guildNickname: member.nickname,
      friendNickname: friendNicknameById[member.id],
      globalName: member.globalName,
      username: member.username,
    );
    users.putIfAbsent(
      member.id,
      () => QuickSwitcherUserCandidate(
        id: member.id,
        title: memberName,
        subtitle: member.username,
        userId: member.id,
        avatar: member.avatar,
        avatarColor: member.avatarColor,
        status: member.status,
        searchValues: <String>[
          memberName,
          member.username,
          if (member.globalName != null) member.globalName!,
          member.id,
        ],
        sortWeight: 0,
      ),
    );
  }
  for (final Channel channel in input.guildChannels) {
    if (channel.type != ChannelType.guildText &&
        channel.type != ChannelType.guildVoice) {
      continue;
    }
    final Guild? guild = guildsById[channel.guildId];
    final String guildName = guild?.name ?? '';
    final int sortWeight = _channelSortWeight(channel);
    final QuickSwitcherChannelCandidate candidate =
        QuickSwitcherChannelCandidate(
          id: channel.id,
          title: channel.name,
          subtitle: guildName,
          channelId: channel.id,
          guildId: channel.guildId,
          guildName: guildName,
          guildIcon: guild?.icon,
          isVoice: channel.type == ChannelType.guildVoice,
          searchValues: <String>[channel.name, guildName, channel.id],
          sortWeight: sortWeight,
        );
    if (channel.type == ChannelType.guildVoice) {
      voiceChannels.add(candidate);
    } else {
      textChannels.add(candidate);
    }
  }
  final List<QuickSwitcherGuildCandidate> guildCandidates = input.guilds
      .map(
        (Guild guild) => QuickSwitcherGuildCandidate(
          id: guild.id,
          title: guild.name,
          guild: guild,
          searchValues: <String>[guild.name, guild.id],
          sortWeight: guild.position,
        ),
      )
      .toList();
  final List<QuickSwitcherVirtualGuildCandidate> virtualGuilds =
      <QuickSwitcherVirtualGuildCandidate>[
        QuickSwitcherVirtualGuildCandidate(
          id: 'home',
          title: input.l10n.quickSwitcherHomeLabel,
          subtitle: input.l10n.quickSwitcherDirectMessagesLabel,
          virtualGuildType: QuickSwitcherVirtualGuildType.home,
          searchValues: _homeVirtualGuildSearchValues(input.l10n),
          sortWeight: DateTime.now().millisecondsSinceEpoch,
        ),
        if (input.hasFavorites)
          QuickSwitcherVirtualGuildCandidate(
            id: 'favorites',
            title: input.l10n.quickSwitcherFavoritesLabel,
            virtualGuildType: QuickSwitcherVirtualGuildType.favorites,
            searchValues: _favoritesVirtualGuildSearchValues(input.l10n),
            sortWeight: DateTime.now().millisecondsSinceEpoch,
          ),
      ];
  final List<QuickSwitcherSettingsCandidate> settings =
      <QuickSwitcherSettingsCandidate>[
        QuickSwitcherSettingsCandidate(
          id: 'user-settings',
          title: input.l10n.quickSwitcherUserSettingsLabel,
          target: QuickSwitcherSettingsTarget.userSettings,
          searchValues: _userSettingsSearchValues(input.l10n),
          sortWeight: 0,
        ),
        QuickSwitcherSettingsCandidate(
          id: 'notifications',
          title: input.l10n.quickSwitcherNotificationsLabel,
          target: QuickSwitcherSettingsTarget.notifications,
          searchValues: _notificationsSearchValues(input.l10n),
          sortWeight: 0,
        ),
        QuickSwitcherSettingsCandidate(
          id: 'bookmarks',
          title: input.l10n.quickSwitcherBookmarksLabel,
          target: QuickSwitcherSettingsTarget.bookmarks,
          searchValues: _bookmarksSearchValues(input.l10n),
          sortWeight: 0,
        ),
        QuickSwitcherSettingsCandidate(
          id: 'mentions',
          title: input.l10n.quickSwitcherMentionsLabel,
          target: QuickSwitcherSettingsTarget.mentions,
          searchValues: _mentionsSearchValues(input.l10n),
          sortWeight: 0,
        ),
      ];
  return QuickSwitcherCandidateSets(
    users: users.values.toList(),
    groupDms: groupDms,
    textChannels: textChannels,
    voiceChannels: voiceChannels,
    guilds: guildCandidates,
    virtualGuilds: virtualGuilds,
    settings: settings,
  );
}

QuickSwitcherGroupDmCandidate quickSwitcherGroupDmCandidate(
  DmConversation convo,
) {
  final List<String> participantNames = convo.groupMembers
      .map((GroupMemberInfo member) => member.name)
      .toList();
  final String subtitle = participantNames.isNotEmpty
      ? participantNames.join(', ')
      : '${convo.memberCount} members';
  return QuickSwitcherGroupDmCandidate(
    id: convo.id,
    title: convo.displayName,
    subtitle: subtitle,
    channelId: convo.id,
    icon: convo.icon,
    groupStatus: convo.groupStatus,
    groupMembers: convo.groupMembers,
    searchValues: <String>[convo.displayName, ...participantNames, convo.id],
    sortWeight: convo.lastMessageTime.millisecondsSinceEpoch,
  );
}

String? _dmChannelIdForUser(List<DmConversation> conversations, String userId) {
  for (final DmConversation convo in conversations) {
    if (!convo.isGroup && convo.recipientId == userId) {
      return convo.id;
    }
  }
  return null;
}

int _channelSortWeight(Channel channel) {
  return dateTimeFromSnowflakeAsLocalOrNow(channel.id).millisecondsSinceEpoch;
}

List<QuickSwitcherUserCandidate> mergeMemberSearchCandidates({
  required List<QuickSwitcherUserCandidate> baseCandidates,
  required List<Member> memberSearchResults,
  required String? currentUserId,
  Map<String, String?> friendNicknameById = const <String, String?>{},
}) {
  if (memberSearchResults.isEmpty) {
    return baseCandidates;
  }
  final Map<String, QuickSwitcherUserCandidate> candidateMap =
      <String, QuickSwitcherUserCandidate>{
        for (final QuickSwitcherUserCandidate candidate in baseCandidates)
          candidate.userId: candidate,
      };
  for (final Member member in memberSearchResults) {
    if (member.id == currentUserId) {
      continue;
    }
    final String memberName = resolveDisplayName(
      guildNickname: member.nickname,
      friendNickname: friendNicknameById[member.id],
      globalName: member.globalName,
      username: member.username,
    );
    candidateMap.putIfAbsent(
      member.id,
      () => QuickSwitcherUserCandidate(
        id: member.id,
        title: memberName,
        subtitle: member.username,
        userId: member.id,
        avatar: member.avatar,
        avatarColor: member.avatarColor,
        status: member.status,
        searchValues: <String>[
          memberName,
          member.username,
          if (member.globalName != null) member.globalName!,
          member.id,
        ],
        sortWeight: 0,
      ),
    );
  }
  return candidateMap.values.toList();
}

List<String> _homeVirtualGuildSearchValues(FluxerLocalizations l10n) {
  return <String>[
    l10n.quickSwitcherHomeLabel,
    l10n.quickSwitcherSearchAliasDm,
    l10n.quickSwitcherSearchAliasDms,
    l10n.quickSwitcherDirectMessagesLabel,
    l10n.quickSwitcherSearchAliasMessages,
  ];
}

List<String> _favoritesVirtualGuildSearchValues(FluxerLocalizations l10n) {
  return <String>[
    l10n.quickSwitcherFavoritesLabel,
    l10n.quickSwitcherSearchAliasFav,
    l10n.quickSwitcherSearchAliasStarred,
  ];
}

List<String> _userSettingsSearchValues(FluxerLocalizations l10n) {
  return <String>[
    l10n.quickSwitcherSectionSettings,
    l10n.quickSwitcherSearchAliasUser,
    l10n.userSettingsNavProfile,
    l10n.quickSwitcherSearchAliasYou,
  ];
}

List<String> _notificationsSearchValues(FluxerLocalizations l10n) {
  return <String>[
    l10n.quickSwitcherNotificationsLabel,
    l10n.quickSwitcherSearchAliasInbox,
  ];
}

List<String> _bookmarksSearchValues(FluxerLocalizations l10n) {
  return <String>[
    l10n.quickSwitcherBookmarksLabel,
    l10n.quickSwitcherSearchAliasSaved,
  ];
}

List<String> _mentionsSearchValues(FluxerLocalizations l10n) {
  return <String>[l10n.quickSwitcherMentionsLabel, '@'];
}
