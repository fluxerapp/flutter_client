import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/data/composer_autocomplete_members.dart';
import 'package:fluxer_app/features/members/domain/member.dart';

Member _member({String? avatar, String? guildAvatar}) {
  return Member(
    id: '1',
    username: 'user',
    avatar: avatar,
    guildAvatar: guildAvatar,
  );
}

void main() {
  group('mentionMemberAvatarUrl', () {
    test('uses the guild avatar when a guild profile picture is set', () {
      final String? url = mentionMemberAvatarUrl(
        member: _member(avatar: 'guild_avatar', guildAvatar: 'guild_avatar'),
        guildId: '10',
      );
      expect(url, contains('/guilds/10/users/1/avatars/guild_avatar'));
      expect(url, isNot(contains('/avatars/1/guild_avatar')));
    });

    test('uses the global avatar when the guild profile inherits it', () {
      final String? url = mentionMemberAvatarUrl(
        member: _member(avatar: 'user_avatar'),
        guildId: '10',
      );
      expect(url, contains('/avatars/1/user_avatar'));
      expect(url, isNot(contains('/guilds/')));
    });

    test('uses the global avatar outside a guild', () {
      final String? url = mentionMemberAvatarUrl(
        member: _member(avatar: 'user_avatar', guildAvatar: 'guild_avatar'),
      );
      expect(url, contains('/avatars/1/user_avatar'));
    });

    test('returns null when the guild avatar is unset', () {
      expect(mentionMemberAvatarUrl(member: _member(), guildId: '10'), isNull);
    });
  });
}
