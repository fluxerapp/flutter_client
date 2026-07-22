import 'package:dio/dio.dart';
import 'package:fluxer_app/features/members/providers/guild_member_chunk_waiter.dart';
import 'package:fluxer_app/shared/services/guild_member_hydration_service.dart';
import 'package:fluxer_dart/export.dart';

class NoopGuildMemberHydrationService extends GuildMemberHydrationService {
  NoopGuildMemberHydrationService({required super.database})
    : super(
        client: FluxerClient(
          Dio(BaseOptions(baseUrl: 'https://test.fluxer.invalid/v1')),
        ),
        chunkWaiter: GuildMemberChunkWaiter(),
        readGateway: () => null,
      );

  @override
  Future<void> hydrateMembers({
    required String guildId,
    required Iterable<String> userIds,
    void Function(String userId)? onMemberFetched,
  }) async {}

  @override
  void requestHydration({
    required String guildId,
    required Iterable<String> userIds,
    void Function(String userId)? onMemberFetched,
  }) {}
}
