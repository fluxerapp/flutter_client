import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/gateway/gateway_event_dispatcher.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';

Map<String, Object?> _messageJson({
  required String id,
  required String channelId,
  required String authorId,
}) => <String, Object?>{
  'id': id,
  'channel_id': channelId,
  'author': <String, Object?>{
    'id': authorId,
    'username': 'user-$authorId',
    'discriminator': '0001',
    'global_name': null,
    'avatar': null,
    'avatar_color': null,
    'flags': 0,
  },
  'type': 0,
  'flags': 0,
  'tts': false,
  'content': 'hello',
  'timestamp': dateTimeFromUserSnowflakeOrNull(id)!.toIso8601String(),
  'pinned': false,
  'mention_everyone': false,
  'mentions': <Object?>[],
  'mention_roles': <Object?>[],
};

void main() {
  test('processes events serially in dispatch order', () async {
    final List<String> handled = <String>[];
    final Completer<void> block = Completer<void>();
    final GatewayEventDispatcher dispatcher =
        GatewayEventDispatcher(
            onEvent: (GatewayEvent event) async {
              if (event is MessageCreateEvent) {
                if (event.message.id == '900000000000000002') {
                  await block.future;
                }
                handled.add(event.message.id);
              }
            },
          )
          ..dispatch(
            MessageCreateEvent(
              message: MessageResponseSchema.fromJson(
                _messageJson(
                  id: '900000000000000001',
                  channelId: 'c1',
                  authorId: 'u1',
                ),
              ),
            ),
          )
          ..dispatch(
            MessageCreateEvent(
              message: MessageResponseSchema.fromJson(
                _messageJson(
                  id: '900000000000000002',
                  channelId: 'c1',
                  authorId: 'u1',
                ),
              ),
            ),
          )
          ..dispatch(
            MessageCreateEvent(
              message: MessageResponseSchema.fromJson(
                _messageJson(
                  id: '900000000000000003',
                  channelId: 'c1',
                  authorId: 'u1',
                ),
              ),
            ),
          );
    await Future<void>.delayed(Duration.zero);
    expect(handled, <String>['900000000000000001']);
    block.complete();
    await Future<void>.delayed(Duration.zero);
    expect(handled.length, 3);
    await dispatcher.dispose();
  });

  test('typing start bypasses the serial queue', () async {
    final List<String> typingHandled = <String>[];
    final Completer<void> block = Completer<void>();
    final GatewayEventDispatcher dispatcher =
        GatewayEventDispatcher(
            onEvent: (GatewayEvent event) async {
              if (event is MessageCreateEvent) {
                await block.future;
              }
              if (event is TypingStartEvent) {
                typingHandled.add(event.userId);
              }
            },
          )
          ..dispatch(
            MessageCreateEvent(
              message: MessageResponseSchema.fromJson(
                _messageJson(
                  id: '900000000000000001',
                  channelId: 'c1',
                  authorId: 'u1',
                ),
              ),
            ),
          )
          ..dispatch(
            TypingStartEvent(
              channelId: 'c1',
              userId: 'u1',
              timestamp: DateTime.now(),
            ),
          );
    await Future<void>.delayed(Duration.zero);
    expect(typingHandled, <String>['u1']);
    block.complete();
    await dispatcher.dispose();
  });
}
