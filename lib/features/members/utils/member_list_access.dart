import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';

enum MemberListUnavailableReason { permissionDenied, updatesDisabled }

class MemberListAccess {
  const MemberListAccess({this.unavailableReason});

  final MemberListUnavailableReason? unavailableReason;

  bool get canSubscribe => unavailableReason == null;
}

MemberListAccess resolveMemberListAccess({
  required String? currentUserId,
  required int? permissionBits,
  required bool permissionBitsResolved,
  required Guild? guild,
}) {
  final bool lacksMemberViewPermission =
      currentUserId != null &&
      currentUserId.isNotEmpty &&
      permissionBitsResolved &&
      permissionBits != null &&
      !hasPermission(permissionBits, Permission.viewChannelMembers);

  if (lacksMemberViewPermission) {
    return const MemberListAccess(
      unavailableReason: MemberListUnavailableReason.permissionDenied,
    );
  }

  if (guild != null && guild.isMemberListUpdatesDisabled) {
    return const MemberListAccess(
      unavailableReason: MemberListUnavailableReason.updatesDisabled,
    );
  }

  return const MemberListAccess();
}
