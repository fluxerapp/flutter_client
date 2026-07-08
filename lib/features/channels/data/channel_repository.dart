import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_move_operation.dart';
import 'package:fluxer_app/shared/utils/sdk_converters.dart';
import 'package:fluxer_dart/export.dart';

class ChannelRepository {
  final FluxerClient _client;
  final db.FluxerDatabase _db;

  const ChannelRepository(this._client, this._db);

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

  Future<void> moveChannel({
    required String guildId,
    required ChannelMoveOperation operation,
    List<Channel>? rollbackChannels,
  }) async {
    try {
      await _client.guilds.updateGuildChannelPositions(
        guildId: guildId,
        body: <ChannelPositionUpdateRequestItem>[
          ChannelPositionUpdateRequestItem(
            id: operation.channelId,
            parentId: operation.newParentId,
            precedingSiblingId: operation.precedingSiblingId,
            position: operation.position,
            lockPermissions: false,
          ),
        ],
      );
      unawaited(getChannels(guildId));
    } on DioException catch (e) {
      if (rollbackChannels != null) {
        await applyLocalChannels(guildId, rollbackChannels);
      }
      throw Exception(e.response?.statusMessage ?? 'Failed to move channel');
    }
  }
}
