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

    test('mobile phone height uses web aspect ratio', () {
      final AvatarStatusLayout layout = AvatarStatusLayout.forAvatarSize(40);
      expect(
        layout.phoneHeight,
        (layout.phoneWidth / kMobileAspectRatio).roundToDouble() +
            kMobilePhoneExtraHeight,
      );
    });

    test('phone badge is centered on web cutout anchor', () {
      const double avatarSize = 36;
      final AvatarStatusLayout layout = AvatarStatusLayout.forAvatarSize(
        avatarSize,
      );
      final double cutoutCenter = avatarStatusCutoutCenter(avatarSize);
      expect(layout.statusCutoutCenter, Offset(cutoutCenter, cutoutCenter));
      expect(
        layout.mobileStatusRight,
        avatarSize - cutoutCenter - layout.phoneWidth / 2,
      );
      expect(
        layout.mobileStatusBottom,
        avatarSize - cutoutCenter - layout.phoneHeight / 2,
      );
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
      expect(layout.phoneCutoutRect.width, layout.phoneWidth + borderWidth * 2);
      expect(
        layout.phoneCutoutRect.height,
        layout.phoneHeight + borderWidth * 2,
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
