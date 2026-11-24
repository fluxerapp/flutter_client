// ignore_for_file: document_ignores

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartPackageName: 'fluxer_voice',
    dartOut: 'lib/src/screen_share_service.g.dart',
    kotlinOut:
        'android/src/main/kotlin/com/fluxer/voice/ScreenShareService.g.kt',
    kotlinOptions: KotlinOptions(
      package: 'com.fluxer.voice',
      errorClassName: 'FluxerVoiceScreenShareServiceError',
    ),
  ),
)
class NativeScreenShareNotification {
  NativeScreenShareNotification({required this.title, required this.text});

  String title;
  String text;
}

@HostApi()
abstract class VoiceScreenShareServiceHostApi {
  @async
  bool start(NativeScreenShareNotification notification);

  void stop();

  bool isRunning();
}
