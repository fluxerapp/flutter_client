import 'package:dio/dio.dart';
import 'package:fluxer_app/features/settings/data/guild_settings_converters.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_audit_log_entry.dart';
import 'package:fluxer_dart/export.dart';

class GuildSettingsRepository {
  final FluxerClient _client;

  const GuildSettingsRepository(this._client);

  Future<GuildResponse> getGuildDetails(String guildId) async {
    try {
      return await _client.guilds.getGuild(guildId: guildId);
    } on DioException catch (error) {
      throw Exception(_messageFromDio(error, 'Failed to load guild details'));
    }
  }

  Future<GuildResponse> updateGuild({
    required String guildId,
    required GuildUpdateRequest body,
  }) async {
    try {
      return await _client.guilds.updateGuild(guildId: guildId, body: body);
    } on DioException catch (error) {
      throw Exception(_messageFromDio(error, 'Failed to update guild'));
    }
  }

  Future<List<GuildBanResponse>> listBans(String guildId) async {
    try {
      return await _client.guilds.listGuildBans(guildId: guildId);
    } on DioException catch (error) {
      throw Exception(_messageFromDio(error, 'Failed to load bans'));
    }
  }

  Future<void> unbanMember({
    required String guildId,
    required String userId,
  }) async {
    try {
      await _client.guilds.unbanGuildMember(guildId: guildId, userId: userId);
    } on DioException catch (error) {
      throw Exception(_messageFromDio(error, 'Failed to revoke ban'));
    }
  }

  Future<List<InviteMetadataResponseSchema>> listGuildInvites(
    String guildId,
  ) async {
    try {
      return await _client.invites.listGuildInvites(guildId: guildId);
    } on DioException catch (error) {
      throw Exception(_messageFromDio(error, 'Failed to load invites'));
    }
  }

  Future<void> deleteInvite(String inviteCode) async {
    try {
      await _client.invites.deleteInvite(inviteCode: inviteCode);
    } on DioException catch (error) {
      throw Exception(_messageFromDio(error, 'Failed to revoke invite'));
    }
  }

  Future<GuildAuditLogPage> listAuditLogs({
    required String guildId,
    int limit = 50,
    String? before,
    String? after,
    String? userId,
    AuditLogActionType? actionType,
  }) async {
    try {
      final GuildAuditLogListResponse response = await _client.guilds
          .listGuildAuditLogs(
            guildId: guildId,
            limit: limit,
            before: before,
            after: after,
            userId: userId,
            actionType: actionType,
          );
      return guildAuditLogPageFromSdk(response);
    } on DioException catch (error) {
      throw Exception(_messageFromDio(error, 'Failed to load audit log'));
    }
  }

  String _messageFromDio(DioException error, String fallback) {
    return error.response?.statusMessage ?? fallback;
  }
}
