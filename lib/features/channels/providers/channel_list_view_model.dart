import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/threads/providers/thread_guild_gate_provider.dart';
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
  List<Channel>? _channels;
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
    ref.listen<Set<String>>(threadGuildGateProvider, (
      Set<String>? previous,
      Set<String> next,
    ) {
      final Set<String> prior = previous ?? const <String>{};
      final Set<String> changed = <String>{
        ...next.difference(prior),
        ...prior.difference(next),
      };
      _categoryCache.removeWhere(
        (String guildId, _) => changed.contains(guildId),
      );
      final String? guildId = _currentGuildId;
      final List<Channel>? channels = _channels;
      if (guildId == null || channels == null || !changed.contains(guildId)) {
        return;
      }
      final List<ChannelCategory> categories = _groupVisible(guildId, channels);
      _categoryCache[guildId] = categories;
      state = state.copyWith(categories: categories);
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
    _channels = null;
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
            _channels = channels;
            final categories = _groupVisible(guildId, channels);
            _categoryCache[guildId] = categories;
            state = state.copyWith(
              categories: categories,
              hasReceivedInitialChannelList: true,
            );
            final ChannelPermissionCaches cachedBits = ref.read(
              channelPermissionCacheProvider,
            );
            final bool allChannelsCached = channels.every(
              (Channel channel) => cachedBits.hasEffectiveBits(channel.id),
            );
            if (!allChannelsCached) {
              unawaited(
                ref
                    .read(channelPermissionCacheProvider.notifier)
                    .rebuildGuild(guildId),
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

  List<ChannelCategory> _groupVisible(String guildId, List<Channel> channels) {
    if (ref.read(threadsGateProvider).isActive(guildId)) {
      return groupChannelsIntoCategories(channels);
    }
    return groupChannelsIntoCategories(<Channel>[
      for (final Channel channel in channels)
        if (!isThreadOnlyChannelType(channel.type.wireValue)) channel,
    ]);
  }

  void selectChannel(String channelId) {
    state = state.copyWith(selectedChannelId: channelId);
  }

  void setGuild(Guild guild) {
    state = state.copyWith(guild: guild);
  }

  bool isMemberListVisibleForChannel({
    required String channelId,
    required ChannelType? channelType,
  }) {
    return state.isMemberListVisibleForChannel(
      channelId: channelId,
      channelType: channelType,
    );
  }

  bool isMemberListToggleActive({
    required String channelId,
    required ChannelType? channelType,
  }) {
    return state.isMemberListToggleActive(
      channelId: channelId,
      channelType: channelType,
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
