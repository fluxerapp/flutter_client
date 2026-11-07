import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/members/domain/member.dart';

int resolveGuildPermissions({
  required String guildOwnerId,
  required String currentUserId,
  required int everyonePermissions,
  required List<MemberRole> memberRoles,
  bool guildMfaRestricted = false,
}) {
  if (currentUserId == guildOwnerId) {
    return allPermissions;
  }

  var permissions = everyonePermissions;

  for (final role in memberRoles) {
    permissions |= role.permissions;
  }

  if (permissions & Permission.administrator.value != 0) {
    permissions = allPermissions;
  }

  return applyGuildMfaRestriction(permissions, restricted: guildMfaRestricted);
}
