import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_enter_send.dart';

void main() {
  group('isComposerSubmitKey', () {
    test('matches enter and numpad enter', () {
      expect(isComposerSubmitKey(LogicalKeyboardKey.enter), isTrue);
      expect(isComposerSubmitKey(LogicalKeyboardKey.numpadEnter), isTrue);
    });

    test('ignores other keys', () {
      expect(isComposerSubmitKey(LogicalKeyboardKey.escape), isFalse);
      expect(isComposerSubmitKey(LogicalKeyboardKey.space), isFalse);
    });
  });

  group('composerEnterSends', () {
    test('sends on desktop', () {
      expect(
        composerEnterSends(
          isWeb: false,
          isWideLayout: false,
          isNativeMobileOs: false,
          physicalKeyboardConnected: false,
        ),
        isTrue,
      );
    });

    test('sends on web only when the layout is wide', () {
      expect(
        composerEnterSends(
          isWeb: true,
          isWideLayout: true,
          isNativeMobileOs: false,
          physicalKeyboardConnected: false,
        ),
        isTrue,
      );
      expect(
        composerEnterSends(
          isWeb: true,
          isWideLayout: false,
          isNativeMobileOs: false,
          physicalKeyboardConnected: false,
        ),
        isFalse,
      );
    });

    test('ignores on-screen enter on mobile without a physical keyboard', () {
      expect(
        composerEnterSends(
          isWeb: false,
          isWideLayout: false,
          isNativeMobileOs: true,
          physicalKeyboardConnected: false,
        ),
        isFalse,
      );
    });

    test('sends on mobile when a physical keyboard is connected', () {
      expect(
        composerEnterSends(
          isWeb: false,
          isWideLayout: false,
          isNativeMobileOs: true,
          physicalKeyboardConnected: true,
        ),
        isTrue,
      );
    });
  });
}
