import 'package:fluxer_app/features/chat/utils/channel_search_utils.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:test/test.dart';

void main() {
  group('resolveUserIdByTag', () {
    const Member alice = Member(
      id: 'user-1',
      username: 'alice',
      globalName: 'Alice A',
      nickname: 'Al',
    );
    const Member bob = Member(id: 'user-2', username: 'bob');

    test('matches username, display name, and discriminator tag', () {
      expect(
        resolveUserIdByTag('alice', members: const <Member>[alice, bob]),
        'user-1',
      );
      expect(
        resolveUserIdByTag('Alice A', members: const <Member>[alice, bob]),
        'user-1',
      );
      expect(
        resolveUserIdByTag(
          'bob#1234',
          members: const <Member>[alice, bob],
          discriminators: const <String, String>{'user-2': '1234'},
        ),
        'user-2',
      );
    });

    test('matches partial username like channel name fallback', () {
      expect(
        resolveUserIdByTag('ali', members: const <Member>[alice, bob]),
        'user-1',
      );
    });

    test('returns null when no member matches', () {
      expect(
        resolveUserIdByTag('carol', members: const <Member>[alice, bob]),
        isNull,
      );
    });
  });
}
