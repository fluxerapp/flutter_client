import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_binding.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_sync.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';

class ChatAttachmentAudioPosition {
  final ValueNotifier<Duration> notifier = ValueNotifier<Duration>(
    Duration.zero,
  );

  Duration get value => notifier.value;

  void update(Duration position) {
    notifier.value = position;
  }

  void dispose() {
    notifier.dispose();
  }
}

class ChatAttachmentAudioSessionReporter {
  ChatAttachmentAudioSessionReporter({
    required this.binding,
    required this.attachment,
    required this.title,
    required this.totalDuration,
    required this.playbackRate,
    required this.position,
  });

  final ChatAttachmentAudioBinding binding;
  final Attachment attachment;
  final String Function() title;
  final Duration Function() totalDuration;
  final double Function() playbackRate;
  final ChatAttachmentAudioPosition position;

  static const Duration _positionSyncInterval = Duration(seconds: 1);

  DateTime? _lastPositionSync;

  void sync({
    required bool playing,
    bool loading = false,
    bool completed = false,
  }) {
    _lastPositionSync = DateTime.now();
    syncChatAttachmentAudioSession(
      binding: binding,
      attachment: attachment,
      title: title(),
      playing: playing,
      position: position.value,
      totalDuration: totalDuration(),
      playbackRate: playbackRate(),
      loading: loading,
      completed: completed,
    );
  }

  void syncPositionIfDue({required bool playing}) {
    final DateTime now = DateTime.now();
    if (_lastPositionSync != null &&
        now.difference(_lastPositionSync!) < _positionSyncInterval) {
      return;
    }
    _lastPositionSync = now;
    syncChatAttachmentAudioSessionPosition(
      binding: binding,
      playing: playing,
      position: position.value,
      totalDuration: totalDuration(),
      playbackRate: playbackRate(),
    );
  }
}
