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
}
