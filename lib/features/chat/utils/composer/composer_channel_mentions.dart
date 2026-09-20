import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';

List<Channel> _mentionableChannelsFromCategories(
  List<ChannelCategory> categories,
) {
  final List<Channel> flat = <Channel>[];
  for (final ChannelCategory cat in categories) {
    for (final Channel c in cat.channels) {
      if (!c.isCategory) {
        flat.add(c);
      }
    }
  }
  return flat;
}

/// `#` autocomplete channels for [guildId]. Uses the loaded sidebar when it
/// matches; otherwise [fallbackChannels] from that guild's local rows.
List<Channel> mentionableChannelsForGuild({
  required String guildId,
  required ChannelListState currentList,
  required List<Channel> fallbackChannels,
}) {
  if (currentList.guild?.id == guildId) {
    return _mentionableChannelsFromCategories(currentList.categories);
  }
  return <Channel>[
    for (final Channel c in fallbackChannels)
      if (c.guildId == guildId && !c.isCategory) c,
  ];
}
