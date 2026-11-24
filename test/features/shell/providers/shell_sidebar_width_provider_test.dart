import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/shell/providers/layout/shell_sidebar_width_provider.dart';

void main() {
  group('ShellSidebarWidth', () {
    test('persists per account and reloads on user change', () {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);
      container.read(currentUserIdProvider.notifier).set('user-a');
      container
          .read(shellSidebarWidthProvider.notifier)
          .setWidth(340, persist: true);

      container.read(currentUserIdProvider.notifier).set('user-b');
      expect(container.read(shellSidebarWidthProvider), isNull);
      container
          .read(shellSidebarWidthProvider.notifier)
          .setWidth(280, persist: true);

      container.read(currentUserIdProvider.notifier).set('user-a');
      expect(container.read(shellSidebarWidthProvider), 340);
    });

    test('does not store a width while dragging', () {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);
      container.read(currentUserIdProvider.notifier).set('user-a');
      container
          .read(shellSidebarWidthProvider.notifier)
          .setWidth(340, persist: false);
      expect(container.read(shellSidebarWidthProvider), 340);

      container.invalidate(shellSidebarWidthProvider);
      expect(container.read(shellSidebarWidthProvider), isNull);
    });

    test('reset clears stored value', () async {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);
      container.read(currentUserIdProvider.notifier).set('user-a');
      container
          .read(shellSidebarWidthProvider.notifier)
          .setWidth(310, persist: true);

      await container.read(shellSidebarWidthProvider.notifier).reset();
      container.invalidate(shellSidebarWidthProvider);
      expect(container.read(shellSidebarWidthProvider), isNull);
    });
  });
}
