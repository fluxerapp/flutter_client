import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/services/voice_message_recording_service.dart';

Future<void> sendPreparedVoiceMessage({
  required WidgetRef ref,
  required VoiceMessagePreparedRecording prepared,
}) async {
  await ref
      .read(chatViewModelProvider.notifier)
      .sendVoiceMessage(
        filePath: prepared.filePath,
        duration: prepared.duration,
        waveform: prepared.waveform,
      );
}

String formatVoiceDurationMs(int durationMs) {
  final int totalSeconds = (durationMs / 1000).floor();
  final int minutes = totalSeconds ~/ 60;
  final int seconds = totalSeconds % 60;
  return '${minutes.toString().padLeft(1, '0')}:'
      '${seconds.toString().padLeft(2, '0')}';
}

String formatVoiceDurationSeconds(double seconds) {
  final int total = seconds.floor();
  final int minutes = total ~/ 60;
  final int secs = total % 60;
  return '$minutes:${secs.toString().padLeft(2, '0')}';
}
