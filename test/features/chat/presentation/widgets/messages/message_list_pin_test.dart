import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_pin.dart';

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
}
