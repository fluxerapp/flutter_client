import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_move_operation.dart';
import 'package:fluxer_app/features/channels/domain/channel_move_payload.dart';
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
    final ChannelMoveOperation? operation = computeChannelMove(
      channels: channels,
      dragItem: dragItem,
      dropResult: const ChannelReorderDropResult(
        targetId: 'cat-1',
        position: ChannelReorderDropPosition.inside,
        targetParentId: 'cat-1',
        targetParentIdSpecified: true,
      ),
    )?.operation;
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
        targetParentIdSpecified: true,
      ),
    );
    expect(computation, isNotNull);
    final Channel moved = computation!.updatedChannels.firstWhere(
      (Channel channel) => channel.id == 'text-2',
    );
    expect(moved.parentId, 'cat-1');
    expect(moved.position, 1);
  });

  test(
    'createChannelMoveOperation places channel at top with null space target',
    () {
      final List<Channel> channels = <Channel>[
        _channel(id: 'cat-1', type: 4),
        _channel(id: 'text-1', type: 0, parentId: 'cat-1'),
        _channel(id: 'text-2', type: 0, position: 1),
      ];
      final ChannelReorderDragItem dragItem =
          ChannelReorderDragItem.fromChannel(
            channels.firstWhere((Channel channel) => channel.id == 'text-2'),
          );
      final ChannelMoveOperation? operation = computeChannelMove(
        channels: channels,
        dragItem: dragItem,
        dropResult: const ChannelReorderDropResult(
          targetId: kNullSpaceTargetId,
          position: ChannelReorderDropPosition.before,
        ),
      )?.operation;
      expect(operation, isNotNull);
      expect(operation!.newParentId, isNull);
      expect(operation.precedingSiblingId, isNull);
      expect(operation.position, 0);
    },
  );

  test(
    'createChannelMoveOperation places channel at bottom with trailing space target',
    () {
      final List<Channel> channels = <Channel>[
        _channel(id: 'cat-1', type: 4),
        _channel(id: 'text-1', type: 0, parentId: 'cat-1'),
        _channel(id: 'text-2', type: 0, position: 1),
      ];
      final ChannelReorderDragItem dragItem =
          ChannelReorderDragItem.fromChannel(
            channels.firstWhere((Channel channel) => channel.id == 'text-1'),
          );
      final ChannelMoveOperation? operation = computeChannelMove(
        channels: channels,
        dragItem: dragItem,
        dropResult: const ChannelReorderDropResult(
          targetId: kTrailingSpaceTargetId,
          position: ChannelReorderDropPosition.after,
        ),
      )?.operation;
      expect(operation, isNotNull);
      expect(operation!.newParentId, isNull);
      expect(operation.precedingSiblingId, 'text-2');
      expect(operation.position, 2);
    },
  );

  test(
    'createChannelMoveOperation moves categorized channel to root before category',
    () {
      final List<Channel> channels = <Channel>[
        _channel(id: 'cat-1', type: 4),
        _channel(id: 'text-1', type: 0, parentId: 'cat-1'),
        _channel(id: 'cat-2', type: 4, position: 1),
        _channel(id: 'text-2', type: 0, parentId: 'cat-2'),
      ];
      final ChannelReorderDragItem dragItem =
          ChannelReorderDragItem.fromChannel(
            channels.firstWhere((Channel channel) => channel.id == 'text-1'),
          );
      final ChannelMoveOperation? operation = computeChannelMove(
        channels: channels,
        dragItem: dragItem,
        dropResult: const ChannelReorderDropResult(
          targetId: 'cat-2',
          position: ChannelReorderDropPosition.before,
          targetParentIdSpecified: true,
        ),
      )?.operation;
      expect(operation, isNotNull);
      expect(operation!.newParentId, isNull);
    },
  );

  test(
    'createChannelMoveOperation inserts channel between siblings in category',
    () {
      final List<Channel> channels = <Channel>[
        _channel(id: 'cat-1', type: 4),
        _channel(id: 'text-1', type: 0, parentId: 'cat-1'),
        _channel(id: 'voice-1', type: 2, parentId: 'cat-1', position: 1),
        _channel(id: 'text-2', type: 0, parentId: 'cat-1', position: 2),
      ];
      final ChannelReorderDragItem dragItem =
          ChannelReorderDragItem.fromChannel(
            channels.firstWhere((Channel channel) => channel.id == 'text-2'),
          );
      final ChannelMoveOperation? operation = computeChannelMove(
        channels: channels,
        dragItem: dragItem,
        dropResult: const ChannelReorderDropResult(
          targetId: 'voice-1',
          position: ChannelReorderDropPosition.before,
          targetParentId: 'cat-1',
          targetParentIdSpecified: true,
        ),
      )?.operation;
      expect(operation, isNotNull);
      expect(operation!.newParentId, 'cat-1');
      expect(operation.precedingSiblingId, 'text-1');
    },
  );

  test(
    'createChannelMoveOperation places channel after last channel in category',
    () {
      final List<Channel> channels = <Channel>[
        _channel(id: 'cat-1', type: 4),
        _channel(id: 'text-1', type: 0, parentId: 'cat-1'),
        _channel(id: 'text-3', type: 0, parentId: 'cat-1', position: 1),
        _channel(id: 'text-2', type: 0, position: 1),
      ];
      final ChannelReorderDragItem dragItem =
          ChannelReorderDragItem.fromChannel(
            channels.firstWhere((Channel channel) => channel.id == 'text-2'),
          );
      final ChannelMoveOperation? operation = computeChannelMove(
        channels: channels,
        dragItem: dragItem,
        dropResult: const ChannelReorderDropResult(
          targetId: 'text-3',
          position: ChannelReorderDropPosition.after,
          targetParentId: 'cat-1',
          targetParentIdSpecified: true,
        ),
      )?.operation;
      expect(operation, isNotNull);
      expect(operation!.newParentId, 'cat-1');
      expect(operation.precedingSiblingId, 'text-3');
    },
  );

  group('computeChannelMoveToParent', () {
    final List<Channel> channels = <Channel>[
      _channel(id: 'top', type: 0),
      _channel(id: 'cat-1', type: 4, position: 1),
      _channel(id: 'text-1', type: 0, parentId: 'cat-1'),
      _channel(id: 'text-3', type: 0, parentId: 'cat-1', position: 1),
      _channel(id: 'voice-1', type: 2, parentId: 'cat-1', position: 2),
      _channel(id: 'cat-2', type: 4, position: 2),
      _channel(id: 'text-4', type: 0, parentId: 'cat-2'),
    ];

    List<Map<String, Object?>> payloadFor(String channelId, String? parentId) {
      final ChannelMoveComputation? computation = computeChannelMoveToParent(
        channels: channels,
        channelId: channelId,
        parentId: parentId,
      );
      expect(computation, isNotNull);
      return buildChannelMoveRequestBody(computation!.operation);
    }

    test('a text channel goes after the last text channel of the target', () {
      expect(payloadFor('top', 'cat-1'), <Map<String, Object?>>[
        <String, Object?>{
          'id': 'top',
          'parent_id': 'cat-1',
          'preceding_sibling_id': 'text-3',
          'position': 2,
          'lock_permissions': false,
        },
      ]);
    });

    test('a voice channel goes to the end of the target category', () {
      final List<Channel> withVoice = <Channel>[
        ...channels,
        _channel(id: 'voice-2', type: 2, parentId: 'cat-2', position: 1),
      ];
      final ChannelMoveComputation? computation = computeChannelMoveToParent(
        channels: withVoice,
        channelId: 'voice-2',
        parentId: 'cat-1',
      );
      expect(computation, isNotNull);
      expect(computation!.operation.newParentId, 'cat-1');
      expect(computation.operation.precedingSiblingId, 'voice-1');
      expect(computation.operation.position, 3);
    });

    test('moving to no category sends a null parent at the end', () {
      expect(payloadFor('text-4', null), <Map<String, Object?>>[
        <String, Object?>{
          'id': 'text-4',
          'parent_id': null,
          'preceding_sibling_id': 'cat-2',
          'position': 3,
          'lock_permissions': false,
        },
      ]);
    });

    test('the current parent and categories are no-ops', () {
      expect(
        computeChannelMoveToParent(
          channels: channels,
          channelId: 'text-1',
          parentId: 'cat-1',
        ),
        isNull,
      );
      expect(
        computeChannelMoveToParent(
          channels: channels,
          channelId: 'top',
          parentId: null,
        ),
        isNull,
      );
      expect(
        computeChannelMoveToParent(
          channels: channels,
          channelId: 'cat-2',
          parentId: 'cat-1',
        ),
        isNull,
      );
    });
  });
}
