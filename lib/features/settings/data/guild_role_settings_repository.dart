import 'package:dio/dio.dart';
import 'package:fluxer_app/features/settings/domain/guild/roles/guild_role_order.dart';
import 'package:fluxer_dart/export.dart';

class GuildRoleSettingsRepository {
  const GuildRoleSettingsRepository(this._client);

  final FluxerClient _client;

  Future<GuildRoleResponse> createRole({
    required String guildId,
    required String name,
  }) async {
    try {
      return await _client.guilds.createGuildRole(
        guildId: guildId,
        body: GuildRoleCreateRequest(name: name),
      );
    } on DioException catch (error) {
      throw Exception(_messageFromDio(error, "Couldn't create role"));
    }
  }

  Future<GuildRoleResponse> updateRole({
    required String guildId,
    required String roleId,
    String? name,
    int? color,
    bool? hoist,
    bool? mentionable,
    int? permissions,
  }) async {
    try {
      return await _client.guilds.updateGuildRole(
        guildId: guildId,
        roleId: roleId,
        body: GuildRoleUpdateRequest(
          name: name,
          color: color,
          hoist: hoist,
          mentionable: mentionable,
          permissions: permissions?.toString(),
        ),
      );
    } on DioException catch (error) {
      throw Exception(_messageFromDio(error, "Couldn't update roles"));
    }
  }

  Future<void> deleteRole({
    required String guildId,
    required String roleId,
  }) async {
    try {
      await _client.guilds.deleteGuildRole(guildId: guildId, roleId: roleId);
    } on DioException catch (error) {
      throw Exception(_messageFromDio(error, "Couldn't delete role"));
    }
  }

  Future<void> updateRolePositions({
    required String guildId,
    required List<GuildRolePositionPayloadItem> items,
  }) async {
    if (items.isEmpty) {
      return;
    }
    try {
      await _client.guilds.updateGuildRolePositions(
        guildId: guildId,
        body: items
            .map(
              (GuildRolePositionPayloadItem item) =>
                  GuildRolePositionsRequestItem(
                    id: item.id,
                    position: item.position,
                  ),
            )
            .toList(),
      );
    } on DioException catch (error) {
      throw Exception(_messageFromDio(error, "Couldn't update roles"));
    }
  }

  Future<void> updateRoleHoistPositions({
    required String guildId,
    required List<GuildRoleHoistPositionPayloadItem> items,
  }) async {
    if (items.isEmpty) {
      return;
    }
    try {
      await _client.guilds.updateRoleHoistPositions(
        guildId: guildId,
        body: items
            .map(
              (GuildRoleHoistPositionPayloadItem item) =>
                  GuildRoleHoistPositionsRequestItem(
                    id: item.id,
                    hoistPosition: item.hoistPosition,
                  ),
            )
            .toList(),
      );
    } on DioException catch (error) {
      throw Exception(_messageFromDio(error, "Couldn't update roles"));
    }
  }

  Future<void> resetRoleHoistPositions({required String guildId}) async {
    try {
      await _client.guilds.resetRoleHoistPositions(guildId: guildId);
    } on DioException catch (error) {
      throw Exception(_messageFromDio(error, "Couldn't reset hoist order"));
    }
  }

  String _messageFromDio(DioException error, String fallback) {
    return error.response?.statusMessage ?? fallback;
  }
}
