import 'package:fluxer_app/features/chat/domain/message.dart';

enum ChannelStreamType {
  message,
  messageGroupBlocked,
  messageGroupSpammer,
  divider,
}

extension ChannelStreamTypeX on ChannelStreamType {
  bool get isCollapsedGroup =>
      this == ChannelStreamType.messageGroupBlocked ||
      this == ChannelStreamType.messageGroupSpammer;
}

class ChannelStreamItem {
  const ChannelStreamItem({
    required this.type,
    this.messages = const <Message>[],
    this.groupKey,
    this.dividerDate,
    this.showUnreadDividerBefore = false,
    this.dividerHasUnread = false,
  });

  final ChannelStreamType type;
  final List<Message> messages;
  final String? groupKey;
  final DateTime? dividerDate;
  final bool showUnreadDividerBefore;
  final bool dividerHasUnread;

  Message? get singleMessage => messages.length == 1 ? messages.first : null;

  bool containsMessageId(String messageId) =>
      messages.any((Message message) => message.id == messageId);
}

typedef IsUserMarkedAsSpammer = bool Function(String userId, int userFlags);

class ChannelCollapseContext {
  const ChannelCollapseContext({
    required this.treatSpam,
    required this.currentUserId,
    required this.blockedUserIds,
    required this.isUserMarkedAsSpammer,
  });

  final bool treatSpam;
  final String? currentUserId;
  final Set<String> blockedUserIds;
  final IsUserMarkedAsSpammer isUserMarkedAsSpammer;

  ChannelStreamType? collapsedTypeFor(Message message) {
    if (blockedUserIds.contains(message.authorId)) {
      return ChannelStreamType.messageGroupBlocked;
    }
    final String? userId = currentUserId;
    if (treatSpam &&
        userId != null &&
        userId.isNotEmpty &&
        message.authorId != userId &&
        isUserMarkedAsSpammer(message.authorId, message.authorPublicFlags)) {
      return ChannelStreamType.messageGroupSpammer;
    }
    return null;
  }
}

class MessageCollapseAssignment {
  const MessageCollapseAssignment({this.collapsedType, this.groupKey});

  final ChannelStreamType? collapsedType;
  final String? groupKey;
}

List<MessageCollapseAssignment> buildMessageCollapseAssignments({
  required List<Message> messages,
  required ChannelCollapseContext context,
}) {
  if (messages.isEmpty) {
    return const <MessageCollapseAssignment>[];
  }
  final List<MessageCollapseAssignment> assignments =
      <MessageCollapseAssignment>[];
  ChannelStreamType? currentType;
  String? currentGroupKey;
  DateTime? previousTimestamp;
  for (final Message message in messages) {
    final ChannelStreamType? collapsedType = context.collapsedTypeFor(message);
    if (collapsedType == null) {
      currentType = null;
      currentGroupKey = null;
      assignments.add(const MessageCollapseAssignment());
      previousTimestamp = message.timestamp;
      continue;
    }
    if (collapsedType != currentType ||
        (previousTimestamp != null &&
            !_isSameDay(previousTimestamp, message.timestamp))) {
      currentType = collapsedType;
      currentGroupKey = message.id;
    }
    assignments.add(
      MessageCollapseAssignment(
        collapsedType: collapsedType,
        groupKey: currentGroupKey,
      ),
    );
    previousTimestamp = message.timestamp;
  }
  return assignments;
}

String? getCollapsedMessageGroupKey({
  required List<Message> messages,
  required String messageId,
  required ChannelCollapseContext context,
}) {
  final List<MessageCollapseAssignment> assignments =
      buildMessageCollapseAssignments(messages: messages, context: context);
  for (var i = 0; i < messages.length; i++) {
    if (messages[i].id == messageId) {
      return assignments[i].groupKey;
    }
  }
  return null;
}

List<ChannelStreamItem> createChannelStream({
  required List<Message> messages,
  required String? oldestUnreadMessageId,
  required ChannelCollapseContext context,
  String? groupSplitBoundaryId,
}) {
  if (messages.isEmpty) {
    return const <ChannelStreamItem>[];
  }
  final List<MessageCollapseAssignment> assignments =
      buildMessageCollapseAssignments(messages: messages, context: context);
  final List<ChannelStreamItem> stream = <ChannelStreamItem>[];
  DateTime? lastDateDividerTimestamp;
  String? activeCollapsedGroupKey;
  ChannelStreamItem? activeCollapsedItem;
  bool unreadBoundaryPending = oldestUnreadMessageId != null;

  for (var i = 0; i < messages.length; i++) {
    final Message message = messages[i];
    final MessageCollapseAssignment assignment = assignments[i];
    if (lastDateDividerTimestamp == null ||
        !_isSameDay(lastDateDividerTimestamp, message.timestamp)) {
      activeCollapsedGroupKey = null;
      activeCollapsedItem = null;
      stream.add(
        ChannelStreamItem(
          type: ChannelStreamType.divider,
          dividerDate: message.timestamp,
        ),
      );
      lastDateDividerTimestamp = message.timestamp;
    }

    final ChannelStreamType? collapsedType = assignment.collapsedType;
    final String? groupKey = assignment.groupKey;

    ChannelStreamItem targetItem;
    if (collapsedType != null && groupKey != null) {
      final bool sameGroup =
          activeCollapsedItem != null && activeCollapsedGroupKey == groupKey;
      // A collapsed group must never absorb content ACROSS the split
      // boundary (the viewport anchor): the anchor's containing item sits
      // leading-of-center, so growth inside it would shift everything above.
      // Content newer than the boundary starts a NEW stream item, which
      // lands trailing-of-center and is structurally scroll-stable.
      final bool splitAtBoundary =
          sameGroup &&
          groupSplitBoundaryId != null &&
          activeCollapsedItem.messages.last.id == groupSplitBoundaryId;
      if (sameGroup && !splitAtBoundary) {
        activeCollapsedItem = ChannelStreamItem(
          type: activeCollapsedItem.type,
          messages: <Message>[...activeCollapsedItem.messages, message],
          groupKey: activeCollapsedItem.groupKey,
          showUnreadDividerBefore: activeCollapsedItem.showUnreadDividerBefore,
        );
        stream[stream.length - 1] = activeCollapsedItem;
        targetItem = activeCollapsedItem;
      } else {
        activeCollapsedGroupKey = groupKey;
        activeCollapsedItem = ChannelStreamItem(
          type: collapsedType,
          messages: <Message>[message],
          // The post-boundary item needs its own identity or two stream
          // items would collide on 'group-<key>'.
          groupKey: splitAtBoundary ? message.id : groupKey,
        );
        stream.add(activeCollapsedItem);
        targetItem = activeCollapsedItem;
      }
    } else {
      activeCollapsedGroupKey = null;
      activeCollapsedItem = null;
      targetItem = ChannelStreamItem(
        type: ChannelStreamType.message,
        messages: <Message>[message],
      );
      stream.add(targetItem);
    }

    if (unreadBoundaryPending && oldestUnreadMessageId == message.id) {
      final ChannelStreamItem? previousItem = stream.length > 1
          ? stream[stream.length - 2]
          : null;
      if (previousItem?.type == ChannelStreamType.divider &&
          previousItem?.dividerDate != null) {
        stream[stream.length - 2] = ChannelStreamItem(
          type: ChannelStreamType.divider,
          dividerDate: previousItem!.dividerDate,
          dividerHasUnread: true,
        );
      } else {
        final int targetIndex = stream.length - 1;
        stream[targetIndex] = ChannelStreamItem(
          type: targetItem.type,
          messages: targetItem.messages,
          groupKey: targetItem.groupKey,
          showUnreadDividerBefore: true,
        );
        if (collapsedType != null) {
          activeCollapsedItem = stream[targetIndex];
        }
      }
      unreadBoundaryPending = false;
    }
  }

  return stream;
}

int? findChannelStreamDataIndex(
  List<ChannelStreamItem> stream,
  String messageId,
) {
  final int index = stream.indexWhere(
    (ChannelStreamItem item) => item.containsMessageId(messageId),
  );
  return index == -1 ? null : index;
}

int? findChannelStreamRenderIndex(
  List<ChannelStreamItem> stream,
  String messageId,
) {
  final int? dataIndex = findChannelStreamDataIndex(stream, messageId);
  if (dataIndex == null) {
    return null;
  }
  return stream.length - 1 - dataIndex;
}

int findChannelStreamSplitIndex(
  List<ChannelStreamItem> stream,
  String anchorMessageId,
) {
  final int? dataIndex = findChannelStreamDataIndex(stream, anchorMessageId);
  if (dataIndex == null) {
    return stream.length;
  }
  return dataIndex;
}

ChannelStreamItem? previousRenderableStreamItem(
  List<ChannelStreamItem> stream,
  int index,
) {
  if (index <= 0 || index >= stream.length) {
    return null;
  }
  for (var i = index - 1; i >= 0; i--) {
    final ChannelStreamItem item = stream[i];
    if (item.type == ChannelStreamType.divider || item.messages.isEmpty) {
      continue;
    }
    return item;
  }
  return null;
}

bool followsCollapsedGroup(List<ChannelStreamItem> stream, int index) =>
    previousRenderableStreamItem(stream, index)?.type.isCollapsedGroup ?? false;

double leadingGroupSpacingBeforeStreamItem(
  List<ChannelStreamItem> stream,
  int index, {
  required double spacing,
}) {
  if (spacing <= 0 || previousRenderableStreamItem(stream, index) == null) {
    return 0;
  }
  return spacing;
}

Message? resolvePreviousMessageForStreamItem(
  List<ChannelStreamItem> stream,
  int index,
) {
  final ChannelStreamItem? previousItem = previousRenderableStreamItem(
    stream,
    index,
  );
  if (previousItem == null) {
    return null;
  }
  if (stream[index].type == ChannelStreamType.message &&
      previousItem.type.isCollapsedGroup) {
    return null;
  }
  return previousItem.messages.last;
}

bool isMessageInRevealedCollapsedGroup({
  required List<Message> messages,
  required String messageId,
  required String? revealedCollapsedGroupKey,
  required ChannelCollapseContext context,
}) {
  final String? groupKey = getCollapsedMessageGroupKey(
    messages: messages,
    messageId: messageId,
    context: context,
  );
  if (groupKey == null) {
    return true;
  }
  return revealedCollapsedGroupKey == groupKey;
}

bool _isSameDay(DateTime a, DateTime b) {
  final DateTime localA = a.toLocal();
  final DateTime localB = b.toLocal();
  return localA.year == localB.year &&
      localA.month == localB.month &&
      localA.day == localB.day;
}
