import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_pagination.dart';

void main() {
  const double viewportHeight = 800;

  bool shouldRequest(
    MessageEdgeLoadTrigger trigger, {
    MessageLoadEdge edge = MessageLoadEdge.older,
    double? distanceFromEdge,
    bool hasMore = true,
    bool isLoading = false,
    bool isUserDrivenScroll = true,
    bool hasActiveJumpTarget = false,
  }) {
    return trigger.shouldRequest(
      edge: edge,
      distanceFromEdge:
          distanceFromEdge ?? messageListLoadEnterMargin(viewportHeight) - 1,
      viewportHeight: viewportHeight,
      hasMore: hasMore,
      isLoading: isLoading,
      isUserDrivenScroll: isUserDrivenScroll,
      hasActiveJumpTarget: hasActiveJumpTarget,
    );
  }

  group('MessageEdgeLoadTrigger', () {
    test('requests the first user-driven in-threshold sample', () {
      final MessageEdgeLoadTrigger trigger = MessageEdgeLoadTrigger();

      expect(shouldRequest(trigger), isTrue);
    });

    test(
      'requires fresh progress toward the same edge before requesting again',
      () {
        final MessageEdgeLoadTrigger trigger = MessageEdgeLoadTrigger();
        final double enterMargin = messageListLoadEnterMargin(viewportHeight);
        final double progressDelta = messageListLoadProgressDelta(
          viewportHeight,
        );

        expect(shouldRequest(trigger, distanceFromEdge: enterMargin), isTrue);
        expect(
          shouldRequest(
            trigger,
            distanceFromEdge: enterMargin - progressDelta + 1,
          ),
          isFalse,
        );
        expect(
          shouldRequest(trigger, distanceFromEdge: enterMargin - progressDelta),
          isTrue,
        );
      },
    );

    test('skips in-threshold samples that are not user-driven', () {
      final MessageEdgeLoadTrigger trigger = MessageEdgeLoadTrigger();

      expect(shouldRequest(trigger, isUserDrivenScroll: false), isFalse);
    });

    test('skips while an anchor or jump target is active', () {
      final MessageEdgeLoadTrigger trigger = MessageEdgeLoadTrigger();

      expect(shouldRequest(trigger, hasActiveJumpTarget: true), isFalse);
    });

    test('skips while the same edge is already loading', () {
      final MessageEdgeLoadTrigger trigger = MessageEdgeLoadTrigger();

      expect(shouldRequest(trigger, isLoading: true), isFalse);
    });

    test('skips when the edge has no more messages', () {
      final MessageEdgeLoadTrigger trigger = MessageEdgeLoadTrigger();

      expect(shouldRequest(trigger, hasMore: false), isFalse);
    });

    test('rearms after moving far enough away from an edge', () {
      final MessageEdgeLoadTrigger trigger = MessageEdgeLoadTrigger();
      final double enterMargin = messageListLoadEnterMargin(viewportHeight);
      final double rearmMargin = messageListLoadRearmMargin(viewportHeight);

      expect(shouldRequest(trigger, distanceFromEdge: 0), isTrue);
      expect(
        shouldRequest(trigger, distanceFromEdge: rearmMargin + 1),
        isFalse,
      );
      expect(shouldRequest(trigger, distanceFromEdge: enterMargin), isTrue);
    });

    test('tracks older and newer progress independently', () {
      final MessageEdgeLoadTrigger trigger = MessageEdgeLoadTrigger();
      final double enterMargin = messageListLoadEnterMargin(viewportHeight);
      final double progressDelta = messageListLoadProgressDelta(viewportHeight);
      final double notEnoughOlderProgress = enterMargin - progressDelta + 1;

      expect(shouldRequest(trigger, distanceFromEdge: enterMargin), isTrue);
      expect(
        shouldRequest(trigger, distanceFromEdge: notEnoughOlderProgress),
        isFalse,
      );
      expect(
        shouldRequest(
          trigger,
          edge: MessageLoadEdge.newer,
          distanceFromEdge: notEnoughOlderProgress,
        ),
        isTrue,
      );
    });

    test('clearEdge allows retry without leaving the enter margin', () {
      final MessageEdgeLoadTrigger trigger = MessageEdgeLoadTrigger();
      final double enterMargin = messageListLoadEnterMargin(viewportHeight);
      final double progressDelta = messageListLoadProgressDelta(viewportHeight);
      final double notEnoughProgress = enterMargin - progressDelta + 1;

      expect(shouldRequest(trigger, distanceFromEdge: enterMargin), isTrue);
      expect(
        shouldRequest(trigger, distanceFromEdge: notEnoughProgress),
        isFalse,
      );

      trigger.clearEdge(MessageLoadEdge.older);
      expect(
        shouldRequest(trigger, distanceFromEdge: notEnoughProgress),
        isTrue,
      );
    });
  });

  group('message list load thresholds', () {
    test('clamp enter margin at the low and high viewport bounds', () {
      expect(messageListLoadEnterMargin(200), 480);
      expect(messageListLoadEnterMargin(800), 720);
      expect(messageListLoadEnterMargin(2000), 900);
    });

    test('clamp progress delta at the low and high viewport bounds', () {
      expect(messageListLoadProgressDelta(200), 80);
      expect(messageListLoadProgressDelta(800), 120);
      expect(messageListLoadProgressDelta(2000), 160);
    });

    test('places the rearm margin beyond the enter margin', () {
      expect(messageListLoadRearmMargin(800), 1120);
      expect(
        messageListLoadRearmMargin(800),
        greaterThan(messageListLoadEnterMargin(800)),
      );
    });
  });
}
