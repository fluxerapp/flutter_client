import 'package:fluxer_app/features/chat/domain/message.dart';

/// Hard cap on the number of messages kept loaded in memory for a channel.
///
/// Mirrors the web client's `MAX_LOADED_MESSAGES`. Slivers already virtualize
/// rendering, so this bounds per-build cost and memory, not what is painted.
const int kMaxLoadedMessages = 200;

/// Result of trimming a message window down to [kMaxLoadedMessages].
class MessageWindowTrim {
  const MessageWindowTrim({
    required this.messages,
    required this.droppedOlder,
    required this.droppedNewer,
  });

  final List<Message> messages;
  final bool droppedOlder;
  final bool droppedNewer;
}

/// Trims [messages] to at most [max], keeping the newest entries when
/// [keepNewest] is true and the oldest otherwise. The returned flags report
/// which end was dropped so callers can re-enable pagination for that side.
MessageWindowTrim trimMessageWindow(
  List<Message> messages, {
  required bool keepNewest,
  int max = kMaxLoadedMessages,
}) {
  if (messages.length <= max) {
    return MessageWindowTrim(
      messages: messages,
      droppedOlder: false,
      droppedNewer: false,
    );
  }
  if (keepNewest) {
    return MessageWindowTrim(
      messages: messages.sublist(messages.length - max),
      droppedOlder: true,
      droppedNewer: false,
    );
  }
  return MessageWindowTrim(
    messages: messages.sublist(0, max),
    droppedOlder: false,
    droppedNewer: true,
  );
}
