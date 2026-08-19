// Seems to be a lot of items missing from the OpenAPI spec for discovery,
// so custom addition is needed untill it's added.

import 'package:dio/dio.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_discovery_application.dart';

class GuildDiscoveryRepository {
  const GuildDiscoveryRepository(this._dio);

  final Dio _dio;

  String _discoveryPath(String guildId) => '/guilds/$guildId/discovery';

  Future<GuildDiscoveryStatus> getStatus(String guildId) async {
    try {
      final Response<Map<String, dynamic>> response = await _dio
          .get<Map<String, dynamic>>(_discoveryPath(guildId));
      return GuildDiscoveryStatus.fromJson(
        response.data ?? <String, dynamic>{},
      );
    } on DioException catch (error) {
      throw Exception(
        _messageFromDio(error, 'Failed to load discovery status'),
      );
    }
  }

  Future<GuildDiscoveryApplication> apply({
    required String guildId,
    required GuildDiscoveryApplicationRequest request,
  }) async {
    try {
      final Response<Map<String, dynamic>> response = await _dio
          .post<Map<String, dynamic>>(
            _discoveryPath(guildId),
            data: request.toJson(),
          );
      return GuildDiscoveryApplication.fromJson(
        response.data ?? <String, dynamic>{},
      );
    } on DioException catch (error) {
      throw Exception(
        _messageFromDio(error, 'Failed to submit discovery application'),
      );
    }
  }

  Future<GuildDiscoveryApplication> update({
    required String guildId,
    required GuildDiscoveryApplicationRequest request,
  }) async {
    try {
      final Response<Map<String, dynamic>> response = await _dio
          .patch<Map<String, dynamic>>(
            _discoveryPath(guildId),
            data: request.toJson(),
          );
      return GuildDiscoveryApplication.fromJson(
        response.data ?? <String, dynamic>{},
      );
    } on DioException catch (error) {
      throw Exception(
        _messageFromDio(error, 'Failed to update discovery listing'),
      );
    }
  }

  Future<void> withdraw(String guildId) async {
    try {
      await _dio.delete<void>(_discoveryPath(guildId));
    } on DioException catch (error) {
      throw Exception(
        _messageFromDio(error, 'Failed to withdraw discovery application'),
      );
    }
  }

  String _messageFromDio(DioException error, String fallback) {
    return userFacingErrorMessage(error, fallback);
  }
}
