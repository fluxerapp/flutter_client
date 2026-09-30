import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/build/push_provider_kind.dart';
import 'package:fluxer_app/core/premium/plutonium_store_gate.dart';

void main() {
  group('resolvePlutoniumStorePage', () {
    test('stays off for OSS', () {
      expect(
        resolvePlutoniumStorePage(
          ossWebCheckout: true,
          desktopOs: false,
          pushProvider: PushProviderKind.unifiedPush,
        ),
        isFalse,
      );
    });

    test('stays off on desktop', () {
      expect(
        resolvePlutoniumStorePage(
          ossWebCheckout: false,
          desktopOs: true,
          pushProvider: PushProviderKind.firebaseMessaging,
        ),
        isFalse,
      );
    });

    test('stays off for UnifiedPush', () {
      expect(
        resolvePlutoniumStorePage(
          ossWebCheckout: false,
          desktopOs: false,
          pushProvider: PushProviderKind.unifiedPush,
        ),
        isFalse,
      );
    });

    test('turns on for FCM mobile', () {
      expect(
        resolvePlutoniumStorePage(
          ossWebCheckout: false,
          desktopOs: false,
          pushProvider: PushProviderKind.firebaseMessaging,
        ),
        isTrue,
      );
    });

    test('turns on for APNS mobile', () {
      expect(
        resolvePlutoniumStorePage(
          ossWebCheckout: false,
          desktopOs: false,
          pushProvider: PushProviderKind.apple,
        ),
        isTrue,
      );
    });
  });
}
