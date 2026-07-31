import 'package:dio/dio.dart';
import 'package:fluxer_dart/export.dart';

class GuildMemberRoleRepository {
  const GuildMemberRoleRepository(this._client);

  final FluxerClient _client;

  Future<void> addMemberRole({
    required String guildId,
    required String userId,
    required String roleId,
  }) async {
    try {
      await _client.guilds.addGuildMemberRole(
        guildId: guildId,
        userId: userId,
        roleId: roleId,
      );
    } on DioException catch (error) {
      throw Exception(_messageFromDio(error));
    }
  }

  Future<void> removeMemberRole({
    required String guildId,
    required String userId,
    required String roleId,
  }) async {
    try {
      await _client.guilds.removeGuildMemberRole(
        guildId: guildId,
        userId: userId,
        roleId: roleId,
      );
    } on DioException catch (error) {
      throw Exception(_messageFromDio(error));
    }
  }

  String _messageFromDio(DioException error) {
    return error.response?.statusMessage ?? "Couldn't update roles";
  }
}
