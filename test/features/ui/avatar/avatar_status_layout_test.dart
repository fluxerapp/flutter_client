import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/avatar/avatar_status_layout.dart';

void main() {
  group('AvatarStatusLayout', () {
    test('typing pill is 1.8x wider than status dot', () {
      final AvatarStatusLayout layout = AvatarStatusLayout.forAvatarSize(40);
      expect(
        layout.typingWidth,
        (layout.statusDotSize * kTypingWidthMultiplier).roundToDouble(),
      );
    });

    test('typing pill shifts right edge toward avatar via bridge ratio', () {
      final AvatarStatusLayout layout = AvatarStatusLayout.forAvatarSize(40);
      final double extension = layout.typingWidth - layout.statusDotSize;
      expect(layout.typingRight, -(extension * kTypingBridgeRightShiftRatio));
    });

    test('status dot size scales with avatar size', () {
      expect(avatarStatusDotSize(32), 10);
      expect(avatarStatusDotSize(40), 12);
      expect(avatarStatusDotSize(48), 14);
    });
  });
}
