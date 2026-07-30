import 'package:dio/dio.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_move_operation.dart';
import 'package:fluxer_app/features/channels/domain/channel_move_payload.dart';
import 'package:fluxer_app/features/channels/domain/channel_overview_update.dart';
import 'package:fluxer_app/features/channels/domain/channel_permission_overwrite_update.dart';
import 'package:fluxer_app/shared/utils/sdk_converters.dart';
import 'package:fluxer_dart/export.dart';

class ChannelRepository {
  final FluxerClient _client;
  final Dio _dio;
  final db.FluxerDatabase _db;

  const ChannelRepository(this._client, this._dio, this._db);

  Stream<List<Channel>> watchChannels(String guildId) {
    return _db.channelDao
        .watchChannels(guildId)
        .map((rows) => rows.map(Channel.fromRow).toList());
  }

  Future<List<ChannelCategory>> getChannels(String guildId) async {
    try {
      final channels = await _client.guilds.listGuildChannels(guildId: guildId);

      final companions = channels
          .map((ch) => channelFromSdk(ch, guildId))
          .toList();
      await _db.channelDao.upsertChannels(companions);

      final rows = await _db.channelDao.getChannels(guildId);
      final channelList = rows.map(Channel.fromRow).toList();
      return groupChannelsIntoCategories(channelList);
    } on DioException catch (e) {
      throw Exception(e.response?.statusMessage ?? 'Failed to fetch channels');
    }
  }

  Future<void> applyLocalChannels(
    String guildId,
    List<Channel> channels,
  ) async {
    await _db.channelDao.upsertChannels(
      channels.map((Channel channel) => channel.toCompanion()).toList(),
    );
  }

  Future<Channel> updateChannelOverview({
    required Channel channel,
    required ChannelOverviewFormState current,
    required ChannelOverviewFormState original,
    required bool canManageChannel,
    required bool canUpdateRtcRegion,
  }) {
    final ChannelUpdateRequest body = buildChannelOverviewUpdate(
      channel: channel,
      current: current,
      original: original,
      canManageChannel: canManageChannel,
      canUpdateRtcRegion: canUpdateRtcRegion,
    );
    return _patchChannel(channel.id, channel.guildId, body);
  }

  Future<Channel> updateChannelPermissionOverwrites({
    required Channel channel,
    required List<ChannelPermissionOverwriteEntry> overwrites,
  }) {
    final ChannelUpdateRequest body = buildChannelPermissionOverwritesUpdate(
      channel: channel,
      overwrites: overwrites,
    );
    return _patchChannel(channel.id, channel.guildId, body);
  }

  Future<List<RtcRegionResponse>> listRtcRegions(String channelId) async {
    try {
      return await _client.channels.listRtcRegions(channelId: channelId);
    } on DioException catch (e) {
      throw Exception(
        e.response?.statusMessage ?? 'Failed to fetch voice regions',
      );
    }
  }

  Future<Channel> _patchChannel(
    String channelId,
    String guildId,
    ChannelUpdateRequest body,
  ) async {
    try {
      final ChannelResponse response = await _client.channels.updateChannel(
        channelId: channelId,
        body: body,
      );
      final db.ChannelsCompanion companion = channelFromSdk(response, guildId);
      await _db.channelDao.upsertChannels(<db.ChannelsCompanion>[companion]);
      final db.Channel? row = await _db.channelDao.getChannelById(channelId);
      if (row == null) {
        throw Exception('Failed to load updated channel');
      }
      return Channel.fromRow(row);
    } on DioException catch (e) {
      throw Exception(e.response?.statusMessage ?? 'Failed to update channel');
    }
  }

  Future<void> moveChannel({
    required String guildId,
    required ChannelMoveOperation operation,
    List<Channel>? rollbackChannels,
  }) async {
    try {
      await _dio.patch<void>(
        '/guilds/$guildId/channels',
        data: buildChannelMoveRequestBody(operation),
      );
    } on DioException catch (e) {
      if (rollbackChannels != null) {
        await applyLocalChannels(guildId, rollbackChannels);
      }
      throw Exception(e.response?.statusMessage ?? 'Failed to move channel');
    }
  }
}
