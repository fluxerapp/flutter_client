import 'package:dio/dio.dart';
import 'package:fluxer_app/features/guild_scheduled_events/domain/guild_scheduled_event.dart';
import 'package:fluxer_dart/export.dart';

class GuildScheduledEventRepository {
  final FluxerClient _client;

  const GuildScheduledEventRepository(this._client);

  Future<List<GuildScheduledEvent>> listGuildScheduledEvents({
    required String guildId,
  }) async {
    try {
      final response = await _client.dio.get(
        '/guilds/$guildId/scheduled-events',
      );
      final data = response.data as List;
      return data
          .map((json) => GuildScheduledEvent.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw Exception(e.response?.statusMessage ?? 'Failed to fetch scheduled events');
    }
  }

  Future<GuildScheduledEvent?> getGuildScheduledEvent({
    required String guildId,
    required String eventId,
  }) async {
    try {
      final response = await _client.dio.get(
        '/guilds/$guildId/scheduled-events/$eventId',
      );
      if (response.statusCode == 404) return null;
      return GuildScheduledEvent.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return null;
      throw Exception(e.response?.statusMessage ?? 'Failed to fetch scheduled event');
    }
  }

  Future<GuildScheduledEvent> createGuildScheduledEvent({
    required String guildId,
    required String name,
    String? description,
    required DateTime scheduledStartTime,
    DateTime? scheduledEndTime,
    required int entityType,
    String? entityId,
    String? channelId,
    String? location,
  }) async {
    try {
      final response = await _client.dio.post(
        '/guilds/$guildId/scheduled-events',
        data: {
          'name': name,
          if (description != null) 'description': description,
          'scheduled_start_time': scheduledStartTime.toUtc().toIso8601String(),
          if (scheduledEndTime != null)
            'scheduled_end_time': scheduledEndTime.toUtc().toIso8601String(),
          'entity_type': entityType,
          if (entityId != null) 'entity_id': entityId,
          if (channelId != null) 'channel_id': channelId,
          if (location != null) 'location': location,
        },
      );
      return GuildScheduledEvent.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw Exception(e.response?.statusMessage ?? 'Failed to create scheduled event');
    }
  }

  Future<GuildScheduledEvent> updateGuildScheduledEvent({
    required String guildId,
    required String eventId,
    String? name,
    String? description,
    DateTime? scheduledStartTime,
    DateTime? scheduledEndTime,
    int? entityType,
    String? entityId,
    String? channelId,
    String? location,
    int? status,
  }) async {
    try {
      final response = await _client.dio.patch(
        '/guilds/$guildId/scheduled-events/$eventId',
        data: {
          if (name != null) 'name': name,
          if (description != null) 'description': description,
          if (scheduledStartTime != null)
            'scheduled_start_time': scheduledStartTime.toUtc().toIso8601String(),
          if (scheduledEndTime != null)
            'scheduled_end_time': scheduledEndTime.toUtc().toIso8601String(),
          if (entityType != null) 'entity_type': entityType,
          if (entityId != null) 'entity_id': entityId,
          if (channelId != null) 'channel_id': channelId,
          if (location != null) 'location': location,
          if (status != null) 'status': status,
        },
      );
      return GuildScheduledEvent.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw Exception(e.response?.statusMessage ?? 'Failed to update scheduled event');
    }
  }

  Future<void> deleteGuildScheduledEvent({
    required String guildId,
    required String eventId,
  }) async {
    try {
      await _client.dio.delete('/guilds/$guildId/scheduled-events/$eventId');
    } on DioException catch (e) {
      throw Exception(e.response?.statusMessage ?? 'Failed to delete scheduled event');
    }
  }

  Future<void> subscribeToEvent({
    required String guildId,
    required String eventId,
  }) async {
    try {
      await _client.dio.put('/guilds/$guildId/scheduled-events/$eventId/subscribe');
    } on DioException catch (e) {
      throw Exception(e.response?.statusMessage ?? 'Failed to subscribe to event');
    }
  }

  Future<void> unsubscribeFromEvent({
    required String guildId,
    required String eventId,
  }) async {
    try {
      await _client.dio.delete('/guilds/$guildId/scheduled-events/$eventId/subscribe');
    } on DioException catch (e) {
      throw Exception(e.response?.statusMessage ?? 'Failed to unsubscribe from event');
    }
  }

  Future<List<String>> listEventSubscribers({
    required String guildId,
    required String eventId,
  }) async {
    try {
      final response = await _client.dio.get(
        '/guilds/$guildId/scheduled-events/$eventId/subscribers',
      );
      return (response.data as List).cast<String>();
    } on DioException catch (e) {
      throw Exception(e.response?.statusMessage ?? 'Failed to fetch subscribers');
    }
  }

  Future<List<GuildScheduledEvent>> listUserScheduledEvents() async {
    try {
      final response = await _client.dio.get('/users/@me/scheduled-events');
      final data = response.data as List;
      return data
          .map((json) => GuildScheduledEvent.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw Exception(e.response?.statusMessage ?? 'Failed to fetch user scheduled events');
    }
  }
}
