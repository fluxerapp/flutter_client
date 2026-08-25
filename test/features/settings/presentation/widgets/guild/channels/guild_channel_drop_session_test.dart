import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_move_operation.dart';
import 'package:fluxer_app/features/channels/domain/channel_reorder_drop.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/channels/guild_channel_drop_session.dart';

Channel _channel({
  required String id,
  int type = 0,
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
  group('GuildChannelDropSession', () {
    final List<Channel> channels = <Channel>[
      _channel(id: 'cat-1', type: 4),
      _channel(id: 'text-1', parentId: 'cat-1'),
      _channel(id: 'text-2', position: 1),
    ];
    final ChannelReorderDragItem dragItem = ChannelReorderDragItem.fromChannel(
      channels.last,
    );
    const ChannelReorderDropResult dropResult = ChannelReorderDropResult(
      targetId: 'text-1',
      position: ChannelReorderDropPosition.before,
      targetParentId: 'cat-1',
      targetParentIdSpecified: true,
    );

    test('completes a move once', () {
      final GuildChannelDropSession session = GuildChannelDropSession();
      final ChannelMoveComputation? first = session.tryComplete(
        channels: channels,
        dragItem: dragItem,
        dropResult: dropResult,
      );
      final ChannelMoveComputation? second = session.tryComplete(
        channels: channels,
        dragItem: dragItem,
        dropResult: dropResult,
      );
      expect(first, isNotNull);
      expect(second, isNull);
      expect(session.isDropHandled, isTrue);
    });

    test('resets after drag start', () {
      final GuildChannelDropSession session = GuildChannelDropSession()
        ..tryComplete(
          channels: channels,
          dragItem: dragItem,
          dropResult: dropResult,
        )
        ..reset();
      final ChannelMoveComputation? retry = session.tryComplete(
        channels: channels,
        dragItem: dragItem,
        dropResult: dropResult,
      );
      expect(retry, isNotNull);
    });

    test('tryCompleteFromHover ignores missing hover data', () {
      final GuildChannelDropSession session = GuildChannelDropSession();
      expect(
        session.tryCompleteFromHover(
          channels: channels,
          dragItem: null,
          dropResult: dropResult,
        ),
        isNull,
      );
      expect(
        session.tryCompleteFromHover(
          channels: channels,
          dragItem: dragItem,
          dropResult: null,
        ),
        isNull,
      );
    });
    test('moves uncategorized channel before a category child', () {
      final GuildChannelDropSession session = GuildChannelDropSession();
      final ChannelMoveComputation? computation = session.tryComplete(
        channels: channels,
        dragItem: ChannelReorderDragItem.fromChannel(channels.last),
        dropResult: const ChannelReorderDropResult(
          targetId: 'text-1',
          position: ChannelReorderDropPosition.before,
          targetParentId: 'cat-1',
          targetParentIdSpecified: true,
        ),
      );
      expect(computation, isNotNull);
      expect(computation!.operation.channelId, 'text-2');
      expect(computation.operation.newParentId, 'cat-1');
    });
  });
}
