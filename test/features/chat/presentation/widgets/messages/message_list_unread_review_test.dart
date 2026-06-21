import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_unread_review.dart';

void main() {
  group('isNearScrollExtentEnd', () {
    test('is true at minScrollExtent with large absolute pixels', () {
      expect(isNearScrollExtentEnd(pixels: 80, minScrollExtent: 80), isTrue);
      expect(80 <= 24, isFalse);
    });

    test('is false when far from minScrollExtent', () {
      expect(isNearScrollExtentEnd(pixels: 140, minScrollExtent: 80), isFalse);
    });
  });

  group('isLiveNearBottom', () {
    test('is true at minScrollExtent with large absolute pixels', () {
      expect(isLiveNearBottom(pixels: 80, minScrollExtent: 80), isTrue);
    });

    test('is false when far from minScrollExtent', () {
      expect(isLiveNearBottom(pixels: 140, minScrollExtent: 80), isFalse);
    });
  });

  group('shouldShowUnreadBar', () {
    test('returns false when there is no unread', () {
      expect(
        shouldShowUnreadBar(
          hasUnread: false,
          liveNearBottom: false,
          hasMoreNewerMessages: false,
          isManualReadState: false,
          stickyUnreadMessageId: null,
        ),
        isFalse,
      );
    });

    test('suppresses at bottom on latest page with unread', () {
      expect(
        shouldShowUnreadBar(
          hasUnread: true,
          liveNearBottom: true,
          hasMoreNewerMessages: false,
          isManualReadState: false,
          stickyUnreadMessageId: null,
        ),
        isFalse,
      );
    });

    test('shows when scrolled up with unread', () {
      expect(
        shouldShowUnreadBar(
          hasUnread: true,
          liveNearBottom: false,
          hasMoreNewerMessages: false,
          isManualReadState: false,
          stickyUnreadMessageId: null,
        ),
        isTrue,
      );
    });

    test('shows at bottom when read state is manual', () {
      expect(
        shouldShowUnreadBar(
          hasUnread: true,
          liveNearBottom: true,
          hasMoreNewerMessages: false,
          isManualReadState: true,
          stickyUnreadMessageId: null,
        ),
        isTrue,
      );
    });

    test('shows at bottom when sticky unread is set', () {
      expect(
        shouldShowUnreadBar(
          hasUnread: true,
          liveNearBottom: true,
          hasMoreNewerMessages: false,
          isManualReadState: false,
          stickyUnreadMessageId: 'msg-1',
        ),
        isTrue,
      );
    });

    test('shows at bottom when newer pages remain', () {
      expect(
        shouldShowUnreadBar(
          hasUnread: true,
          liveNearBottom: true,
          hasMoreNewerMessages: true,
          isManualReadState: false,
          stickyUnreadMessageId: null,
        ),
        isTrue,
      );
    });
  });
}
