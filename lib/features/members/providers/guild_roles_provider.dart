import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/members/data/member_repository.dart';
import 'package:riverpod/misc.dart';

final Set<String> _guildRolesPrefetchCompleted = <String>{};
final Map<String, Future<void>> _guildRolesPrefetchInFlight =
    <String, Future<void>>{};

Future<void> _runGuildRolesPrefetch(
  MemberRepository repository,
  String guildId,
) async {
  try {
    await repository.getRoles(guildId);
    _guildRolesPrefetchCompleted.add(guildId);
  } on Object {
    // Role names still resolve from gateway-synced rows when REST fails.
  }
}

Future<void> _ensurePrefetchStarted(
  MemberRepository repository,
  String guildId, {
  bool ignoreCompleted = false,
}) {
  if (!ignoreCompleted && _guildRolesPrefetchCompleted.contains(guildId)) {
    return Future<void>.value();
  }
  final Future<void>? existing = _guildRolesPrefetchInFlight[guildId];
  if (existing != null) {
    return existing;
  }
  final Future<void> future = _runGuildRolesPrefetch(repository, guildId)
      .whenComplete(() {
        unawaited(_guildRolesPrefetchInFlight.remove(guildId));
      });
  _guildRolesPrefetchInFlight[guildId] = future;
  return future;
}

void prefetchGuildRoles(MemberRepository repository, String guildId) {
  if (guildId.isEmpty || _guildRolesPrefetchCompleted.contains(guildId)) {
    return;
  }
  unawaited(_ensurePrefetchStarted(repository, guildId));
}

void prefetchGuildRolesIfMissing({
  required db.FluxerDatabase database,
  required MemberRepository repository,
  required String guildId,
}) {
  if (guildId.isEmpty || _guildRolesPrefetchCompleted.contains(guildId)) {
    return;
  }
  prefetchGuildRoles(repository, guildId);
}

bool _guildHasMatchingRoleName(
  List<db.Role> roles,
  String guildId,
  String query,
) {
  final String trimmed = query.trim().toLowerCase();
  if (trimmed.isEmpty) {
    return true;
  }
  for (final db.Role role in roles) {
    if (role.id == guildId) {
      continue;
    }
    if (role.name.toLowerCase().contains(trimmed)) {
      return true;
    }
  }
  return false;
}

Future<List<db.Role>> resolveGuildRolesForMentionAutocomplete({
  required db.FluxerDatabase database,
  required MemberRepository repository,
  required String guildId,
  required String query,
  Map<String, db.Role>? rolesById,
}) async {
  List<db.Role> roles = rolesById != null
      ? rolesById.values.toList()
      : await database.roleDao.getRoles(guildId);
  final bool needsAwaitedRefresh =
      roles.isEmpty ||
      (query.trim().isNotEmpty &&
          !_guildHasMatchingRoleName(roles, guildId, query));
  final Future<void> refresh = _ensurePrefetchStarted(
    repository,
    guildId,
    ignoreCompleted: needsAwaitedRefresh,
  );
  if (needsAwaitedRefresh) {
    await refresh;
    roles = await database.roleDao.getRoles(guildId);
  }
  return roles;
}

void clearGuildRolesPrefetchState() {
  _guildRolesPrefetchCompleted.clear();
  _guildRolesPrefetchInFlight.clear();
}

final StreamProviderFamily<Map<String, db.Role>, String>
guildRolesByIdProvider = StreamProvider.autoDispose
    .family<Map<String, db.Role>, String>((Ref ref, String guildId) {
      if (guildId.isEmpty) {
        return Stream<Map<String, db.Role>>.value(<String, db.Role>{});
      }
      final database = ref.watch(fluxerDatabaseProvider);
      return database.roleDao.watchRoles(guildId).map((List<db.Role> roles) {
        return <String, db.Role>{
          for (final db.Role role in roles) role.id: role,
        };
      });
    });
