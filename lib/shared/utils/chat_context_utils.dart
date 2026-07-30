import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';

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

/// Resolves a human-readable name for [channelId] by checking server
/// channels first, then DM conversations.
String resolveChannelName(WidgetRef ref, String channelId) {
  final channelState = ref.read(channelListViewModelProvider);
  final channel = findChannelById(channelState, channelId);
  if (channel != null) {
    return channel.name;
  }

  final conversations = ref.read(
    dmViewModelProvider.select((s) => s.conversations),
  );
  final dm = findDmById(conversations, channelId);
  return dm?.recipientName ?? '';
}
