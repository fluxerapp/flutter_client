import 'package:fluxer_app/core/permissions/permission.dart';
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

/// Whether the current user can manage messages in this channel.
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

/// Whether the current user can pin messages in this channel.
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

/// Whether the current user can add reactions in this channel.
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

/// Whether the current user can toggle embed suppression on [message].
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

/// Whether the current user can delete an attachment from [message].
bool canDeleteAttachmentOnMessage({
  required Message message,
  required bool isOwnMessage,
  bool isSendDisabled = false,
}) {
  if (!isOwnMessage) {
    return false;
  }
  if (!isMessageTypeDeletable(message.type)) {
    return false;
  }
  return !isSendDisabled;
}

/// Whether the current user can edit the alt text of [attachment].
bool canEditAttachmentAltText({
  required Message message,
  required bool isOwnMessage,
  required Attachment attachment,
  required bool canManageMessages,
  required bool isDmChannel,
}) {
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
