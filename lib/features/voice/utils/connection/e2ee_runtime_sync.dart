import 'package:fluxer_app/features/voice/utils/e2ee/e2ee_status.dart';

bool? desiredRuntimeE2eeEnabled({
  required ChannelE2eeStatus status,
  required bool hasE2eeKey,
  required bool guildHasVoiceE2ee,
}) {
  switch (status) {
    case ChannelE2eeStatus.encrypted:
      return hasE2eeKey ? true : null;
    case ChannelE2eeStatus.broken:
      if (hasE2eeKey && guildHasVoiceE2ee) {
        return null;
      }
      return false;
    case ChannelE2eeStatus.none:
      return null;
  }
}
