import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_move_operation.dart';
import 'package:fluxer_app/features/channels/domain/channel_reorder_drop.dart';
import 'package:fluxer_app/features/channels/domain/guild_channel_ordering.dart';

Channel _channel({
  required String id,
  required int type,
  String? parentId,
  int position = 0,
}) {
  return Channel(
    id: id,
    guildId: 'guild-1',
    name: id,
    type: ChannelType.fromWire(type),
    parentId: parentId,
    position: position,
  );
}

void main() {
  test('sortChannelsForOrdering nests category children', () {
    final List<Channel> channels = <Channel>[
      _channel(id: 'cat-1', type: 4),
      _channel(id: 'text-1', type: 0, parentId: 'cat-1'),
      _channel(id: 'voice-1', type: 2, parentId: 'cat-1', position: 1),
      _channel(id: 'text-2', type: 0, position: 1),
    ];
    final List<String> orderedIds =
        GuildChannelOrdering.sortChannelsForOrdering(
          channels,
        ).map((Channel channel) => channel.id).toList();
    expect(orderedIds, <String>['cat-1', 'text-1', 'voice-1', 'text-2']);
  });

  test('createChannelMoveOperation places text channel inside category', () {
    final List<Channel> channels = <Channel>[
      _channel(id: 'cat-1', type: 4),
      _channel(id: 'text-1', type: 0, parentId: 'cat-1'),
      _channel(id: 'voice-1', type: 2, parentId: 'cat-1', position: 1),
      _channel(id: 'text-2', type: 0, position: 1),
    ];
    final ChannelReorderDragItem dragItem = ChannelReorderDragItem.fromChannel(
      channels.firstWhere((Channel channel) => channel.id == 'text-2'),
    );
    final ChannelMoveOperation? operation = createChannelMoveOperation(
      channels: channels,
      dragItem: dragItem,
      dropResult: const ChannelReorderDropResult(
        targetId: 'cat-1',
        position: ChannelReorderDropPosition.inside,
        targetParentId: 'cat-1',
      ),
    );
    expect(operation, isNotNull);
    expect(operation!.newParentId, 'cat-1');
    expect(operation.precedingSiblingId, 'text-1');
  });

  test('computeChannelMove returns updated channel list', () {
    final List<Channel> channels = <Channel>[
      _channel(id: 'cat-1', type: 4),
      _channel(id: 'text-1', type: 0, parentId: 'cat-1'),
      _channel(id: 'text-2', type: 0, position: 1),
    ];
    final ChannelReorderDragItem dragItem = ChannelReorderDragItem.fromChannel(
      channels.firstWhere((Channel channel) => channel.id == 'text-2'),
    );
    final ChannelMoveComputation? computation = computeChannelMove(
      channels: channels,
      dragItem: dragItem,
      dropResult: const ChannelReorderDropResult(
        targetId: 'cat-1',
        position: ChannelReorderDropPosition.inside,
        targetParentId: 'cat-1',
      ),
    );
    expect(computation, isNotNull);
    final Channel moved = computation!.updatedChannels.firstWhere(
      (Channel channel) => channel.id == 'text-2',
    );
    expect(moved.parentId, 'cat-1');
    expect(moved.position, 1);
  });
}
