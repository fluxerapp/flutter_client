import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/domain/channel_reorder_drop.dart';

void main() {
  test('category drag only targets other categories', () {
    const ChannelReorderDragItem categoryItem = ChannelReorderDragItem(
      id: 'cat-1',
      kind: ChannelReorderDragKind.category,
      channelType: 4,
      parentId: null,
      guildId: 'guild-1',
    );
    expect(
      canChannelDropOnTarget(
        item: categoryItem,
        target: const ChannelReorderTarget(
          id: 'cat-2',
          channelType: 4,
          parentId: null,
          guildId: 'guild-1',
        ),
      ),
      isTrue,
    );
    expect(
      canChannelDropOnTarget(
        item: categoryItem,
        target: const ChannelReorderTarget(
          id: 'text-1',
          channelType: 0,
          parentId: null,
          guildId: 'guild-1',
        ),
      ),
      isFalse,
    );
    expect(
      canChannelDropOnTarget(
        item: categoryItem,
        target: const ChannelReorderTarget(
          id: 'text-2',
          channelType: 0,
          parentId: 'cat-2',
          guildId: 'guild-1',
        ),
      ),
      isFalse,
    );
  });
}
