import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/client_system_message.dart';
import 'package:fluxer_app/features/chat/utils/message_page_sync.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';

String _snowflakeForUtc(DateTime utc) {
  final int internal = (utc.millisecondsSinceEpoch - kSnowflakeEpochMs) << 22;
  return internal.toString();
}

Message _message(
  String id, {
  String content = 'body',
  MessageDeliveryState deliveryState = MessageDeliveryState.sent,
  List<Attachment> attachments = const [],
}) {
  return Message(
    id: id,
    channelId: 'channel-1',
    authorId: 'author-1',
    authorName: 'Author',
    content: content,
    timestamp: dateTimeFromUserSnowflakeOrNull(id)!,
    deliveryState: deliveryState,
    attachments: attachments,
  );
}

void main() {
  final String idA = _snowflakeForUtc(DateTime.utc(2026, 5, 10, 10));
  final String idB = _snowflakeForUtc(DateTime.utc(2026, 5, 10, 11));
  final String idC = _snowflakeForUtc(DateTime.utc(2026, 5, 10, 12));
  final String idD = _snowflakeForUtc(DateTime.utc(2026, 5, 10, 13));

  test('removes deleted message in network page window', () {
    final List<Message> current = [_message(idA), _message(idB), _message(idC)];
    final List<Message> networkPage = [
      _message(idA),
      _message(idC, content: 'updated'),
    ];
    final List<Message> actual = reconcileMessagesWithNetworkPage(
      current: current,
      networkPage: networkPage,
    );
    expect(actual.map((Message m) => m.id), [idA, idC]);
    expect(actual.last.content, 'updated');
    expect(actual.any((Message m) => m.id == idB), isFalse);
  });

  test('preserves messages older than sync baseline when paginated', () {
    final String idOlder = _snowflakeForUtc(DateTime.utc(2026, 5, 9, 12));
    final List<Message> current = [
      _message(idOlder),
      _message(idA),
      _message(idB),
    ];
    final List<Message> networkPage = [_message(idA), _message(idB)];
    final List<Message> actual = reconcileMessagesWithNetworkPage(
      current: current,
      networkPage: networkPage,
      syncBaselineOldestId: idA,
    );
    expect(actual.map((Message m) => m.id), [idOlder, idA, idB]);
  });

  test('preserves sending and failed placeholders not in network page', () {
    final String failedId = _snowflakeForUtc(DateTime.utc(2026, 5, 10, 14));
    final List<Message> current = [
      _message(idA),
      _message(idD, deliveryState: MessageDeliveryState.sending),
      _message(failedId, deliveryState: MessageDeliveryState.failed),
    ];
    final List<Message> networkPage = [_message(idA)];
    final List<Message> actual = reconcileMessagesWithNetworkPage(
      current: current,
      networkPage: networkPage,
      syncBaselineOldestId: idA,
    );
    expect(actual.any((Message m) => m.id == idD), isTrue);
    expect(actual.any((Message m) => m.id == failedId), isTrue);
  });

  test('preserves client system messages not in network page', () {
    final Message clientSystem = createClientSystemMessage(
      channelId: 'channel-1',
      content: 'Delivery failed.',
    );
    final List<Message> current = [_message(idA), clientSystem];
    final List<Message> networkPage = [_message(idA)];
    final List<Message> actual = reconcileMessagesWithNetworkPage(
      current: current,
      networkPage: networkPage,
      syncBaselineOldestId: idA,
    );
    expect(actual.any((Message m) => m.id == clientSystem.id), isTrue);
  });

  test('drops cached messages below baseline when channel shrinks', () {
    final List<Message> current = [_message(idA), _message(idB), _message(idC)];
    final List<Message> networkPage = [_message(idC, content: 'only')];
    final List<Message> actual = reconcileMessagesWithNetworkPage(
      current: current,
      networkPage: networkPage,
      syncBaselineOldestId: idA,
    );
    expect(actual.map((Message m) => m.id), [idC]);
    expect(actual.single.content, 'only');
  });

  test('networkPageStaleLocalIds returns ids deleted on server', () {
    final List<String> stale = networkPageStaleLocalIds(
      localMessageIds: [idA, idB, idC],
      networkPage: [_message(idA), _message(idC)],
    );
    expect(stale, [idB]);
  });

  test('removes middle deleted message from three-message cache page', () {
    final String anchor = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 10));
    final String deleted = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 11));
    final String kept = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 12));
    final List<Message> actual = reconcileMessagesWithNetworkPage(
      current: [_message(anchor), _message(deleted), _message(kept)],
      networkPage: [_message(anchor), _message(kept)],
    );
    expect(actual.map((Message m) => m.id), [anchor, kept]);
  });

  test('networkPageStaleLocalIds ignores messages outside page range', () {
    final String idOlder = _snowflakeForUtc(DateTime.utc(2026, 5, 9, 12));
    final List<String> stale = networkPageStaleLocalIds(
      localMessageIds: [idOlder, idA, idB],
      networkPage: [_message(idA), _message(idB)],
    );
    expect(stale, isEmpty);
  });

  group('cache-serve contiguity guards', () {
    test('canServeOlderFromCache only when window is strictly inside '
        'the interval', () {
      expect(
        canServeOlderFromCache(windowOldestId: idC, contigOldestId: idA),
        isTrue,
      );
      expect(
        canServeOlderFromCache(windowOldestId: idA, contigOldestId: idA),
        isFalse,
      );
      expect(
        canServeOlderFromCache(windowOldestId: idA, contigOldestId: idC),
        isFalse,
      );
      expect(
        canServeOlderFromCache(windowOldestId: null, contigOldestId: idA),
        isFalse,
      );
      expect(
        canServeOlderFromCache(windowOldestId: idC, contigOldestId: null),
        isFalse,
      );
    });

    test('canServeNewerFromCache only when the interval extends past '
        'the window', () {
      expect(
        canServeNewerFromCache(windowNewestId: idA, contigNewestId: idC),
        isTrue,
      );
      expect(
        canServeNewerFromCache(windowNewestId: idC, contigNewestId: idC),
        isFalse,
      );
      expect(
        canServeNewerFromCache(windowNewestId: idC, contigNewestId: idA),
        isFalse,
      );
      expect(
        canServeNewerFromCache(windowNewestId: null, contigNewestId: idC),
        isFalse,
      );
      expect(
        canServeNewerFromCache(windowNewestId: idA, contigNewestId: null),
        isFalse,
      );
    });
  });

  group('mergeMessagesSorted referential reuse', () {
    test('keeps the existing instance when render-equivalent', () {
      final Message existing = _message(idB);
      final Message incoming = _message(idB);
      final List<Message> merged = mergeMessagesSorted([existing], [incoming]);
      expect(identical(merged.single, existing), isTrue);
    });

    test('replaces with incoming when content changed', () {
      final Message existing = _message(idB, content: 'old');
      final Message incoming = _message(idB, content: 'new');
      final List<Message> merged = mergeMessagesSorted([existing], [incoming]);
      expect(identical(merged.single, incoming), isTrue);
    });

    test('reuses when attachments are identical', () {
      final Message existing = _message(
        idB,
        attachments: const [
          Attachment(id: 'a1', filename: 'f.png', url: 'https://x/f.png'),
        ],
      );
      final Message incoming = _message(
        idB,
        attachments: const [
          Attachment(id: 'a1', filename: 'f.png', url: 'https://x/f.png'),
        ],
      );
      final List<Message> merged = mergeMessagesSorted([existing], [incoming]);
      expect(identical(merged.single, existing), isTrue);
    });

    test('replaces when attachments differ', () {
      final Message existing = _message(
        idB,
        attachments: const [
          Attachment(id: 'a1', filename: 'f.png', url: 'https://x/f.png'),
        ],
      );
      final Message incoming = _message(
        idB,
        attachments: const [
          Attachment(id: 'a2', filename: 'g.png', url: 'https://x/g.png'),
        ],
      );
      final List<Message> merged = mergeMessagesSorted([existing], [incoming]);
      expect(identical(merged.single, incoming), isTrue);
    });
  });
}
