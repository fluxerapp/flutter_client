import 'package:fluxer_app/features/channels/data/read_state_utils.dart';

class ChatUnreadMessageRef {
  const ChatUnreadMessageRef({required this.id, required this.authorId});

  final String id;
  final String authorId;
}

class ChatUnreadSummary {
  const ChatUnreadSummary({
    required this.oldestUnreadMessageId,
    required this.loadedUnreadCount,
    required this.displayUnreadCount,
    required this.isEstimated,
  });

  final String? oldestUnreadMessageId;
  final int loadedUnreadCount;
  final int displayUnreadCount;
  final bool isEstimated;

  bool get hasUnread => displayUnreadCount > 0;
}

String unreadCountLabel(int count, {required bool isEstimated}) {
  if (count > 99) {
    return '99+';
  }
  return isEstimated ? '$count+' : '$count';
}

ChatUnreadSummary computeChatUnreadSummary({
  required Iterable<ChatUnreadMessageRef> messages,
  required String? ackLastMessageId,
  required int mentionCount,
  required String? currentUserId,
  required String? channelLastMessageId,
  required bool hasMoreNewerMessages,
  required bool hasMoreOlderMessages,
}) {
  if (ackLastMessageId == null || ackLastMessageId.isEmpty) {
    return const ChatUnreadSummary(
      oldestUnreadMessageId: null,
      loadedUnreadCount: 0,
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
    if (currentUserId != null &&
        currentUserId.isNotEmpty &&
        message.authorId == currentUserId) {
      continue;
    }
    oldestUnread ??= message.id;
    loadedUnreadCount++;
  }

  final displayUnreadCount = loadedUnreadCount > mentionCount
      ? loadedUnreadCount
      : mentionCount;
  // Web parity: the ack boundary is "known" when a loaded message is at or
  // before the ack, or when the window reaches the channel start. Without it
  // the first loaded message is NOT the true first unread, so no divider.
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
    loadedUnreadCount: loadedUnreadCount,
    displayUnreadCount: displayUnreadCount,
    isEstimated:
        hasUnreadBeyondLoadedTail ||
        hasEstimatedTailFromPagination ||
        hasEstimatedFromMissingBoundary,
  );
}

/// Anchor for the inline "new messages" divider: the sticky message if it is
/// still loaded and not the user's own, else the oldest unread, else null.
/// Independent of the unread count, so the divider survives auto-ack.
String? resolveVisualUnreadId({
  required Iterable<ChatUnreadMessageRef> messages,
  required String? stickyUnreadId,
  required String? oldestUnreadId,
  required String? currentUserId,
}) {
  if (stickyUnreadId == null || stickyUnreadId.isEmpty) {
    return oldestUnreadId;
  }
  final bool hasVisibleSticky = messages.any(
    (ChatUnreadMessageRef message) =>
        message.id == stickyUnreadId &&
        !(currentUserId != null &&
            currentUserId.isNotEmpty &&
            message.authorId == currentUserId),
  );
  return hasVisibleSticky ? stickyUnreadId : oldestUnreadId;
}
