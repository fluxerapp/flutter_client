import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';

bool _isEmptyComposerActionSlot({
  required bool showMessageSendButtonPreference,
  required bool hasSendable,
  required bool isEditing,
  required bool isTouchPrimary,
}) {
  final bool hideForSendPreference =
      showMessageSendButtonPreference && !isTouchPrimary;
  return !hideForSendPreference && !isEditing && !hasSendable;
}

bool shouldShowComposerVoiceButton({
  required ChannelMessagePermissions permissions,
  required bool hasSendable,
  required bool isEditing,
  required bool showMessageSendButtonPreference,
  bool isTouchPrimary = false,
}) {
  return permissions.isComposerEnabled &&
      _isEmptyComposerActionSlot(
        showMessageSendButtonPreference: showMessageSendButtonPreference,
        hasSendable: hasSendable,
        isEditing: isEditing,
        isTouchPrimary: isTouchPrimary,
      ) &&
      permissions.canAttachFiles;
}

bool shouldShowComposerSendButton({
  required ChannelMessagePermissions permissions,
  required bool hasSendable,
  required bool isEditing,
  required bool showMessageSendButtonPreference,
  bool isTouchPrimary = false,
}) {
  if (!permissions.isComposerEnabled) {
    return false;
  }
  if (hasSendable || (!isTouchPrimary && showMessageSendButtonPreference)) {
    return true;
  }
  return _isEmptyComposerActionSlot(
        showMessageSendButtonPreference: showMessageSendButtonPreference,
        hasSendable: hasSendable,
        isEditing: isEditing,
        isTouchPrimary: isTouchPrimary,
      ) &&
      !permissions.canAttachFiles;
}
