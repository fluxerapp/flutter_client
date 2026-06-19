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
        guildHasPlainUnread: false,
      );
      expect(badge.count, 6);
    });

    test('shows 1 for guild plain unread when no mentions', () {
      final badge = computeAppIconBadge(
        guildMentionCount: 0,
        dmMentionCount: 0,
        pendingFriendRequestCount: 0,
        guildHasPlainUnread: true,
      );
      expect(badge.count, 1);
    });

    test('dm plain unread does not show dot badge', () {
      final badge = computeAppIconBadge(
        guildMentionCount: 0,
        dmMentionCount: 0,
        pendingFriendRequestCount: 0,
        guildHasPlainUnread: false,
      );
      expect(badge.count, 0);
    });

    test('clears when no unread and unread badge disabled', () {
      final badge = computeAppIconBadge(
        guildMentionCount: 0,
        dmMentionCount: 0,
        pendingFriendRequestCount: 0,
        guildHasPlainUnread: true,
        unreadMessageBadgeEnabled: false,
      );
      expect(badge.count, 0);
    });

    test('mentions win over plain unread dot', () {
      final badge = computeAppIconBadge(
        guildMentionCount: 1,
        dmMentionCount: 0,
        pendingFriendRequestCount: 0,
        guildHasPlainUnread: true,
      );
      expect(badge.count, 1);
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
