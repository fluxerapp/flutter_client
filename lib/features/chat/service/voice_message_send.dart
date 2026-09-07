import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/service/voice_message_recording_service.dart';
import 'package:fluxer_app/features/chat/utils/voice_message_wav_encoder.dart';
import 'package:fluxer_app/features/chat/utils/voice_message_waveform.dart';

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

Future<VoiceMessagePreparedRecording?> prepareRecordingFromPath(
  String path,
) async {
  final File file = File(path);
  if (!file.existsSync()) {
    return null;
  }
  final Uint8List bytes = await file.readAsBytes();
  final VoiceMessagePcmSlice? pcm = decodeWavMonoPcm(bytes);
  if (pcm == null) {
    return null;
  }
  final VoiceWaveformResult waveform = computeVoiceWaveformFromPcm(pcm);
  return VoiceMessagePreparedRecording(
    filePath: path,
    duration: waveform.duration,
    waveform: waveform.waveform,
    pcm: pcm,
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
