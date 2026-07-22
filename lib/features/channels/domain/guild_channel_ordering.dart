import 'package:fluxer_app/features/channels/domain/channel.dart';

abstract final class GuildChannelOrdering {
  const GuildChannelOrdering._();

  static int compareChannelOrdering(Channel a, Channel b) {
    final int positionComparison = a.position.compareTo(b.position);
    if (positionComparison != 0) {
      return positionComparison;
    }
    return a.id.compareTo(b.id);
  }

  static List<Channel> sortChannelsForOrdering(List<Channel> channels) {
    final Map<String, Channel> channelById = <String, Channel>{
      for (final Channel channel in channels) channel.id: channel,
    };
    final Map<String, List<Channel>> childrenByParent =
        <String, List<Channel>>{};
    final List<Channel> rootChannels = <Channel>[];
    for (final Channel channel in channels) {
      final String? parentId = channel.parentId;
      if (parentId == null || !channelById.containsKey(parentId)) {
        rootChannels.add(channel);
        continue;
      }
      childrenByParent.putIfAbsent(parentId, () => <Channel>[]).add(channel);
    }
    final List<Channel> orderedChannels = <Channel>[];
    final Set<String> seen = <String>{};
    final List<Channel> sortedRoots = List<Channel>.from(rootChannels)
      ..sort(compareChannelOrdering);
    for (final Channel root in sortedRoots) {
      orderedChannels.add(root);
      seen.add(root.id);
      if (root.type != ChannelType.guildCategory) {
        continue;
      }
      final List<Channel>? children = childrenByParent[root.id];
      if (children == null) {
        continue;
      }
      final List<Channel> sortedChildren = List<Channel>.from(children)
        ..sort(compareChannelOrdering);
      for (final Channel child in sortedChildren) {
        orderedChannels.add(child);
        seen.add(child.id);
      }
    }
    final List<Channel> remaining =
        channels.where((Channel channel) => !seen.contains(channel.id)).toList()
          ..sort(compareChannelOrdering);
    orderedChannels.addAll(remaining);
    return orderedChannels;
  }

  static Set<String> computeChannelMoveBlockIds({
    required List<Channel> channels,
    required String targetId,
  }) {
    final Map<String, Channel> channelById = <String, Channel>{
      for (final Channel channel in channels) channel.id: channel,
    };
    final Channel? target = channelById[targetId];
    final Set<String> blockIds = <String>{targetId};
    if (target?.type == ChannelType.guildCategory) {
      for (final Channel channel in channels) {
        if (channel.parentId == targetId) {
          blockIds.add(channel.id);
        }
      }
    }
    return blockIds;
  }

  static int? computePositionFromPrecedingSiblingId({
    required List<Channel> channels,
    required String targetId,
    required String? desiredParentId,
    required String? precedingSiblingId,
  }) {
    final List<Channel> siblings = sortChannelsForOrdering(
      channels,
    ).where((Channel channel) => channel.parentId == desiredParentId).toList();
    final Set<String> blockIds = computeChannelMoveBlockIds(
      channels: channels,
      targetId: targetId,
    );
    final List<Channel> siblingsWithoutBlock = siblings
        .where((Channel channel) => !blockIds.contains(channel.id))
        .toList();
    if (precedingSiblingId == null) {
      return 0;
    }
    final int index = siblingsWithoutBlock.indexWhere(
      (Channel channel) => channel.id == precedingSiblingId,
    );
    if (index == -1) {
      return null;
    }
    return index + 1;
  }
}
