import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message_avatar.dart';

void main() {
  group('messageAuthorAvatarKey', () {
    test('is stable for the same author and avatar', () {
      // The key excludes the message id so the avatar survives the
      // optimistic->delivered id swap without re-fetching or fading.
      expect(
        messageAuthorAvatarKey(authorId: 'user-1', avatarHash: 'hash-a'),
        messageAuthorAvatarKey(authorId: 'user-1', avatarHash: 'hash-a'),
      );
    });

    test('changes when the avatar hash changes', () {
      expect(
        messageAuthorAvatarKey(authorId: 'user-1', avatarHash: 'hash-a'),
        isNot(messageAuthorAvatarKey(authorId: 'user-1', avatarHash: 'hash-b')),
      );
    });

    test('differs between authors', () {
      expect(
        messageAuthorAvatarKey(authorId: 'user-1', avatarHash: 'hash-a'),
        isNot(messageAuthorAvatarKey(authorId: 'user-2', avatarHash: 'hash-a')),
      );
    });

    test('a null hash is stable and distinct from a set hash', () {
      expect(
        messageAuthorAvatarKey(authorId: 'user-1', avatarHash: null),
        messageAuthorAvatarKey(authorId: 'user-1', avatarHash: null),
      );
      expect(
        messageAuthorAvatarKey(authorId: 'user-1', avatarHash: null),
        isNot(messageAuthorAvatarKey(authorId: 'user-1', avatarHash: 'hash-a')),
      );
    });
  });

  group('messageAuthorAvatarKeyFromDisplay', () {
    test('prefers resolved display hash over message payload hash', () {
      expect(
        messageAuthorAvatarKeyFromDisplay(
          authorId: 'user-1',
          displayAvatarHash: 'guild-hash',
          messageAvatarHash: 'global-hash',
        ),
        messageAuthorAvatarKey(authorId: 'user-1', avatarHash: 'guild-hash'),
      );
      expect(
        messageAuthorAvatarKeyFromDisplay(
          authorId: 'user-1',
          displayAvatarHash: 'guild-hash',
          messageAvatarHash: 'global-hash',
        ),
        isNot(
          messageAuthorAvatarKey(authorId: 'user-1', avatarHash: 'global-hash'),
        ),
      );
    });

    test('falls back to message hash when display hash is null', () {
      expect(
        messageAuthorAvatarKeyFromDisplay(
          authorId: 'user-1',
          displayAvatarHash: null,
          messageAvatarHash: 'global-hash',
        ),
        messageAuthorAvatarKey(authorId: 'user-1', avatarHash: 'global-hash'),
      );
    });
  });
}
