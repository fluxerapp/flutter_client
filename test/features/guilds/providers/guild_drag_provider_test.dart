import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/providers/guild_drag_provider.dart';

void main() {
  group('DragState.shouldCollapseDragSource', () {
    const DragState idle = DragState();

    test('returns false when item is not being dragged', () {
      expect(
        idle.shouldCollapseDragSource(itemId: '1', useTouchDrag: false),
        isFalse,
      );
    });

    test('collapses immediately for pointer drag', () {
      const DragState dragging = DragState(dragItemId: 'folder-1');
      expect(
        dragging.shouldCollapseDragSource(
          itemId: 'folder-1',
          useTouchDrag: false,
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
          useTouchDrag: true,
        ),
        isFalse,
      );
      expect(
        moving.shouldCollapseDragSource(itemId: 'folder-1', useTouchDrag: true),
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

    test('uses wider reorder edges on folders', () {
      expect(
        resolveGuildDropPosition(
          ratio: 0.2,
          sourceIsFolder: false,
          targetIsFolder: true,
          allowCombine: true,
        ),
        DropPosition.before,
      );
      expect(
        resolveGuildDropPosition(
          ratio: 0.8,
          sourceIsFolder: false,
          targetIsFolder: true,
          allowCombine: true,
        ),
        DropPosition.after,
      );
    });

    test('uses a narrow merge band between guilds', () {
      expect(
        resolveGuildDropPosition(
          ratio: 0.5,
          sourceIsFolder: false,
          targetIsFolder: false,
          allowCombine: true,
        ),
        DropPosition.combine,
      );
      expect(
        resolveGuildDropPosition(
          ratio: 0.4,
          sourceIsFolder: false,
          targetIsFolder: false,
          allowCombine: true,
        ),
        DropPosition.before,
      );
    });

    test('skips guild merge when dragging from inside a folder', () {
      expect(
        resolveGuildDropPosition(
          ratio: 0.5,
          sourceIsFolder: false,
          targetIsFolder: false,
          allowCombine: true,
          sourceAllowGuildMerge: false,
        ),
        DropPosition.after,
      );
    });
  });

  group('shouldDeferGuildHoverUpdate', () {
    test('defers when moving quickly with a pending change', () {
      expect(
        shouldDeferGuildHoverUpdate(
          verticalSpeedPxPerMs: 3,
          dwellInPendingTarget: Duration.zero,
          hasPendingChange: true,
        ),
        isTrue,
      );
    });

    test('applies when movement is slow', () {
      expect(
        shouldDeferGuildHoverUpdate(
          verticalSpeedPxPerMs: 1,
          dwellInPendingTarget: Duration.zero,
          hasPendingChange: true,
        ),
        isFalse,
      );
    });

    test('applies after dwell even when moving quickly', () {
      expect(
        shouldDeferGuildHoverUpdate(
          verticalSpeedPxPerMs: 4,
          dwellInPendingTarget: kGuildDragHoverDwell,
          hasPendingChange: true,
        ),
        isFalse,
      );
    });

    test('does not defer when hover already matches', () {
      expect(
        shouldDeferGuildHoverUpdate(
          verticalSpeedPxPerMs: 4,
          dwellInPendingTarget: Duration.zero,
          hasPendingChange: false,
        ),
        isFalse,
      );
    });
  });

  group('normalizeGuildDropSeam', () {
    const List<GuildDragTargetBounds> targets = <GuildDragTargetBounds>[
      GuildDragTargetBounds(itemId: 'a', isFolder: false, top: 0, bottom: 56),
      GuildDragTargetBounds(itemId: 'b', isFolder: false, top: 56, bottom: 112),
    ];

    test('maps after on upper row to before on lower row', () {
      expect(
        normalizeGuildDropSeam(
          intent: const GuildDropHoverIntent(
            targetId: 'a',
            isFolder: false,
            position: DropPosition.after,
          ),
          targets: targets,
        ),
        const GuildDropHoverIntent(
          targetId: 'b',
          isFolder: false,
          position: DropPosition.before,
        ),
      );
    });

    test('leaves before unchanged', () {
      const GuildDropHoverIntent intent = GuildDropHoverIntent(
        targetId: 'b',
        isFolder: false,
        position: DropPosition.before,
      );
      expect(normalizeGuildDropSeam(intent: intent, targets: targets), intent);
    });

    test('leaves after when next row is not adjacent', () {
      const GuildDropHoverIntent intent = GuildDropHoverIntent(
        targetId: 'a',
        isFolder: false,
        position: DropPosition.after,
      );
      expect(
        normalizeGuildDropSeam(
          intent: intent,
          targets: <GuildDragTargetBounds>[
            targets[0],
            const GuildDragTargetBounds(
              itemId: 'b',
              isFolder: false,
              top: 80,
              bottom: 136,
            ),
          ],
        ),
        intent,
      );
    });
  });

  group('clampGuildDragFeedbackCenterY', () {
    test('returns input when bounds are missing', () {
      expect(
        clampGuildDragFeedbackCenterY(centerY: 120, boundsBottom: 400),
        120,
      );
    });

    test('keeps icon inside vertical bounds', () {
      const double top = 100;
      const double bottom = 500;
      const double half = kGuildDragFeedbackSize / 2;

      expect(
        clampGuildDragFeedbackCenterY(
          centerY: top,
          boundsTop: top,
          boundsBottom: bottom,
        ),
        top + half,
      );
      expect(
        clampGuildDragFeedbackCenterY(
          centerY: bottom,
          boundsTop: top,
          boundsBottom: bottom,
        ),
        bottom - half,
      );
      expect(
        clampGuildDragFeedbackCenterY(
          centerY: 300,
          boundsTop: top,
          boundsBottom: bottom,
        ),
        300,
      );
    });
  });

  group('guildRailAutoScrollVelocity', () {
    const double top = 100;
    const double bottom = 700;

    double velocityAt(double pointerY) => guildRailAutoScrollVelocity(
      pointerY: pointerY,
      top: top,
      bottom: bottom,
    );

    test('does not scroll away from the edges', () {
      expect(velocityAt(400), 0);
      expect(velocityAt(top + kGuildRailAutoScrollEdgeExtent), 0);
      expect(velocityAt(bottom - kGuildRailAutoScrollEdgeExtent), 0);
    });

    test('scrolls up near the top and down near the bottom', () {
      expect(velocityAt(top + 10), lessThan(0));
      expect(velocityAt(bottom - 10), greaterThan(0));
    });

    test('speeds up the deeper the finger is in the edge zone', () {
      expect(velocityAt(bottom - 5), greaterThan(velocityAt(bottom - 40)));
      expect(velocityAt(top + 5), lessThan(velocityAt(top + 40)));
    });

    test('caps the speed once the finger leaves the rail', () {
      expect(velocityAt(bottom + 200), kGuildRailAutoScrollMaxSpeed);
      expect(velocityAt(0), -kGuildRailAutoScrollMaxSpeed);
    });

    test('never scrolls a rail too short for an edge zone', () {
      expect(
        guildRailAutoScrollVelocity(pointerY: 100, top: 100, bottom: 100),
        0,
      );
    });
  });
}
