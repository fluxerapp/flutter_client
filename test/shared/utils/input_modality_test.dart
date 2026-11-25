import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/shared/utils/input_modality.dart';

void main() {
  group('initialIsTouchPrimary', () {
    tearDown(() {
      debugDefaultTargetPlatformOverride = null;
      debugSetFluxerRuntimeMobileFormFactor(value: null);
    });

    test('starts as mouse on desktop', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.linux;
      debugSetFluxerRuntimeMobileFormFactor(value: false);
      expect(initialIsTouchPrimary(), isFalse);
    });

    test('starts as touch on a phone running a desktop os', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.linux;
      debugSetFluxerRuntimeMobileFormFactor(value: true);
      expect(initialIsTouchPrimary(), isTrue);
    });
  });

  group('shouldPromoteDesktopPointerKind', () {
    test('ignores mouse hover on iOS', () {
      expect(
        shouldPromoteDesktopPointerKind(
          kind: PointerDeviceKind.mouse,
          isIOS: true,
          mouseIsConnected: true,
          isHoverEvent: true,
        ),
        isFalse,
      );
    });

    test('allows trackpad hover on iOS', () {
      expect(
        shouldPromoteDesktopPointerKind(
          kind: PointerDeviceKind.trackpad,
          isIOS: true,
          mouseIsConnected: true,
          isHoverEvent: true,
        ),
        isTrue,
      );
    });

    test('ignores synthesized mouse on iOS without a mouse', () {
      expect(
        shouldPromoteDesktopPointerKind(
          kind: PointerDeviceKind.mouse,
          isIOS: true,
          mouseIsConnected: false,
          isHoverEvent: false,
        ),
        isFalse,
      );
    });

    test('allows connected mouse down on iOS', () {
      expect(
        shouldPromoteDesktopPointerKind(
          kind: PointerDeviceKind.mouse,
          isIOS: true,
          mouseIsConnected: true,
          isHoverEvent: false,
        ),
        isTrue,
      );
    });

    test('allows trackpad down on iOS', () {
      expect(
        shouldPromoteDesktopPointerKind(
          kind: PointerDeviceKind.trackpad,
          isIOS: true,
          mouseIsConnected: true,
          isHoverEvent: false,
        ),
        isTrue,
      );
    });

    test('suppresses desktop pointers briefly after iOS touch', () {
      final DateTime now = DateTime(2026, 1, 1, 12);
      expect(
        shouldPromoteDesktopPointerKind(
          kind: PointerDeviceKind.trackpad,
          isIOS: true,
          mouseIsConnected: true,
          isHoverEvent: false,
          now: now,
          iosTouchLockUntil: now.add(const Duration(milliseconds: 200)),
        ),
        isFalse,
      );
    });

    test('allows desktop pointers after iOS touch lock expires', () {
      final DateTime now = DateTime(2026, 1, 1, 12);
      expect(
        shouldPromoteDesktopPointerKind(
          kind: PointerDeviceKind.trackpad,
          isIOS: true,
          mouseIsConnected: true,
          isHoverEvent: false,
          now: now,
          iosTouchLockUntil: now.subtract(const Duration(milliseconds: 1)),
        ),
        isTrue,
      );
    });

    test('allows mouse hover on desktop', () {
      expect(
        shouldPromoteDesktopPointerKind(
          kind: PointerDeviceKind.mouse,
          isIOS: false,
          mouseIsConnected: true,
          isHoverEvent: true,
        ),
        isTrue,
      );
    });
  });
}
