import 'dart:convert';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/permissions/permission_resolver.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_permissions_provider.g.dart';

@Riverpod(keepAlive: true)
class GuildPermissions extends _$GuildPermissions {
  @override
  Map<String, int> build() {
    ref.watch(currentUserIdProvider);
    return {};
  }

  Future<int> getPermissions(String guildId) async {
    if (state.containsKey(guildId)) {
      return state[guildId]!;
    }

    final ({int value, bool shouldCache}) outcome = await _computePermissions(
      guildId,
    );
    if (outcome.shouldCache) {
      final Map<String, int> newState = Map<String, int>.from(state);
      newState[guildId] = outcome.value;
      state = newState;
    }
    return outcome.value;
  }

  Future<void> refreshPermissions(String guildId) async {
    final ({int value, bool shouldCache}) outcome = await _computePermissions(
      guildId,
    );
    final Map<String, int> newState = Map<String, int>.from(state);
    newState[guildId] = outcome.value;
    state = newState;
  }

  void evict(String guildId) {
    if (!state.containsKey(guildId)) {
      return;
    }
    final newState = Map<String, int>.from(state)..remove(guildId);
    state = newState;
  }

  void clearAll() {
    if (state.isEmpty) {
      return;
    }
    state = {};
  }

  Future<({int value, bool shouldCache})> _computePermissions(
    String guildId,
  ) async {
    final db = ref.read(fluxerDatabaseProvider);
    final String currentUserId = ref.read(userSettingsViewModelProvider).userId;

    final Server? guild = await db.guildDao.getServerById(guildId);
    if (guild == null) {
      return (value: 0, shouldCache: false);
    }

    if (currentUserId == guild.ownerId) {
      return (value: allPermissions, shouldCache: true);
    }

    final allRoles = await db.roleDao.getRoles(guildId);
    final memberRow = await db.memberDao.getMemberByUserId(
      currentUserId,
      guildId,
    );

    if (memberRow == null) {
      return (value: 0, shouldCache: true);
    }

    final memberRoleIds = memberRow.roleIdsJson.isNotEmpty
        ? List<String>.from(jsonDecode(memberRow.roleIdsJson) as List<dynamic>)
        : <String>[];

    final everyoneRole = allRoles.where((r) => r.id == guildId).firstOrNull;
    final int everyonePermissions =
        int.tryParse(everyoneRole?.permissions ?? '0') ?? 0;

    final memberRoles = allRoles
        .where((r) => memberRoleIds.contains(r.id))
        .map(MemberRole.fromRow)
        .toList();

    final int value = resolveGuildPermissions(
      guildOwnerId: guild.ownerId ?? '',
      currentUserId: currentUserId,
      everyonePermissions: everyonePermissions,
      memberRoles: memberRoles,
    );
    return (value: value, shouldCache: true);
  }
}
