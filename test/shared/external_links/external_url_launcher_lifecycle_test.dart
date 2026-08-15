import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';

void main() {
  group('shouldCloseInAppBrowserOnLifecycleResume', () {
    test('is true when returning from background to resumed', () {
      expect(
        shouldCloseInAppBrowserOnLifecycleResume(
          wasForeground: false,
          state: AppLifecycleState.resumed,
        ),
        isTrue,
      );
    });

    test('is true when returning from background to inactive', () {
      expect(
        shouldCloseInAppBrowserOnLifecycleResume(
          wasForeground: false,
          state: AppLifecycleState.inactive,
        ),
        isTrue,
      );
    });

    test('is false while remaining in the foreground', () {
      expect(
        shouldCloseInAppBrowserOnLifecycleResume(
          wasForeground: true,
          state: AppLifecycleState.resumed,
        ),
        isFalse,
      );
      expect(
        shouldCloseInAppBrowserOnLifecycleResume(
          wasForeground: true,
          state: AppLifecycleState.inactive,
        ),
        isFalse,
      );
    });

    test('is false when leaving the foreground', () {
      expect(
        shouldCloseInAppBrowserOnLifecycleResume(
          wasForeground: true,
          state: AppLifecycleState.paused,
        ),
        isFalse,
      );
      expect(
        shouldCloseInAppBrowserOnLifecycleResume(
          wasForeground: true,
          state: AppLifecycleState.hidden,
        ),
        isFalse,
      );
    });

    test('is false while remaining in the background', () {
      expect(
        shouldCloseInAppBrowserOnLifecycleResume(
          wasForeground: false,
          state: AppLifecycleState.paused,
        ),
        isFalse,
      );
      expect(
        shouldCloseInAppBrowserOnLifecycleResume(
          wasForeground: false,
          state: AppLifecycleState.hidden,
        ),
        isFalse,
      );
    });
  });
}
