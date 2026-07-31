import 'dart:async';
import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/features/members/providers/guild_member_chunk_waiter.dart';
import 'package:fluxer_app/shared/utils/sdk_converters.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';

const int kGuildMemberHydrationBatchSize = 100;
const int kGuildMemberHydrationRestUpsertBatchSize = 25;
const Duration kGuildMemberHydrationChunkTimeout = Duration(seconds: 10);

class GuildMemberHydrationService {
  GuildMemberHydrationService({
    required this._database,
    required this._client,
    required this._chunkWaiter,
    required this._readGateway,
  });

  final db.FluxerDatabase _database;
  final FluxerClient _client;
  final GuildMemberChunkWaiter _chunkWaiter;
  final GatewayConnection? Function() _readGateway;

  final Map<String, Set<String>> _nonMembers = <String, Set<String>>{};
  final Map<String, Set<String>> _pendingByGuild = <String, Set<String>>{};
  final Map<String, Future<void>> _inFlightByGuild = <String, Future<void>>{};

  bool isNonMember(String guildId, String userId) {
    return _nonMembers[guildId]?.contains(userId) ?? false;
  }

  void requestHydration({
    required String guildId,
    required Iterable<String> userIds,
    void Function(String userId)? onMemberFetched,
  }) {
    if (guildId.isEmpty) {
      return;
    }
    final Set<String> pending = _pendingByGuild.putIfAbsent(
      guildId,
      () => <String>{},
    );
    for (final String userId in userIds) {
      if (userId.isNotEmpty && !isNonMember(guildId, userId)) {
        pending.add(userId);
      }
    }
    if (pending.isEmpty) {
      return;
    }
    _scheduleFlush(guildId, onMemberFetched: onMemberFetched);
  }

  void _scheduleFlush(
    String guildId, {
    void Function(String userId)? onMemberFetched,
  }) {
    if (_inFlightByGuild.containsKey(guildId)) {
      return;
    }
    _inFlightByGuild[guildId] = Future<void>.microtask(() async {
      try {
        final Set<String>? pending = _pendingByGuild.remove(guildId);
        if (pending == null || pending.isEmpty) {
          return;
        }
        await hydrateMembers(
          guildId: guildId,
          userIds: pending,
          onMemberFetched: onMemberFetched,
        );
      } finally {
        unawaited(_inFlightByGuild.remove(guildId));
        if (_pendingByGuild[guildId]?.isNotEmpty ?? false) {
          _scheduleFlush(guildId, onMemberFetched: onMemberFetched);
        }
      }
    });
  }

  Future<void> hydrateMembers({
    required String guildId,
    required Iterable<String> userIds,
    void Function(String userId)? onMemberFetched,
  }) async {
    if (guildId.isEmpty) {
      return;
    }
    final Set<String> uniqueUserIds = userIds
        .where((String id) => id.isNotEmpty && !isNonMember(guildId, id))
        .toSet();
    if (uniqueUserIds.isEmpty) {
      return;
    }
    final List<String> missingUserIds = await _missingMemberUserIds(
      guildId: guildId,
      userIds: uniqueUserIds,
    );
    if (missingUserIds.isEmpty) {
      return;
    }
    final GatewayConnection? gateway = _readGateway();
    if (gateway != null && gateway.state == GatewayState.connected) {
      await _requestMissingMembersViaGateway(
        gateway: gateway,
        guildId: guildId,
        missingUserIds: missingUserIds,
        onMemberFetched: onMemberFetched,
      );
    }
    final List<String> stillMissing = await _missingMemberUserIds(
      guildId: guildId,
      userIds: missingUserIds.toSet(),
    );
    if (stillMissing.isEmpty) {
      return;
    }
    await _fetchMissingMembersViaRest(
      guildId: guildId,
      missingUserIds: stillMissing,
      onMemberFetched: onMemberFetched,
    );
  }

  Future<List<String>> _missingMemberUserIds({
    required String guildId,
    required Set<String> userIds,
  }) async {
    final List<String> candidateIds = userIds
        .where((String id) => !isNonMember(guildId, id))
        .toList(growable: false);
    if (candidateIds.isEmpty) {
      return const <String>[];
    }
    final List<db.Member> existingMembers = await _database.memberDao
        .getMembersByUserIds(guildId, candidateIds);
    final Set<String> existingUserIds = existingMembers
        .map((db.Member member) => member.userId)
        .toSet();
    return candidateIds
        .where((String userId) => !existingUserIds.contains(userId))
        .toList(growable: false);
  }

  Future<void> _requestMissingMembersViaGateway({
    required GatewayConnection gateway,
    required String guildId,
    required List<String> missingUserIds,
    void Function(String userId)? onMemberFetched,
  }) async {
    for (
      int index = 0;
      index < missingUserIds.length;
      index += kGuildMemberHydrationBatchSize
    ) {
      final int end = math.min(
        index + kGuildMemberHydrationBatchSize,
        missingUserIds.length,
      );
      final List<String> batch = missingUserIds.sublist(index, end);
      gateway.requestGuildMembers(
        guildId: guildId,
        userIds: batch,
        presences: false,
      );
      await _chunkWaiter.waitForChunk(
        guildId,
        timeout: kGuildMemberHydrationChunkTimeout,
      );
      final Set<String> returnedUserIds = _chunkWaiter
          .lastChunkUserIds(guildId)
          .toSet();
      final List<db.Member> cachedMembers = await _database.memberDao
          .getMembersByUserIds(guildId, batch);
      final Set<String> cachedUserIds = cachedMembers
          .map((db.Member member) => member.userId)
          .toSet();
      for (final String userId in batch) {
        if (cachedUserIds.contains(userId)) {
          onMemberFetched?.call(userId);
          continue;
        }
        if (!returnedUserIds.contains(userId)) {
          _markNonMember(guildId, userId);
        }
      }
    }
  }

  Future<void> _fetchMissingMembersViaRest({
    required String guildId,
    required List<String> missingUserIds,
    void Function(String userId)? onMemberFetched,
  }) async {
    final List<GuildMemberResponse> pendingUpsert = <GuildMemberResponse>[];
    Future<void> flushPendingUpsert() async {
      if (pendingUpsert.isEmpty) {
        return;
      }
      final List<GuildMemberResponse> batch = List<GuildMemberResponse>.from(
        pendingUpsert,
      );
      pendingUpsert.clear();
      await upsertGuildMembersFromSdk(_database, guildId, batch);
      for (final GuildMemberResponse sdk in batch) {
        onMemberFetched?.call(sdk.user.id);
      }
    }

    for (final String userId in missingUserIds) {
      if (isNonMember(guildId, userId)) {
        continue;
      }
      try {
        final GuildMemberResponse sdk = await _client.guilds.getGuildMember(
          guildId: guildId,
          userId: userId,
        );
        pendingUpsert.add(sdk);
        if (pendingUpsert.length >= kGuildMemberHydrationRestUpsertBatchSize) {
          await flushPendingUpsert();
        }
      } on Object {
        _markNonMember(guildId, userId);
      }
    }
    await flushPendingUpsert();
  }

  void _markNonMember(String guildId, String userId) {
    _nonMembers.putIfAbsent(guildId, () => <String>{}).add(userId);
  }
}

final Provider<GuildMemberHydrationService>
guildMemberHydrationServiceProvider = Provider<GuildMemberHydrationService>((
  Ref ref,
) {
  ref.keepAlive();
  return GuildMemberHydrationService(
    database: ref.watch(fluxerDatabaseProvider),
    client: ref.watch(fluxerClientProvider),
    chunkWaiter: ref.watch(guildMemberChunkWaiterProvider),
    readGateway: () => ref.read(gatewayConnectionProvider),
  );
});
