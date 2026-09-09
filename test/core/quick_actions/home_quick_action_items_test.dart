import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/quick_actions/home_quick_action.dart';
import 'package:fluxer_app/core/quick_actions/home_quick_action_items.dart';
import 'package:quick_actions/quick_actions.dart';

const HomeQuickActionTitles _titles = HomeQuickActionTitles(
  dms: 'DMs',
  search: 'Search',
  notifications: 'Notifications',
);

void main() {
  group('HomeQuickAction.tryParse', () {
    test('parses known types', () {
      expect(HomeQuickAction.tryParse('fluxer.dms'), HomeQuickAction.dms);
      expect(HomeQuickAction.tryParse('fluxer.search'), HomeQuickAction.search);
      expect(
        HomeQuickAction.tryParse('fluxer.notifications'),
        HomeQuickAction.notifications,
      );
    });

    test('returns null for unknown types', () {
      expect(HomeQuickAction.tryParse('unknown'), isNull);
    });
  });

  group('buildHomeQuickActionItems', () {
    test('includes DMs, Search, and Notifications by default', () {
      final List<ShortcutItem> items = buildHomeQuickActionItems(
        titles: _titles,
        includeDms: true,
      );

      expect(
        items.map((ShortcutItem item) => item.type).toList(),
        <String>['fluxer.dms', 'fluxer.search', 'fluxer.notifications'],
      );
      expect(
        items.map((ShortcutItem item) => item.localizedTitle).toList(),
        <String>['DMs', 'Search', 'Notifications'],
      );
      expect(
        items.map((ShortcutItem item) => item.icon).toList(),
        <String?>[
          'quick_action_dms',
          'quick_action_search',
          'quick_action_notifications',
        ],
      );
    });

    test('omits DMs when they are disabled', () {
      final List<ShortcutItem> items = buildHomeQuickActionItems(
        titles: _titles,
        includeDms: false,
      );

      expect(
        items.map((ShortcutItem item) => item.type).toList(),
        <String>['fluxer.search', 'fluxer.notifications'],
      );
    });
  });
}
