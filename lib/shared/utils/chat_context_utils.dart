import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';

Channel? findChannelById(ChannelListState state, String id) {
  for (final category in state.categories) {
    for (final channel in category.channels) {
      if (channel.id == id) {
        return channel;
      }
    }
  }
  return null;
}

/// In-memory guild channel list first, then the local DB row.
Channel? resolveGuildChannel(WidgetRef ref, String channelId) {
  return findChannelById(ref.read(channelListViewModelProvider), channelId) ??
      ref.read(channelByIdProvider(channelId)).value;
}

DmConversation? findDmById(List<DmConversation> conversations, String id) {
  for (final dm in conversations) {
    if (dm.id == id) {
      return dm;
    }
  }
  return null;
}
