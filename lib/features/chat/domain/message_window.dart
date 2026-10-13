import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/messages/message_page_sync.dart';

const int kMaxLoadedMessages = 200;

const int kTrimmedMessageWindowSize = 120;

const int kMaxLoadedMessagesHard = 400;

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

class MessageWindowSnapshot {
  const MessageWindowSnapshot({
    required this.messages,
    required this.hasMoreOlder,
    required this.hasMoreNewer,
  });

  final List<Message> messages;
  final bool hasMoreOlder;
  final bool hasMoreNewer;
}

sealed class WindowPageResult {
  const WindowPageResult();
}

class WindowPageApplied extends WindowPageResult {
  const WindowPageApplied(this.window);

  final MessageWindowSnapshot window;
}

class WindowPageSuperseded extends WindowPageResult {
  const WindowPageSuperseded();
}

MessageWindowTrim trimMessageWindow(
  List<Message> messages, {
  required bool keepNewest,
  int max = kMaxLoadedMessages,
  int target = kTrimmedMessageWindowSize,
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
      messages: messages.sublist(messages.length - target),
      droppedOlder: true,
      droppedNewer: false,
    );
  }
  return MessageWindowTrim(
    messages: messages.sublist(0, target),
    droppedOlder: false,
    droppedNewer: true,
  );
}

MessageWindowTrim trimMessageWindowAround(
  List<Message> messages, {
  required String aroundId,
  int max = kMaxLoadedMessages,
  int target = kTrimmedMessageWindowSize,
}) {
  if (messages.length <= max) {
    return MessageWindowTrim(
      messages: messages,
      droppedOlder: false,
      droppedNewer: false,
    );
  }
  final int idx = messages.indexWhere((Message m) => m.id == aroundId);
  if (idx < 0) {
    return trimMessageWindow(
      messages,
      keepNewest: true,
      max: max,
      target: target,
    );
  }
  final int start = (idx - target ~/ 2).clamp(0, messages.length - target);
  return _keepRange(messages, start, start + target);
}

MessageWindowTrim trimMessageWindowBetween(
  List<Message> messages, {
  required String firstId,
  required String lastId,
}) {
  final int start = messages.indexWhere((Message m) => m.id == firstId);
  final int last = messages.indexWhere((Message m) => m.id == lastId);
  if (start < 0 || last < start) {
    return MessageWindowTrim(
      messages: messages,
      droppedOlder: false,
      droppedNewer: false,
    );
  }
  return _keepRange(messages, start, last + 1);
}

MessageWindowTrim _keepRange(List<Message> messages, int start, int end) {
  if (start == 0 && end == messages.length) {
    return MessageWindowTrim(
      messages: messages,
      droppedOlder: false,
      droppedNewer: false,
    );
  }
  List<Message> kept = messages.sublist(start, end);
  final bool droppedOlder = start > 0;
  final bool droppedNewer = end < messages.length;
  if (droppedNewer) {
    final List<Message> localOnly = messages
        .sublist(end)
        .where(isLocalOnlyMessage)
        .toList();
    if (localOnly.isNotEmpty) {
      kept = collapseDeliveredLocalSends(<Message>[...kept, ...localOnly]);
    }
  }
  return MessageWindowTrim(
    messages: kept,
    droppedOlder: droppedOlder,
    droppedNewer: droppedNewer,
  );
}

WindowPageResult applyOlderPage({
  required MessageWindowSnapshot window,
  required List<Message> page,
  required String requestedBeforeId,
  required bool pageIndicatesMoreOlder,
}) {
  if (window.messages.isEmpty ||
      window.messages.first.id != requestedBeforeId) {
    return const WindowPageSuperseded();
  }
  if (page.isEmpty) {
    return WindowPageApplied(
      MessageWindowSnapshot(
        messages: window.messages,
        hasMoreOlder: false,
        hasMoreNewer: window.hasMoreNewer,
      ),
    );
  }
  final List<Message> merged = <Message>[...page, ...window.messages];
  return WindowPageApplied(
    MessageWindowSnapshot(
      messages: merged,
      hasMoreOlder: pageIndicatesMoreOlder,
      hasMoreNewer: window.hasMoreNewer,
    ),
  );
}

WindowPageResult applyNewerPage({
  required MessageWindowSnapshot window,
  required List<Message> page,
  required String requestedAfterId,
  required bool pageIndicatesMoreNewer,
}) {
  final String? windowTailId = newestServerBackedMessageId(window.messages);
  if (windowTailId == null || windowTailId != requestedAfterId) {
    return const WindowPageSuperseded();
  }
  if (page.isEmpty) {
    return WindowPageApplied(
      MessageWindowSnapshot(
        messages: window.messages,
        hasMoreOlder: window.hasMoreOlder,
        hasMoreNewer: pageIndicatesMoreNewer,
      ),
    );
  }
  final List<Message> merged = mergeMessagesSorted(window.messages, page);
  return WindowPageApplied(
    MessageWindowSnapshot(
      messages: merged,
      hasMoreOlder: window.hasMoreOlder,
      hasMoreNewer: pageIndicatesMoreNewer,
    ),
  );
}
