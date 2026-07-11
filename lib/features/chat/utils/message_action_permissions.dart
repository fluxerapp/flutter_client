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

/// Whether the current user can manage other users' messages in this
/// channel (delete-all-reactions, force-suppress, etc.).
///
/// DMs never grant moderator powers. Guild channels gate on
/// `MANAGE_MESSAGES`. Mirrors the web app's
/// `Permission.can(MANAGE_MESSAGES, {channelId})` check.
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

/// Whether the current user can pin or unpin a message in this channel.
///
/// DMs allow either participant to pin (web parity). Guild channels gate
/// on `PIN_MESSAGES` or `MANAGE_MESSAGES`.
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

/// Whether the current user can add a new reaction in this channel.
///
/// DMs always allow reactions. Guild channels gate on `ADD_REACTIONS`.
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

/// Whether the suppress/unsuppress-embeds action should be offered on
/// [message].
///
/// Mirrors the web app's gate: author can always toggle their own
/// message; moderators with `MANAGE_MESSAGES` (channels only, never
/// DMs) can toggle on others' messages. Hidden entirely when the
/// message has no embeds and they aren't currently suppressed — there
/// is nothing to toggle.
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
