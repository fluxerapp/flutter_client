import 'dart:convert';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/permissions/permission_resolver.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/members/domain/member.dart' show MemberRole;
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_permissions_provider.g.dart';

typedef _GuildPermissionsOutcome = ({int value, bool shouldCache});

@Riverpod(keepAlive: true)
class GuildPermissions extends _$GuildPermissions {
  int _generation = 0;
  final Set<String> _inFlight = <String>{};
  final Map<String, int> _evictions = <String, int>{};

  @override
  Map<String, int> build(String accountUserId) {
    ref.watch(currentUserIdProvider);
    _generation++;
    _inFlight.clear();
    _evictions.clear();
    return {};
  }

  bool _isCurrent(int generation, String guildId, int evictions) =>
      ref.mounted &&
      generation == _generation &&
      (_evictions[guildId] ?? 0) == evictions;

  Future<int> getPermissions(String guildId) async {
    final int? cached = state[guildId];
    if (cached != null) {
      return cached;
    }
    final int generation = _generation;
    final int evictions = _evictions[guildId] ?? 0;
    final _GuildPermissionsOutcome outcome = (await _computePermissions(
      <String>[guildId],
    ))[guildId]!;
    if (outcome.shouldCache && _isCurrent(generation, guildId, evictions)) {
      state = <String, int>{...state, guildId: outcome.value};
    }
    return outcome.value;
  }

  Future<void> prefetch(Iterable<String> guildIds) async {
    final List<String> missing = <String>{
      for (final String id in guildIds)
        if (!state.containsKey(id) && !_inFlight.contains(id)) id,
    }.toList();
    if (missing.isEmpty) {
      return;
    }
    final int generation = _generation;
    final Map<String, int> evictions = <String, int>{
      for (final String id in missing) id: _evictions[id] ?? 0,
    };
    _inFlight.addAll(missing);
    final Map<String, _GuildPermissionsOutcome> outcomes;
    try {
      outcomes = await _computePermissions(missing);
    } finally {
      if (generation == _generation) {
        _inFlight.removeWhere(
          (String id) =>
              evictions.containsKey(id) &&
              (_evictions[id] ?? 0) == evictions[id],
        );
      }
    }
    final Map<String, int> computed = <String, int>{
      for (final MapEntry<String, _GuildPermissionsOutcome> entry
          in outcomes.entries)
        if (entry.value.shouldCache &&
            !state.containsKey(entry.key) &&
            _isCurrent(generation, entry.key, evictions[entry.key]!))
          entry.key: entry.value.value,
    };
    if (computed.isEmpty) {
      return;
    }
    state = <String, int>{...state, ...computed};
  }

  Future<void> refreshPermissions(String guildId) async {
    final int generation = _generation;
    final int evictions = _evictions[guildId] ?? 0;
    final _GuildPermissionsOutcome outcome = (await _computePermissions(
      <String>[guildId],
    ))[guildId]!;
    if (!_isCurrent(generation, guildId, evictions)) {
      return;
    }
    state = <String, int>{...state, guildId: outcome.value};
  }

  void evict(String guildId) {
    _evictions[guildId] = (_evictions[guildId] ?? 0) + 1;
    _inFlight.remove(guildId);
    if (!state.containsKey(guildId)) {
      return;
    }
    state = Map<String, int>.from(state)..remove(guildId);
  }

  void clearAll() {
    _generation++;
    _inFlight.clear();
    _evictions.clear();
    if (state.isEmpty) {
      return;
    }
    state = {};
  }

  Future<Map<String, _GuildPermissionsOutcome>> _computePermissions(
    List<String> guildIds,
  ) async {
    final db = ref.read(fluxerDatabaseProvider);
    final String currentUserId = ref.read(userSettingsViewModelProvider).userId;
    final bool userLacksMfa = ref.read(userSettingsViewModelProvider).lacksMfa;

    final Map<String, Server> guildsById = <String, Server>{
      for (final Server guild in await db.guildDao.getServersByIds(guildIds))
        guild.id: guild,
    };
    final List<String> memberGuildIds = <String>[
      for (final Server guild in guildsById.values)
        if (guild.ownerId != currentUserId) guild.id,
    ];
    final Map<String, List<Role>> rolesByGuildId = <String, List<Role>>{};
    final Map<String, Member> memberByGuildId = <String, Member>{};
    if (memberGuildIds.isNotEmpty) {
      for (final Role role in await db.roleDao.getRolesForGuilds(
        memberGuildIds,
      )) {
        (rolesByGuildId[role.guildId] ??= <Role>[]).add(role);
      }
      for (final Member member in await db.memberDao.getMembersForUserInGuilds(
        currentUserId,
        memberGuildIds,
      )) {
        memberByGuildId[member.guildId] = member;
      }
    }

    return <String, _GuildPermissionsOutcome>{
      for (final String guildId in guildIds)
        guildId: _resolve(
          guild: guildsById[guildId],
          roles: rolesByGuildId[guildId] ?? const <Role>[],
          memberRow: memberByGuildId[guildId],
          currentUserId: currentUserId,
          userLacksMfa: userLacksMfa,
        ),
    };
  }

  static _GuildPermissionsOutcome _resolve({
    required Server? guild,
    required List<Role> roles,
    required Member? memberRow,
    required String currentUserId,
    required bool userLacksMfa,
  }) {
    if (guild == null) {
      return (value: 0, shouldCache: false);
    }

    if (currentUserId == guild.ownerId) {
      return (value: allPermissions, shouldCache: true);
    }

    if (memberRow == null) {
      return (value: 0, shouldCache: true);
    }

    final memberRoleIds = memberRow.roleIdsJson.isNotEmpty
        ? List<String>.from(jsonDecode(memberRow.roleIdsJson) as List<dynamic>)
        : <String>[];

    final everyoneRole = roles.where((r) => r.id == guild.id).firstOrNull;
    final int everyonePermissions =
        int.tryParse(everyoneRole?.permissions ?? '0') ?? 0;

    final memberRoles = roles
        .where((r) => memberRoleIds.contains(r.id))
        .map(MemberRole.fromRow)
        .toList();

    final int value = resolveGuildPermissions(
      guildOwnerId: guild.ownerId ?? '',
      currentUserId: currentUserId,
      everyonePermissions: everyonePermissions,
      memberRoles: memberRoles,
      guildMfaRestricted: isGuildMfaRestricted(
        guildMfaLevel: guild.mfaLevel,
        isGuildOwner: false,
        userLacksMfa: userLacksMfa,
      ),
    );
    return (value: value, shouldCache: true);
  }
}
