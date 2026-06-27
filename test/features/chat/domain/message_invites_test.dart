import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';

void main() {
  Message msg(String content) => Message(
    id: '1',
    channelId: '2',
    authorId: '3',
    authorName: 'author',
    content: content,
    timestamp: DateTime.utc(2026),
  );

  group('Message.invites', () {
    test('returns empty when no invite links', () {
      expect(msg('hello world').invites, isEmpty);
    });

    test('extracts a single fluxer.gg code', () {
      expect(msg('join https://fluxer.gg/abcd').invites, <String>['abcd']);
    });

    test('extracts a fluxer.app/invite code', () {
      expect(msg('https://web.fluxer.app/invite/wxyz here').invites, <String>[
        'wxyz',
      ]);
    });

    test('ignores fluxer.gg/invite/ paths', () {
      expect(msg('https://fluxer.gg/invite/nope').invites, isEmpty);
    });

    test('extracts multiple distinct codes', () {
      expect(msg('fluxer.gg/one and fluxer.gg/two').invites, <String>[
        'one',
        'two',
      ]);
    });

    test('dedupes repeated codes', () {
      expect(msg('fluxer.gg/dup fluxer.gg/dup').invites, <String>['dup']);
    });

    test('caps at 10 codes', () {
      final content = List<String>.generate(
        15,
        (int i) => 'fluxer.gg/code$i',
      ).join(' ');
      expect(msg(content).invites, hasLength(10));
    });
  });

  group('Message.themes', () {
    test('returns empty when no theme links', () {
      expect(msg('no themes here').themes, isEmpty);
    });

    test('extracts a theme id', () {
      expect(
        msg('check https://web.fluxer.app/theme/dark1 out').themes,
        <String>['dark1'],
      );
    });

    test('dedupes repeated theme ids', () {
      expect(
        msg(
          'https://web.fluxer.app/theme/xy https://web.fluxer.app/theme/xy',
        ).themes,
        <String>['xy'],
      );
    });
  });
}
