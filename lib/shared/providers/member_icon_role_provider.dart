import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/members/domain/member_list_group_names.dart';
import 'package:fluxer_app/features/members/providers/guild_roles_provider.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';

final ProviderFamily<MemberRole?, (String, String)> memberIconRoleProvider =
    Provider.autoDispose.family<MemberRole?, (String, String)>((ref, args) {
      final String? roleIdsJson = ref.watch(
        memberRowByGuildProvider(
          args,
        ).select((AsyncValue<db.Member?> async) => async.value?.roleIdsJson),
      );
      if (roleIdsJson == null) {
        return null;
      }
      final List<String> roleIds = parseMemberRoleIds(roleIdsJson);
      return ref.watch(
        guildRolesByIdProvider(args.$2).select((
          AsyncValue<Map<String, db.Role>> async,
        ) {
          final Map<String, db.Role>? rolesById = async.value;
          if (rolesById == null) {
            return null;
          }
          return resolveMemberIconRole(roleIds: roleIds, rolesById: rolesById);
        }),
      );
    });
