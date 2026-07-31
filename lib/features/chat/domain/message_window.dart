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

/// In-memory cap at which loadMore/loadNewer PAUSE instead of installing:
/// installs never trim (a directional trim landing mid-fling evicts the
/// anchor and teleports the viewport). The scroll-end around-trim (the
/// widget calls ChatViewModel.trimAroundVisible) shrinks the window back to
/// [kTrimmedMessageWindowSize], and the parked edge re-arms on the next
/// scroll gesture.
const int kMaxLoadedMessagesHard = 400;

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

/// Trims to [target] rows containing [aroundId], split as evenly as the
/// window edges allow. Local-only rows (optimistic sends, client system
/// rows) dropped from the newest side are re-appended, mirroring
/// [applyOlderPage]. [aroundId] not found => falls back to
/// trimMessageWindow(keepNewest: true).
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
  List<Message> kept = messages.sublist(start, start + target);
  final bool droppedOlder = start > 0;
  final bool droppedNewer = start + target < messages.length;
  if (droppedNewer) {
    // The newest side holds optimistic sends, failed retries, and client
    // system rows that exist only in memory - keep them.
    final List<Message> localOnly = messages
        .sublist(start + target)
        .where(isLocalOnlyMessage)
        .toList();
    if (localOnly.isNotEmpty) {
      kept = <Message>[...kept, ...localOnly];
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
  // Anchor on the newest server-backed row: local-only tail rows carry nonce
  // ids near "now" and would otherwise seal the gap as a false overlap.
  final String? windowTailId = newestServerBackedMessageId(window.messages);
  if (windowTailId == null || windowTailId != requestedAfterId) {
    return const WindowPageSuperseded();
  }
  if (page.isEmpty) {
    // An empty newer page is NOT self-evidently the tail either: the raw scan is
    // truncated before invisible and orphaned rows are filtered out, so "nothing
    // came back" can mean "everything that came back was filtered". The caller's
    // consult owns that verdict, exactly as it does for a non-empty page.
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
