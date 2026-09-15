import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/attachments/voice_message_constants.dart';

bool isVoiceMessageAttachment({
  required int messageFlags,
  required Attachment attachment,
}) {
  return (messageFlags & kMessageFlagVoiceMessage) != 0 &&
      attachment.isAudio &&
      (attachment.waveform?.isNotEmpty ?? false);
}
