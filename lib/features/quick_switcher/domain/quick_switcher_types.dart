import 'package:fluxer_app/features/channels/domain/channel.dart'
    show ChannelType;
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';

enum QuickSwitcherResultType {
  user,
  groupDm,
  textChannel,
  thread,
  voiceChannel,
  guild,
  virtualGuild,
  settings,
}

enum QuickSwitcherVirtualGuildType { home, favorites }

enum QuickSwitcherSettingsTarget {
  userSettings,
  notifications,
  bookmarks,
  mentions,
}

enum QuickSwitcherQueryMode { user, textChannel, voiceChannel, guild }

const int kQuickSwitcherMaxGeneralResults = 5;
const int kQuickSwitcherMaxQueryModeResults = 20;
const int kQuickSwitcherMaxRecentResults = 8;
const int kQuickSwitcherMaxUnreadResults = 8;
const int kQuickSwitcherMemberSearchLimit = 25;

sealed class QuickSwitcherResult {
  const QuickSwitcherResult();
}

class QuickSwitcherHeaderResult extends QuickSwitcherResult {
  const QuickSwitcherHeaderResult({required this.title});

  final String title;
}

class QuickSwitcherUserResult extends QuickSwitcherResult {
  const QuickSwitcherUserResult({
    required this.title,
    required this.userId,
    this.subtitle,
    this.dmChannelId,
    this.avatar,
    this.avatarColor,
  });

  final String title;
  final String? subtitle;
  final String userId;
  final String? dmChannelId;
  final String? avatar;
  final int? avatarColor;
}

class QuickSwitcherGroupDmResult extends QuickSwitcherResult {
  const QuickSwitcherGroupDmResult({
    required this.title,
    required this.channelId,
    this.subtitle,
    this.icon,
    this.groupStatus,
    this.groupMembers = const <GroupMemberInfo>[],
  });

  final String title;
  final String? subtitle;
  final String channelId;
  final String? icon;
  final String? groupStatus;
  final List<GroupMemberInfo> groupMembers;
}

class QuickSwitcherTextChannelResult extends QuickSwitcherResult {
  const QuickSwitcherTextChannelResult({
    required this.title,
    required this.channelId,
    required this.guildId,
    this.subtitle,
    this.channelType = ChannelType.guildText,
  });

  final String title;
  final String? subtitle;
  final String channelId;
  final String guildId;
  final ChannelType channelType;
}

class QuickSwitcherVoiceChannelResult extends QuickSwitcherResult {
  const QuickSwitcherVoiceChannelResult({
    required this.title,
    required this.channelId,
    required this.guildId,
    this.subtitle,
  });

  final String title;
  final String? subtitle;
  final String channelId;
  final String guildId;
}

class QuickSwitcherGuildResult extends QuickSwitcherResult {
  const QuickSwitcherGuildResult({
    required this.title,
    required this.guild,
    this.subtitle,
  });

  final String title;
  final String? subtitle;
  final Guild guild;
}

class QuickSwitcherVirtualGuildResult extends QuickSwitcherResult {
  const QuickSwitcherVirtualGuildResult({
    required this.title,
    required this.virtualGuildType,
    this.subtitle,
  });

  final String title;
  final String? subtitle;
  final QuickSwitcherVirtualGuildType virtualGuildType;
}

class QuickSwitcherSettingsResult extends QuickSwitcherResult {
  const QuickSwitcherSettingsResult({
    required this.title,
    required this.target,
    this.subtitle,
  });

  final String title;
  final String? subtitle;
  final QuickSwitcherSettingsTarget target;
}

class QuickSwitcherLinkResult extends QuickSwitcherResult {
  const QuickSwitcherLinkResult({
    required this.title,
    required this.path,
    this.subtitle,
  });

  final String title;
  final String? subtitle;
  final String path;
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
