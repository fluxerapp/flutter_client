import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/avatar/avatar_status_layout.dart';

void main() {
  group('AvatarStatusLayout', () {
    test('typing pill is 1.8x wider than status dot', () {
      final AvatarStatusLayout layout = AvatarStatusLayout.forAvatarSize(40);
      expect(
        layout.typingRect.width,
        (layout.statusDotSize * kTypingWidthMultiplier).roundToDouble(),
      );
    });

    test('typing pill grows right of the dot by the bridge ratio', () {
      final AvatarStatusLayout layout = AvatarStatusLayout.forAvatarSize(40);
      final double extension = layout.typingRect.width - layout.statusDotSize;
      expect(
        layout.typingRect.right,
        layout.dotRect.right + extension * kTypingBridgeRightShiftRatio,
      );
      expect(layout.typingRect.center.dy, layout.dotRect.center.dy);
    });

    test('status dot size scales with avatar size', () {
      expect(AvatarStatusLayout.forAvatarSize(32).statusDotSize, 10);
      expect(AvatarStatusLayout.forAvatarSize(40).statusDotSize, 12);
      expect(AvatarStatusLayout.forAvatarSize(48).statusDotSize, 14);
      expect(AvatarStatusLayout.forAvatarSize(80).statusDotSize, 16);
    });

    test('dot sits flush with the avatar corner', () {
      for (final double avatarSize in <double>[32, 40, 80, 120]) {
        final AvatarStatusLayout layout = AvatarStatusLayout.forAvatarSize(
          avatarSize,
        );
        expect(layout.dotRect.right, avatarSize, reason: 'size $avatarSize');
        expect(layout.dotRect.bottom, avatarSize, reason: 'size $avatarSize');
      }
    });

    test('32pt avatar keeps a 3pt transparent ring around a 10pt dot', () {
      final AvatarStatusLayout layout = AvatarStatusLayout.forAvatarSize(32);
      expect(layout.statusGap, 3);
      expect(layout.dotRect.width, 10);
    });

    test('mobile phone height uses web aspect ratio', () {
      final AvatarStatusLayout layout = AvatarStatusLayout.forAvatarSize(40);
      final double phoneWidth = mobilePhoneWidth(layout.statusDotSize);
      expect(layout.phoneRect.width, phoneWidth);
      expect(
        layout.phoneRect.height,
        (phoneWidth / kMobileAspectRatio).roundToDouble() +
            kMobilePhoneExtraHeight,
      );
    });

    test('phone and dot share the cutout anchor', () {
      final AvatarStatusLayout layout = AvatarStatusLayout.forAvatarSize(36);
      expect(layout.phoneRect.center, layout.statusCutoutCenter);
      expect(layout.dotRect.center, layout.statusCutoutCenter);
    });

    test('gap equals cutout radius minus dot radius', () {
      final AvatarStatusLayout layout = AvatarStatusLayout.forAvatarSize(36);
      expect(
        layout.statusGap,
        statusCutoutGap(
          statusDotSize: layout.statusDotSize,
          cutoutRadius: layout.cutoutRadius,
        ),
      );
    });
  });

  group('isMobileOnlineStatus', () {
    test('requires online mobile client and sufficient size', () {
      expect(
        isMobileOnlineStatus(
          isMobileStatus: true,
          status: 'online',
          isTyping: false,
          size: 32,
        ),
        isTrue,
      );
      expect(
        isMobileOnlineStatus(
          isMobileStatus: true,
          status: 'idle',
          isTyping: false,
          size: 32,
        ),
        isFalse,
      );
      expect(
        isMobileOnlineStatus(
          isMobileStatus: true,
          status: 'online',
          isTyping: true,
          size: 32,
        ),
        isFalse,
      );
      expect(
        isMobileOnlineStatus(
          isMobileStatus: false,
          status: 'online',
          isTyping: false,
          size: 32,
        ),
        isFalse,
      );
      expect(
        isMobileOnlineStatus(
          isMobileStatus: true,
          status: 'online',
          isTyping: false,
          size: 16,
        ),
        isFalse,
      );
    });
  });
}
