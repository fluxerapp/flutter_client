import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/voice/providers/voice_track_handoff_provider.dart';

Future<void> drainVoiceMediaHandoffs(Ref ref) async {
  final renderers = ref.read(voiceTrackRendererCacheProvider);
  final screenShareAudio = ref.read(voiceScreenShareAudioSessionProvider);
  renderers.markSessionEnded();
  screenShareAudio.markSessionEnded();
  await Future.wait<void>(<Future<void>>[
    renderers.drain(),
    screenShareAudio.drain(),
  ]);
}

Future<void> waitForVoiceMediaWidgetsToRelease() async {
  final SchedulerBinding binding = SchedulerBinding.instance;
  await binding.endOfFrame;
  await Future<void>.delayed(Duration.zero);
}
