import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/members/data/member_repository.dart';
import 'package:riverpod/misc.dart';

final Set<String> _guildRolesPrefetchCompleted = <String>{};
final Set<String> _guildRolesPrefetchInFlight = <String>{};

void prefetchGuildRoles(MemberRepository repository, String guildId) {
  if (guildId.isEmpty ||
      _guildRolesPrefetchCompleted.contains(guildId) ||
      _guildRolesPrefetchInFlight.contains(guildId)) {
    return;
  }
  _guildRolesPrefetchInFlight.add(guildId);
  unawaited(() async {
    try {
      await repository.getRoles(guildId);
      _guildRolesPrefetchCompleted.add(guildId);
    } on Object {
      // Role names still resolve from gateway-synced rows when REST fails.
    } finally {
      _guildRolesPrefetchInFlight.remove(guildId);
    }
  }());
}

void prefetchGuildRolesIfMissing({
  required db.FluxerDatabase database,
  required MemberRepository repository,
  required String guildId,
}) {
  if (guildId.isEmpty || _guildRolesPrefetchCompleted.contains(guildId)) {
    return;
  }
  unawaited(
    database.roleDao.getRoles(guildId).then((List<db.Role> roles) {
      if (roles.length > 1) {
        _guildRolesPrefetchCompleted.add(guildId);
        return;
      }
      prefetchGuildRoles(repository, guildId);
    }),
  );
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
