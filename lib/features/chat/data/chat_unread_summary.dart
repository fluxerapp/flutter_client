import 'package:fluxer_app/features/channels/data/read_state_utils.dart';

class ChatUnreadMessageRef {
  const ChatUnreadMessageRef({required this.id});

  final String id;
}

class ChatUnreadSummary {
  const ChatUnreadSummary({
    required this.oldestUnreadMessageId,
    required this.displayUnreadCount,
    required this.isEstimated,
  });

  final String? oldestUnreadMessageId;
  final int displayUnreadCount;
  final bool isEstimated;
}

ChatUnreadSummary computeChatUnreadSummary({
  required Iterable<ChatUnreadMessageRef> messages,
  required String? ackLastMessageId,
  required int mentionCount,
  required String? channelLastMessageId,
  required bool hasMoreNewerMessages,
  required bool hasMoreOlderMessages,
  required int cachedUnreadCount,
}) {
  if (ackLastMessageId == null || ackLastMessageId.isEmpty) {
    return const ChatUnreadSummary(
      oldestUnreadMessageId: null,
      displayUnreadCount: 0,
      isEstimated: false,
    );
  }

  String? oldestUnread;
  var loadedUnreadCount = 0;
  var hasLoadedAckBoundary = false;
  String? newestLoadedMessageId;

  for (final message in messages) {
    newestLoadedMessageId = message.id;
    final comparison = compareSnowflakeIds(message.id, ackLastMessageId);
    if (comparison <= 0) {
      hasLoadedAckBoundary = true;
      continue;
    }
    oldestUnread ??= message.id;
    loadedUnreadCount++;
  }

  final int unreadCount =
      hasMoreNewerMessages && cachedUnreadCount > loadedUnreadCount
      ? cachedUnreadCount
      : loadedUnreadCount;
  final displayUnreadCount = unreadCount > mentionCount
      ? unreadCount
      : mentionCount;
  final bool boundaryKnown = hasLoadedAckBoundary || !hasMoreOlderMessages;
  final bool hasUnreadBeyondLoadedTail =
      displayUnreadCount > 0 &&
      channelLastMessageId != null &&
      channelLastMessageId.isNotEmpty &&
      newestLoadedMessageId != null &&
      compareSnowflakeIds(ackLastMessageId, channelLastMessageId) < 0 &&
      compareSnowflakeIds(newestLoadedMessageId, channelLastMessageId) < 0;
  final bool hasEstimatedTailFromPagination =
      displayUnreadCount > 0 && hasMoreNewerMessages;
  final bool hasEstimatedFromMissingBoundary =
      displayUnreadCount > 0 && !boundaryKnown;

  return ChatUnreadSummary(
    oldestUnreadMessageId: boundaryKnown ? oldestUnread : null,
    displayUnreadCount: displayUnreadCount,
    isEstimated:
        hasUnreadBeyondLoadedTail ||
        hasEstimatedTailFromPagination ||
        hasEstimatedFromMissingBoundary,
  );
}

String? resolveVisualUnreadId({
  required Iterable<ChatUnreadMessageRef> messages,
  required String? stickyUnreadId,
  required String? oldestUnreadId,
}) {
  if (stickyUnreadId == null || stickyUnreadId.isEmpty) {
    return oldestUnreadId;
  }
  final bool hasVisibleSticky = messages.any(
    (ChatUnreadMessageRef message) => message.id == stickyUnreadId,
  );
  return hasVisibleSticky ? stickyUnreadId : oldestUnreadId;
}
