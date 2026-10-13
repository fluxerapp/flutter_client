import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';

const Map<int, bool> kMessageTypeDeletable = <int, bool>{
  messageTypeDefault: true,
  messageTypeRecipientAdd: false,
  messageTypeRecipientRemove: false,
  messageTypeCall: false,
  messageTypeChannelNameChange: false,
  messageTypeChannelIconChange: false,
  messageTypeChannelPinnedMessage: true,
  messageTypeUserJoin: true,
  messageTypeChannelFollowAdd: true,
  messageTypeReply: true,
  messageTypeClientSystem: false,
};

bool isMessageTypeDeletable(int type) {
  return kMessageTypeDeletable[type] ?? false;
}

bool canDeleteMessage({
  required Message message,
  required String? currentUserId,
  required bool isDmChannel,
  int? channelPermissionBits,
}) {
  if (message.hasFailed) {
    return true;
  }
  if (!isMessageTypeDeletable(message.type)) {
    return false;
  }
  if (currentUserId == null) {
    return false;
  }
  if (message.authorId == currentUserId) {
    return true;
  }
  if (isDmChannel) {
    return false;
  }
  if (channelPermissionBits == null) {
    return false;
  }
  return hasPermission(channelPermissionBits, Permission.manageMessages);
}

bool canManageMessagesInChannel({
  required bool isDmChannel,
  int? channelPermissionBits,
}) {
  if (isDmChannel) {
    return false;
  }
  if (channelPermissionBits == null) {
    return false;
  }
  return hasPermission(channelPermissionBits, Permission.manageMessages);
}

bool canPinMessageInChannel({
  required bool isDmChannel,
  int? channelPermissionBits,
  bool interactionsBlocked = false,
}) {
  if (interactionsBlocked) {
    return false;
  }
  if (isDmChannel) {
    return true;
  }
  if (channelPermissionBits == null) {
    return false;
  }
  return hasPermission(channelPermissionBits, Permission.pinMessages) ||
      hasPermission(channelPermissionBits, Permission.manageMessages);
}

bool canAddReactionsInChannel({
  required bool isDmChannel,
  int? channelPermissionBits,
  bool interactionsBlocked = false,
  bool isAuthorBlocked = false,
}) {
  if (interactionsBlocked || isAuthorBlocked) {
    return false;
  }
  if (isDmChannel) {
    return true;
  }
  if (channelPermissionBits == null) {
    return false;
  }
  return hasPermission(channelPermissionBits, Permission.addReactions);
}

bool canSuppressEmbedsOnMessage({
  required Message message,
  required bool isOwnMessage,
  required bool isDmChannel,
  required bool canDelete,
}) {
  if (!message.isUserMessage) {
    return false;
  }
  if (message.embeds.isEmpty && !message.suppressEmbeds) {
    return false;
  }
  if (isOwnMessage) {
    return true;
  }
  return !isDmChannel && canDelete;
}

bool canDeleteAttachmentOnMessage({
  required Message message,
  required bool isOwnMessage,
  bool isSendDisabled = false,
}) {
  if (message.hasForwardSnapshots) {
    return false;
  }
  if (!isOwnMessage) {
    return false;
  }
  if (!isMessageTypeDeletable(message.type)) {
    return false;
  }
  return !isSendDisabled;
}

bool canEditAttachmentAltText({
  required Message message,
  required bool isOwnMessage,
  required Attachment attachment,
  required bool canManageMessages,
  required bool isDmChannel,
}) {
  if (message.hasForwardSnapshots) {
    return false;
  }
  if (!attachment.isPreviewMedia) {
    return false;
  }
  if (isOwnMessage) {
    return true;
  }
  if (isDmChannel) {
    return false;
  }
  return canManageMessages;
}

bool canPublishMessage({
  required Message message,
  required ChannelType? channelType,
  required bool isOwnMessage,
  required bool canSendMessages,
  required bool canManageMessages,
  required bool isDmChannel,
  required bool isSendDisabled,
}) {
  if (isDmChannel || isSendDisabled) {
    return false;
  }
  if (channelType != ChannelType.guildAnnouncement) {
    return false;
  }
  if (message.type != messageTypeDefault || message.isReply) {
    return false;
  }
  if (message.deliveryState != MessageDeliveryState.sent) {
    return false;
  }
  if (message.hasForwardSnapshots ||
      message.isForwarded ||
      message.isCrosspostCopy) {
    return false;
  }
  if (!canSendMessages) {
    return false;
  }
  return isOwnMessage || canManageMessages;
}
