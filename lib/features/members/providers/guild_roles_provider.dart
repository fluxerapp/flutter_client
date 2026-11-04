import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/app/account_user_id.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/members/data/member_repository.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:riverpod/misc.dart';

final Map<String, Set<String>> _guildRolesPrefetchCompletedByAccount =
    <String, Set<String>>{};
final Map<String, Map<String, Future<void>>>
_guildRolesPrefetchInFlightByAccount = <String, Map<String, Future<void>>>{};
final Map<String, int> _guildRolesPrefetchGenerationByAccount = <String, int>{};

Set<String> _completedFor(String accountUserId) =>
    _guildRolesPrefetchCompletedByAccount.putIfAbsent(
      accountUserId,
      () => <String>{},
    );

Map<String, Future<void>> _inFlightFor(String accountUserId) =>
    _guildRolesPrefetchInFlightByAccount.putIfAbsent(
      accountUserId,
      () => <String, Future<void>>{},
    );

int _generationFor(String accountUserId) =>
    _guildRolesPrefetchGenerationByAccount.putIfAbsent(accountUserId, () => 0);

Future<void> _runGuildRolesPrefetch(
  MemberRepository repository,
  String guildId,
  String accountUserId,
  int generation,
) async {
  try {
    await repository.getRoles(guildId);
    if (generation != _generationFor(accountUserId)) {
      return;
    }
    _completedFor(accountUserId).add(guildId);
  } on Object {
    // Role names still resolve from gateway-synced rows when REST fails.
  }
}

Future<void> _ensurePrefetchStarted(
  Object ref,
  MemberRepository repository,
  String guildId, {
  bool ignoreCompleted = false,
}) {
  final String accountUserId = readAccountUserId(ref);
  if (!ignoreCompleted && _completedFor(accountUserId).contains(guildId)) {
    return Future<void>.value();
  }
  final Map<String, Future<void>> inFlight = _inFlightFor(accountUserId);
  final Future<void>? existing = inFlight[guildId];
  if (existing != null) {
    return existing;
  }
  final int generation = _generationFor(accountUserId);
  final Future<void> future =
      _runGuildRolesPrefetch(
        repository,
        guildId,
        accountUserId,
        generation,
      ).whenComplete(() {
        if (generation != _generationFor(accountUserId)) {
          return;
        }
        unawaited(inFlight.remove(guildId));
      });
  inFlight[guildId] = future;
  return future;
}

void prefetchGuildRoles(Object ref, String guildId) {
  if (guildId.isEmpty) {
    return;
  }
  final String accountUserId = readAccountUserId(ref);
  if (_completedFor(accountUserId).contains(guildId)) {
    return;
  }
  final MemberRepository repository = switch (ref) {
    final ProviderContainer c => c.read(memberRepositoryProvider),
    final WidgetRef w => w.read(memberRepositoryProvider),
    final Ref r => r.read(memberRepositoryProvider),
    _ => throw ArgumentError('Unsupported ref type: ${ref.runtimeType}'),
  };
  unawaited(_ensurePrefetchStarted(ref, repository, guildId));
}

void prefetchGuildRolesIfMissing({
  required Object ref,
  required db.FluxerDatabase database,
  required MemberRepository repository,
  required String guildId,
}) {
  if (guildId.isEmpty) {
    return;
  }
  final String accountUserId = readAccountUserId(ref);
  if (_completedFor(accountUserId).contains(guildId)) {
    return;
  }
  prefetchGuildRoles(ref, guildId);
}

Future<List<db.Role>> localRolesForMentionAutocomplete({
  required Object ref,
  required db.FluxerDatabase database,
  required MemberRepository repository,
  required String guildId,
  Map<String, db.Role>? rolesById,
}) async {
  if (rolesById != null && rolesById.isNotEmpty) {
    prefetchGuildRolesIfMissing(
      ref: ref,
      database: database,
      repository: repository,
      guildId: guildId,
    );
    return rolesById.values.toList();
  }
  final List<db.Role> roles = await database.roleDao.getRoles(guildId);
  prefetchGuildRolesIfMissing(
    ref: ref,
    database: database,
    repository: repository,
    guildId: guildId,
  );
  return roles;
}

void clearGuildRolesPrefetchState([String? accountUserId]) {
  if (accountUserId != null) {
    _guildRolesPrefetchGenerationByAccount[accountUserId] =
        _generationFor(accountUserId) + 1;
    _guildRolesPrefetchCompletedByAccount.remove(accountUserId);
    _guildRolesPrefetchInFlightByAccount.remove(accountUserId);
    return;
  }
  for (final String id
      in _guildRolesPrefetchGenerationByAccount.keys.toList()) {
    clearGuildRolesPrefetchState(id);
  }
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
