import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';

String _snowflakeForUtc(DateTime utc) {
  final int internal = (utc.millisecondsSinceEpoch - kSnowflakeEpochMs) << 22;
  return internal.toString();
}

void main() {
  test(
    'hasUnreadByReadState uses fallback ack time when no read state exists',
    () {
      final lastMessageId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      final fallbackAckMs = DateTime.utc(2026, 5, 6, 11).millisecondsSinceEpoch;

      expect(
        hasUnreadByReadState(
          channelLastMessageId: lastMessageId,
          ackLastMessageId: null,
          fallbackAckMs: fallbackAckMs,
          mentionCount: 0,
        ),
        isTrue,
      );
    },
  );

  test('hasUnreadByReadState returns false for unknown guild read state', () {
    final lastMessageId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    final fallbackAckMs = DateTime.utc(2026, 5, 6, 11).millisecondsSinceEpoch;

    expect(
      hasUnreadByReadState(
        channelLastMessageId: lastMessageId,
        ackLastMessageId: null,
        fallbackAckMs: fallbackAckMs,
        mentionCount: 0,
        isGuildChannel: true,
      ),
      isFalse,
    );
  });

  test('hasUnreadByReadState treats matching ack and last message as read', () {
    final lastMessageId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));

    expect(
      hasUnreadByReadState(
        channelLastMessageId: lastMessageId,
        ackLastMessageId: lastMessageId,
        fallbackAckMs: 0,
        mentionCount: 0,
      ),
      isFalse,
    );
  });

  test('snowflakeAtPreviousMillisecond sorts before target snowflake', () {
    final target = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    final previous = snowflakeAtPreviousMillisecond(target);

    expect(compareSnowflakeIds(previous, target), isNegative);
  });

  test('oldestUnreadMessageId returns first message newer than ack', () {
    final first = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    final second = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12, 1));
    final third = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12, 2));

    expect(
      oldestUnreadMessageId(
        messageIds: [first, second, third],
        ackLastMessageId: second,
      ),
      third,
    );
  });

  test(
    'oldestUnreadMessageId returns null when all cached messages are read',
    () {
      final first = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      final second = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12, 1));

      expect(
        oldestUnreadMessageId(
          messageIds: [first, second],
          ackLastMessageId: second,
        ),
        null,
      );
    },
  );

  test(
    'resolveLatestMessageId prefers cached message over channel pointer',
    () {
      final cachedId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      final channelId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 13));

      expect(
        resolveLatestMessageId(
          channelLastMessageId: channelId,
          cachedLastMessageId: cachedId,
          channelLastMessageExistsInCache: true,
        ),
        cachedId,
      );
    },
  );

  test('resolveLatestMessageId returns null for orphaned channel pointer', () {
    final channelId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));

    expect(
      resolveLatestMessageId(
        channelLastMessageId: channelId,
        cachedLastMessageId: null,
        channelLastMessageExistsInCache: false,
      ),
      isNull,
    );
  });

  test(
    'resolveLatestMessageIdForUnread falls back to channel pointer when ack is behind',
    () {
      final lastMessageId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 13));
      final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));

      expect(
        resolveLatestMessageIdForUnread(
          strictLatestMessageId: null,
          channelLastMessageId: lastMessageId,
          ackLastMessageId: ackId,
          mentionCount: 0,
        ),
        lastMessageId,
      );
    },
  );

  test(
    'resolveLatestMessageIdForUnread falls back to channel pointer for mentions',
    () {
      final lastMessageId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 13));

      expect(
        resolveLatestMessageIdForUnread(
          strictLatestMessageId: null,
          channelLastMessageId: lastMessageId,
          ackLastMessageId: lastMessageId,
          mentionCount: 2,
        ),
        lastMessageId,
      );
    },
  );

  test(
    'resolveLatestMessageIdForUnread ignores orphaned channel pointer when cache has a tail',
    () {
      final cachedId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      final channelId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 13));
      final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));

      expect(
        resolveLatestMessageIdForUnread(
          strictLatestMessageId: cachedId,
          channelLastMessageId: channelId,
          ackLastMessageId: ackId,
          mentionCount: 0,
          channelLastMessageExistsInCache: false,
        ),
        cachedId,
      );
    },
  );

  test(
    'resolveLatestMessageIdForUnread prefers channel pointer when cache is stale',
    () {
      final cachedId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      final channelId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 13));
      final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));

      expect(
        resolveLatestMessageIdForUnread(
          strictLatestMessageId: cachedId,
          channelLastMessageId: channelId,
          ackLastMessageId: ackId,
          mentionCount: 0,
        ),
        channelId,
      );
    },
  );

  test(
    'resolveLatestMessageIdForUnread falls back to channel pointer without ack',
    () {
      final lastMessageId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 13));

      expect(
        resolveLatestMessageIdForUnread(
          strictLatestMessageId: null,
          channelLastMessageId: lastMessageId,
          ackLastMessageId: null,
          mentionCount: 0,
        ),
        lastMessageId,
      );
    },
  );

  test(
    'resolveLatestMessageIdForUnread uses channel pointer when ack caught cache but pointer is ahead',
    () {
      final cachedId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12, 1));
      final channelId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12, 2));

      expect(
        resolveLatestMessageIdForUnread(
          strictLatestMessageId: cachedId,
          channelLastMessageId: channelId,
          ackLastMessageId: cachedId,
          mentionCount: 0,
          channelLastMessageExistsInCache: false,
        ),
        channelId,
      );
    },
  );

  test(
    'resolveLatestMessageIdForUnread keeps strict resolver when ack already caught up',
    () {
      final cachedId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      final channelId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 13));

      expect(
        resolveLatestMessageIdForUnread(
          strictLatestMessageId: cachedId,
          channelLastMessageId: channelId,
          ackLastMessageId: channelId,
          mentionCount: 0,
        ),
        cachedId,
      );
    },
  );
}
