import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';

class MessagePersistSnapshot {
  const MessagePersistSnapshot({
    required this.mentionsCurrentUser,
    required this.isDm,
    required this.guildStorageId,
    required this.acknowledgedByGateway,
    this.notificationLevel,
    this.isChannelMuted = false,
  });

  final bool mentionsCurrentUser;
  final bool isDm;
  final String? guildStorageId;
  final bool acknowledgedByGateway;
  final UserNotificationSettings? notificationLevel;
  final bool isChannelMuted;
}

class MessageCreateDispatch {
  const MessageCreateDispatch({required this.event, required this.snapshot});

  final MessageCreateEvent event;
  final MessagePersistSnapshot snapshot;
}

sealed class MessageRealtimeEvent {
  const MessageRealtimeEvent();
}

class MessageCreated extends MessageRealtimeEvent {
  const MessageCreated({required this.event, required this.snapshot});

  final MessageCreateEvent event;
  final MessagePersistSnapshot snapshot;
}

class MessageUpdated extends MessageRealtimeEvent {
  final MessageUpdateEvent event;

  const MessageUpdated(this.event);
}

class MessageDeleted extends MessageRealtimeEvent {
  final MessageDeleteEvent event;

  const MessageDeleted(this.event);
}

class MessagesDeletedBulk extends MessageRealtimeEvent {
  final MessageDeleteBulkEvent event;

  const MessagesDeletedBulk(this.event);
}

class MessageReactionsChanged extends MessageRealtimeEvent {
  final String channelId;
  final String messageId;

  const MessageReactionsChanged({
    required this.channelId,
    required this.messageId,
  });
}
