import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart'
    show ProviderFamily, StreamProviderFamily;
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/permissions/permission_resolver.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/domain/nagbar_dismissals_state.dart';
import 'package:fluxer_app/features/shell/providers/nagbar/nagbar_providers.dart';

final StreamProviderFamily<Server?, String> guildMfaServerRowProvider =
    StreamProvider.autoDispose.family<Server?, String>(
      (Ref ref, String guildId) =>
          ref.watch(fluxerDatabaseProvider).guildDao.watchServerById(guildId),
    );

final StreamProviderFamily<List<Role>, String> guildMfaRoleRowsProvider =
    StreamProvider.autoDispose.family<List<Role>, String>(
      (Ref ref, String guildId) =>
          ref.watch(fluxerDatabaseProvider).roleDao.watchRoles(guildId),
    );

final ProviderFamily<bool, String> guildMfaRequirementNagbarVisibleProvider =
    Provider.autoDispose.family<bool, String>(
      _guildMfaRequirementNagbarVisible,
    );

bool _guildMfaRequirementNagbarVisible(Ref ref, String guildId) {
  if (guildId.isEmpty) {
    return false;
  }
  final ({String userId, bool lacksMfa}) user = ref.watch(
    userSettingsViewModelProvider.select(
      (UserSettingsViewState s) => (userId: s.userId, lacksMfa: s.lacksMfa),
    ),
  );
  if (!user.lacksMfa) {
    return false;
  }
  final bool dismissed = ref.watch(
    nagbarDismissalsProvider.select(
      (NagbarDismissalsState s) =>
          s.guildMfaRequirementDismissed.contains(guildId),
    ),
  );
  if (dismissed) {
    return false;
  }
  final Server? server = ref.watch(guildMfaServerRowProvider(guildId)).value;
  if (server == null ||
      !isGuildMfaRestricted(
        guildMfaLevel: server.mfaLevel,
        isGuildOwner: server.ownerId == user.userId,
        userLacksMfa: true,
      )) {
    return false;
  }
  final String? roleIdsJson = ref
      .watch(currentUserMemberIdentityProvider(guildId))
      .value
      ?.roleIdsJson;
  final List<Role> roles =
      ref.watch(guildMfaRoleRowsProvider(guildId)).value ?? const <Role>[];
  final Set<String> memberRoleIds = roleIdsJson == null || roleIdsJson.isEmpty
      ? const <String>{}
      : Set<String>.from(jsonDecode(roleIdsJson) as List<dynamic>);
  Role? everyoneRole;
  for (final Role role in roles) {
    if (role.id == guildId) {
      everyoneRole = role;
      break;
    }
  }
  final int permissions = resolveGuildPermissions(
    guildOwnerId: server.ownerId ?? '',
    currentUserId: user.userId,
    everyonePermissions: everyoneRolePermissionsFromString(
      everyoneRole?.permissions,
    ),
    memberRoles: <MemberRole>[
      for (final Role role in roles)
        if (memberRoleIds.contains(role.id)) MemberRole.fromRow(role),
    ],
  );
  return (permissions & elevatedPermissions) != 0;
}
