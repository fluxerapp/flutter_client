import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/members/domain/member_list_group_names.dart';
import 'package:fluxer_app/features/members/providers/guild_roles_provider.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';

final ProviderFamily<Color?, (String, String)> memberRoleColorProvider =
    Provider.autoDispose.family<Color?, (String, String)>((ref, args) {
      final (String userId, String guildId) = args;
      final String? roleIdsJson = ref.watch(
        memberRowByGuildProvider(
          args,
        ).select((AsyncValue<db.Member?> async) => async.value?.roleIdsJson),
      );
      if (roleIdsJson == null) {
        return null;
      }

      final List<String> roleIds = parseMemberRoleIds(roleIdsJson);
      final int? argb = ref.watch(
        guildRolesByIdProvider(guildId).select((
          AsyncValue<Map<String, db.Role>> async,
        ) {
          final Map<String, db.Role>? rolesById = async.value;
          if (rolesById == null) {
            return null;
          }
          return resolveMemberHighestRoleColor(
            roleIds: roleIds,
            rolesById: rolesById,
            guildId: guildId,
          );
        }),
      );
      return argb == null ? null : Color(argb);
    });
