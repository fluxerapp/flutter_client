import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/data/read_state_decisions.dart';

// Message ids are compared via snowflake (BigInt) ordering, so plain ascending
// numeric strings are sufficient: '100' < '200' < '300'.

ReadStateIncomingMessageInput _incoming({
  bool isCurrentUserAuthor = false,
  bool automaticAckEnabled = false,
  bool isAtBottom = false,
  bool authorBlocked = false,
  bool hadUnreadOrMentions = false,
  bool readStateKnown = true,
  String messageId = '200',
  String? ackMessageId = '100',
  String? previousLastMessageId = '100',
}) => ReadStateIncomingMessageInput(
  isCurrentUserAuthor: isCurrentUserAuthor,
  automaticAckEnabled: automaticAckEnabled,
  isAtBottom: isAtBottom,
  authorBlocked: authorBlocked,
  hadUnreadOrMentions: hadUnreadOrMentions,
  readStateKnown: readStateKnown,
  messageId: messageId,
  ackMessageId: ackMessageId,
  previousLastMessageId: previousLastMessageId,
);

ReadStateServerAckInput _serverAck({
  String messageId = '200',
  String? ackMessageId = '100',
  String? version,
  String? serverVersion,
  bool manual = false,
  bool readStateWasKnown = true,
  bool hasMentionCount = false,
}) => ReadStateServerAckInput(
  messageId: messageId,
  ackMessageId: ackMessageId,
  version: version,
  serverVersion: serverVersion,
  manual: manual,
  readStateWasKnown: readStateWasKnown,
  hasMentionCount: hasMentionCount,
);

void main() {
  group('resolveReadStateIncomingMessageDecision', () {
    test('own message is acked', () {
      final decision = resolveReadStateIncomingMessageDecision(
        _incoming(isCurrentUserAuthor: true),
      );
      expect(decision.kind, ReadStateIncomingMessageKind.ackCurrentUserMessage);
    });

    test(
      'actively-viewed channel auto-acks at bottom (no unread recorded)',
      () {
        final decision = resolveReadStateIncomingMessageDecision(
          _incoming(automaticAckEnabled: true, isAtBottom: true),
        );
        expect(decision.kind, ReadStateIncomingMessageKind.ackAutomaticMessage);
      },
    );

    test('auto-ack enabled but not at bottom records unread', () {
      final decision = resolveReadStateIncomingMessageDecision(
        _incoming(automaticAckEnabled: true),
      );
      expect(decision.kind, ReadStateIncomingMessageKind.recordUnread);
    });

    test('blocked author with no prior unread is silently acked', () {
      final decision = resolveReadStateIncomingMessageDecision(
        _incoming(authorBlocked: true),
      );
      expect(decision.kind, ReadStateIncomingMessageKind.ackBlockedMessage);
    });

    test('blocked author preserves an existing unread', () {
      final decision = resolveReadStateIncomingMessageDecision(
        _incoming(authorBlocked: true, hadUnreadOrMentions: true),
      );
      expect(decision.kind, ReadStateIncomingMessageKind.ignoreBlockedMessage);
    });

    test('message at or behind ack is covered', () {
      final decision = resolveReadStateIncomingMessageDecision(
        _incoming(messageId: '100'),
      );
      expect(decision.kind, ReadStateIncomingMessageKind.coveredByAck);
    });

    test('unknown read state seeds ack on first unread message', () {
      final decision = resolveReadStateIncomingMessageDecision(
        _incoming(readStateKnown: false, messageId: '300', ackMessageId: null),
      );
      expect(decision.kind, ReadStateIncomingMessageKind.recordUnread);
      expect(decision.initializeUnknownReadState, isTrue);
    });

    test('known read state records unread without initializing', () {
      final decision = resolveReadStateIncomingMessageDecision(
        _incoming(messageId: '300'),
      );
      expect(decision.kind, ReadStateIncomingMessageKind.recordUnread);
      expect(decision.initializeUnknownReadState, isFalse);
    });
  });

  group('resolveReadStateServerAckDecision', () {
    test('stale version is ignored', () {
      final decision = resolveReadStateServerAckDecision(
        _serverAck(version: '1', serverVersion: '2'),
      );
      expect(decision.kind, ReadStateServerAckKind.ignoreStaleVersion);
    });

    test('manual server ack is applied', () {
      final decision = resolveReadStateServerAckDecision(
        _serverAck(manual: true),
      );
      expect(decision.kind, ReadStateServerAckKind.applyManualAck);
    });

    test('ack older than current is ignored', () {
      final decision = resolveReadStateServerAckDecision(
        _serverAck(messageId: '100', ackMessageId: '200'),
      );
      expect(decision.kind, ReadStateServerAckKind.ignoreOlderMessage);
    });

    test('ack equal to current refreshes and updates mention count', () {
      final decision = resolveReadStateServerAckDecision(
        _serverAck(ackMessageId: '200', hasMentionCount: true),
      );
      expect(decision.kind, ReadStateServerAckKind.refreshCurrentAck);
      expect(decision.shouldUpdateMentionCount, isTrue);
      expect(decision.shouldRefreshUnreadEstimate, isTrue);
      expect(decision.shouldNotify, isTrue);
    });

    test('newer ack advances', () {
      final decision = resolveReadStateServerAckDecision(
        _serverAck(messageId: '300', hasMentionCount: true),
      );
      expect(decision.kind, ReadStateServerAckKind.advanceAck);
      expect(decision.shouldUpdateMentionCount, isTrue);
    });
  });
}
