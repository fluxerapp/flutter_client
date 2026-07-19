import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';

bool isMessageIdInNetworkPageRange({
  required String messageId,
  required String oldestId,
  required String newestId,
}) {
  return compareSnowflakeIds(messageId, oldestId) >= 0 &&
      compareSnowflakeIds(messageId, newestId) <= 0;
}

/// False when [networkPage] lies entirely newer than the window's newest
/// server-backed row, meaning that merging would create a silent gap.
bool networkPageOverlapsWindow({
  required List<Message> window,
  required List<Message> networkPage,
}) {
  if (networkPage.isEmpty) {
    return true;
  }
  final String? windowTailId = newestServerBackedMessageId(window);
  if (windowTailId == null) {
    return true;
  }
  return compareSnowflakeIds(networkPage.first.id, windowTailId) <= 0;
}

bool isLocalOnlyMessage(Message message) =>
    message.isClientSystemMessage ||
    message.deliveryState == MessageDeliveryState.sending ||
    message.deliveryState == MessageDeliveryState.failed;

String? newestServerBackedMessageId(List<Message> messages) {
  for (var i = messages.length - 1; i >= 0; i--) {
    final Message message = messages[i];
    if (!isLocalOnlyMessage(message)) {
      return message.id;
    }
  }
  return null;
}

bool shouldPreserveLocalMessage({
  required Message message,
  required String newestNetworkId,
  required String? syncBaselineOldestId,
}) {
  if (isLocalOnlyMessage(message)) {
    return true;
  }
  if (syncBaselineOldestId != null &&
      compareSnowflakeIds(message.id, syncBaselineOldestId) < 0) {
    return true;
  }
  if (compareSnowflakeIds(message.id, newestNetworkId) > 0) {
    return true;
  }
  return false;
}

List<String> networkPageStaleLocalIds({
  required Iterable<String> localMessageIds,
  required List<Message> networkPage,
}) {
  if (networkPage.isEmpty) {
    return const [];
  }
  final String oldestId = networkPage.first.id;
  final String newestId = networkPage.last.id;
  final Set<String> networkIds = networkPage.map((Message m) => m.id).toSet();
  return localMessageIds
      .where(
        (String id) =>
            isMessageIdInNetworkPageRange(
              messageId: id,
              oldestId: oldestId,
              newestId: newestId,
            ) &&
            !networkIds.contains(id),
      )
      .toList();
}

List<Message> mergeMessagesSorted(
  List<Message> current,
  List<Message> incoming,
) {
  final Map<String, Message> byId = <String, Message>{
    for (final Message message in current) message.id: message,
  };
  for (final Message message in incoming) {
    final Message? existing = byId[message.id];
    byId[message.id] =
        (existing != null && existing.isRenderEquivalent(message))
        ? existing
        : message;
  }
  final List<Message> merged = byId.values.toList()
    ..sort((Message a, Message b) {
      final int bySnowflake = compareSnowflakeIds(a.id, b.id);
      if (bySnowflake != 0) {
        return bySnowflake;
      }
      return a.timestamp.compareTo(b.timestamp);
    });
  return merged;
}

List<Message> reconcileMessagesWithNetworkPage({
  required List<Message> current,
  required List<Message> networkPage,
  String? syncBaselineOldestId,
}) {
  if (networkPage.isEmpty) {
    return current;
  }
  final String newestId = networkPage.last.id;
  final String? baselineId =
      syncBaselineOldestId ?? (current.isEmpty ? null : current.first.id);
  final List<Message> preserved = current
      .where(
        (Message message) => shouldPreserveLocalMessage(
          message: message,
          newestNetworkId: newestId,
          syncBaselineOldestId: baselineId,
        ),
      )
      .toList();
  return mergeMessagesSorted(preserved, networkPage);
}

/// Drops local messages that fall inside [networkPage]s snowflake range but
/// are absent from the server response, then merges [networkPage] updates.
/// unlike [reconcileMessagesWithNetworkPage], messages outside the network
/// page range are kept as is so a scrolledup window is not trimmed.
List<Message> reconcileStaleDeletionsInLoadedWindow({
  required List<Message> current,
  required List<Message> networkPage,
}) {
  if (networkPage.isEmpty) {
    return current;
  }
  final Set<String> staleIds = networkPageStaleLocalIds(
    localMessageIds: current
        .where((Message message) => !isLocalOnlyMessage(message))
        .map((Message message) => message.id),
    networkPage: networkPage,
  ).toSet();
  final Map<String, Message> networkById = <String, Message>{
    for (final Message message in networkPage) message.id: message,
  };
  var changed = false;
  final List<Message> updated = <Message>[];
  for (final Message message in current) {
    if (staleIds.contains(message.id)) {
      changed = true;
      continue;
    }
    final Message? networkMessage = networkById[message.id];
    if (networkMessage != null && !message.isRenderEquivalent(networkMessage)) {
      updated.add(networkMessage);
      changed = true;
    } else {
      updated.add(message);
    }
  }
  return changed ? updated : current;
}

/// True when the window's oldest message is strictly newer than the oldest
/// id of the channel's known-contiguous interval, i.e. every message between
/// them was fetched contiguously and can be re-served from the local cache
/// without a network round-trip.
bool canServeOlderFromCache({
  required String? windowOldestId,
  required String? contigOldestId,
}) {
  if (windowOldestId == null || contigOldestId == null) {
    return false;
  }
  return compareSnowflakeIds(windowOldestId, contigOldestId) > 0;
}

/// True when the newest id of the channel's known-contiguous interval is
/// strictly newer than the window's newest message, so the gap can be served
/// from the local cache without a network round-trip.
bool canServeNewerFromCache({
  required String? windowNewestId,
  required String? contigNewestId,
}) {
  if (windowNewestId == null || contigNewestId == null) {
    return false;
  }
  return compareSnowflakeIds(contigNewestId, windowNewestId) > 0;
}

class VisibleWindowReconcileParams {
  const VisibleWindowReconcileParams({
    required this.aroundId,
    required this.limit,
  });

  final String aroundId;
  final int limit;
}

/// Network fetch anchors that cover a scrolled-up in-memory window.
List<VisibleWindowReconcileParams> reconcileParamsListForVisibleWindow({
  required List<Message> window,
  int minLimit = 30,
  int maxLimit = 100,
  int padding = 20,
}) {
  final List<Message> serverBacked = window
      .where((Message message) => !isLocalOnlyMessage(message))
      .toList();
  if (serverBacked.isEmpty) {
    return const <VisibleWindowReconcileParams>[];
  }
  if (serverBacked.length <= maxLimit) {
    return <VisibleWindowReconcileParams>[
      VisibleWindowReconcileParams(
        aroundId: serverBacked[serverBacked.length ~/ 2].id,
        limit: (serverBacked.length + padding).clamp(minLimit, maxLimit),
      ),
    ];
  }
  final int segmentCount = (serverBacked.length / maxLimit).ceil();
  final int step = serverBacked.length ~/ segmentCount;
  final List<VisibleWindowReconcileParams> params =
      <VisibleWindowReconcileParams>[];
  for (int i = 0; i < segmentCount; i++) {
    final int index = i == segmentCount - 1
        ? serverBacked.length - 1
        : (i * step).clamp(0, serverBacked.length - 1);
    params.add(
      VisibleWindowReconcileParams(
        aroundId: serverBacked[index].id,
        limit: maxLimit,
      ),
    );
  }
  return params;
}

/// Network fetch anchor and page size that cover a scrolled-up in-memory window.
VisibleWindowReconcileParams? reconcileParamsForVisibleWindow({
  required List<Message> window,
  int minLimit = 30,
  int maxLimit = 100,
  int padding = 20,
}) {
  final List<VisibleWindowReconcileParams> params =
      reconcileParamsListForVisibleWindow(
        window: window,
        minLimit: minLimit,
        maxLimit: maxLimit,
        padding: padding,
      );
  if (params.isEmpty) {
    return null;
  }
  return params.first;
}
