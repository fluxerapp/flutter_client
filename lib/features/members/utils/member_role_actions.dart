import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/members/providers/guild_member_role_repository_provider.dart';
import 'package:fluxer_app/shared/providers/user_profile.dart';
import 'package:fluxer_app/shared/utils/api_error_presentation.dart';

Future<bool> toggleMemberRole(
  WidgetRef ref, {
  required String guildId,
  required String userId,
  required String roleId,
  required bool hasRole,
}) async {
  final repository = ref.read(guildMemberRoleRepositoryProvider);
  try {
    if (hasRole) {
      await repository.removeMemberRole(
        guildId: guildId,
        userId: userId,
        roleId: roleId,
      );
    } else {
      await repository.addMemberRole(
        guildId: guildId,
        userId: userId,
        roleId: roleId,
      );
    }
    ref.invalidate(userProfileProvider(userId: userId, guildId: guildId));
    return true;
  } on Object catch (error, stackTrace) {
    talker.error(
      '[MemberRoleActions] toggle failed: $error',
      error,
      stackTrace,
    );
    await showApiErrorFromRoot(ApiErrorAction.updateMemberRoles, error);
    return false;
  }
}
