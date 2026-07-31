import 'dart:math' as math;

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/members/providers/guild_member_chunk_waiter.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_audit_log_entry.dart';
import 'package:fluxer_app/shared/utils/guild_member_prefetch.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';

const int _kGuildMemberRequestBatchSize = 100;
const Duration _kGuildMemberChunkWaitTimeout = Duration(seconds: 10);

class GuildAuditLogMemberRepository {
  const GuildAuditLogMemberRepository({
    required this._database,
    required this._client,
    required this._chunkWaiter,
    required this._readGateway,
  });

  final db.FluxerDatabase _database;
  final FluxerClient _client;
  final GuildMemberChunkWaiter _chunkWaiter;
  final GatewayConnection? Function() _readGateway;

  Future<Map<String, GuildUserDisplay>> resolveUserDisplays({
    required String guildId,
    required Iterable<String> userIds,
    required Iterable<GuildAuditLogUser> auditLogUsers,
    void Function(String userId)? onMemberFetched,
  }) async {
    final Set<String> uniqueUserIds = userIds
        .where((String id) => id.isNotEmpty)
        .toSet();
    if (uniqueUserIds.isEmpty || guildId.isEmpty) {
      return const <String, GuildUserDisplay>{};
    }
    await _upsertAuditLogUsers(auditLogUsers);
    final List<String> missingUserIds = await _missingMemberUserIds(
      guildId: guildId,
      userIds: uniqueUserIds,
    );
    final GatewayConnection? gateway = _readGateway();
    if (gateway != null && missingUserIds.isNotEmpty) {
      await _requestMissingMembersViaGateway(
        gateway: gateway,
        guildId: guildId,
        missingUserIds: missingUserIds,
      );
    }
    await prefetchGuildMembersForUserIds(
      database: _database,
      client: _client,
      guildId: guildId,
      userIds: uniqueUserIds,
      onMemberFetched: onMemberFetched,
    );
    return _buildDisplays(guildId: guildId, userIds: uniqueUserIds);
  }

  Future<void> _upsertAuditLogUsers(Iterable<GuildAuditLogUser> users) async {
    for (final GuildAuditLogUser user in users) {
      await _database.userDao.upsertUser(
        db.UsersCompanion.insert(
          id: user.id,
          username: user.username,
          globalName: Value(user.globalName),
          avatar: Value(user.avatarHash),
          avatarColor: Value(user.avatarColor),
          bot: Value(user.isBot),
          memberSince: Value(dateTimeFromUserSnowflakeOrNull(user.id)),
        ),
      );
    }
  }

  Future<List<String>> _missingMemberUserIds({
    required String guildId,
    required Set<String> userIds,
  }) async {
    final List<String> missingUserIds = <String>[];
    for (final String userId in userIds) {
      final db.Member? existing = await _database.memberDao.getMemberByUserId(
        userId,
        guildId,
      );
      if (existing == null) {
        missingUserIds.add(userId);
      }
    }
    return missingUserIds;
  }

  Future<void> _requestMissingMembersViaGateway({
    required GatewayConnection gateway,
    required String guildId,
    required List<String> missingUserIds,
  }) async {
    if (gateway.state != GatewayState.connected || missingUserIds.isEmpty) {
      return;
    }
    for (
      int index = 0;
      index < missingUserIds.length;
      index += _kGuildMemberRequestBatchSize
    ) {
      final int end = math.min(
        index + _kGuildMemberRequestBatchSize,
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
        timeout: _kGuildMemberChunkWaitTimeout,
      );
    }
  }

  Future<Map<String, GuildUserDisplay>> _buildDisplays({
    required String guildId,
    required Set<String> userIds,
  }) async {
    final Map<String, String?> nicknameByUserId = await _database
        .relationshipDao
        .getNicknamesByUserId();
    final Map<String, GuildUserDisplay> displays = <String, GuildUserDisplay>{};
    for (final String userId in userIds) {
      final db.User? user = await _database.userDao.getUserById(userId);
      if (user == null) {
        continue;
      }
      final db.Member? member = await _database.memberDao.getMemberByUserId(
        userId,
        guildId,
      );
      displays[userId] = resolveGuildUserDisplayFromRows(
        user: user,
        member: member,
        guildId: guildId,
        friendNickname: nicknameByUserId[userId],
      );
    }
    return displays;
  }
}
