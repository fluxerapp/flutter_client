import 'package:flutter/scheduler.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';

typedef MessageRealtimeFrameFlushCallback =
    void Function(List<MessageRealtimeEvent> events);

class MessageRealtimeFrameBatcher {
  MessageRealtimeFrameBatcher({
    required MessageRealtimeFrameFlushCallback onFlush,
  }) : _onFlush = onFlush;

  final MessageRealtimeFrameFlushCallback _onFlush;
  final List<MessageRealtimeEvent> _buffer = <MessageRealtimeEvent>[];
  bool _frameScheduled = false;

  void onEvent(MessageRealtimeEvent event) {
    if (event is MessageCreated) {
      _buffer.add(event);
      _scheduleFrameFlush();
      return;
    }
    _flushNow();
    _onFlush(<MessageRealtimeEvent>[event]);
  }

  void dispose() {
    _buffer.clear();
    _frameScheduled = false;
  }

  void _scheduleFrameFlush() {
    if (_frameScheduled) {
      return;
    }
    _frameScheduled = true;
    SchedulerBinding.instance.scheduleFrameCallback((_) {
      _frameScheduled = false;
      if (_buffer.isEmpty) {
        return;
      }
      final List<MessageRealtimeEvent> batch = List<MessageRealtimeEvent>.from(
        _buffer,
      );
      _buffer.clear();
      _onFlush(batch);
    });
  }

  void _flushNow() {
    if (_buffer.isEmpty) {
      return;
    }
    final List<MessageRealtimeEvent> batch = List<MessageRealtimeEvent>.from(
      _buffer,
    );
    _buffer.clear();
    _onFlush(batch);
  }
}
