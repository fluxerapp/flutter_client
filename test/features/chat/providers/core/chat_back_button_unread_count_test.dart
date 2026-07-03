import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_back_button_unread_count.dart';

void main() {
  group('computeChatBackButtonUnreadCount', () {
    test('sums guild mentions and other DM unread counts', () {
      final int actual = computeChatBackButtonUnreadCount(
        totalGuildMentionCount: 5,
        currentGuildChannelMentionCount: 2,
        otherDmUnreadCount: 3,
      );
      expect(actual, 6);
    });

    test('never returns negative guild mention totals', () {
      final int actual = computeChatBackButtonUnreadCount(
        totalGuildMentionCount: 1,
        currentGuildChannelMentionCount: 4,
        otherDmUnreadCount: 0,
      );
      expect(actual, 0);
    });
  });

  group('computeOtherDmUnreadCount', () {
    const List<ChatBackButtonDmUnreadSnapshot> dmChannels = [
      ChatBackButtonDmUnreadSnapshot(
        channelId: 'dm-1',
        mentionCount: 2,
        hasUnread: true,
      ),
      ChatBackButtonDmUnreadSnapshot(
        channelId: 'dm-2',
        mentionCount: 0,
        hasUnread: true,
      ),
      ChatBackButtonDmUnreadSnapshot(
        channelId: 'dm-3',
        mentionCount: 0,
        hasUnread: false,
      ),
    ];

    test('excludes the current DM channel', () {
      final int actual = computeOtherDmUnreadCount(
        dmChannels: dmChannels,
        currentChannelId: 'dm-1',
      );
      expect(actual, 1);
    });

    test('counts mention totals before plain unread DMs', () {
      final int actual = computeOtherDmUnreadCount(
        dmChannels: dmChannels,
        currentChannelId: 'dm-2',
      );
      expect(actual, 2);
    });
  });

  group('sumGuildMentionCounts', () {
    test('adds mention counts across guilds', () {
      final int actual = sumGuildMentionCounts(const {
        'guild-a': 2,
        'guild-b': 3,
      });
      expect(actual, 5);
    });
  });
}
