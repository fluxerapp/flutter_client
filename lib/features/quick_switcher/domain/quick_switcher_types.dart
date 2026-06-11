import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';

enum QuickSwitcherResultType {
  header,
  user,
  groupDm,
  textChannel,
  voiceChannel,
  guild,
  virtualGuild,
  settings,
  link,
}

enum QuickSwitcherVirtualGuildType { home, favorites }

enum QuickSwitcherSettingsTarget {
  userSettings,
  notifications,
  bookmarks,
  mentions,
}

enum QuickSwitcherQueryMode {
  user,
  textChannel,
  voiceChannel,
  guild,
}

const int kQuickSwitcherMaxGeneralResults = 5;
const int kQuickSwitcherMaxQueryModeResults = 20;
const int kQuickSwitcherMaxRecentResults = 8;
const int kQuickSwitcherMaxUnreadResults = 8;
const int kQuickSwitcherMemberSearchLimit = 25;
const int kQuickSwitcherUnreadSortWeightBoost = 7 * 24 * 60 * 60 * 1000;

sealed class QuickSwitcherResult {
  const QuickSwitcherResult();
}

class QuickSwitcherHeaderResult extends QuickSwitcherResult {
  const QuickSwitcherHeaderResult({required this.id, required this.title});

  final String id;
  final String title;

  QuickSwitcherResultType get type => QuickSwitcherResultType.header;
}

class QuickSwitcherUserResult extends QuickSwitcherResult {
  const QuickSwitcherUserResult({
    required this.id,
    required this.title,
    this.subtitle,
    required this.userId,
    this.dmChannelId,
    this.avatar,
    this.avatarColor,
    this.status,
  });

  final String id;
  final String title;
  final String? subtitle;
  final String userId;
  final String? dmChannelId;
  final String? avatar;
  final int? avatarColor;
  final String? status;

  QuickSwitcherResultType get type => QuickSwitcherResultType.user;
}

class QuickSwitcherGroupDmResult extends QuickSwitcherResult {
  const QuickSwitcherGroupDmResult({
    required this.id,
    required this.title,
    this.subtitle,
    required this.channelId,
    this.icon,
    this.groupStatus,
    this.groupMembers = const <GroupMemberInfo>[],
  });

  final String id;
  final String title;
  final String? subtitle;
  final String channelId;
  final String? icon;
  final String? groupStatus;
  final List<GroupMemberInfo> groupMembers;

  QuickSwitcherResultType get type => QuickSwitcherResultType.groupDm;
}

class QuickSwitcherTextChannelResult extends QuickSwitcherResult {
  const QuickSwitcherTextChannelResult({
    required this.id,
    required this.title,
    this.subtitle,
    required this.channelId,
    required this.guildId,
    this.guildName,
    this.guildIcon,
  });

  final String id;
  final String title;
  final String? subtitle;
  final String channelId;
  final String guildId;
  final String? guildName;
  final String? guildIcon;

  QuickSwitcherResultType get type => QuickSwitcherResultType.textChannel;
}

class QuickSwitcherVoiceChannelResult extends QuickSwitcherResult {
  const QuickSwitcherVoiceChannelResult({
    required this.id,
    required this.title,
    this.subtitle,
    required this.channelId,
    required this.guildId,
    this.guildName,
    this.guildIcon,
  });

  final String id;
  final String title;
  final String? subtitle;
  final String channelId;
  final String guildId;
  final String? guildName;
  final String? guildIcon;

  QuickSwitcherResultType get type => QuickSwitcherResultType.voiceChannel;
}

class QuickSwitcherGuildResult extends QuickSwitcherResult {
  const QuickSwitcherGuildResult({
    required this.id,
    required this.title,
    this.subtitle,
    required this.guild,
  });

  final String id;
  final String title;
  final String? subtitle;
  final Guild guild;

  QuickSwitcherResultType get type => QuickSwitcherResultType.guild;
}

class QuickSwitcherVirtualGuildResult extends QuickSwitcherResult {
  const QuickSwitcherVirtualGuildResult({
    required this.id,
    required this.title,
    this.subtitle,
    required this.virtualGuildType,
  });

  final String id;
  final String title;
  final String? subtitle;
  final QuickSwitcherVirtualGuildType virtualGuildType;

  QuickSwitcherResultType get type => QuickSwitcherResultType.virtualGuild;
}

class QuickSwitcherSettingsResult extends QuickSwitcherResult {
  const QuickSwitcherSettingsResult({
    required this.id,
    required this.title,
    this.subtitle,
    required this.target,
  });

  final String id;
  final String title;
  final String? subtitle;
  final QuickSwitcherSettingsTarget target;

  QuickSwitcherResultType get type => QuickSwitcherResultType.settings;
}

class QuickSwitcherLinkResult extends QuickSwitcherResult {
  const QuickSwitcherLinkResult({
    required this.id,
    required this.title,
    this.subtitle,
    required this.path,
  });

  final String id;
  final String title;
  final String? subtitle;
  final String path;

  QuickSwitcherResultType get type => QuickSwitcherResultType.link;
}

bool isQuickSwitcherExecutable(QuickSwitcherResult result) =>
    result is! QuickSwitcherHeaderResult;

QuickSwitcherResultType? quickSwitcherQueryModeToResultType(
  QuickSwitcherQueryMode mode,
) => switch (mode) {
  QuickSwitcherQueryMode.user => QuickSwitcherResultType.user,
  QuickSwitcherQueryMode.textChannel => QuickSwitcherResultType.textChannel,
  QuickSwitcherQueryMode.voiceChannel => QuickSwitcherResultType.voiceChannel,
  QuickSwitcherQueryMode.guild => QuickSwitcherResultType.guild,
};

QuickSwitcherQueryMode? parseQuickSwitcherQueryMode(String query) {
  if (query.isEmpty) {
    return null;
  }
  return switch (query[0]) {
    '@' => QuickSwitcherQueryMode.user,
    '#' => QuickSwitcherQueryMode.textChannel,
    '!' => QuickSwitcherQueryMode.voiceChannel,
    '*' => QuickSwitcherQueryMode.guild,
    _ => null,
  };
}

String quickSwitcherResultKey(QuickSwitcherResult result) => switch (result) {
  QuickSwitcherHeaderResult(:final id) => 'header-$id',
  QuickSwitcherUserResult(:final id) => 'user-$id',
  QuickSwitcherGroupDmResult(:final id) => 'group-dm-$id',
  QuickSwitcherTextChannelResult(:final id) => 'text-$id',
  QuickSwitcherVoiceChannelResult(:final id) => 'voice-$id',
  QuickSwitcherGuildResult(:final id) => 'guild-$id',
  QuickSwitcherVirtualGuildResult(:final id) => 'virtual-$id',
  QuickSwitcherSettingsResult(:final id) => 'settings-$id',
  QuickSwitcherLinkResult(:final id) => 'link-$id',
};
