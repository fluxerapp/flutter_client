import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_availability_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/guilds/utils/guild_outage_availability.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'channel_list_view_model.g.dart';

class ChannelListState {
  final Guild? guild;
  final List<ChannelCategory> categories;
  final String? selectedChannelId;
  final bool isMemberListVisible;
  final Set<String> defaultHiddenChannelMembersOpen;
  final bool hasReceivedInitialChannelList;

  const ChannelListState({
    required this.guild,
    required this.categories,
    required this.selectedChannelId,
    this.isMemberListVisible = true,
    this.defaultHiddenChannelMembersOpen = const <String>{},
    this.hasReceivedInitialChannelList = false,
  });

  ChannelListState copyWith({
    Guild? guild,
    List<ChannelCategory>? categories,
    String? selectedChannelId,
    bool? isMemberListVisible,
    Set<String>? defaultHiddenChannelMembersOpen,
    bool? hasReceivedInitialChannelList,
  }) {
    return ChannelListState(
      guild: guild ?? this.guild,
      categories: categories ?? this.categories,
      selectedChannelId: selectedChannelId ?? this.selectedChannelId,
      isMemberListVisible: isMemberListVisible ?? this.isMemberListVisible,
      defaultHiddenChannelMembersOpen:
          defaultHiddenChannelMembersOpen ??
          this.defaultHiddenChannelMembersOpen,
      hasReceivedInitialChannelList:
          hasReceivedInitialChannelList ?? this.hasReceivedInitialChannelList,
    );
  }

  bool isMemberListVisibleForChannel({
    required String channelId,
    required ChannelType? channelType,
  }) {
    if (!isMemberListVisible) {
      return false;
    }
    if (channelType == ChannelType.unknown) {
      return false;
    }
    if (channelType == ChannelType.guildVoice) {
      return defaultHiddenChannelMembersOpen.contains(channelId);
    }
    return true;
  }

  bool isMemberListToggleActive({
    required String channelId,
    required ChannelType? channelType,
  }) {
    if (channelType == ChannelType.guildVoice) {
      return defaultHiddenChannelMembersOpen.contains(channelId);
    }
    return isMemberListVisible;
  }
}

@Riverpod(keepAlive: true)
class ChannelListViewModel extends _$ChannelListViewModel {
  String? _currentGuildId;
  StreamSubscription<List<Channel>>? _subscription;
  StreamSubscription<Guild?>? _guildSubscription;
  final Map<String, List<ChannelCategory>> _categoryCache =
      <String, List<ChannelCategory>>{};

  @override
  ChannelListState build() {
    ref.listen<String?>(currentUserIdProvider, (
      String? previous,
      String? next,
    ) {
      if (previous == next) {
        return;
      }
      _categoryCache.clear();
    });
    ref.onDispose(() {
      unawaited(_subscription?.cancel());
      unawaited(_guildSubscription?.cancel());
    });
    return const ChannelListState(
      guild: null,
      categories: [],
      selectedChannelId: null,
    );
  }

  bool loadActiveGuild(String guildId) {
    final List<Guild> guilds = ref.read(guildListViewModelProvider).guilds;
    final Guild? guild = guilds.where((Guild g) => g.id == guildId).firstOrNull;
    if (isGuildOutageUnavailable(
      guildId: guildId,
      trackedUnavailableGuildIds: ref.read(guildAvailabilityProvider),
      guild: guild,
    )) {
      return false;
    }
    loadChannels(guildId, guild: guild);
    return true;
  }

  void loadChannels(String guildId, {Guild? guild}) {
    if (_currentGuildId == guildId) {
      if (guild != null) {
        state = state.copyWith(guild: guild);
      }
      return;
    }
    if (_currentGuildId != null && state.categories.isNotEmpty) {
      _categoryCache[_currentGuildId!] = state.categories;
    }
    _currentGuildId = guildId;
    final List<ChannelCategory> cachedCategories =
        _categoryCache[guildId] ?? const <ChannelCategory>[];
    state = ChannelListState(
      guild: guild,
      categories: cachedCategories,
      selectedChannelId: state.selectedChannelId,
      isMemberListVisible: state.isMemberListVisible,
      defaultHiddenChannelMembersOpen: state.defaultHiddenChannelMembersOpen,
      hasReceivedInitialChannelList: cachedCategories.isNotEmpty,
    );

    final repo = ref.read(channelRepositoryProvider);
    unawaited(_subscription?.cancel());
    _subscription = repo
        .watchChannels(guildId)
        .listen(
          (channels) {
            final categories = groupChannelsIntoCategories(channels);
            _categoryCache[guildId] = categories;
            state = state.copyWith(
              categories: categories,
              hasReceivedInitialChannelList: true,
            );
            final ChannelPermissionCaches cachedBits = ref.read(
              channelPermissionCacheProvider,
            );
            final Set<String> uncached = <String>{
              for (final Channel channel in channels)
                if (!cachedBits.hasEffectiveBits(channel.id)) channel.id,
            };
            if (uncached.isNotEmpty) {
              unawaited(
                ref
                    .read(channelPermissionCacheProvider.notifier)
                    .rebuildGuild(guildId, onlyChannelIds: uncached),
              );
            }
          },
          onError: (Object error) {
            debugPrint('[ChannelListViewModel] Watch error: $error');
          },
        );

    unawaited(_guildSubscription?.cancel());
    _guildSubscription = ref
        .read(guildRepositoryProvider)
        .watchServerById(guildId)
        .listen(
          (Guild? updatedGuild) {
            if (updatedGuild == null || _currentGuildId != guildId) {
              return;
            }
            state = state.copyWith(guild: updatedGuild);
          },
          onError: (Object error) {
            debugPrint('[ChannelListViewModel] Guild watch error: $error');
          },
        );
  }

  void forgetGuild(String guildId) {
    _categoryCache.remove(guildId);
    if (_currentGuildId != guildId) {
      return;
    }
    _currentGuildId = null;
    unawaited(_subscription?.cancel());
    _subscription = null;
    unawaited(_guildSubscription?.cancel());
    _guildSubscription = null;
    state = ChannelListState(
      guild: null,
      categories: const <ChannelCategory>[],
      selectedChannelId: null,
      isMemberListVisible: state.isMemberListVisible,
      defaultHiddenChannelMembersOpen: state.defaultHiddenChannelMembersOpen,
    );
  }

  void toggleMemberList({
    required String channelId,
    required ChannelType? channelType,
  }) {
    if (channelType == ChannelType.guildVoice) {
      final Set<String> next = Set<String>.from(
        state.defaultHiddenChannelMembersOpen,
      );
      if (next.contains(channelId)) {
        next.remove(channelId);
      } else {
        next.add(channelId);
      }
      state = state.copyWith(defaultHiddenChannelMembersOpen: next);
      return;
    }
    setMemberListVisible(isVisible: !state.isMemberListVisible);
  }

  void setMemberListVisible({required bool isVisible}) {
    if (state.isMemberListVisible == isVisible) {
      return;
    }
    state = state.copyWith(isMemberListVisible: isVisible);
    ref
        .read(syncedPreferencesStoreProvider)
        .markDirty(SyncedPreferenceField.memberList);
  }
}
