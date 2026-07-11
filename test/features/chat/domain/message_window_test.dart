import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_window.dart';

Message _message(int index) {
  return Message(
    id: index.toString().padLeft(4, '0'),
    channelId: 'channel-1',
    authorId: 'author-1',
    authorName: 'Author',
    content: 'message $index',
    timestamp: DateTime.utc(2026).add(Duration(seconds: index)),
  );
}

List<Message> _build(int count) => List<Message>.generate(count, _message);

List<Message> _range(int start, int count) =>
    List<Message>.generate(count, (int offset) => _message(start + offset));

Message _localMessage(int index, MessageDeliveryState deliveryState) {
  return Message(
    id: index.toString().padLeft(4, '0'),
    channelId: 'channel-1',
    authorId: 'author-1',
    authorName: 'Author',
    content: 'local $index',
    timestamp: DateTime.utc(2026).add(Duration(seconds: index)),
    deliveryState: deliveryState,
  );
}

MessageWindowSnapshot _applied(WindowPageResult result) {
  expect(result, isA<WindowPageApplied>());
  return (result as WindowPageApplied).window;
}

void main() {
  group('trimMessageWindow', () {
    test('keepNewest keeps the newest entries and drops the oldest', () {
      final messages = _build(250);
      final trim = trimMessageWindow(messages, keepNewest: true);
      expect(trim.messages.length, kTrimmedMessageWindowSize);
      expect(
        trim.messages.first.id,
        messages[250 - kTrimmedMessageWindowSize].id,
      );
      expect(trim.messages.last.id, messages[249].id);
      expect(trim.droppedOlder, isTrue);
      expect(trim.droppedNewer, isFalse);
    });

    test('keepNewest false keeps the oldest entries and drops the newest', () {
      final messages = _build(250);
      final trim = trimMessageWindow(messages, keepNewest: false);
      expect(trim.messages.length, kTrimmedMessageWindowSize);
      expect(trim.messages.first.id, messages[0].id);
      expect(trim.messages.last.id, messages[kTrimmedMessageWindowSize - 1].id);
      expect(trim.droppedNewer, isTrue);
      expect(trim.droppedOlder, isFalse);
    });

    test('returns the same list unchanged when at the cap', () {
      final messages = _build(kMaxLoadedMessages);
      final trim = trimMessageWindow(messages, keepNewest: true);
      expect(identical(trim.messages, messages), isTrue);
      expect(trim.droppedOlder, isFalse);
      expect(trim.droppedNewer, isFalse);
    });

    test('respects a custom max', () {
      final messages = _build(10);
      final trim = trimMessageWindow(
        messages,
        keepNewest: true,
        max: 4,
        target: 4,
      );
      expect(trim.messages.length, 4);
      expect(trim.messages.first.id, messages[6].id);
      expect(trim.messages.last.id, messages[9].id);
      expect(trim.droppedOlder, isTrue);
    });

    test('trims to the target with headroom once it exceeds the cap', () {
      final messages = _build(kMaxLoadedMessages + 1);
      final trim = trimMessageWindow(messages, keepNewest: true);
      expect(trim.messages.length, kTrimmedMessageWindowSize);
      expect(trim.droppedOlder, isTrue);
      expect(trim.droppedNewer, isFalse);
    });
  });

  group('window page reducers', () {
    test('supersedes older pages when the leading boundary moved', () {
      final MessageWindowSnapshot window = MessageWindowSnapshot(
        messages: _range(100, 2),
        hasMoreOlder: true,
        hasMoreNewer: false,
      );

      final WindowPageResult result = applyOlderPage(
        window: window,
        page: _range(98, 2),
        requestedBeforeId: _message(99).id,
        pageIndicatesMoreOlder: true,
      );

      expect(result, isA<WindowPageSuperseded>());
    });

    test('supersedes newer pages when the trailing boundary moved', () {
      final MessageWindowSnapshot window = MessageWindowSnapshot(
        messages: _range(100, 2),
        hasMoreOlder: false,
        hasMoreNewer: true,
      );

      final WindowPageResult result = applyNewerPage(
        window: window,
        page: _range(102, 2),
        requestedAfterId: _message(100).id,
        pageIndicatesMoreNewer: true,
      );

      expect(result, isA<WindowPageSuperseded>());
    });

    test('older pages trim the newer side and reopen newer pagination', () {
      final MessageWindowSnapshot window = MessageWindowSnapshot(
        messages: _range(100, 150),
        hasMoreOlder: true,
        hasMoreNewer: false,
      );

      final MessageWindowSnapshot result = _applied(
        applyOlderPage(
          window: window,
          page: _range(0, 100),
          requestedBeforeId: window.messages.first.id,
          pageIndicatesMoreOlder: false,
        ),
      );

      expect(result.messages, hasLength(kTrimmedMessageWindowSize));
      expect(result.messages.first.id, _message(0).id);
      expect(
        result.messages.last.id,
        _message(kTrimmedMessageWindowSize - 1).id,
      );
      expect(result.hasMoreOlder, isFalse);
      expect(result.hasMoreNewer, isTrue);
    });

    test('newer pages trim the older side and reopen older pagination', () {
      final MessageWindowSnapshot window = MessageWindowSnapshot(
        messages: _range(0, 150),
        hasMoreOlder: false,
        hasMoreNewer: true,
      );

      final MessageWindowSnapshot result = _applied(
        applyNewerPage(
          window: window,
          page: _range(150, 100),
          requestedAfterId: window.messages.last.id,
          pageIndicatesMoreNewer: false,
        ),
      );

      expect(result.messages, hasLength(kTrimmedMessageWindowSize));
      expect(result.messages.first.id, _message(130).id);
      expect(result.messages.last.id, _message(249).id);
      expect(result.hasMoreOlder, isTrue);
      expect(result.hasMoreNewer, isFalse);
    });

    test('empty older page closes only older pagination', () {
      final List<Message> messages = _range(100, 2);
      final MessageWindowSnapshot result = _applied(
        applyOlderPage(
          window: MessageWindowSnapshot(
            messages: messages,
            hasMoreOlder: true,
            hasMoreNewer: true,
          ),
          page: const <Message>[],
          requestedBeforeId: messages.first.id,
          pageIndicatesMoreOlder: true,
        ),
      );

      expect(result.messages, same(messages));
      expect(result.hasMoreOlder, isFalse);
      expect(result.hasMoreNewer, isTrue);
    });

    test('empty newer page closes only newer pagination', () {
      final List<Message> messages = _range(100, 2);
      final MessageWindowSnapshot result = _applied(
        applyNewerPage(
          window: MessageWindowSnapshot(
            messages: messages,
            hasMoreOlder: true,
            hasMoreNewer: true,
          ),
          page: const <Message>[],
          requestedAfterId: messages.last.id,
          pageIndicatesMoreNewer: true,
        ),
      );

      expect(result.messages, same(messages));
      expect(result.hasMoreOlder, isTrue);
      expect(result.hasMoreNewer, isFalse);
    });

    test('older page landing exactly at the cap is not trimmed', () {
      final MessageWindowSnapshot window = MessageWindowSnapshot(
        messages: _range(100, 100),
        hasMoreOlder: true,
        hasMoreNewer: false,
      );

      final MessageWindowSnapshot result = _applied(
        applyOlderPage(
          window: window,
          page: _range(0, 100),
          requestedBeforeId: window.messages.first.id,
          pageIndicatesMoreOlder: true,
        ),
      );

      expect(result.messages, hasLength(kMaxLoadedMessages));
      expect(result.messages.first.id, _message(0).id);
      expect(result.messages.last.id, _message(199).id);
      expect(result.hasMoreNewer, isFalse);
    });

    test('newer page landing exactly at the cap is not trimmed', () {
      final MessageWindowSnapshot window = MessageWindowSnapshot(
        messages: _range(0, 100),
        hasMoreOlder: false,
        hasMoreNewer: true,
      );

      final MessageWindowSnapshot result = _applied(
        applyNewerPage(
          window: window,
          page: _range(100, 100),
          requestedAfterId: window.messages.last.id,
          pageIndicatesMoreNewer: true,
        ),
      );

      expect(result.messages, hasLength(kMaxLoadedMessages));
      expect(result.messages.first.id, _message(0).id);
      expect(result.messages.last.id, _message(199).id);
      expect(result.hasMoreOlder, isFalse);
    });

    test('older page trim preserves local-only tail rows', () {
      final Message sending = _localMessage(250, MessageDeliveryState.sending);
      final Message failed = _localMessage(251, MessageDeliveryState.failed);
      final List<Message> messages = <Message>[
        ..._range(100, 150),
        sending,
        failed,
      ];

      final MessageWindowSnapshot result = _applied(
        applyOlderPage(
          window: MessageWindowSnapshot(
            messages: messages,
            hasMoreOlder: true,
            hasMoreNewer: false,
          ),
          page: _range(0, 100),
          requestedBeforeId: messages.first.id,
          pageIndicatesMoreOlder: false,
        ),
      );

      expect(result.messages, hasLength(kTrimmedMessageWindowSize + 2));
      expect(
        result.messages[kTrimmedMessageWindowSize - 1].id,
        _message(kTrimmedMessageWindowSize - 1).id,
      );
      expect(result.messages[kTrimmedMessageWindowSize].id, sending.id);
      expect(result.messages.last.id, failed.id);
      expect(result.hasMoreNewer, isTrue);
    });

    test('newer page anchors on the server tail past local-only rows', () {
      final Message sending = _localMessage(210, MessageDeliveryState.sending);
      final List<Message> messages = <Message>[..._range(0, 150), sending];

      final MessageWindowSnapshot result = _applied(
        applyNewerPage(
          window: MessageWindowSnapshot(
            messages: messages,
            hasMoreOlder: false,
            hasMoreNewer: true,
          ),
          page: _range(150, 10),
          requestedAfterId: _message(149).id,
          pageIndicatesMoreNewer: false,
        ),
      );

      expect(result.messages, hasLength(161));
      expect(result.messages[159].id, _message(159).id);
      expect(result.messages.last.id, sending.id);
      expect(result.hasMoreNewer, isFalse);
    });

    test('supersedes newer pages when the window has no server tail', () {
      final WindowPageResult result = applyNewerPage(
        window: MessageWindowSnapshot(
          messages: <Message>[_localMessage(100, MessageDeliveryState.sending)],
          hasMoreOlder: false,
          hasMoreNewer: true,
        ),
        page: _range(101, 2),
        requestedAfterId: _localMessage(100, MessageDeliveryState.sending).id,
        pageIndicatesMoreNewer: false,
      );

      expect(result, isA<WindowPageSuperseded>());
    });

    test('supersedes pages against an empty window', () {
      const MessageWindowSnapshot window = MessageWindowSnapshot(
        messages: <Message>[],
        hasMoreOlder: true,
        hasMoreNewer: true,
      );

      expect(
        applyOlderPage(
          window: window,
          page: _range(0, 2),
          requestedBeforeId: _message(0).id,
          pageIndicatesMoreOlder: true,
        ),
        isA<WindowPageSuperseded>(),
      );
      expect(
        applyNewerPage(
          window: window,
          page: _range(0, 2),
          requestedAfterId: _message(0).id,
          pageIndicatesMoreNewer: true,
        ),
        isA<WindowPageSuperseded>(),
      );
    });
  });
}
