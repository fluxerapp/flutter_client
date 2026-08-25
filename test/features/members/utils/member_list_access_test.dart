import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/members/utils/member_list_access.dart';

void main() {
  const Guild guildWithDisabledMemberList = Guild(
    id: 'guild-1',
    name: 'Test Guild',
    disabledOperations: 1 << 6,
  );

  test('permission denied takes precedence over disabled updates', () {
    final MemberListAccess access = resolveMemberListAccess(
      currentUserId: 'user-1',
      permissionBits: 0,
      permissionBitsResolved: true,
      guild: guildWithDisabledMemberList,
    );

    expect(access.canSubscribe, isFalse);
    expect(
      access.unavailableReason,
      MemberListUnavailableReason.permissionDenied,
    );
  });

  test('updates disabled when user can view members', () {
    final MemberListAccess access = resolveMemberListAccess(
      currentUserId: 'user-1',
      permissionBits: Permission.viewChannelMembers.value,
      permissionBitsResolved: true,
      guild: guildWithDisabledMemberList,
    );

    expect(access.canSubscribe, isFalse);
    expect(
      access.unavailableReason,
      MemberListUnavailableReason.updatesDisabled,
    );
  });

  test('allows subscription when permission and updates are available', () {
    final MemberListAccess access = resolveMemberListAccess(
      currentUserId: 'user-1',
      permissionBits: Permission.viewChannelMembers.value,
      permissionBitsResolved: true,
      guild: const Guild(id: 'guild-1', name: 'Test Guild'),
    );

    expect(access.canSubscribe, isTrue);
    expect(access.unavailableReason, isNull);
  });

  test(
    'shows unavailable when updates are disabled before permission resolves',
    () {
      final MemberListAccess access = resolveMemberListAccess(
        currentUserId: 'user-1',
        permissionBits: null,
        permissionBitsResolved: false,
        guild: guildWithDisabledMemberList,
      );

      expect(access.canSubscribe, isFalse);
      expect(
        access.unavailableReason,
        MemberListUnavailableReason.updatesDisabled,
      );
    },
  );

  test('does not deny access before current user is known', () {
    final MemberListAccess access = resolveMemberListAccess(
      currentUserId: null,
      permissionBits: 0,
      permissionBitsResolved: true,
      guild: guildWithDisabledMemberList,
    );

    expect(
      access.unavailableReason,
      MemberListUnavailableReason.updatesDisabled,
    );
  });
}
