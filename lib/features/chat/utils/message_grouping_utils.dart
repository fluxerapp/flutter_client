import 'package:fluxer_app/features/chat/domain/message.dart';

const Duration messageGroupTimeout = Duration(minutes: 7);

bool authorsShareGroupIdentity(Message current, Message previous) {
  final bool currentHasWebhook =
      current.webhookId != null && current.webhookId!.isNotEmpty;
  final bool previousHasWebhook =
      previous.webhookId != null && previous.webhookId!.isNotEmpty;
  if (currentHasWebhook || previousHasWebhook) {
    if (current.authorName != previous.authorName ||
        current.authorAvatar != previous.authorAvatar) {
      return false;
    }
  }
  if (current.authorIsBot || previous.authorIsBot) {
    if (current.authorName != previous.authorName ||
        current.authorAvatar != previous.authorAvatar) {
      return false;
    }
  }
  return true;
}

bool shouldGroupMessages(Message current, Message? previous) {
  if (previous == null) {
    return false;
  }
  if (current.isSystemMessage || previous.isSystemMessage) {
    return false;
  }
  if (current.authorId != previous.authorId) {
    return false;
  }
  if (!authorsShareGroupIdentity(current, previous)) {
    return false;
  }
  if (current.isReply || current.isForwarded) {
    return false;
  }
  if (previous.isReply || previous.isForwarded) {
    return false;
  }
  final bool currentSilent =
      (current.flags & messageFlagSuppressNotifications) != 0;
  final bool previousSilent =
      (previous.flags & messageFlagSuppressNotifications) != 0;
  if (currentSilent && !previousSilent) {
    return false;
  }
  final Duration diff = current.timestamp.difference(previous.timestamp);
  return diff < messageGroupTimeout;
}

/// Between-group spacer height (web parity); half between system messages.
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
