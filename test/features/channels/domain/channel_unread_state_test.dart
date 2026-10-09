import 'package:fluxer_app/features/channels/domain/channel_unread_state.dart';
import 'package:fluxer_dart/export.dart';
import 'package:test/test.dart';

void main() {
  group('getChannelUnreadState', () {
    test('unread and not muted shows indicator and highlight', () {
      final state = getChannelUnreadState(
        unreadCount: 1,
        mentionCount: 0,
        isMuted: false,
        showFadedUnreadOnMutedChannels: false,
      );
      expect(state.shouldShowUnreadIndicator, isTrue);
      expect(state.isHighlight, isTrue);
      expect(state.hasMentions, isFalse);
    });

    test('unread and muted with setting off hides indicator and highlight', () {
      final state = getChannelUnreadState(
        unreadCount: 1,
        mentionCount: 0,
        isMuted: true,
        showFadedUnreadOnMutedChannels: false,
      );
      expect(state.shouldShowUnreadIndicator, isFalse);
      expect(state.isHighlight, isFalse);
    });

    test('unread and muted with setting on shows faded indicator only', () {
      final state = getChannelUnreadState(
        unreadCount: 1,
        mentionCount: 0,
        isMuted: true,
        showFadedUnreadOnMutedChannels: true,
      );
      expect(state.shouldShowUnreadIndicator, isTrue);
      expect(state.isHighlight, isFalse);
    });

    test('mentions on muted channel highlight and show mentions', () {
      final state = getChannelUnreadState(
        unreadCount: 0,
        mentionCount: 2,
        isMuted: true,
        showFadedUnreadOnMutedChannels: false,
      );
      expect(state.hasMentions, isTrue);
      expect(state.isHighlight, isTrue);
      expect(state.shouldShowUnreadIndicator, isFalse);
    });

    test('no messages badge level suppresses visible surfaces', () {
      final state = getChannelUnreadState(
        unreadCount: 3,
        mentionCount: 2,
        isMuted: false,
        showFadedUnreadOnMutedChannels: true,
        unreadBadgesLevel: UserNotificationSettings.noMessages,
      );
      expect(state.shouldShowUnreadIndicator, isFalse);
      expect(state.hasMentions, isFalse);
      expect(state.isHighlight, isFalse);
      expect(state.hasVisibleUnread, isFalse);
    });

    test('only mentions badge level shows faded dot for plain unread', () {
      final state = getChannelUnreadState(
        unreadCount: 3,
        mentionCount: 0,
        isMuted: false,
        showFadedUnreadOnMutedChannels: false,
        unreadBadgesLevel: UserNotificationSettings.onlyMentions,
      );
      expect(state.shouldShowUnreadIndicator, isTrue);
      expect(state.isUnreadIndicatorMuted, isTrue);
      expect(state.hasMentions, isFalse);
      expect(state.isHighlight, isFalse);
    });

    test('only mentions badge level shows mention highlight', () {
      final state = getChannelUnreadState(
        unreadCount: 3,
        mentionCount: 1,
        isMuted: false,
        showFadedUnreadOnMutedChannels: false,
        unreadBadgesLevel: UserNotificationSettings.onlyMentions,
      );
      expect(state.shouldShowUnreadIndicator, isTrue);
      expect(state.hasMentions, isTrue);
      expect(state.isHighlight, isTrue);
    });

    test('all messages badge level shows indicator even when muted', () {
      final state = getChannelUnreadState(
        unreadCount: 1,
        mentionCount: 0,
        isMuted: true,
        showFadedUnreadOnMutedChannels: false,
        unreadBadgesLevel: UserNotificationSettings.allMessages,
      );
      expect(state.shouldShowUnreadIndicator, isTrue);
      expect(state.isHighlight, isTrue);
    });
  });
}
