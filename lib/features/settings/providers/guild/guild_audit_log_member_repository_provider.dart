import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/features/members/providers/guild_member_chunk_waiter.dart';
import 'package:fluxer_app/features/settings/data/guild_audit_log_member_repository.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_audit_log_member_repository_provider.g.dart';

GatewayConnection? _readConnectedGateway(Ref ref) {
  try {
    final GatewayConnection gateway = ref.read(gatewayConnectionProvider);
    if (gateway.state == GatewayState.connected) {
      return gateway;
    }
  } on Object {
    // Gateway is unavailable while logged out or reconnecting.
  }
  return null;
}

@Riverpod(keepAlive: true)
GuildAuditLogMemberRepository guildAuditLogMemberRepository(Ref ref) {
  return GuildAuditLogMemberRepository(
    database: ref.watch(fluxerDatabaseProvider),
    client: ref.watch(fluxerClientProvider),
    chunkWaiter: ref.watch(guildMemberChunkWaiterProvider),
    readGateway: () => _readConnectedGateway(ref),
  );
}
