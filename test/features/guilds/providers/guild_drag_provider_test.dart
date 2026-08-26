import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/providers/guild_drag_provider.dart';

void main() {
  group('DragState.shouldCollapseDragSource', () {
    const DragState idle = DragState();

    test('returns false when item is not being dragged', () {
      expect(
        idle.shouldCollapseDragSource(itemId: '1', useLongPressDrag: false),
        isFalse,
      );
    });

    test('collapses immediately for pointer drag', () {
      const DragState dragging = DragState(dragItemId: 'folder-1');
      expect(
        dragging.shouldCollapseDragSource(
          itemId: 'folder-1',
          useLongPressDrag: false,
        ),
        isTrue,
      );
    });

    test('waits for movement threshold on touch drag', () {
      const DragState holding = DragState(dragItemId: 'folder-1');
      const DragState moving = DragState(
        dragItemId: 'folder-1',
        hasMovedFromHoldPoint: true,
      );

      expect(
        holding.shouldCollapseDragSource(
          itemId: 'folder-1',
          useLongPressDrag: true,
        ),
        isFalse,
      );
      expect(
        moving.shouldCollapseDragSource(
          itemId: 'folder-1',
          useLongPressDrag: true,
        ),
        isTrue,
      );
    });
  });

  group('resolveGuildDropPosition', () {
    test('allows combine when dropping guild onto folder', () {
      expect(
        resolveGuildDropPosition(
          ratio: 0.5,
          sourceIsFolder: false,
          targetIsFolder: true,
          allowCombine: true,
        ),
        DropPosition.combine,
      );
    });

    test('uses split positions when dragging folder onto folder', () {
      expect(
        resolveGuildDropPosition(
          ratio: 0.2,
          sourceIsFolder: true,
          targetIsFolder: true,
          allowCombine: true,
        ),
        DropPosition.before,
      );
      expect(
        resolveGuildDropPosition(
          ratio: 0.8,
          sourceIsFolder: true,
          targetIsFolder: true,
          allowCombine: true,
        ),
        DropPosition.after,
      );
    });

    test('uses split positions when combine is disabled', () {
      expect(
        resolveGuildDropPosition(
          ratio: 0.5,
          sourceIsFolder: false,
          targetIsFolder: true,
          allowCombine: false,
        ),
        DropPosition.after,
      );
    });
  });
}
