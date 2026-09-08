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
  return _isEmptyComposerActionSlot(
        showMessageSendButtonPreference: showMessageSendButtonPreference,
        hasSendable: hasSendable,
        isEditing: isEditing,
        isTouchPrimary: isTouchPrimary,
      ) &&
      permissions.canAttachFiles;
}

bool shouldShowComposerSendButtonFallback({
  required ChannelMessagePermissions permissions,
  required bool hasSendable,
  required bool isEditing,
  required bool showMessageSendButtonPreference,
  bool isTouchPrimary = false,
}) {
  return _isEmptyComposerActionSlot(
        showMessageSendButtonPreference: showMessageSendButtonPreference,
        hasSendable: hasSendable,
        isEditing: isEditing,
        isTouchPrimary: isTouchPrimary,
      ) &&
      !permissions.canAttachFiles;
}
