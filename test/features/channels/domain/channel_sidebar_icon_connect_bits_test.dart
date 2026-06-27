import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/features/channels/domain/channel_sidebar_icon_connect_bits.dart';

void main() {
  group('resolveChannelSidebarIconConnectBits', () {
    test('prefers cached bits over computed outcome', () {
      final int? actual = resolveChannelSidebarIconConnectBits(
        cachedBits: 42,
        computedOutcome: (value: 0, shouldCache: true),
      );
      expect(actual, 42);
    });

    test('returns null when cache is empty and outcome is not cacheable', () {
      final int? actual = resolveChannelSidebarIconConnectBits(
        computedOutcome: (value: 0, shouldCache: false),
      );
      expect(actual, isNull);
    });

    test('returns computed value when cacheable', () {
      const int deniedConnect = 1024;
      final int? actual = resolveChannelSidebarIconConnectBits(
        computedOutcome: (value: deniedConnect, shouldCache: true),
      );
      expect(actual, deniedConnect);
    });

    test('returns zero connect bits when cacheable and user lacks connect', () {
      final int? actual = resolveChannelSidebarIconConnectBits(
        computedOutcome: (value: 0, shouldCache: true),
      );
      expect(actual, 0);
    });

    test('returns null when no cache and no computed outcome', () {
      expect(resolveChannelSidebarIconConnectBits(), isNull);
    });
  });
}
