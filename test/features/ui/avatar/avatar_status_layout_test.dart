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
      expect(AvatarStatusLayout.forAvatarSize(32).statusDotSize, 10);
      expect(AvatarStatusLayout.forAvatarSize(40).statusDotSize, 12);
      expect(AvatarStatusLayout.forAvatarSize(48).statusDotSize, 14);
    });

    test('mobile phone height uses web aspect ratio', () {
      final AvatarStatusLayout layout = AvatarStatusLayout.forAvatarSize(40);
      final double phoneWidth = mobilePhoneWidth(layout.statusDotSize);
      final double borderWidth = mobileStatusBorderWidth(
        statusDotSize: layout.statusDotSize,
        cutoutRadius: layout.cutoutRadius,
      );
      expect(
        layout.phoneCutoutRect.height,
        (phoneWidth / kMobileAspectRatio).roundToDouble() +
            kMobilePhoneExtraHeight +
            borderWidth * 2,
      );
    });

    test('phone badge is centered on web cutout anchor', () {
      const double avatarSize = 36;
      final AvatarStatusLayout layout = AvatarStatusLayout.forAvatarSize(
        avatarSize,
      );
      expect(layout.phoneCutoutRect.center, layout.statusCutoutCenter);
    });

    test('phone cutout includes status border padding', () {
      const double avatarSize = 36;
      final AvatarStatusLayout layout = AvatarStatusLayout.forAvatarSize(
        avatarSize,
      );
      final double borderWidth = mobileStatusBorderWidth(
        statusDotSize: layout.statusDotSize,
        cutoutRadius: layout.cutoutRadius,
      );
      final double phoneWidth = mobilePhoneWidth(layout.statusDotSize);
      expect(layout.phoneCutoutRect.width, phoneWidth + borderWidth * 2);
      expect(
        layout.phoneCutoutRect.height,
        mobilePhoneHeight(phoneWidth) + borderWidth * 2,
      );
    });

    test('round status dot is centered on web cutout anchor', () {
      for (final double avatarSize in <double>[36, 80, 120]) {
        final AvatarStatusLayout layout = AvatarStatusLayout.forAvatarSize(
          avatarSize,
        );
        final double cutoutCenter = layout.statusCutoutCenter.dx;
        expect(
          layout.statusRight,
          avatarSize - cutoutCenter - layout.statusDotSize / 2,
          reason: 'statusRight should center dot for size $avatarSize',
        );
        expect(
          layout.statusBottom,
          avatarSize - cutoutCenter - layout.statusDotSize / 2,
          reason: 'statusBottom should center dot for size $avatarSize',
        );
      }
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
