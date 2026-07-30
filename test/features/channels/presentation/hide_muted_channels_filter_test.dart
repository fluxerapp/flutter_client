import 'package:fluxer_app/features/channels/domain/hide_muted_channels_filter.dart';
import 'package:test/test.dart';

void main() {
  group('shouldShowChannelWhenHidingMuted', () {
    test('shows unmuted channel', () {
      expect(
        shouldShowChannelWhenHidingMuted(
          channelId: 'channel-1',
          mutedChannelIds: const {'other-channel'},
        ),
        isTrue,
      );
    });

    test('hides directly muted channel', () {
      expect(
        shouldShowChannelWhenHidingMuted(
          channelId: 'channel-1',
          mutedChannelIds: const {'channel-1'},
        ),
        isFalse,
      );
    });

    test('shows channel when only parent category is muted', () {
      expect(
        shouldShowChannelWhenHidingMuted(
          channelId: 'channel-1',
          mutedChannelIds: const {'category-1'},
        ),
        isTrue,
      );
    });

    test('shows channel when guild mute is not part of muted set', () {
      expect(
        shouldShowChannelWhenHidingMuted(
          channelId: 'channel-1',
          mutedChannelIds: const {},
        ),
        isTrue,
      );
    });

    test('shows selected channel even when directly muted', () {
      expect(
        shouldShowChannelWhenHidingMuted(
          channelId: 'channel-1',
          mutedChannelIds: const {'channel-1'},
          selectedChannelId: 'channel-1',
        ),
        isTrue,
      );
    });

    test('hides non-selected muted channel when another is selected', () {
      expect(
        shouldShowChannelWhenHidingMuted(
          channelId: 'channel-1',
          mutedChannelIds: const {'channel-1'},
          selectedChannelId: 'channel-2',
        ),
        isFalse,
      );
    });

    test('shows muted channel that has mentions', () {
      expect(
        shouldShowChannelWhenHidingMuted(
          channelId: 'channel-1',
          mutedChannelIds: const {'channel-1'},
          hasMentions: true,
        ),
        isTrue,
      );
    });

    test('hides muted channel with plain unread but no mentions', () {
      expect(
        shouldShowChannelWhenHidingMuted(
          channelId: 'channel-1',
          mutedChannelIds: const {'channel-1'},
        ),
        isFalse,
      );
    });

    test('shows muted channel the user is connected to', () {
      expect(
        shouldShowChannelWhenHidingMuted(
          channelId: 'channel-1',
          mutedChannelIds: const {'channel-1'},
          connectedChannelId: 'channel-1',
        ),
        isTrue,
      );
    });

    test('hides muted channel with no unread, not selected, not connected', () {
      expect(
        shouldShowChannelWhenHidingMuted(
          channelId: 'channel-1',
          mutedChannelIds: const {'channel-1'},
          selectedChannelId: 'channel-2',
          connectedChannelId: 'channel-3',
        ),
        isFalse,
      );
    });
  });

  group('shouldShowChannelInCollapsedCategory', () {
    test('shows the selected channel', () {
      expect(
        shouldShowChannelInCollapsedCategory(
          isCategoryMuted: false,
          isSelected: true,
          isConnected: false,
          hasVisibleUnread: false,
        ),
        isTrue,
      );
    });

    test('shows the connected channel', () {
      expect(
        shouldShowChannelInCollapsedCategory(
          isCategoryMuted: true,
          isSelected: false,
          isConnected: true,
          hasVisibleUnread: false,
        ),
        isTrue,
      );
    });

    test('shows an unread channel when the category is not muted', () {
      expect(
        shouldShowChannelInCollapsedCategory(
          isCategoryMuted: false,
          isSelected: false,
          isConnected: false,
          hasVisibleUnread: true,
        ),
        isTrue,
      );
    });

    test('hides an unread channel when the category is muted', () {
      expect(
        shouldShowChannelInCollapsedCategory(
          isCategoryMuted: true,
          isSelected: false,
          isConnected: false,
          hasVisibleUnread: true,
        ),
        isFalse,
      );
    });

    test('hides a read, unselected, disconnected channel', () {
      expect(
        shouldShowChannelInCollapsedCategory(
          isCategoryMuted: false,
          isSelected: false,
          isConnected: false,
          hasVisibleUnread: false,
        ),
        isFalse,
      );
    });
  });
}
