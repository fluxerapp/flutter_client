import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
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

  test('newestServerBackedMessageId ignores local-only tail rows', () {
    expect(
      newestServerBackedMessageId([
        _message(idA),
        _message(idC, deliveryState: MessageDeliveryState.sending),
        _message(idD, deliveryState: MessageDeliveryState.failed),
      ]),
      idA,
    );
  });

  test('newestServerBackedMessageId is null without server-backed rows', () {
    expect(newestServerBackedMessageId(const <Message>[]), isNull);
    expect(
      newestServerBackedMessageId([
        _message(idA, deliveryState: MessageDeliveryState.sending),
        _message(idB, deliveryState: MessageDeliveryState.failed),
      ]),
      isNull,
    );
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

  test('reconcileStaleDeletionsInLoadedWindow keeps scrolled-up history', () {
    final String idOlder = _snowflakeForUtc(DateTime.utc(2026, 5, 9, 12));
    final String idA = _snowflakeForUtc(DateTime.utc(2026, 5, 10, 10));
    final String idB = _snowflakeForUtc(DateTime.utc(2026, 5, 10, 11));
    final String idC = _snowflakeForUtc(DateTime.utc(2026, 5, 10, 12));
    final List<Message> current = [
      _message(idOlder),
      _message(idA),
      _message(idB),
      _message(idC),
    ];
    final List<Message> actual = reconcileStaleDeletionsInLoadedWindow(
      current: current,
      networkPage: [
        _message(idA),
        _message(idC, content: 'updated'),
      ],
    );
    expect(actual.map((Message m) => m.id), [idOlder, idA, idC]);
    expect(actual.last.content, 'updated');
    expect(actual.any((Message m) => m.id == idB), isFalse);
  });

  test('loaded-window reconciliation preserves local-only rows', () {
    final List<Message> actual = reconcileStaleDeletionsInLoadedWindow(
      current: [
        _message(idA),
        _message(idB, deliveryState: MessageDeliveryState.sending),
        _message(idC),
      ],
      networkPage: [_message(idA), _message(idC)],
    );
    expect(actual.map((Message message) => message.id), [idA, idB, idC]);
    expect(actual[1].deliveryState, MessageDeliveryState.sending);
  });

  test('networkPageStaleLocalIds ignores messages outside page range', () {
    final String idOlder = _snowflakeForUtc(DateTime.utc(2026, 5, 9, 12));
    final List<String> stale = networkPageStaleLocalIds(
      localMessageIds: [idOlder, idA, idB],
      networkPage: [_message(idA), _message(idB)],
    );
    expect(stale, isEmpty);
  });

  group('network page overlap guard', () {
    test('accepts overlap', () {
      expect(
        networkPageOverlapsWindow(
          window: [_message(idA), _message(idC)],
          networkPage: [_message(idB), _message(idD)],
        ),
        isTrue,
      );
    });

    test('accepts an abutting boundary', () {
      expect(
        networkPageOverlapsWindow(
          window: [_message(idA), _message(idC)],
          networkPage: [_message(idC), _message(idD)],
        ),
        isTrue,
      );
    });

    test('rejects a disjoint newer page', () {
      expect(
        networkPageOverlapsWindow(
          window: [_message(idA), _message(idB)],
          networkPage: [_message(idC), _message(idD)],
        ),
        isFalse,
      );
    });

    test('rejects a disjoint page past a local-only tail row', () {
      expect(
        networkPageOverlapsWindow(
          window: [
            _message(idA),
            _message(idD, deliveryState: MessageDeliveryState.sending),
          ],
          networkPage: [_message(idB), _message(idC)],
        ),
        isFalse,
      );
    });

    test('accepts an empty window', () {
      expect(
        networkPageOverlapsWindow(
          window: const <Message>[],
          networkPage: [_message(idC)],
        ),
        isTrue,
      );
    });

    test('accepts a window with only local-only rows', () {
      expect(
        networkPageOverlapsWindow(
          window: [_message(idA, deliveryState: MessageDeliveryState.sending)],
          networkPage: [_message(idC), _message(idD)],
        ),
        isTrue,
      );
    });

    test('accepts an empty page', () {
      expect(
        networkPageOverlapsWindow(
          window: [_message(idA)],
          networkPage: const <Message>[],
        ),
        isTrue,
      );
    });
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

    test('aroundPageReachesLiveTail when the newer side came back short of the '
        "server's quota for the fetch limit", () {
      // The server fills an around window's newer side independently, up to
      // limit / 2 rows, so a newer side SHORT of that quota is the server
      // reporting nothing newer remains. Quota reached means truncated, which
      // proves nothing and must read as detached.
      expect(
        aroundPageReachesLiveTail(
          anchorId: idC,
          page: <Message>[_message(idA), _message(idB), _message(idC)],
          limit: 30,
        ),
        isTrue,
        reason: 'zero newer rows against a quota of 15 is the trivial subcase',
      );
      expect(
        aroundPageReachesLiveTail(
          anchorId: idB,
          page: <Message>[_message(idA), _message(idB), _message(idC)],
          limit: 30,
        ),
        isTrue,
        reason:
            'one newer row where the server would have sent 15 is the newer '
            'side exhausted, not a page filled to its limit',
      );
      expect(
        aroundPageReachesLiveTail(
          anchorId: idB,
          page: <Message>[_message(idA), _message(idB), _message(idC)],
          limit: 2,
        ),
        isFalse,
        reason: 'the same page against a quota of 1 is a filled newer side',
      );
      expect(
        aroundPageReachesLiveTail(
          anchorId: idB,
          page: const <Message>[],
          limit: 30,
        ),
        isFalse,
        reason: 'a page that never carried the anchor makes no tail claim',
      );
      expect(
        aroundPageReachesLiveTail(
          anchorId: idD,
          page: <Message>[_message(idA), _message(idB)],
          limit: 30,
        ),
        isFalse,
        reason:
            'an anchor absent from the page was not the centre the server '
            'used, so its shape cannot be read as a quota at all',
      );
      expect(
        aroundPageReachesLiveTail(
          anchorId: idB,
          page: <Message>[_message(idA), _message(idB)],
          limit: 1,
        ),
        isFalse,
        reason: 'a limit that leaves no newer quota to fill proves nothing',
      );
    });

    test(
      'resolveJumpScrollTargetId prefers the exact target, else neighbour',
      () {
        expect(
          resolveJumpScrollTargetId(
            jumpTargetId: idB,
            messageIds: <String>[idA, idB, idC],
          ),
          idB,
        );
        expect(
          resolveJumpScrollTargetId(
            jumpTargetId: idB,
            messageIds: const <String>[],
          ),
          isNull,
          reason: 'empty window cannot resolve a neighbour',
        );
        // Missing target between B and C: prefer the next newer neighbour.
        expect(
          resolveJumpScrollTargetId(
            jumpTargetId: idC,
            messageIds: <String>[idA, idB, idD],
          ),
          idD,
        );
        // Missing target older than the window: land on the oldest loaded row.
        expect(
          resolveJumpScrollTargetId(
            jumpTargetId: idA,
            messageIds: <String>[idB, idC, idD],
          ),
          idB,
        );
        // Missing target newer than the window: land on the newest loaded row.
        expect(
          resolveJumpScrollTargetId(
            jumpTargetId: idD,
            messageIds: <String>[idA, idB, idC],
          ),
          idC,
        );
        expect(
          resolveJumpScrollTargetId(
            jumpTargetId: idB,
            messageIds: <String>[idA, idB, idC],
            jumpTargetOffset: 1,
          ),
          idC,
        );
      },
    );

    test(
      'jumpTargetWindowSettled waits for the page that carries the target',
      () {
        // Inside the loaded span: a deleted or filtered row, so the neighbour
        // is where the message was.
        expect(
          jumpTargetWindowSettled(
            jumpTargetId: idC,
            messageIds: <String>[idA, idB, idD],
            hasMoreOlder: true,
            hasMoreNewer: true,
          ),
          isTrue,
        );
        // Past an OPEN edge: still in flight, and the nearest loaded row is
        // the edge of the window being left.
        expect(
          jumpTargetWindowSettled(
            jumpTargetId: idA,
            messageIds: <String>[idB, idC, idD],
            hasMoreOlder: true,
            hasMoreNewer: false,
          ),
          isFalse,
        );
        expect(
          jumpTargetWindowSettled(
            jumpTargetId: idD,
            messageIds: <String>[idA, idB, idC],
            hasMoreOlder: false,
            hasMoreNewer: true,
          ),
          isFalse,
        );
        // Past a SEALED edge: no page can ever bring it.
        expect(
          jumpTargetWindowSettled(
            jumpTargetId: idD,
            messageIds: <String>[idA, idB, idC],
            hasMoreOlder: false,
            hasMoreNewer: false,
          ),
          isTrue,
        );
        expect(
          jumpTargetWindowSettled(
            jumpTargetId: idB,
            messageIds: <String>[idA, idB, idC],
            hasMoreOlder: true,
            hasMoreNewer: true,
          ),
          isTrue,
          reason: 'the exact row is loaded',
        );
        expect(
          jumpTargetWindowSettled(
            jumpTargetId: idB,
            messageIds: const <String>[],
            hasMoreOlder: false,
            hasMoreNewer: false,
          ),
          isFalse,
          reason: 'an empty window has landed nothing',
        );
      },
    );

    test('m16e: the quota boundary decides, and it fails toward detached', () {
      // The one rung the integration tests cannot pin, because the pointer
      // consult can absorb either verdict. expectedNewer - 1 newer rows is the
      // tail; expectedNewer exactly is a filled quota, and a tail that happens
      // to land there costs one extra fetch instead of dropping live messages.
      const int limit = 30;
      const int expectedNewer = limit ~/ 2;
      final DateTime anchorTime = DateTime.utc(2026, 5, 11, 12);
      final String anchorId = _snowflakeForUtc(anchorTime);
      List<Message> pageWithNewer(int newerCount) => <Message>[
        _message(anchorId),
        for (var i = 1; i <= newerCount; i++)
          _message(_snowflakeForUtc(anchorTime.add(Duration(minutes: i)))),
      ];

      expect(
        aroundPageReachesLiveTail(
          anchorId: anchorId,
          page: pageWithNewer(expectedNewer - 1),
          limit: limit,
        ),
        isTrue,
        reason: 'one row short of the quota is the newer side exhausted',
      );
      expect(
        aroundPageReachesLiveTail(
          anchorId: anchorId,
          page: pageWithNewer(expectedNewer),
          limit: limit,
        ),
        isFalse,
        reason: 'a filled quota is a truncated page: fail toward detached',
      );
    });
  });

  group('visible window reconcile params', () {
    test('anchors around the middle server-backed row', () {
      final String idOlder = _snowflakeForUtc(DateTime.utc(2026, 5, 9, 12));
      final VisibleWindowReconcileParams? params =
          reconcileParamsForVisibleWindow(
            window: [_message(idOlder), _message(idA), _message(idB)],
          );
      expect(params, isNotNull);
      expect(params!.aroundId, idA);
      expect(params.limit, greaterThanOrEqualTo(30));
    });

    test('returns null when the window has only local-only rows', () {
      expect(
        reconcileParamsForVisibleWindow(
          window: [_message(idA, deliveryState: MessageDeliveryState.sending)],
        ),
        isNull,
      );
    });

    test('returns multiple anchors when the window exceeds maxLimit', () {
      final List<Message> window = <Message>[
        for (int i = 0; i < 150; i++)
          _message(_snowflakeForUtc(DateTime.utc(2026, 5, 10, 0, i))),
      ];
      final List<VisibleWindowReconcileParams> params =
          reconcileParamsListForVisibleWindow(window: window);
      expect(params.length, greaterThan(1));
      expect(params.first.aroundId, window.first.id);
      expect(params.last.aroundId, window.last.id);
    });

    test('removes edge deletions in a large scrolled window', () {
      final List<Message> window = <Message>[
        for (int i = 0; i < 150; i++)
          _message(_snowflakeForUtc(DateTime.utc(2026, 5, 10, 0, i))),
      ];
      final String deletedNearStart = window[10].id;
      final String deletedNearEnd = window[140].id;
      final List<Message> networkPage = window
          .where(
            (Message message) =>
                message.id != deletedNearStart && message.id != deletedNearEnd,
          )
          .toList();
      final List<Message> actual = reconcileStaleDeletionsInLoadedWindow(
        current: window,
        networkPage: networkPage,
      );
      expect(
        actual.any((Message message) => message.id == deletedNearStart),
        isFalse,
      );
      expect(
        actual.any((Message message) => message.id == deletedNearEnd),
        isFalse,
      );
      expect(actual.length, 148);
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

  group('scale', () {
    List<Message> window0(int count) => <Message>[
      for (int i = 0; i < count; i++)
        _message(_snowflakeForUtc(DateTime.utc(2026, 5, 10, 0, i))),
    ];

    test('mergeMessagesSorted keeps ordering for 1k messages', () {
      final List<Message> current = window0(1000);
      final List<Message> incoming = window0(1000);
      final List<Message> merged = mergeMessagesSorted(current, incoming);
      expect(merged.length, 1000);
      for (int i = 1; i < merged.length; i++) {
        expect(
          compareSnowflakeIds(merged[i - 1].id, merged[i].id),
          lessThan(0),
        );
      }
    });

    test('reconcileStaleDeletionsInLoadedWindow handles 5k window', () {
      final List<Message> window = window0(5000);
      final String deletedId = window[2500].id;
      final List<Message> networkPage = window
          .where((Message message) => message.id != deletedId)
          .toList();
      final List<Message> actual = reconcileStaleDeletionsInLoadedWindow(
        current: window,
        networkPage: networkPage,
      );
      expect(actual.length, 4999);
      expect(actual.any((Message message) => message.id == deletedId), isFalse);
    });

    test('networkPageStaleLocalIds handles large local sets', () {
      final List<Message> window = window0(2000);
      final String deletedId = window[100].id;
      final List<Message> networkPage = window
          .where((Message message) => message.id != deletedId)
          .toList();
      final List<String> stale = networkPageStaleLocalIds(
        localMessageIds: window.map((Message message) => message.id),
        networkPage: networkPage,
      );
      expect(stale, [deletedId]);
    });
  });
}
