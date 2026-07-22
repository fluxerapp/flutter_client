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

  group('resolveChannelReorderHover dead zones', () {
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

    test('top zone positions before', () {
      final ChannelReorderIntent? intent = resolveChannelReorderHover(
        item: textItem,
        target: target,
        localY: 10,
        height: 100,
      );
      expect(intent, isNotNull);
      expect(intent!.indicator.position, ChannelReorderIndicatorPosition.top);
      expect(intent.result.position, ChannelReorderDropPosition.before);
    });

    test('bottom zone positions after', () {
      final ChannelReorderIntent? intent = resolveChannelReorderHover(
        item: textItem,
        target: target,
        localY: 90,
        height: 100,
      );
      expect(intent, isNotNull);
      expect(
        intent!.indicator.position,
        ChannelReorderIndicatorPosition.bottom,
      );
      expect(intent.result.position, ChannelReorderDropPosition.after);
    });

    test('dead zone preserves last position', () {
      const ChannelReorderIndicatorPosition lastPosition =
          ChannelReorderIndicatorPosition.top;
      final ChannelReorderIntent? intent = resolveChannelReorderHover(
        item: textItem,
        target: target,
        localY: 50,
        height: 100,
        lastPosition: lastPosition,
      );
      expect(intent, isNotNull);
      expect(intent!.indicator.position, ChannelReorderIndicatorPosition.top);
    });

    test('dead zone without last position defaults to nearest half', () {
      final ChannelReorderIntent? topSide = resolveChannelReorderHover(
        item: textItem,
        target: target,
        localY: 45,
        height: 100,
      );
      expect(topSide?.indicator.position, ChannelReorderIndicatorPosition.top);
      final ChannelReorderIntent? bottomSide = resolveChannelReorderHover(
        item: textItem,
        target: target,
        localY: 55,
        height: 100,
      );
      expect(
        bottomSide?.indicator.position,
        ChannelReorderIndicatorPosition.bottom,
      );
    });
  });
}
