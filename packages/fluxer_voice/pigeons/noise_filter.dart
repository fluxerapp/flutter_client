// ignore_for_file: document_ignores

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartPackageName: 'fluxer_voice',
    dartOut: 'lib/src/noise_filter.g.dart',
    kotlinOut: 'android/src/main/kotlin/com/fluxer/voice/NoiseFilter.g.kt',
    kotlinOptions: KotlinOptions(
      package: 'com.fluxer.voice',
      errorClassName: 'FluxerVoiceNoiseFilterError',
    ),
    swiftOut: 'ios/fluxer_voice/Sources/fluxer_voice/NoiseFilter.g.swift',
    swiftOptions: SwiftOptions(errorClassName: 'FluxerVoiceNoiseFilterError'),
    cppHeaderOut: 'windows/noise_filter.g.h',
    cppSourceOut: 'windows/noise_filter.g.cpp',
    cppOptions: CppOptions(namespace: 'fluxer_voice'),
    gobjectHeaderOut: 'linux/noise_filter.g.h',
    gobjectSourceOut: 'linux/noise_filter.g.cc',
    gobjectOptions: GObjectOptions(module: 'FluxerVoice'),
  ),
)
enum NativeNoiseFilterBackend { none, gate, rnnoise }

class NativeNoiseFilterStatus {
  NativeNoiseFilterStatus({
    required this.attached,
    required this.backend,
    required this.sampleRate,
    required this.frames,
    required this.bypassedFrames,
    required this.recoveredFrames,
    required this.averageMicros,
    required this.maxMicros,
  });

  bool attached;
  NativeNoiseFilterBackend backend;
  int sampleRate;
  int frames;
  int bypassedFrames;
  int recoveredFrames;
  double averageMicros;
  double maxMicros;
}

@HostApi()
abstract class VoiceNoiseFilterHostApi {
  bool attach();

  bool setBackend(NativeNoiseFilterBackend backend);

  NativeNoiseFilterStatus status();
}
