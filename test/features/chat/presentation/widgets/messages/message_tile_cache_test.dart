import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_tile_cache.dart';

Message _message({String content = 'hello'}) {
  return Message(
    id: 'msg-1',
    channelId: 'ch-1',
    authorId: 'user-1',
    authorName: 'User',
    content: content,
    timestamp: DateTime.utc(2026),
  );
}

void main() {
  group('MessageTileCache', () {
    test('reuses the built widget while the signature is unchanged', () {
      final MessageTileCache cache = MessageTileCache();
      int builds = 0;
      Widget build() {
        builds++;
        return SizedBox(width: builds.toDouble());
      }

      final Widget first = cache.resolve('a', (1, 'x'), build);
      final Widget second = cache.resolve('a', (1, 'x'), build);

      expect(builds, 1);
      expect(identical(first, second), isTrue);
    });

    test('rebuilds when the signature changes', () {
      final MessageTileCache cache = MessageTileCache();
      int builds = 0;
      Widget build() {
        builds++;
        return SizedBox(width: builds.toDouble());
      }

      final Widget first = cache.resolve('a', (1, 'x'), build);
      final Widget second = cache.resolve('a', (2, 'x'), build);

      expect(builds, 2);
      expect(identical(first, second), isFalse);
    });

    test('compares record fields by identity for distinct objects', () {
      final MessageTileCache cache = MessageTileCache();
      final Object objA = Object();
      final Object objB = Object();
      int builds = 0;
      Widget build() {
        builds++;
        return SizedBox(width: builds.toDouble());
      }

      cache
        ..resolve('a', (objA, 1), build)
        ..resolve('a', (objA, 1), build);
      expect(builds, 1, reason: 'same instance is a cache hit');

      cache.resolve('a', (objB, 1), build);
      expect(builds, 2, reason: 'distinct instance is a cache miss');
    });

    test('reuses tiles when only the message instance changes', () {
      final MessageTileCache cache = MessageTileCache();
      final Message firstMessage = _message();
      final Message secondMessage = _message();
      int builds = 0;
      Widget build() {
        builds++;
        return SizedBox(width: builds.toDouble());
      }

      final Widget first = cache.resolve(
        firstMessage.id,
        (1,),
        build,
        message: firstMessage,
      );
      final Widget second = cache.resolve(
        secondMessage.id,
        (1,),
        build,
        message: secondMessage,
      );

      expect(builds, 1);
      expect(identical(first, second), isTrue);
    });

    test('rebuilds when render-relevant message content changes', () {
      final MessageTileCache cache = MessageTileCache();
      int builds = 0;
      Widget build() {
        builds++;
        return SizedBox(width: builds.toDouble());
      }

      cache.resolve('msg-1', (1,), build, message: _message(content: 'a'));
      cache.resolve('msg-1', (1,), build, message: _message(content: 'b'));

      expect(builds, 2);
    });

    test('retainKeys drops absent ids, forcing a rebuild', () {
      final MessageTileCache cache = MessageTileCache();
      int builds = 0;
      Widget build() {
        builds++;
        return SizedBox(width: builds.toDouble());
      }

      cache
        ..resolve('a', (1,), build)
        ..retainKeys(<String>{'b'})
        ..resolve('a', (1,), build);

      expect(builds, 2);
    });

    test('clear empties the cache', () {
      final MessageTileCache cache = MessageTileCache();
      int builds = 0;
      Widget build() {
        builds++;
        return SizedBox(width: builds.toDouble());
      }

      cache
        ..resolve('a', (1,), build)
        ..clear()
        ..resolve('a', (1,), build);

      expect(builds, 2);
    });
  });
}
