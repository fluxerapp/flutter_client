import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_channel_unread_snapshot_provider.g.dart';

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
            ref.watch(channelUnreadOrLastKnownProvider(channel.id)) ??
            const UnreadState(),
  };
  return Map<String, UnreadState>.unmodifiable(snapshot);
}

@riverpod
bool guildChannelUnreadKnown(Ref ref, String guildId) {
  final List<ChannelCategory> categories = ref.watch(
    channelListViewModelProvider.select(
      (ChannelListState state) => state.guild?.id == guildId
          ? state.categories
          : const <ChannelCategory>[],
    ),
  );
  for (final ChannelCategory category in categories) {
    for (final Channel channel in category.channels) {
      final bool known = ref.watch(
        channelUnreadOrLastKnownProvider(
          channel.id,
        ).select((UnreadState? unread) => unread != null),
      );
      if (!known) {
        return false;
      }
    }
  }
  return true;
}
