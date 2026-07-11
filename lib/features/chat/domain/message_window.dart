import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/message_page_sync.dart';

/// Hard cap on the number of messages kept loaded in memory for a channel.
///
/// Mirrors the web client's `MAX_LOADED_MESSAGES`. Slivers already virtualize
/// rendering, so this bounds per-build cost and memory, not what is painted.
const int kMaxLoadedMessages = 200;

/// Size to trim the window back to once [kMaxLoadedMessages] is exceeded,
/// leaving headroom so the next message does not immediately re-trigger a trim.
const int kTrimmedMessageWindowSize = 120;

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

/// The window boundary moved while the request was in flight.
class WindowPageSuperseded extends WindowPageResult {
  const WindowPageSuperseded();
}

/// Trims [messages] down to [target] once it exceeds [max], keeping the newest
/// when [keepNewest] and the oldest otherwise. The returned flags report which
/// end was dropped so callers can re-enable pagination for that side.
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
  final MessageWindowTrim trim = trimMessageWindow(merged, keepNewest: false);
  List<Message> kept = trim.messages;
  if (trim.droppedNewer) {
    // The trim cuts the newest side, where optimistic sends, failed retries,
    // and client system rows live. Those exist only in memory - keep them.
    final List<Message> localOnly = merged
        .sublist(kept.length)
        .where(isLocalOnlyMessage)
        .toList();
    if (localOnly.isNotEmpty) {
      kept = <Message>[...kept, ...localOnly];
    }
  }
  return WindowPageApplied(
    MessageWindowSnapshot(
      messages: kept,
      hasMoreOlder: pageIndicatesMoreOlder,
      hasMoreNewer: window.hasMoreNewer || trim.droppedNewer,
    ),
  );
}

WindowPageResult applyNewerPage({
  required MessageWindowSnapshot window,
  required List<Message> page,
  required String requestedAfterId,
  required bool pageIndicatesMoreNewer,
}) {
  // Anchor on the newest server-backed row: local-only tail rows carry nonce
  // ids near "now" and would otherwise seal the gap as a false overlap.
  final String? windowTailId = newestServerBackedMessageId(window.messages);
  if (windowTailId == null || windowTailId != requestedAfterId) {
    return const WindowPageSuperseded();
  }
  if (page.isEmpty) {
    return WindowPageApplied(
      MessageWindowSnapshot(
        messages: window.messages,
        hasMoreOlder: window.hasMoreOlder,
        hasMoreNewer: false,
      ),
    );
  }
  final List<Message> merged = mergeMessagesSorted(window.messages, page);
  final MessageWindowTrim trim = trimMessageWindow(merged, keepNewest: true);
  return WindowPageApplied(
    MessageWindowSnapshot(
      messages: trim.messages,
      hasMoreOlder: window.hasMoreOlder || trim.droppedOlder,
      hasMoreNewer: pageIndicatesMoreNewer,
    ),
  );
}
