import 'package:fluxer_app/core/permissions/permission.dart';

const List<Permission> membersPagePermissions = <Permission>[
  Permission.manageGuild,
  Permission.manageRoles,
  Permission.manageNicknames,
  Permission.banMembers,
  Permission.moderateMembers,
  Permission.kickMembers,
];

int get membersPagePermissionsMask => membersPagePermissions.fold<int>(
  0,
  (int mask, Permission permission) => mask | permission.value,
);

bool hasMembersPagePermission(int permissions) {
  return (permissions & membersPagePermissionsMask) != 0;
}
