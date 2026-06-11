import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_list_pivot.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';

String _snowflakeForUtc(DateTime utc) {
  final int internal = (utc.millisecondsSinceEpoch - kSnowflakeEpochMs) << 22;
  return internal.toString();
}

Message _message(String id) {
  return Message(
    id: id,
    channelId: 'channel-1',
    authorId: 'author-1',
    authorName: 'Author',
    content: 'body',
    timestamp: dateTimeFromUserSnowflakeOrNull(id)!,
  );
}

void main() {
  final String idA = _snowflakeForUtc(DateTime.utc(2026, 5, 10, 10));
  final String idB = _snowflakeForUtc(DateTime.utc(2026, 5, 10, 11));
  final String idC = _snowflakeForUtc(DateTime.utc(2026, 5, 10, 12));
  final String idD = _snowflakeForUtc(DateTime.utc(2026, 5, 10, 13));

  group('splitMessagesForCenterSliver', () {
    test('returns empty halves for empty input', () {
      final MessageListPivotSplit actual = splitMessagesForCenterSliver(
        messages: const [],
        pivotMessageId: null,
      );
      expect(actual.preCenter, isEmpty);
      expect(actual.postCenter, isEmpty);
    });

    test('puts all messages in pre-center when pivot is null', () {
      final List<Message> messages = [_message(idA), _message(idB)];
      final MessageListPivotSplit actual = splitMessagesForCenterSliver(
        messages: messages,
        pivotMessageId: null,
      );
      expect(actual.preCenter.map((Message m) => m.id), [idA, idB]);
      expect(actual.postCenter, isEmpty);
    });

    test('splits around pivot for history window', () {
      final List<Message> messages = [
        _message(idA),
        _message(idB),
        _message(idC),
        _message(idD),
      ];
      final MessageListPivotSplit actual = splitMessagesForCenterSliver(
        messages: messages,
        pivotMessageId: idB,
      );
      expect(actual.preCenter.map((Message m) => m.id), [idA, idB]);
      expect(actual.postCenter.map((Message m) => m.id), [idC, idD]);
      expect(actual.containsMessageId(idC), isTrue);
      expect(actual.isPostCenter(idC), isTrue);
      expect(actual.isPostCenter(idB), isFalse);
    });

    test('falls back to pre-center only when pivot is missing', () {
      final List<Message> messages = [_message(idA), _message(idB)];
      final MessageListPivotSplit actual = splitMessagesForCenterSliver(
        messages: messages,
        pivotMessageId: 'missing',
      );
      expect(actual.preCenter.map((Message m) => m.id), [idA, idB]);
      expect(actual.postCenter, isEmpty);
    });

    test('puts pivot-only message entirely in pre-center', () {
      final List<Message> messages = [_message(idA)];
      final MessageListPivotSplit actual = splitMessagesForCenterSliver(
        messages: messages,
        pivotMessageId: idA,
      );
      expect(actual.preCenter.map((Message m) => m.id), [idA]);
      expect(actual.postCenter, isEmpty);
    });

    test('routes newer arrivals to post-center when scrolled up', () {
      final List<Message> messages = [
        _message(idA),
        _message(idB),
        _message(idC),
        _message(idD),
      ];
      final MessageListPivotSplit actual = splitMessagesForCenterSliver(
        messages: messages,
        pivotMessageId: idB,
      );
      expect(actual.preCenter.map((Message m) => m.id), [idA, idB]);
      expect(actual.postCenter.map((Message m) => m.id), [idC, idD]);
    });
  });

  group('resolvePivotMessageId', () {
    test('uses explicit pivot when viewing latest with sticky unread', () {
      final String? actual = resolvePivotMessageId(
        hasMoreNewerMessages: false,
        explicitPivotMessageId: idB,
        scrollAnchoredPivotMessageId: null,
        messages: [_message(idA), _message(idB)],
      );
      expect(actual, idB);
    });

    test(
      'returns null when viewing latest at bottom without explicit pivot',
      () {
        final String? actual = resolvePivotMessageId(
          hasMoreNewerMessages: false,
          explicitPivotMessageId: null,
          scrollAnchoredPivotMessageId: null,
          messages: [_message(idA), _message(idB)],
        );
        expect(actual, isNull);
      },
    );

    test('uses scroll anchor when viewing latest but scrolled up', () {
      final String? actual = resolvePivotMessageId(
        hasMoreNewerMessages: false,
        explicitPivotMessageId: null,
        scrollAnchoredPivotMessageId: idB,
        messages: [_message(idA), _message(idB), _message(idC)],
      );
      expect(actual, idB);
    });

    test('prefers explicit pivot when present in messages', () {
      final String? actual = resolvePivotMessageId(
        hasMoreNewerMessages: true,
        explicitPivotMessageId: idB,
        scrollAnchoredPivotMessageId: null,
        messages: [_message(idA), _message(idB), _message(idC)],
      );
      expect(actual, idB);
    });

    test('defaults to second-newest when history has no explicit pivot', () {
      final String? actual = resolvePivotMessageId(
        hasMoreNewerMessages: true,
        explicitPivotMessageId: null,
        scrollAnchoredPivotMessageId: null,
        messages: [_message(idA), _message(idB), _message(idC)],
      );
      expect(actual, idB);
    });

    test(
      'uses scroll anchor in history mode before second-newest fallback',
      () {
        final List<Message> messages = [
          _message(idA),
          _message(idB),
          _message(idC),
          _message(idD),
        ];
        final String? actual = resolvePivotMessageId(
          hasMoreNewerMessages: true,
          explicitPivotMessageId: null,
          scrollAnchoredPivotMessageId: idB,
          messages: messages,
        );
        expect(actual, idB);
      },
    );

    test('keeps explicit pivot after newer page append', () {
      final List<Message> messages = [
        _message(idA),
        _message(idB),
        _message(idC),
        _message(idD),
      ];
      final String? actual = resolvePivotMessageId(
        hasMoreNewerMessages: true,
        explicitPivotMessageId: idB,
        scrollAnchoredPivotMessageId: null,
        messages: messages,
      );
      expect(actual, idB);
    });

    test('defaults to sole message when history window is one message', () {
      final String? actual = resolvePivotMessageId(
        hasMoreNewerMessages: true,
        explicitPivotMessageId: null,
        scrollAnchoredPivotMessageId: null,
        messages: [_message(idA)],
      );
      expect(actual, idA);
    });
  });
}
