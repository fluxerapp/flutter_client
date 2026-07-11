import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_list_anchor.dart';

Message _msg(String id) {
  return Message(
    id: id,
    channelId: 'channel-1',
    authorId: 'author-1',
    authorName: 'Author',
    content: 'message $id',
    timestamp: DateTime.utc(2026),
  );
}

List<Message> _list(List<String> ids) => ids.map(_msg).toList();

void main() {
  group('computeLeadingEdgeDelta', () {
    test('append-newer-only reports the appended count', () {
      final delta = computeLeadingEdgeDelta(
        _list(['a', 'b', 'c']),
        _list(['a', 'b', 'c', 'd', 'e']),
      );
      expect(delta.addedNewest, 2);
      expect(delta.removedNewest, 0);
    });

    test('single live append reports one added', () {
      final delta = computeLeadingEdgeDelta(
        _list(['a', 'b']),
        _list(['a', 'b', 'c']),
      );
      expect(delta.addedNewest, 1);
      expect(delta.removedNewest, 0);
    });

    test('prepend-older-only is a zero delta', () {
      final delta = computeLeadingEdgeDelta(
        _list(['c', 'd', 'e']),
        _list(['a', 'b', 'c', 'd', 'e']),
      );
      expect(delta.isUnchanged, isTrue);
    });

    test('trim-newest (load-older over cap) reports the dropped count', () {
      // Prepended x,y at the oldest end; dropped d,e from the newest end.
      final delta = computeLeadingEdgeDelta(
        _list(['a', 'b', 'c', 'd', 'e']),
        _list(['x', 'y', 'a', 'b', 'c']),
      );
      expect(delta.addedNewest, 0);
      expect(delta.removedNewest, 2);
    });

    test(
      'mixed load-newer (append end + drop oldest) reports only the append',
      () {
        // Dropped a,b from the oldest end; appended d,e,f at the newest end.
        final delta = computeLeadingEdgeDelta(
          _list(['a', 'b', 'c']),
          _list(['c', 'd', 'e', 'f']),
        );
        expect(delta.addedNewest, 3);
        expect(delta.removedNewest, 0);
      },
    );

    test('in-place update of the same window is a zero delta', () {
      final delta = computeLeadingEdgeDelta(
        _list(['a', 'b', 'c']),
        _list(['a', 'b', 'c']),
      );
      expect(delta.isUnchanged, isTrue);
    });

    test('middle delete does not touch the leading edge', () {
      final delta = computeLeadingEdgeDelta(
        _list(['a', 'b', 'c']),
        _list(['a', 'c']),
      );
      expect(delta.isUnchanged, isTrue);
    });

    test('delete of the newest message reports one removed', () {
      final delta = computeLeadingEdgeDelta(
        _list(['a', 'b', 'c']),
        _list(['a', 'b']),
      );
      expect(delta.addedNewest, 0);
      expect(delta.removedNewest, 1);
    });

    test('empty previous list is a zero delta (initial load)', () {
      expect(
        computeLeadingEdgeDelta(const [], _list(['a'])).isUnchanged,
        isTrue,
      );
    });

    test('empty next list is a zero delta (clear)', () {
      expect(
        computeLeadingEdgeDelta(_list(['a']), const []).isUnchanged,
        isTrue,
      );
    });

    test('fully divergent windows are a zero delta (channel switch)', () {
      final delta = computeLeadingEdgeDelta(
        _list(['a', 'b']),
        _list(['x', 'y']),
      );
      expect(delta.isUnchanged, isTrue);
    });
  });

  group('computeLeadingEdgeKeyDelta', () {
    test('counts every rendered item added at the newest edge', () {
      final delta = computeLeadingEdgeKeyDelta(
        const <Object>['day-1', 'message-1'],
        const <Object>['day-1', 'message-1', 'day-2', 'message-2'],
      );

      expect(delta.addedNewest, 2);
      expect(delta.removedNewest, 0);
    });

    test('reports zero when a collapsed tail group absorbs a message', () {
      final delta = computeLeadingEdgeKeyDelta(
        const <Object>['day-1', 'blocked-group-1'],
        const <Object>['day-1', 'blocked-group-1'],
      );

      expect(delta.isUnchanged, isTrue);
    });

    test('reports one when a new collapsed tail group is rendered', () {
      final delta = computeLeadingEdgeKeyDelta(
        const <Object>['day-1', 'message-1'],
        const <Object>['day-1', 'message-1', 'blocked-group-2'],
      );

      expect(delta.addedNewest, 1);
      expect(delta.removedNewest, 0);
    });
  });
}
