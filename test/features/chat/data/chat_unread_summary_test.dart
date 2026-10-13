import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/data/chat_unread_summary.dart';

void main() {
  test('finds oldest unread including own messages', () {
    final summary = computeChatUnreadSummary(
      messages: const [
        ChatUnreadMessageRef(id: '90'),
        ChatUnreadMessageRef(id: '100'),
        ChatUnreadMessageRef(id: '110'),
        ChatUnreadMessageRef(id: '120'),
      ],
      ackLastMessageId: '90',
      mentionCount: 0,
      channelLastMessageId: '120',
      hasMoreNewerMessages: false,
      hasMoreOlderMessages: false,
      cachedUnreadCount: 0,
    );

    expect(summary.oldestUnreadMessageId, '100');
    expect(summary.displayUnreadCount, 3);
    expect(summary.isEstimated, isFalse);
  });

  test('anchors unread on own messages when they are the only unread', () {
    final summary = computeChatUnreadSummary(
      messages: const [
        ChatUnreadMessageRef(id: '90'),
        ChatUnreadMessageRef(id: '100'),
        ChatUnreadMessageRef(id: '110'),
      ],
      ackLastMessageId: '90',
      mentionCount: 0,
      channelLastMessageId: '110',
      hasMoreNewerMessages: false,
      hasMoreOlderMessages: false,
      cachedUnreadCount: 0,
    );

    expect(summary.oldestUnreadMessageId, '100');
    expect(summary.displayUnreadCount, 2);
    expect(summary.displayUnreadCount, greaterThan(0));
    expect(summary.isEstimated, isFalse);
  });

  test('uses an older loaded message as an exact unread boundary', () {
    final summary = computeChatUnreadSummary(
      messages: const [
        ChatUnreadMessageRef(id: '90'),
        ChatUnreadMessageRef(id: '110'),
        ChatUnreadMessageRef(id: '120'),
      ],
      ackLastMessageId: '100',
      mentionCount: 0,
      channelLastMessageId: '120',
      hasMoreNewerMessages: false,
      hasMoreOlderMessages: false,
      cachedUnreadCount: 0,
    );

    expect(summary.oldestUnreadMessageId, '110');
    expect(summary.displayUnreadCount, 2);
    expect(summary.isEstimated, isFalse);
  });

  test('marks count estimated when unread boundary is not loaded', () {
    final summary = computeChatUnreadSummary(
      messages: const [
        ChatUnreadMessageRef(id: '200'),
        ChatUnreadMessageRef(id: '210'),
      ],
      ackLastMessageId: '100',
      mentionCount: 0,
      channelLastMessageId: '210',
      hasMoreNewerMessages: false,
      hasMoreOlderMessages: true,
      cachedUnreadCount: 0,
    );

    expect(summary.oldestUnreadMessageId, isNull);
    expect(summary.displayUnreadCount, 2);
    expect(summary.isEstimated, isTrue);
  });

  test('window reaching the channel start is a known unread boundary', () {
    final summary = computeChatUnreadSummary(
      messages: const [
        ChatUnreadMessageRef(id: '200'),
        ChatUnreadMessageRef(id: '210'),
      ],
      ackLastMessageId: '100',
      mentionCount: 0,
      channelLastMessageId: '210',
      hasMoreNewerMessages: false,
      hasMoreOlderMessages: false,
      cachedUnreadCount: 0,
    );

    expect(summary.oldestUnreadMessageId, '200');
    expect(summary.displayUnreadCount, 2);
    expect(summary.isEstimated, isFalse);
  });

  test('uses mention count as display lower bound', () {
    final summary = computeChatUnreadSummary(
      messages: const [ChatUnreadMessageRef(id: '200')],
      ackLastMessageId: '100',
      mentionCount: 5,
      channelLastMessageId: '200',
      hasMoreNewerMessages: false,
      hasMoreOlderMessages: true,
      cachedUnreadCount: 0,
    );
    expect(summary.displayUnreadCount, 5);
    expect(summary.isEstimated, isTrue);
  });

  test('does not produce unread summary without ack id', () {
    final summary = computeChatUnreadSummary(
      messages: const [ChatUnreadMessageRef(id: '200')],
      ackLastMessageId: null,
      mentionCount: 5,
      channelLastMessageId: '200',
      hasMoreNewerMessages: false,
      hasMoreOlderMessages: false,
      cachedUnreadCount: 0,
    );

    expect(summary.oldestUnreadMessageId, isNull);
    expect(summary.displayUnreadCount, 0);
    expect(summary.isEstimated, isFalse);
    expect(summary.displayUnreadCount, 0);
  });

  test(
    'marks summary estimated when channel pointer is ahead of loaded tail',
    () {
      final summary = computeChatUnreadSummary(
        messages: const [
          ChatUnreadMessageRef(id: '100'),
          ChatUnreadMessageRef(id: '110'),
        ],
        ackLastMessageId: '90',
        mentionCount: 0,
        channelLastMessageId: '200',
        hasMoreNewerMessages: false,
        hasMoreOlderMessages: false,
        cachedUnreadCount: 0,
      );

      expect(summary.displayUnreadCount, 2);
      expect(summary.isEstimated, isTrue);
    },
  );

  test('counts cached unread arrivals beyond a detached window', () {
    final summary = computeChatUnreadSummary(
      messages: const [
        ChatUnreadMessageRef(id: '20'),
        ChatUnreadMessageRef(id: '21'),
      ],
      ackLastMessageId: '300',
      mentionCount: 0,
      channelLastMessageId: '303',
      hasMoreNewerMessages: true,
      hasMoreOlderMessages: true,
      cachedUnreadCount: 3,
    );

    expect(summary.oldestUnreadMessageId, isNull);
    expect(summary.displayUnreadCount, 3);
    expect(summary.isEstimated, isTrue);
  });

  test('cached unread count includes the loaded unread messages', () {
    final summary = computeChatUnreadSummary(
      messages: const [
        ChatUnreadMessageRef(id: '90'),
        ChatUnreadMessageRef(id: '100'),
      ],
      ackLastMessageId: '90',
      mentionCount: 0,
      channelLastMessageId: '300',
      hasMoreNewerMessages: true,
      hasMoreOlderMessages: true,
      cachedUnreadCount: 3,
    );

    expect(summary.oldestUnreadMessageId, '100');
    expect(summary.displayUnreadCount, 3);
    expect(summary.isEstimated, isTrue);
  });

  test('ignores the cached count once the window reaches the tail', () {
    final summary = computeChatUnreadSummary(
      messages: const [
        ChatUnreadMessageRef(id: '90'),
        ChatUnreadMessageRef(id: '100'),
      ],
      ackLastMessageId: '100',
      mentionCount: 0,
      channelLastMessageId: '100',
      hasMoreNewerMessages: false,
      hasMoreOlderMessages: true,
      cachedUnreadCount: 2,
    );

    expect(summary.displayUnreadCount, 0);
    expect(summary.isEstimated, isFalse);
  });

  group('resolveVisualUnreadId', () {
    const messages = [
      ChatUnreadMessageRef(id: '100'),
      ChatUnreadMessageRef(id: '110'),
      ChatUnreadMessageRef(id: '120'),
    ];

    test('falls back to oldest unread when no sticky is set', () {
      expect(
        resolveVisualUnreadId(
          messages: messages,
          stickyUnreadId: null,
          oldestUnreadId: '110',
        ),
        '110',
      );
    });

    test('returns the sticky id when present as a non-own message', () {
      expect(
        resolveVisualUnreadId(
          messages: messages,
          stickyUnreadId: '110',
          oldestUnreadId: '120',
        ),
        '110',
      );
    });

    test('falls back to oldest when the sticky id is not loaded', () {
      expect(
        resolveVisualUnreadId(
          messages: messages,
          stickyUnreadId: '999',
          oldestUnreadId: '120',
        ),
        '120',
      );
    });

    test('keeps a sticky pointing at an own message', () {
      expect(
        resolveVisualUnreadId(
          messages: messages,
          stickyUnreadId: '100',
          oldestUnreadId: '120',
        ),
        '100',
      );
    });

    test('keeps the sticky divider after ack when count is zero', () {
      expect(
        resolveVisualUnreadId(
          messages: messages,
          stickyUnreadId: '110',
          oldestUnreadId: null,
        ),
        '110',
      );
    });

    test('returns null when neither anchor is available', () {
      expect(
        resolveVisualUnreadId(
          messages: messages,
          stickyUnreadId: null,
          oldestUnreadId: null,
        ),
        isNull,
      );
    });
  });
}
