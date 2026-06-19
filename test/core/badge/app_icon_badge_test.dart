import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/badge/app_icon_badge.dart';
import 'package:fluxer_app/core/badge/push_badge_count_parser.dart';

void main() {
  group('computeAppIconBadge', () {
    test('sums mentions and friend requests', () {
      final badge = computeAppIconBadge(
        guildMentionCount: 3,
        dmMentionCount: 2,
        pendingFriendRequestCount: 1,
      );
      expect(badge.count, 6);
    });

    test('clears when there are no counted notifications', () {
      final badge = computeAppIconBadge(
        guildMentionCount: 0,
        dmMentionCount: 0,
        pendingFriendRequestCount: 0,
      );
      expect(badge.count, 0);
    });
  });

  group('parsePushBadgeCount', () {
    test('parses int and string values', () {
      expect(parsePushBadgeCount(const {'badge_count': '5'}), 5);
      expect(parsePushBadgeCount(const {'badge_count': '0'}), 0);
    });

    test('returns null for missing or invalid', () {
      expect(parsePushBadgeCount(const {}), isNull);
      expect(
        parsePushBadgeCount(const {'badge_count': 'not-a-number'}),
        isNull,
      );
      expect(parsePushBadgeCount(const {'badge_count': '-1'}), isNull);
    });
  });
}
