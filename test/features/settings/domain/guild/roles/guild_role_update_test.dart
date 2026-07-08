import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/settings/domain/guild/roles/guild_role_update.dart';

void main() {
  group('applyGuildRoleUpdate', () {
    const MemberRole original = MemberRole(
      id: 'role-1',
      name: 'Moderator',
      color: 0xFF112233,
      position: 2,
      mentionable: true,
      permissions: 8,
    );

    test('returns original role when update is null', () {
      expect(applyGuildRoleUpdate(original, null), original);
    });

    test('merges partial updates', () {
      const GuildRoleUpdate update = GuildRoleUpdate(
        id: 'role-1',
        name: 'Staff',
        permissions: 16,
      );
      final MemberRole actual = applyGuildRoleUpdate(original, update);
      expect(actual.name, 'Staff');
      expect(actual.color, original.color);
      expect(actual.permissions, 16);
      expect(actual.mentionable, true);
    });
  });

  group('mergeGuildRoleUpdate', () {
    const MemberRole original = MemberRole(
      id: 'role-1',
      name: 'Moderator',
      color: 0xFF112233,
      permissions: 8,
    );

    test('returns null when merged update matches original', () {
      final GuildRoleUpdate? actual = mergeGuildRoleUpdate(
        original: original,
        existing: null,
        incoming: const GuildRoleUpdate(id: 'role-1', name: 'Moderator'),
      );
      expect(actual, isNull);
    });

    test('returns merged update when values differ', () {
      final GuildRoleUpdate? actual = mergeGuildRoleUpdate(
        original: original,
        existing: const GuildRoleUpdate(id: 'role-1', color: 0xFFFFFF),
        incoming: const GuildRoleUpdate(id: 'role-1', name: 'Staff'),
      );
      expect(actual?.name, 'Staff');
      expect(actual?.color, 0xFFFFFF);
    });
  });
}
