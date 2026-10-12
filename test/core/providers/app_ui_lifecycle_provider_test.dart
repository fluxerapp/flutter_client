import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';

void main() {
  group('isAppUiForegroundLifecycle', () {
    test('resumed is foreground from any prior state', () {
      expect(
        isAppUiForegroundLifecycle(
          AppLifecycleState.resumed,
          wasForeground: false,
        ),
        isTrue,
      );
      expect(
        isAppUiForegroundLifecycle(
          AppLifecycleState.resumed,
          wasForeground: true,
        ),
        isTrue,
      );
    });

    test('inactive stays foreground on a brief dip from resumed', () {
      expect(
        isAppUiForegroundLifecycle(
          AppLifecycleState.inactive,
          wasForeground: true,
        ),
        isTrue,
      );
    });

    test('inactive before the first resume is not foreground', () {
      expect(
        isAppUiForegroundLifecycle(
          AppLifecycleState.inactive,
          wasForeground: false,
        ),
        isFalse,
      );
    });

    test('inactive is foreground for an unfocused desktop window', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
      addTearDown(() => debugDefaultTargetPlatformOverride = null);

      expect(
        isAppUiForegroundLifecycle(
          AppLifecycleState.inactive,
          wasForeground: false,
        ),
        isTrue,
      );
    });

    test('hidden, paused and detached are never foreground', () {
      for (final AppLifecycleState state in <AppLifecycleState>[
        AppLifecycleState.hidden,
        AppLifecycleState.paused,
        AppLifecycleState.detached,
      ]) {
        expect(isAppUiForegroundLifecycle(state, wasForeground: true), isFalse);
      }
    });
  });

  testWidgets('a background launch reporting inactive is not foreground', (
    WidgetTester tester,
  ) async {
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);

    expect(container.read(appUiForegroundProvider), isFalse);
  });

  testWidgets('a launch already resumed is foreground', (
    WidgetTester tester,
  ) async {
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);

    expect(container.read(appUiForegroundProvider), isTrue);
  });
}
