import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_pin.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';

import '../../../../../helpers/pump_fluxer_app.dart';
import 'message_list_test_harness.dart';

// Renders a horizontal SingleChildScrollView inside the row.
const String _kTableContent = '| a | b |\n|---|---|\n| 1 | 2 |';

Future<AroundAckMessageListHarness> _pumpTailList(WidgetTester tester) async {
  configureMessageListViewport(tester);
  final AroundAckMessageListHarness harness =
      await createBottomMessageListHarness();
  await tester.pumpWidget(
    messageListApp(
      database: harness.database,
      chatViewModel: harness.chatViewModel,
    ),
  );
  await pumpFluxerFrames(tester);
  return harness;
}

Future<TestGesture> _holdDragTowardOlder(
  WidgetTester tester, {
  required double distance,
}) async {
  final TestGesture gesture = await tester.startGesture(
    tester.getCenter(messageListScrollable()),
  );
  for (int step = 0; step < 10; step += 1) {
    await gesture.moveBy(Offset(0, distance / 10));
    await tester.pump(const Duration(milliseconds: 16));
  }
  return gesture;
}

Future<void> _pumpFrames(WidgetTester tester) async {
  for (int frame = 0; frame < 4; frame += 1) {
    await tester.pump(const Duration(milliseconds: 16));
  }
}

void main() {
  group('MessageListPin', () {
    test('engages within 8px of the live tail', () {
      final MessageListPin pin = MessageListPin();
      pin.onUserScrollEnd(distanceFromLiveTail: 8, hasMoreNewer: false);
      expect(pin.pinned, isTrue);
    });

    test('does not engage beyond 8px when previously detached', () {
      final MessageListPin pin = MessageListPin();
      pin.onUserScrollEnd(distanceFromLiveTail: 9, hasMoreNewer: false);
      expect(pin.pinned, isFalse);
    });

    test('holds engagement until 64px away', () {
      final MessageListPin pin = MessageListPin();
      pin.onUserScrollEnd(distanceFromLiveTail: 4, hasMoreNewer: false);
      expect(pin.pinned, isTrue);

      pin.onUserScrollEnd(distanceFromLiveTail: 32, hasMoreNewer: false);
      expect(pin.pinned, isTrue);

      pin.onUserScrollEnd(distanceFromLiveTail: 65, hasMoreNewer: false);
      expect(pin.pinned, isFalse);
    });

    test('never pins while newer history is unloaded', () {
      final MessageListPin pin = MessageListPin();
      pin.onUserScrollEnd(distanceFromLiveTail: 0, hasMoreNewer: true);
      expect(pin.pinned, isFalse);
    });

    test('jump-to-present and own send re-engage the tail', () {
      final MessageListPin pin = MessageListPin();
      pin.onDetached();
      expect(pin.pinned, isFalse);

      pin.onJumpToPresentLanded();
      expect(pin.pinned, isTrue);

      pin.onDetached();
      pin.onOwnSend();
      expect(pin.pinned, isTrue);
    });

    test('detached clears the latch', () {
      final MessageListPin pin = MessageListPin();
      pin.onJumpToPresentLanded();
      pin.onDetached();
      expect(pin.pinned, isFalse);
    });
  });

  group('MessageList tail glue', () {
    testWidgets('a live row with a nested scrollable does not move a reader '
        'who dragged off the tail', (WidgetTester tester) async {
      final AroundAckMessageListHarness harness = await _pumpTailList(tester);
      final ScrollPosition position = messageListScrollPosition(tester);
      final TestGesture gesture = await _holdDragTowardOlder(
        tester,
        distance: 150,
      );
      expect(
        messageListTrailingDistance(position),
        greaterThan(kMessageListPinEngageDistance),
      );
      final double pixels = position.pixels;

      final List<Message> current = harness.chatViewModel.testState.messages;
      final DateTime timestamp = current.last.timestamp.add(
        const Duration(minutes: 1),
      );
      harness.chatViewModel.testState = harness.chatViewModel.testState
          .copyWith(
            write: (
              messages: <Message>[
                ...current,
                harnessMessage(
                  id: snowflakeForUtc(timestamp),
                  content: _kTableContent,
                  timestamp: timestamp,
                ),
              ],
              origin: MessagesOrigin.liveCreate,
            ),
          );
      await _pumpFrames(tester);

      expect(position.pixels, pixels);

      await gesture.up();
      await disposeMessageList(tester);
    });

    testWidgets('a row gaining a nested scrollable does not pull an unpinned '
        'reader to the tail', (WidgetTester tester) async {
      final AroundAckMessageListHarness harness = await _pumpTailList(tester);
      final ScrollPosition position = messageListScrollPosition(tester);
      position.jumpTo(position.pixels - 300);
      await _pumpFrames(tester);
      final double pixels = position.pixels;

      final List<Message> current = List<Message>.of(
        harness.chatViewModel.testState.messages,
      );
      final int edited = current.length - 4;
      current[edited] = harnessMessage(
        id: current[edited].id,
        content: _kTableContent,
        timestamp: current[edited].timestamp,
      );
      harness.chatViewModel.testState = harness.chatViewModel.testState
          .copyWith(
            write: (messages: current, origin: MessagesOrigin.realtimeEvent),
          );
      await _pumpFrames(tester);

      expect(position.pixels, pixels);

      await disposeMessageList(tester);
    });
  });
}
