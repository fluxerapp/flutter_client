import 'package:fluxer_voice/fluxer_voice.dart';

Future<bool> isAndroidScreenShareBackgroundRunning() {
  return FluxerVoiceScreenShareService.instance.isRunning();
}

Future<bool> enableAndroidScreenShareBackground({
  required String notificationText,
}) {
  return FluxerVoiceScreenShareService.instance.start(
    title: 'Fluxer',
    text: notificationText,
  );
}

Future<void> disableAndroidScreenShareBackground() {
  return FluxerVoiceScreenShareService.instance.stop();
}
