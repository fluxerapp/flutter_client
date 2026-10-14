import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_icon_peek_menu.dart';

void main() {
  group('shouldCancelGuildPeekHold', () {
    test('returns false until vertical movement exceeds hold threshold', () {
      const Offset start = Offset(10, 20);
      expect(
        shouldCancelGuildPeekHold(
          pointerDownPosition: start,
          currentPosition: const Offset(10, 23),
        ),
        isFalse,
      );
      expect(
        shouldCancelGuildPeekHold(
          pointerDownPosition: start,
          currentPosition: const Offset(10, 24),
        ),
        isTrue,
      );
    });
  });

  group('shouldSuppressPeekForDrag', () {
    test('returns false until vertical movement exceeds threshold', () {
      const Offset start = Offset(10, 20);
      expect(
        shouldSuppressPeekForDrag(
          pointerDownPosition: start,
          currentPosition: const Offset(15, 25),
        ),
        isFalse,
      );
      expect(
        shouldSuppressPeekForDrag(
          pointerDownPosition: start,
          currentPosition: const Offset(10, 33),
        ),
        isTrue,
      );
    });
  });
}
