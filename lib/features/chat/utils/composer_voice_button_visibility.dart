import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';

bool _isEmptyComposerActionSlot({
  required bool showMessageSendButtonPreference,
  required bool hasSendable,
  required bool isEditing,
}) {
  return !showMessageSendButtonPreference && !isEditing && !hasSendable;
}

bool shouldShowComposerVoiceButton({
  required ChannelMessagePermissions permissions,
  required bool hasSendable,
  required bool isEditing,
  required bool showMessageSendButtonPreference,
}) {
  return _isEmptyComposerActionSlot(
        showMessageSendButtonPreference: showMessageSendButtonPreference,
        hasSendable: hasSendable,
        isEditing: isEditing,
      ) &&
      permissions.canAttachFiles;
}

bool shouldShowComposerSendButtonFallback({
  required ChannelMessagePermissions permissions,
  required bool hasSendable,
  required bool isEditing,
  required bool showMessageSendButtonPreference,
}) {
  return _isEmptyComposerActionSlot(
        showMessageSendButtonPreference: showMessageSendButtonPreference,
        hasSendable: hasSendable,
        isEditing: isEditing,
      ) &&
      !permissions.canAttachFiles;
}
