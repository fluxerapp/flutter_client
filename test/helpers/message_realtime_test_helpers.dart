import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_dart/gateway.dart';

MessageCreated testMessageCreated(
  MessageCreateEvent event, {
  MessagePersistSnapshot? snapshot,
}) {
  return MessageCreated(
    event: event,
    snapshot:
        snapshot ??
        const MessagePersistSnapshot(
          mentionsCurrentUser: false,
          isDm: false,
          guildStorageId: null,
          acknowledgedByGateway: false,
        ),
  );
}
