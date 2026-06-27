import 'package:fluxer_app/features/channels/data/read_state_utils.dart';

/// Pure read-state decision tables ported from the web app's state machines
/// (`fluxer_app/src/features/read_state/state/read_states/*Machine.ts`).
///
/// These encode the authoritative unread / mention / ack rules so every Flutter
/// write path (gateway reducer, repository, unread providers) applies identical
/// logic to the canonical web client. Keep in lockstep with the web machines.

// ---------------------------------------------------------------------------
// Incoming message — ReadStateIncomingMessageMachine
// ---------------------------------------------------------------------------

enum ReadStateIncomingMessageKind {
  ackCurrentUserMessage,
  ackAutomaticMessage,
  ackBlockedMessage,
  ignoreBlockedMessage,
  coveredByAck,
  recordUnread,
}

class ReadStateIncomingMessageInput {
  const ReadStateIncomingMessageInput({
    required this.isCurrentUserAuthor,
    required this.automaticAckEnabled,
    required this.isAtBottom,
    required this.authorBlocked,
    required this.hadUnreadOrMentions,
    required this.readStateKnown,
    required this.messageId,
    required this.ackMessageId,
    required this.previousLastMessageId,
  });

  final bool isCurrentUserAuthor;
  final bool automaticAckEnabled;
  final bool isAtBottom;
  final bool authorBlocked;
  final bool hadUnreadOrMentions;
  final bool readStateKnown;
  final String messageId;
  final String? ackMessageId;
  final String? previousLastMessageId;
}

class ReadStateIncomingMessageDecision {
  const ReadStateIncomingMessageDecision({
    required this.kind,
    this.initializeUnknownReadState = false,
  });

  final ReadStateIncomingMessageKind kind;
  final bool initializeUnknownReadState;
}

String? _incomingEffectiveAckMessageId(ReadStateIncomingMessageInput c) =>
    c.readStateKnown ? c.ackMessageId : c.previousLastMessageId;

bool _incomingCoveredByAck(ReadStateIncomingMessageInput c) {
  final effective = _incomingEffectiveAckMessageId(c);
  if (effective == null) {
    return false;
  }
  return compareSnowflakeIds(c.messageId, effective) <= 0;
}

ReadStateIncomingMessageDecision resolveReadStateIncomingMessageDecision(
  ReadStateIncomingMessageInput input,
) {
  if (input.isCurrentUserAuthor) {
    return const ReadStateIncomingMessageDecision(
      kind: ReadStateIncomingMessageKind.ackCurrentUserMessage,
    );
  }
  if (input.automaticAckEnabled && input.isAtBottom) {
    return const ReadStateIncomingMessageDecision(
      kind: ReadStateIncomingMessageKind.ackAutomaticMessage,
    );
  }
  if (input.authorBlocked && !input.hadUnreadOrMentions) {
    return const ReadStateIncomingMessageDecision(
      kind: ReadStateIncomingMessageKind.ackBlockedMessage,
    );
  }
  if (input.authorBlocked) {
    return const ReadStateIncomingMessageDecision(
      kind: ReadStateIncomingMessageKind.ignoreBlockedMessage,
    );
  }
  if (_incomingCoveredByAck(input)) {
    return const ReadStateIncomingMessageDecision(
      kind: ReadStateIncomingMessageKind.coveredByAck,
    );
  }
  return ReadStateIncomingMessageDecision(
    kind: ReadStateIncomingMessageKind.recordUnread,
    initializeUnknownReadState: !input.readStateKnown,
  );
}

// ---------------------------------------------------------------------------
// Server ack — ReadStateServerAckMachine
// ---------------------------------------------------------------------------

enum ReadStateServerAckKind {
  ignoreStaleVersion,
  applyManualAck,
  ignoreOlderMessage,
  refreshCurrentAck,
  advanceAck,
}

class ReadStateServerAckInput {
  const ReadStateServerAckInput({
    required this.messageId,
    required this.ackMessageId,
    required this.serverVersion,
    required this.manual,
    required this.readStateWasKnown,
    required this.hasMentionCount,
    this.version,
  });

  final String messageId;
  final String? ackMessageId;
  final String? version;
  final String? serverVersion;
  final bool manual;
  final bool readStateWasKnown;
  final bool hasMentionCount;
}

class ReadStateServerAckDecision {
  const ReadStateServerAckDecision({
    required this.kind,
    this.shouldUpdateMentionCount = false,
    this.shouldRefreshUnreadEstimate = false,
    this.shouldNotify = false,
  });

  final ReadStateServerAckKind kind;
  final bool shouldUpdateMentionCount;
  final bool shouldRefreshUnreadEstimate;
  final bool shouldNotify;
}

ReadStateServerAckDecision resolveReadStateServerAckDecision(
  ReadStateServerAckInput input,
) {
  final hasStaleVersion =
      input.version != null &&
      compareReadStateVersions(input.version, input.serverVersion) < 0;
  if (hasStaleVersion) {
    return const ReadStateServerAckDecision(
      kind: ReadStateServerAckKind.ignoreStaleVersion,
    );
  }
  if (input.manual) {
    return const ReadStateServerAckDecision(
      kind: ReadStateServerAckKind.applyManualAck,
    );
  }
  if (input.ackMessageId != null &&
      compareSnowflakeIds(input.messageId, input.ackMessageId) < 0) {
    return const ReadStateServerAckDecision(
      kind: ReadStateServerAckKind.ignoreOlderMessage,
    );
  }
  if (input.messageId == input.ackMessageId) {
    return ReadStateServerAckDecision(
      kind: ReadStateServerAckKind.refreshCurrentAck,
      shouldUpdateMentionCount: input.hasMentionCount,
      shouldRefreshUnreadEstimate: input.hasMentionCount,
      shouldNotify: !input.readStateWasKnown || input.hasMentionCount,
    );
  }
  return ReadStateServerAckDecision(
    kind: ReadStateServerAckKind.advanceAck,
    shouldUpdateMentionCount: input.hasMentionCount,
  );
}
