import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/members/domain/member.dart';

class ProfileMenuCapabilities {
  const ProfileMenuCapabilities({
    required this.canChangeNickname,
    required this.canTransfer,
    required this.showTimeout,
    required this.showRemoveTimeout,
    required this.canKick,
    required this.canBan,
    required this.showManageRoles,
    required this.showCommunityMute,
    required this.showCommunityDeafen,
    required this.showDisconnectFromVoice,
  });

  final bool canChangeNickname;

  final bool canTransfer;

  final bool showTimeout;

  final bool showRemoveTimeout;

  final bool canKick;

  final bool canBan;

  final bool showManageRoles;

  final bool showCommunityMute;

  final bool showCommunityDeafen;

  final bool showDisconnectFromVoice;

  static const ProfileMenuCapabilities none = ProfileMenuCapabilities(
    canChangeNickname: false,
    canTransfer: false,
    showTimeout: false,
    showRemoveTimeout: false,
    canKick: false,
    canBan: false,
    showManageRoles: false,
    showCommunityMute: false,
    showCommunityDeafen: false,
    showDisconnectFromVoice: false,
  );
}

MemberRole? highestRole(List<MemberRole> roles) {
  MemberRole? highest;
  for (final MemberRole role in roles) {
    if (highest == null ||
        role.position > highest.position ||
        (role.position == highest.position &&
            BigInt.parse(role.id) < BigInt.parse(highest.id))) {
      highest = role;
    }
  }
  return highest;
}

bool canManageTarget({
  required String currentUserId,
  required String? ownerId,
  required MemberRole? viewerHighest,
  required MemberRole? targetHighest,
  required bool targetIsOwner,
}) {
  if (ownerId != null && ownerId == currentUserId) {
    return true;
  }
  if (targetIsOwner) {
    return false;
  }
  if (viewerHighest == null) {
    return false;
  }
  if (targetHighest == null) {
    return true;
  }
  if (viewerHighest.position != targetHighest.position) {
    return viewerHighest.position > targetHighest.position;
  }
  return BigInt.parse(viewerHighest.id) < BigInt.parse(targetHighest.id);
}

ProfileMenuCapabilities resolveProfileMenuCapabilities({
  required bool isCurrentUser,
  required bool hasGuildMember,
  required bool targetIsTimedOut,
  required bool targetIsBot,
  required bool viewerIsOwner,
  required int viewerPermissions,
  required bool canManageTarget,
  required bool targetHasAdministrator,
  required bool hasAssignableRoles,
}) {
  final bool mod = !isCurrentUser && canManageTarget;

  final bool canKick =
      mod &&
      hasGuildMember &&
      hasPermission(viewerPermissions, Permission.kickMembers);
  final bool canBan =
      mod && hasPermission(viewerPermissions, Permission.banMembers);
  final bool canTimeout =
      mod &&
      hasGuildMember &&
      hasPermission(viewerPermissions, Permission.moderateMembers) &&
      !targetHasAdministrator;

  final bool canChangeNickname =
      hasGuildMember &&
      ((isCurrentUser &&
              hasPermission(viewerPermissions, Permission.changeNickname) &&
              !targetIsTimedOut) ||
          (hasPermission(viewerPermissions, Permission.manageNicknames) &&
              canManageTarget));

  final bool canTransfer =
      !isCurrentUser && !targetIsBot && viewerIsOwner && hasGuildMember;
  final bool canVoiceModerate =
      mod &&
      hasGuildMember &&
      hasPermission(viewerPermissions, Permission.muteMembers);
  final bool canDisconnectFromVoice =
      mod &&
      hasGuildMember &&
      hasPermission(viewerPermissions, Permission.moveMembers);

  return ProfileMenuCapabilities(
    canChangeNickname: canChangeNickname,
    canTransfer: canTransfer,
    showTimeout: canTimeout && !targetIsTimedOut,
    showRemoveTimeout: canTimeout && targetIsTimedOut,
    canKick: canKick,
    canBan: canBan,
    showManageRoles:
        hasGuildMember &&
        hasAssignableRoles &&
        hasPermission(viewerPermissions, Permission.manageRoles),
    showCommunityMute: canVoiceModerate,
    showCommunityDeafen: canVoiceModerate,
    showDisconnectFromVoice: canDisconnectFromVoice,
  );
}
