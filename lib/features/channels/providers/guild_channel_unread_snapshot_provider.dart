import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_channel_unread_snapshot_provider.g.dart';

/// Per-channel unread state for one guild, used by the sidebar entry flattener.
@riverpod
Map<String, UnreadState> guildChannelUnreadSnapshot(Ref ref, String guildId) {
  final List<ChannelCategory> categories = ref.watch(
    channelListViewModelProvider.select(
      (ChannelListState state) => state.guild?.id == guildId
          ? state.categories
          : const <ChannelCategory>[],
    ),
  );
  final Map<String, UnreadState> snapshot = <String, UnreadState>{
    for (final ChannelCategory category in categories)
      for (final Channel channel in category.channels)
        channel.id:
            ref.watch(channelUnreadProvider(channel.id)).value ??
            const UnreadState(),
  };
  return Map<String, UnreadState>.unmodifiable(snapshot);
}
