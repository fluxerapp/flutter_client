import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/providers/voice_media_devices_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

String voiceMediaDeviceLabel(
  FluxerLocalizations l10n,
  VoiceMediaDeviceOption device,
) {
  if (device.deviceId == kDefaultVoiceDeviceId) {
    return l10n.audioAndVideoDefaultDeviceLabel;
  }
  if (device.label.isNotEmpty) {
    return device.label;
  }
  return device.deviceId;
}
