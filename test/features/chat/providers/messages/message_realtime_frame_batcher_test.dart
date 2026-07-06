import 'package:flutter/scheduler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_frame_batcher.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';

import '../../../../helpers/message_realtime_test_helpers.dart';

MessageCreateEvent _createEvent(String id) {
  return MessageCreateEvent(
    message: MessageResponseSchema.fromJson(<String, dynamic>{
      'id': id,
      'channel_id': 'c1',
      'author': <String, dynamic>{
        'id': 'u1',
        'username': 'user',
        'discriminator': '0001',
        'flags': 0,
      },
      'content': 'hello',
      'timestamp': '2020-01-01T00:00:00.000Z',
      'type': 0,
      'flags': 0,
      'pinned': false,
      'mention_everyone': false,
      'tts': false,
      'mentions': <dynamic>[],
      'mention_roles': <dynamic>[],
    }),
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('batches multiple MessageCreated events into one flush per frame', () {
    final List<List<MessageRealtimeEvent>> flushes =
        <List<MessageRealtimeEvent>>[];
    final MessageRealtimeFrameBatcher batcher = MessageRealtimeFrameBatcher(
      onFlush: flushes.add,
    );
    const MessagePersistSnapshot snapshot = MessagePersistSnapshot(
      mentionsCurrentUser: false,
      isDm: false,
      guildStorageId: null,
      acknowledgedByGateway: false,
    );
    batcher.onEvent(testMessageCreated(_createEvent('1'), snapshot: snapshot));
    batcher.onEvent(testMessageCreated(_createEvent('2'), snapshot: snapshot));
    expect(flushes, isEmpty);
    SchedulerBinding.instance.handleBeginFrame(Duration.zero);
    SchedulerBinding.instance.handleDrawFrame();
    expect(flushes.length, 1);
    expect(flushes.first.length, 2);
    batcher.dispose();
  });

  test('non-create events flush immediately', () {
    final List<List<MessageRealtimeEvent>> flushes =
        <List<MessageRealtimeEvent>>[];
    final MessageRealtimeFrameBatcher batcher = MessageRealtimeFrameBatcher(
      onFlush: flushes.add,
    );
    const MessagePersistSnapshot snapshot = MessagePersistSnapshot(
      mentionsCurrentUser: false,
      isDm: false,
      guildStorageId: null,
      acknowledgedByGateway: false,
    );
    batcher.onEvent(testMessageCreated(_createEvent('1'), snapshot: snapshot));
    batcher.onEvent(
      const MessageDeleted(MessageDeleteEvent(channelId: 'c1', messageId: '1')),
    );
    expect(flushes.length, 2);
    expect(flushes.first.length, 1);
    expect(flushes.last.single, isA<MessageDeleted>());
    batcher.dispose();
  });
}
