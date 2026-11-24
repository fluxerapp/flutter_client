import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/voice/providers/voice_track_handoff_provider.dart';

Future<void> drainVoiceMediaHandoffs(Ref ref) async {
  try {
    final renderers = ref.read(voiceTrackRendererCacheProvider);
    final screenShareAudio = ref.read(voiceScreenShareAudioSessionProvider);
    renderers.markSessionEnded();
    screenShareAudio.markSessionEnded();
    await Future.wait<void>(<Future<void>>[
      renderers.drain(),
      screenShareAudio.drain(),
    ]);
  } on Object catch (error, stackTrace) {
    talker.warning(
      '[Voice] failed to drain media handoffs: $error',
      error,
      stackTrace,
    );
  }
}

const Duration kVoiceMediaWidgetReleaseTimeout = Duration(milliseconds: 250);

Future<void> waitForVoiceMediaWidgetsToRelease({
  Duration timeout = kVoiceMediaWidgetReleaseTimeout,
}) async {
  final SchedulerBinding binding = SchedulerBinding.instance;
  if (binding.framesEnabled) {
    await binding.endOfFrame.timeout(timeout, onTimeout: () {});
  }
  await Future<void>.delayed(Duration.zero);
}
