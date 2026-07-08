import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/settings/domain/guild/roles/guild_role_order.dart';
import 'package:fluxer_app/features/settings/domain/guild/roles/guild_role_reorder.dart';

void main() {
  group('createGuildRoleOrderPayload', () {
    test('builds descending positions excluding @everyone', () {
      final List<GuildRolePositionPayloadItem> payload =
          createGuildRoleOrderPayload(
            guildId: 'guild-1',
            orderedRoleIds: <String>['guild-1', 'role-b', 'role-a'],
          );
      expect(payload, hasLength(2));
      expect(payload.first.id, 'role-b');
      expect(payload.first.position, 2);
      expect(payload.last.position, 1);
    });
  });

  group('createSubmittableGuildRoleOrderIds', () {
    test('excludes locked roles', () {
      final List<String> actual = createSubmittableGuildRoleOrderIds(
        guildId: 'guild-1',
        orderedRoleIds: <String>['role-a', 'role-b', 'role-c'],
        isRoleLocked: (String roleId) => roleId == 'role-b',
      );
      expect(actual, <String>['role-a', 'role-c']);
    });
  });

  group('isValidGuildRoleHierarchyOrder', () {
    test('allows @everyone at the end', () {
      expect(
        isValidGuildRoleHierarchyOrder(
          guildId: 'guild-1',
          orderedRoleIds: <String>['role-a', 'role-b', 'guild-1'],
        ),
        isTrue,
      );
    });

    test('rejects roles below @everyone', () {
      expect(
        isValidGuildRoleHierarchyOrder(
          guildId: 'guild-1',
          orderedRoleIds: <String>['role-a', 'guild-1', 'role-b'],
        ),
        isFalse,
      );
    });
  });

  group('createGuildRoleMovePreview', () {
    const String guildId = 'guild-1';
    final List<MemberRole> roles = <MemberRole>[
      const MemberRole(id: guildId, name: '@everyone', color: 0),
      const MemberRole(id: '300', name: 'High', color: 0, position: 3),
      const MemberRole(id: '200', name: 'Mid', color: 0, position: 2),
      const MemberRole(id: '100', name: 'Low', color: 0, position: 1),
    ];

    test('rejects moving @everyone role', () {
      final GuildRoleMovePreview? preview = createGuildRoleMovePreview(
        roles: roles,
        guildId: guildId,
        draggedRoleId: guildId,
        targetRoleId: '200',
        position: GuildRoleReorderPosition.before,
        isRoleLocked: (_) => false,
      );
      expect(preview, isNull);
    });

    test('moves unlocked role before target', () {
      final GuildRoleMovePreview? preview = createGuildRoleMovePreview(
        roles: roles,
        guildId: guildId,
        draggedRoleId: '100',
        targetRoleId: '300',
        position: GuildRoleReorderPosition.before,
        isRoleLocked: (_) => false,
      );
      expect(preview, isNotNull);
      expect(preview!.order.map((MemberRole role) => role.id), <String>[
        guildId,
        '100',
        '300',
        '200',
      ]);
    });
  });
}
