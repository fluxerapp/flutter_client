import 'package:fluxer_app/features/chat/domain/message.dart';

const Duration messageGroupTimeout = Duration(minutes: 7);

bool isDisplaySystemMessage(Message message) =>
    message.type != messageTypeDefault && message.type != messageTypeReply;

bool _isSuppressNotifications(Message message) =>
    (message.flags & messageFlagSuppressNotifications) != 0;

bool authorsShareGroupIdentity(Message current, Message previous) {
  if (current.authorIsBot || previous.authorIsBot) {
    if (current.authorName != previous.authorName ||
        current.authorAvatar != previous.authorAvatar) {
      return false;
    }
  }
  return true;
}

bool isNewMessageGroup(Message current, Message? previous) {
  if (previous == null) {
    return true;
  }
  if (current.type == messageTypeReply || current.isReply) {
    return true;
  }
  final bool currentIsDisplaySystem = isDisplaySystemMessage(current);
  final bool prevIsDisplaySystem = isDisplaySystemMessage(previous);
  if (currentIsDisplaySystem != prevIsDisplaySystem) {
    return true;
  }
  final bool isCurrentUserContent = current.isUserMessage;
  final bool isPrevUserContent = previous.isUserMessage;
  final bool bothDisplaySystem = currentIsDisplaySystem && prevIsDisplaySystem;
  if (!bothDisplaySystem &&
      current.type != previous.type &&
      !(isCurrentUserContent && isPrevUserContent)) {
    return true;
  }
  if (previous.type <= messageTypeReply &&
      previous.authorId != current.authorId) {
    return true;
  }
  if (!authorsShareGroupIdentity(current, previous)) {
    return true;
  }
  final String? webhookId = current.webhookId;
  if (webhookId != null &&
      webhookId.isNotEmpty &&
      previous.authorName != current.authorName) {
    return true;
  }
  if (current.timestamp.difference(previous.timestamp) > messageGroupTimeout) {
    return true;
  }
  final bool prevSuppressed = _isSuppressNotifications(previous);
  final bool currSuppressed = _isSuppressNotifications(current);
  if (currSuppressed != prevSuppressed) {
    if (!prevSuppressed && currSuppressed) {
      return true;
    }
    if (prevSuppressed && !currSuppressed && current.hasMentionsForGrouping) {
      return true;
    }
  }
  return false;
}

bool shouldGroupMessages(Message current, Message? previous) {
  if (previous == null) {
    return false;
  }
  if (current.isSystemMessage || previous.isSystemMessage) {
    return false;
  }
  return !isNewMessageGroup(current, previous);
}

bool computeMessageRowGrouped({
  required Message message,
  required Message? previousMessage,
  required bool isNewDay,
}) {
  if (isNewDay) {
    return false;
  }
  return shouldGroupMessages(message, previousMessage);
}

double leadingGroupSpacing({
  required bool isGroupStart,
  required bool isNewDay,
  required bool isUnreadBoundary,
  required bool hasPrevious,
  required bool bothSystem,
  required double spacing,
}) {
  if (!isGroupStart ||
      isNewDay ||
      isUnreadBoundary ||
      !hasPrevious ||
      spacing <= 0) {
    return 0;
  }
  return bothSystem ? spacing / 2 : spacing;
}
