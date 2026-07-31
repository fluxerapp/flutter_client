import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/permissions/permission_resolver.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/members/domain/member_role_management.dart';
import 'package:fluxer_app/features/members/providers/guild_roles_provider.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:fluxer_app/features/profile/utils/profile_menu_capabilities.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_dart/export.dart';

class GuildMemberMenuState {
  const GuildMemberMenuState({
    required this.capabilities,
    required this.allGuildRoles,
    required this.memberRoleIds,
    required this.canManageRoles,
    required this.isGuildOwner,
    required this.viewerHighestRole,
    required this.shouldShowRolesSubmenu,
    required this.currentNick,
  });

  final ProfileMenuCapabilities capabilities;
  final List<MemberRole> allGuildRoles;
  final Set<String> memberRoleIds;
  final bool canManageRoles;
  final bool isGuildOwner;
  final MemberRole? viewerHighestRole;
  final bool shouldShowRolesSubmenu;
  final String? currentNick;
}

Future<GuildMemberMenuState?> resolveGuildMemberMenuState({
  required WidgetRef ref,
  required String guildId,
  required GuildMemberResponse member,
}) async {
  final String ownUserId = ref.read(
    userSettingsViewModelProvider.select((settings) => settings.userId),
  );
  if (ownUserId.isEmpty) {
    return null;
  }

  final db.FluxerDatabase database = ref.read(fluxerDatabaseProvider);
  final Map<String, db.Role> rolesById =
      ref.read(guildRolesByIdProvider(guildId)).value ??
      <String, db.Role>{
        for (final db.Role role in await database.roleDao.getRoles(guildId))
          role.id: role,
      };
  final List<MemberRole> allGuildRoles = rolesById.values
      .map(MemberRole.fromRow)
      .toList(growable: false);
  final Map<String, MemberRole> memberRoleById = <String, MemberRole>{
    for (final MemberRole role in allGuildRoles) role.id: role,
  };
  final Set<String> memberRoleIds = member.roles.toSet();
  final List<MemberRole> memberRoles = resolveMemberRolesFromIds(
    roleIds: member.roles,
    roleById: memberRoleById,
  );

  final db.Server? guildInfo = await database.guildDao.getServerById(guildId);
  final String? ownerId = guildInfo?.ownerId;
  final bool isGuildOwner = ownerId != null && ownerId == ownUserId;
  final int everyonePermissions = memberRoleById[guildId]?.permissions ?? 0;

  final String? viewerRoleIdsJson = ref
      .read(currentUserMemberIdentityProvider(guildId))
      .value
      ?.roleIdsJson;
  final List<String> viewerRoleIds =
      (viewerRoleIdsJson != null && viewerRoleIdsJson.isNotEmpty)
      ? List<String>.from(jsonDecode(viewerRoleIdsJson) as List<dynamic>)
      : <String>[];
  final List<MemberRole> viewerRoles = viewerRoleIds
      .where((String id) => id != guildId)
      .map((String id) => memberRoleById[id])
      .whereType<MemberRole>()
      .toList(growable: false);
  final MemberRole? viewerHighestRole = highestRole(viewerRoles);
  final int viewerPermissions = resolveGuildPermissions(
    guildOwnerId: ownerId ?? '',
    currentUserId: ownUserId,
    everyonePermissions: everyonePermissions,
    memberRoles: viewerRoles,
  );
  final bool canManageRoles = hasPermission(
    viewerPermissions,
    Permission.manageRoles,
  );

  final List<MemberRole> targetHierarchyRoles = memberRoles
      .where((MemberRole role) => role.id != guildId)
      .toList(growable: false);
  final int targetPermissions = resolveGuildPermissions(
    guildOwnerId: ownerId ?? '',
    currentUserId: member.user.id,
    everyonePermissions: everyonePermissions,
    memberRoles: targetHierarchyRoles,
  );
  final DateTime? timeoutUntil = member.communicationDisabledUntil;
  final bool isTimedOut =
      timeoutUntil != null && timeoutUntil.isAfter(DateTime.now());
  final bool hasAssignableRoles = guildHasAssignableRoles(
    guildId: guildId,
    allGuildRoles: allGuildRoles,
  );

  final ProfileMenuCapabilities capabilities = resolveProfileMenuCapabilities(
    isCurrentUser: ownUserId == member.user.id,
    hasGuildMember: true,
    targetIsTimedOut: isTimedOut,
    targetIsBot: member.user.bot ?? false,
    viewerIsOwner: isGuildOwner,
    viewerPermissions: viewerPermissions,
    canManageTarget: canManageTarget(
      currentUserId: ownUserId,
      ownerId: ownerId,
      viewerHighest: viewerHighestRole,
      targetHighest: highestRole(targetHierarchyRoles),
      targetIsOwner: ownerId != null && ownerId == member.user.id,
    ),
    targetHasAdministrator: hasPermission(
      targetPermissions,
      Permission.administrator,
    ),
    hasAssignableRoles: hasAssignableRoles,
  );

  return GuildMemberMenuState(
    capabilities: capabilities,
    allGuildRoles: allGuildRoles,
    memberRoleIds: memberRoleIds,
    canManageRoles: canManageRoles,
    isGuildOwner: isGuildOwner,
    viewerHighestRole: viewerHighestRole,
    shouldShowRolesSubmenu: shouldShowRolesSubmenu(
      hasAssignableRoles: hasAssignableRoles,
      canManageRoles: canManageRoles,
      memberHasRoles: memberRoles.any(
        (MemberRole role) => !role.isEveryoneRole(guildId),
      ),
    ),
    currentNick: member.nick,
  );
}

Future<GuildMemberMenuState?> resolveGuildMemberMenuStateForUser({
  required WidgetRef ref,
  required String guildId,
  required String userId,
}) async {
  final db.FluxerDatabase database = ref.read(fluxerDatabaseProvider);
  final db.Member? memberRow = await database.memberDao.getMemberByUserId(
    userId,
    guildId,
  );
  final db.User? userRow = await database.userDao.getUserById(userId);
  if (memberRow == null || userRow == null) {
    return null;
  }
  final List<String> roleIds = memberRow.roleIdsJson.isNotEmpty
      ? List<String>.from(jsonDecode(memberRow.roleIdsJson) as List<dynamic>)
      : <String>[];
  final GuildMemberResponse member = GuildMemberResponse(
    user: UserPartialResponse(
      id: userRow.id,
      username: userRow.username,
      discriminator: userRow.discriminator,
      globalName: userRow.globalName,
      avatar: userRow.avatar,
      avatarColor: userRow.avatarColor,
      flags: 0,
      bot: userRow.bot,
      system: userRow.system,
    ),
    roles: roleIds,
    nick: memberRow.nick,
    avatar: memberRow.serverAvatar,
    joinedAt: memberRow.joinedAt ?? DateTime.fromMillisecondsSinceEpoch(0),
    communicationDisabledUntil: memberRow.communicationDisabledUntil,
    mute: false,
    deaf: false,
  );
  return resolveGuildMemberMenuState(
    ref: ref,
    guildId: guildId,
    member: member,
  );
}
