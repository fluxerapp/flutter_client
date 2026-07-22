import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/features/members/data/guild_mention_member_search.dart';
import 'package:fluxer_app/features/members/data/member_repository.dart';
import 'package:fluxer_app/features/members/providers/guild_member_chunk_waiter.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'member_providers.g.dart';

@Riverpod(keepAlive: true)
MemberRepository memberRepository(Ref ref) {
  final client = ref.watch(fluxerClientProvider);
  final database = ref.watch(fluxerDatabaseProvider);
  return MemberRepository(client, database);
}

final Provider<GuildMentionMemberSearch> guildMentionMemberSearchProvider =
    Provider<GuildMentionMemberSearch>((Ref ref) {
      return GuildMentionMemberSearch(
        memberRepository: ref.watch(memberRepositoryProvider),
        chunkWaiter: ref.watch(guildMemberChunkWaiterProvider),
        gateway: ref.watch(gatewayConnectionProvider),
        database: ref.watch(fluxerDatabaseProvider),
      );
    });

/// Emits the member row count for [guildId] so permission-related providers
/// rebuild after membership is synced to the database.
@riverpod
Stream<int> guildMemberRowCount(Ref ref, String guildId) {
  if (guildId.isEmpty) {
    return Stream<int>.value(0);
  }
  final database = ref.watch(fluxerDatabaseProvider);
  return database.memberDao.watchMemberCount(guildId);
}

typedef CurrentUserMemberIdentity = ({String? roleIdsJson});

/// Tracks the current user's role assignment in [guildId] for permission
/// rebuilds.
@riverpod
Stream<CurrentUserMemberIdentity?> currentUserMemberIdentity(
  Ref ref,
  String guildId,
) {
  if (guildId.isEmpty) {
    return Stream<CurrentUserMemberIdentity?>.value(null);
  }
  final String userId = ref.watch(
    userSettingsViewModelProvider.select((settings) => settings.userId),
  );
  if (userId.isEmpty) {
    return Stream<CurrentUserMemberIdentity?>.value(null);
  }
  final database = ref.watch(fluxerDatabaseProvider);
  return database.memberDao.watchMemberByUserId(userId, guildId).map((
    db.Member? row,
  ) {
    if (row == null) {
      return null;
    }
    return (roleIdsJson: row.roleIdsJson);
  }).distinct();
}

/// Fingerprint of guild role permission bitfields; changes when roles update.
@riverpod
Stream<String> guildRolePermissionsIdentity(Ref ref, String guildId) {
  if (guildId.isEmpty) {
    return Stream<String>.value('');
  }
  final database = ref.watch(fluxerDatabaseProvider);
  return database.roleDao.watchRoles(guildId).map((List<db.Role> roles) {
    final StringBuffer buffer = StringBuffer();
    for (final db.Role role in roles) {
      buffer
        ..write(role.id)
        ..write(':')
        ..write(role.permissions)
        ..write(';');
    }
    return buffer.toString();
  }).distinct();
}

// Member rows stream keyed by guild id.
// ignore: specify_nonobvious_property_types
final guildMemberRowsProvider = StreamProvider.family<List<db.Member>, String>((
  Ref ref,
  String guildId,
) {
  return ref.watch(fluxerDatabaseProvider).memberDao.watchMembers(guildId);
});
