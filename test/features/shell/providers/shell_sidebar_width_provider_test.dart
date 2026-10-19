import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/shell/presentation/shell_sidebar_width.dart';
import 'package:fluxer_app/features/shell/providers/shell_sidebar_width_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> waitForValue(
  bool Function() predicate, {
  int attempts = 20,
}) async {
  for (var i = 0; i < attempts; i++) {
    if (predicate()) {
      return;
    }
    await Future<void>.delayed(const Duration(milliseconds: 10));
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ShellSidebarWidth', () {
    test('persists per account and reloads on user change', () async {
      SharedPreferences.setMockInitialValues(<String, Object>{});
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);

      container.read(currentUserIdProvider.notifier).set('user-a');
      await Future<void>.delayed(Duration.zero);
      await Future<void>.delayed(Duration.zero);

      container
          .read(shellSidebarWidthProvider.notifier)
          .setWidth(340, persist: true);

      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      expect(
        preferences.getString(shellSidebarWidthStorageKey('user-a')),
        '340',
      );

      container.read(currentUserIdProvider.notifier).set('user-b');
      await Future<void>.delayed(Duration.zero);
      await Future<void>.delayed(Duration.zero);
      expect(container.read(shellSidebarWidthProvider), isNull);

      container
          .read(shellSidebarWidthProvider.notifier)
          .setWidth(280, persist: true);
      container.read(currentUserIdProvider.notifier).set('user-a');
      await Future<void>.delayed(Duration.zero);
      await Future<void>.delayed(Duration.zero);
      expect(container.read(shellSidebarWidthProvider), 340);
    });

    test('reset clears stored value', () async {
      SharedPreferences.setMockInitialValues(<String, Object>{
        shellSidebarWidthStorageKey('user-a'): '310',
      });
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);

      container.read(currentUserIdProvider.notifier).set('user-a');
      container.read(shellSidebarWidthProvider);
      await waitForValue(
        () => container.read(shellSidebarWidthProvider) == 310,
      );
      expect(container.read(shellSidebarWidthProvider), 310);

      await container.read(shellSidebarWidthProvider.notifier).reset();
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      expect(
        preferences.getString(shellSidebarWidthStorageKey('user-a')),
        isNull,
      );
      expect(container.read(shellSidebarWidthProvider), isNull);
    });
  });
}
