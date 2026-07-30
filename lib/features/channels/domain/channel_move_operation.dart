import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_reorder_drop.dart';
import 'package:fluxer_app/features/channels/domain/guild_channel_ordering.dart';

class ChannelMoveOperation {
  const ChannelMoveOperation({
    required this.channelId,
    required this.newParentId,
    required this.precedingSiblingId,
    required this.position,
  });

  final String channelId;
  final String? newParentId;
  final String? precedingSiblingId;
  final int position;
}

class ChannelMoveComputation {
  const ChannelMoveComputation({
    required this.operation,
    required this.updatedChannels,
  });

  final ChannelMoveOperation operation;
  final List<Channel> updatedChannels;
}

bool _isTextChannel(Channel channel) {
  return channel.type == ChannelType.guildText ||
      channel.type == ChannelType.guildLink;
}

bool _isCategoryChannel(Channel channel) {
  return channel.type == ChannelType.guildCategory;
}

List<Channel> _gatherCategoryBlock(List<Channel> channels, String categoryId) {
  return channels
      .where(
        (Channel channel) =>
            channel.id == categoryId || channel.parentId == categoryId,
      )
      .toList();
}

List<Channel> _filterOutCategoryBlock(
  List<Channel> channels,
  String categoryId,
) {
  return channels
      .where(
        (Channel channel) =>
            channel.id != categoryId && channel.parentId != categoryId,
      )
      .toList();
}

({int start, int end}) _findCategorySpan(
  List<Channel> channels,
  String categoryId,
) {
  final int startIndex = channels.indexWhere(
    (Channel channel) => channel.id == categoryId,
  );
  if (startIndex == -1) {
    return (start: -1, end: -1);
  }
  int endIndex = startIndex + 1;
  while (endIndex < channels.length &&
      channels[endIndex].parentId == categoryId) {
    endIndex++;
  }
  return (start: startIndex, end: endIndex);
}

String? _findCurrentPreceding(List<Channel> channels, Channel channel) {
  final int index = channels.indexWhere(
    (Channel item) => item.id == channel.id,
  );
  if (index <= 0) {
    return null;
  }
  for (int i = index - 1; i >= 0; i--) {
    final Channel candidate = channels[i];
    if (candidate.parentId == channel.parentId) {
      return candidate.id;
    }
  }
  return null;
}

List<Channel> _channelsFromFinalList({
  required List<Channel> channels,
  required List<Channel> finalList,
  required String movedChannelId,
  required String? newParentId,
  required bool isCategory,
}) {
  final Map<String, Channel> channelById = <String, Channel>{
    for (final Channel channel in channels) channel.id: channel,
  };
  final Map<String?, int> nextPositionByParent = <String?, int>{};
  final List<Channel> updatedChannels = <Channel>[];
  for (final Channel listed in finalList) {
    final Channel source = channelById[listed.id]!;
    final String? parentId = !isCategory && listed.id == movedChannelId
        ? newParentId
        : source.parentId;
    final int position = nextPositionByParent[parentId] ?? 0;
    nextPositionByParent[parentId] = position + 1;
    updatedChannels.add(
      Channel(
        id: source.id,
        guildId: source.guildId,
        name: source.name,
        url: source.url,
        type: source.type,
        topic: source.topic,
        parentId: parentId,
        position: position,
        rateLimitPerUser: source.rateLimitPerUser,
        nsfw: source.nsfw,
        nsfwOverride: source.nsfwOverride,
        contentWarningLevel: source.contentWarningLevel,
        contentWarningText: source.contentWarningText,
        permissionOverwritesJson: source.permissionOverwritesJson,
        userLimit: source.userLimit,
        bitrate: source.bitrate,
        rtcRegion: source.rtcRegion,
        voiceConnectionLimit: source.voiceConnectionLimit,
      ),
    );
  }
  return updatedChannels;
}

ChannelMoveComputation? computeChannelMove({
  required List<Channel> channels,
  required ChannelReorderDragItem dragItem,
  required ChannelReorderDropResult dropResult,
}) {
  final int draggedIndex = channels.indexWhere(
    (Channel channel) => channel.id == dragItem.id,
  );
  if (draggedIndex == -1) {
    return null;
  }
  final Channel draggedChannel = channels[draggedIndex];
  final List<Channel> orderedChannels =
      GuildChannelOrdering.sortChannelsForOrdering(channels);
  final bool isCategory = _isCategoryChannel(draggedChannel);
  final List<Channel> baseList = isCategory
      ? _filterOutCategoryBlock(orderedChannels, draggedChannel.id)
      : orderedChannels
            .where((Channel channel) => channel.id != draggedChannel.id)
            .toList();
  final List<Channel> block = isCategory
      ? _gatherCategoryBlock(orderedChannels, draggedChannel.id)
      : <Channel>[draggedChannel];
  if (block.isEmpty) {
    return null;
  }
  final String targetId = dropResult.targetId;
  final bool isTrailingTarget = targetId == kTrailingSpaceTargetId;
  final String? requestedParentId;
  if (targetId == kNullSpaceTargetId || isTrailingTarget) {
    requestedParentId = null;
  } else if (dropResult.targetParentIdSpecified) {
    requestedParentId = dropResult.targetParentId;
  } else if (isCategory) {
    requestedParentId = null;
  } else {
    requestedParentId = draggedChannel.parentId;
  }
  String? newParentId = isCategory ? null : requestedParentId;
  int insertIndex = 0;
  if (targetId == kNullSpaceTargetId) {
    insertIndex = 0;
    newParentId = null;
  } else if (isTrailingTarget) {
    insertIndex = baseList.length;
    newParentId = null;
  } else {
    final int targetIndex = baseList.indexWhere(
      (Channel channel) => channel.id == targetId,
    );
    if (targetIndex == -1) {
      return null;
    }
    final Channel targetChannel = baseList[targetIndex];
    if (dropResult.position == ChannelReorderDropPosition.before) {
      insertIndex = targetIndex;
    } else if (dropResult.position == ChannelReorderDropPosition.after) {
      if (_isCategoryChannel(targetChannel)) {
        final ({int start, int end}) span = _findCategorySpan(
          baseList,
          targetChannel.id,
        );
        insertIndex = span.end;
      } else {
        insertIndex = targetIndex + 1;
      }
    } else if (dropResult.position == ChannelReorderDropPosition.inside) {
      if (!_isCategoryChannel(targetChannel)) {
        return null;
      }
      final ({int start, int end}) span = _findCategorySpan(
        baseList,
        targetChannel.id,
      );
      insertIndex = span.end;
      newParentId = targetChannel.id;
    }
  }
  if (newParentId != null) {
    final List<({int index, Channel channel})> siblingIndices =
        <({int index, Channel channel})>[];
    for (int index = 0; index < baseList.length; index++) {
      final Channel channel = baseList[index];
      if (channel.parentId == newParentId) {
        siblingIndices.add((index: index, channel: channel));
      }
    }
    if (draggedChannel.type == ChannelType.guildVoice) {
      final int lastTextSibling = siblingIndices
          .where(
            (({int index, Channel channel}) entry) =>
                _isTextChannel(entry.channel),
          )
          .fold<int>(
            -1,
            (int max, ({int index, Channel channel}) entry) =>
                entry.index > max ? entry.index : max,
          );
      final int categoryIndex = baseList.indexWhere(
        (Channel channel) => channel.id == newParentId,
      );
      final int minimumIndex = lastTextSibling >= 0
          ? lastTextSibling + 1
          : categoryIndex + 1;
      if (minimumIndex > insertIndex) {
        insertIndex = minimumIndex;
      }
    } else if (_isTextChannel(draggedChannel)) {
      final int firstVoiceSibling = siblingIndices
          .where(
            (({int index, Channel channel}) entry) =>
                entry.channel.type == ChannelType.guildVoice,
          )
          .fold<int>(
            baseList.length,
            (int min, ({int index, Channel channel}) entry) =>
                entry.index < min ? entry.index : min,
          );
      if (firstVoiceSibling != baseList.length &&
          insertIndex > firstVoiceSibling) {
        insertIndex = firstVoiceSibling;
      }
    }
  }
  final List<Channel> finalList = List<Channel>.from(baseList)
    ..insertAll(insertIndex, block);
  final int insertedIndex = finalList.indexWhere(
    (Channel channel) => channel.id == draggedChannel.id,
  );
  if (insertedIndex == -1) {
    return null;
  }
  String? precedingSiblingId;
  for (int i = insertedIndex - 1; i >= 0; i--) {
    final Channel candidate = finalList[i];
    if (isCategory) {
      if (candidate.parentId == null) {
        precedingSiblingId = candidate.id;
        break;
      }
    } else if (candidate.parentId == newParentId) {
      precedingSiblingId = candidate.id;
      break;
    }
  }
  final String? currentPreceding = _findCurrentPreceding(
    orderedChannels,
    draggedChannel,
  );
  if (draggedChannel.parentId == newParentId &&
      currentPreceding == precedingSiblingId) {
    return null;
  }
  final int? position =
      GuildChannelOrdering.computePositionFromPrecedingSiblingId(
        channels: orderedChannels,
        targetId: draggedChannel.id,
        desiredParentId: newParentId,
        precedingSiblingId: precedingSiblingId,
      );
  if (position == null) {
    return null;
  }
  final ChannelMoveOperation operation = ChannelMoveOperation(
    channelId: draggedChannel.id,
    newParentId: newParentId,
    precedingSiblingId: precedingSiblingId,
    position: position,
  );
  final List<Channel> updatedChannels = _channelsFromFinalList(
    channels: channels,
    finalList: finalList,
    movedChannelId: draggedChannel.id,
    newParentId: newParentId,
    isCategory: isCategory,
  );
  return ChannelMoveComputation(
    operation: operation,
    updatedChannels: updatedChannels,
  );
}

ChannelMoveOperation? createChannelMoveOperation({
  required List<Channel> channels,
  required ChannelReorderDragItem dragItem,
  required ChannelReorderDropResult dropResult,
}) {
  return computeChannelMove(
    channels: channels,
    dragItem: dragItem,
    dropResult: dropResult,
  )?.operation;
}
