import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'channel_list_view_model.g.dart';

class ChannelListState {
  final Guild? guild;
  final List<ChannelCategory> categories;
  final String? selectedChannelId;
  final bool isMemberListVisible;

  const ChannelListState({
    required this.guild,
    required this.categories,
    required this.selectedChannelId,
    this.isMemberListVisible = true,
  });

  ChannelListState copyWith({
    Guild? guild,
    List<ChannelCategory>? categories,
    String? selectedChannelId,
    bool? isMemberListVisible,
  }) {
    return ChannelListState(
      guild: guild ?? this.guild,
      categories: categories ?? this.categories,
      selectedChannelId: selectedChannelId ?? this.selectedChannelId,
      isMemberListVisible: isMemberListVisible ?? this.isMemberListVisible,
    );
  }
}

@Riverpod(keepAlive: true)
class ChannelListViewModel extends _$ChannelListViewModel {
  String? _currentGuildId;
  StreamSubscription<List<Channel>>? _subscription;

  @override
  ChannelListState build() {
    ref.onDispose(() => unawaited(_subscription?.cancel()));
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
    _currentGuildId = guildId;
    state = ChannelListState(
      guild: guild,
      categories: const <ChannelCategory>[],
      selectedChannelId: state.selectedChannelId,
      isMemberListVisible: state.isMemberListVisible,
    );

    final repo = ref.read(channelRepositoryProvider);
    unawaited(_subscription?.cancel());
    _subscription = repo
        .watchChannels(guildId)
        .listen(
          (channels) {
            final categories = groupChannelsIntoCategories(channels);
            state = state.copyWith(categories: categories);
            unawaited(
              ref
                  .read(channelPermissionCacheProvider.notifier)
                  .rebuildGuild(guildId),
            );
          },
          onError: (Object error) {
            debugPrint('[ChannelListViewModel] Watch error: $error');
          },
        );
  }

  void selectChannel(String channelId) {
    state = state.copyWith(selectedChannelId: channelId);
  }

  void setGuild(Guild guild) {
    state = state.copyWith(guild: guild);
  }

  void toggleMemberList() {
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
