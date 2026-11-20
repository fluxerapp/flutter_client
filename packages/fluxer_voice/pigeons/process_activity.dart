// ignore_for_file: document_ignores

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartPackageName: 'fluxer_voice',
    dartOut: 'lib/src/process_activity.g.dart',
    swiftOut: 'macos/fluxer_voice/Sources/fluxer_voice/ProcessActivity.g.swift',
    swiftOptions: SwiftOptions(
      errorClassName: 'FluxerVoiceProcessActivityError',
    ),
  ),
)
@HostApi()
abstract class VoiceProcessActivityHostApi {
  void begin();

  void end();
}
