import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_unread_state.dart';
import 'package:fluxer_app/features/channels/domain/hide_muted_channels_filter.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_mute_provider.dart';
import 'package:fluxer_app/features/channels/providers/guild_channel_unread_snapshot_provider.dart';
import 'package:fluxer_app/features/channels/providers/guild_collapsed_categories_provider.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_mute_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_sidebar_entries_provider.g.dart';

enum GuildSidebarEntryKind { categoryHeader, channel, voiceParticipants }

class GuildSidebarEntry {
  const GuildSidebarEntry({
    required this.kind,
    this.category,
    this.isCategoryCollapsed = false,
    this.channel,
    this.guildId,
  });

  final GuildSidebarEntryKind kind;
  final ChannelCategory? category;
  final bool isCategoryCollapsed;
  final Channel? channel;
  final String? guildId;
}

bool _hasVisibleUnreadForChannel({
  required UnreadState? unread,
  required Set<String> mutedSet,
  required String channelId,
  required bool showFadedUnread,
}) {
  if (unread == null) {
    return false;
  }
  return getChannelUnreadState(
    unreadCount: unread.hasUnreadMessages ? 1 : 0,
    mentionCount: unread.mentionCount,
    isMuted: mutedSet.contains(channelId),
    showFadedUnreadOnMutedChannels: showFadedUnread,
    unreadBadgesLevel: unread.unreadBadgesLevel,
  ).hasVisibleUnread;
}

bool _hasMentionsForChannel({
  required UnreadState? unread,
  required Set<String> mutedSet,
  required String channelId,
  required bool showFadedUnread,
}) {
  if (unread == null) {
    return false;
  }
  return getChannelUnreadState(
    unreadCount: unread.hasUnreadMessages ? 1 : 0,
    mentionCount: unread.mentionCount,
    isMuted: mutedSet.contains(channelId),
    showFadedUnreadOnMutedChannels: showFadedUnread,
    unreadBadgesLevel: unread.unreadBadgesLevel,
  ).hasMentions;
}

List<GuildSidebarEntry> flattenGuildSidebarEntries({
  required List<ChannelCategory> categories,
  required Set<String> collapsed,
  required Set<String> mutedSet,
  required bool hideMuted,
  required String? selectedId,
  required String? connectedChannelId,
  required bool showFadedUnread,
  required String guildId,
  required UnreadState? Function(String channelId) unreadForChannel,
}) {
  final List<GuildSidebarEntry> entries = <GuildSidebarEntry>[];
  for (final ChannelCategory category in categories) {
    final bool isCollapsed = collapsed.contains(category.id);
    final bool isCategoryMuted = mutedSet.contains(category.id);

    final List<Channel> base = <Channel>[];
    for (final Channel channel in category.channels) {
      if (hideMuted) {
        final bool hasMentions =
            mutedSet.contains(channel.id) &&
            _hasMentionsForChannel(
              unread: unreadForChannel(channel.id),
              mutedSet: mutedSet,
              channelId: channel.id,
              showFadedUnread: showFadedUnread,
            );
        if (!shouldShowChannelWhenHidingMuted(
          channelId: channel.id,
          mutedChannelIds: mutedSet,
          selectedChannelId: selectedId,
          connectedChannelId: connectedChannelId,
          hasMentions: hasMentions,
        )) {
          continue;
        }
      }
      base.add(channel);
    }
    if (hideMuted && base.isEmpty) {
      continue;
    }

    if (!category.isUncategorized) {
      entries.add(
        GuildSidebarEntry(
          kind: GuildSidebarEntryKind.categoryHeader,
          category: category,
          isCategoryCollapsed: isCollapsed,
        ),
      );
    }

    if (!category.isUncategorized && isCollapsed) {
      for (final Channel channel in base) {
        if (shouldShowChannelInCollapsedCategory(
          isCategoryMuted: isCategoryMuted,
          isSelected: channel.id == selectedId,
          isConnected: channel.id == connectedChannelId,
          hasVisibleUnread: _hasVisibleUnreadForChannel(
            unread: unreadForChannel(channel.id),
            mutedSet: mutedSet,
            channelId: channel.id,
            showFadedUnread: showFadedUnread,
          ),
        )) {
          entries.add(
            GuildSidebarEntry(
              kind: GuildSidebarEntryKind.channel,
              channel: channel,
            ),
          );
        }
      }
      continue;
    }

    for (final Channel channel in base) {
      entries.add(
        GuildSidebarEntry(
          kind: GuildSidebarEntryKind.channel,
          channel: channel,
        ),
      );
      if (channel.type == ChannelType.guildVoice) {
        entries.add(
          GuildSidebarEntry(
            kind: GuildSidebarEntryKind.voiceParticipants,
            channel: channel,
            guildId: guildId,
          ),
        );
      }
    }
  }
  return entries;
}

@riverpod
List<GuildSidebarEntry> guildSidebarEntries(Ref ref) {
  final String? guildId = ref.watch(activeGuildIdProvider);
  final Guild? guild = ref.watch(
    channelListViewModelProvider.select((ChannelListState s) => s.guild),
  );
  final List<ChannelCategory> categories = ref.watch(
    channelListViewModelProvider.select((ChannelListState s) => s.categories),
  );
  if (guild == null || guildId == null || guild.id != guildId) {
    return const <GuildSidebarEntry>[];
  }
  final bool hideMutedChannels =
      ref.watch(guildMuteProvider(guildId)).value?.hideMutedChannels ?? false;
  final Set<String> mutedSet =
      ref.watch(mutedChannelIdsProvider(guildId)).value ?? const <String>{};
  final Set<String> collapsed =
      ref.watch(guildCollapsedCategoriesProvider(guild.id)).value ??
      const <String>{};
  final bool shouldWatchUnreadSnapshot =
      hideMutedChannels || collapsed.isNotEmpty;
  final Map<String, UnreadState> unreadSnapshot = shouldWatchUnreadSnapshot
      ? ref.watch(guildChannelUnreadSnapshotProvider(guildId))
      : const <String, UnreadState>{};
  final String? selectedId = ref.watch(activeChannelIdProvider);
  final String? connectedChannelId = ref.watch(
    voiceSessionProvider.select((VoiceSessionState s) => s.channelId),
  );
  final bool showFadedUnread = ref.watch(
    appearancePreferencesProvider.select(
      (AppearancePreferencesState s) => s.showFadedUnreadOnMutedChannels,
    ),
  );
  return flattenGuildSidebarEntries(
    categories: categories,
    collapsed: collapsed,
    mutedSet: mutedSet,
    hideMuted: hideMutedChannels,
    selectedId: selectedId,
    connectedChannelId: connectedChannelId,
    showFadedUnread: showFadedUnread,
    guildId: guildId,
    unreadForChannel: (String channelId) => unreadSnapshot[channelId],
  );
}
