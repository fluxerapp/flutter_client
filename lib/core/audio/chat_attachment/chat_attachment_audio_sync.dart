import 'dart:async';

import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_binding.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_media_item.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';

void syncChatAttachmentAudioSession({
  required ChatAttachmentAudioBinding binding,
  required Attachment attachment,
  required String title,
  required bool playing,
  required Duration position,
  required Duration totalDuration,
  required double playbackRate,
  bool loading = false,
  bool completed = false,
}) {
  if (!binding.isAvailable) {
    return;
  }
  final Duration bufferedPosition = totalDuration > Duration.zero
      ? totalDuration
      : position;
  if (!binding.isActive && !playing && !loading) {
    return;
  }
  if (!binding.isActive && (playing || loading)) {
    unawaited(
      binding.claim(
        mediaItem: buildChatAttachmentAudioMediaItem(
          attachment: attachment,
          title: title,
          duration: totalDuration > Duration.zero ? totalDuration : null,
        ),
        playing: playing,
        position: position,
        bufferedPosition: bufferedPosition,
        speed: playbackRate,
        loading: loading,
      ),
    );
    return;
  }
  if (binding.isActive) {
    if (completed) {
      binding.release();
      return;
    }
    binding.update(
      mediaItem: buildChatAttachmentAudioMediaItem(
        attachment: attachment,
        title: title,
        duration: totalDuration > Duration.zero ? totalDuration : null,
      ),
      playing: playing,
      position: position,
      bufferedPosition: bufferedPosition,
      speed: playbackRate,
      loading: loading,
    );
  }
}

void syncChatAttachmentAudioSessionPosition({
  required ChatAttachmentAudioBinding binding,
  required bool playing,
  required Duration position,
  required Duration totalDuration,
  required double playbackRate,
}) {
  if (!binding.isAvailable || !binding.isActive) {
    return;
  }
  final Duration bufferedPosition = totalDuration > Duration.zero
      ? totalDuration
      : position;
  binding.updatePosition(
    playing: playing,
    position: position,
    bufferedPosition: bufferedPosition,
    speed: playbackRate,
  );
}
