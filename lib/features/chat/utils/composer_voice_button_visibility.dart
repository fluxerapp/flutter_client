import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';

bool shouldShowComposerVoiceButton({
  required ChannelMessagePermissions permissions,
  required bool hasSendable,
  required bool isEditing,
}) {
  return permissions.canAttachFiles && !isEditing && !hasSendable;
}
