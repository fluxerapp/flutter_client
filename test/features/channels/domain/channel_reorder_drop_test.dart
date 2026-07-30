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

  group('resolveChannelReorderHover midpoint split', () {
    const ChannelReorderDragItem textItem = ChannelReorderDragItem(
      id: 'text-1',
      kind: ChannelReorderDragKind.channel,
      channelType: 0,
      parentId: null,
      guildId: 'guild-1',
    );
    const ChannelReorderTarget target = ChannelReorderTarget(
      id: 'text-2',
      channelType: 0,
      parentId: null,
      guildId: 'guild-1',
    );

    test('top half positions before', () {
      final ChannelReorderIntent? intent = resolveChannelReorderHover(
        item: textItem,
        target: target,
        localY: 40,
        height: 100,
      );
      expect(intent, isNotNull);
      expect(intent!.indicator.position, ChannelReorderIndicatorPosition.top);
      expect(intent.result.position, ChannelReorderDropPosition.before);
    });

    test('bottom half positions after', () {
      final ChannelReorderIntent? intent = resolveChannelReorderHover(
        item: textItem,
        target: target,
        localY: 60,
        height: 100,
      );
      expect(intent, isNotNull);
      expect(
        intent!.indicator.position,
        ChannelReorderIndicatorPosition.bottom,
      );
      expect(intent.result.position, ChannelReorderDropPosition.after);
    });

    test('category bottom half drops inside', () {
      const ChannelReorderTarget categoryTarget = ChannelReorderTarget(
        id: 'cat-1',
        channelType: 4,
        parentId: null,
        guildId: 'guild-1',
      );
      final ChannelReorderIntent? intent = resolveChannelReorderHover(
        item: textItem,
        target: categoryTarget,
        localY: 60,
        height: 100,
      );
      expect(intent, isNotNull);
      expect(
        intent!.indicator.position,
        ChannelReorderIndicatorPosition.bottom,
      );
      expect(intent.result.position, ChannelReorderDropPosition.inside);
      expect(intent.result.targetParentId, 'cat-1');
    });
  });
}
