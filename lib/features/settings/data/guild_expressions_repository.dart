import 'package:dio/dio.dart';
import 'package:fluxer_app/core/api/api_exception.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_emoji_settings_entry.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_expression_uploader.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_sticker_settings_entry.dart';
import 'package:fluxer_dart/export.dart';

class GuildExpressionsRepository {
  const GuildExpressionsRepository(this._client);

  final FluxerClient _client;

  Future<List<GuildEmojiSettingsEntry>> listEmojis(String guildId) async {
    try {
      final GuildEmojiWithUserListResponse response = await _client.guilds
          .listGuildEmojis(guildId: guildId);
      return response
          .map(GuildEmojiSettingsEntry.fromResponse)
          .toList(growable: false);
    } on DioException catch (error) {
      throw ApiException.fromDio(error);
    }
  }

  Future<GuildEmojiBulkCreateResponse> bulkCreateEmojis({
    required String guildId,
    required List<GuildEmojiCreateRequest> emojis,
  }) async {
    try {
      return await _client.guilds.bulkCreateGuildEmojis(
        guildId: guildId,
        body: GuildEmojiBulkCreateRequest(emojis: emojis),
      );
    } on DioException catch (error) {
      throw ApiException.fromDio(error);
    }
  }

  Future<GuildEmojiSettingsEntry> updateEmoji({
    required String guildId,
    required String emojiId,
    required String name,
  }) async {
    try {
      final GuildEmojiResponse response = await _client.guilds.updateGuildEmoji(
        guildId: guildId,
        emojiId: emojiId,
        body: GuildEmojiUpdateRequest(name: name),
      );
      final List<GuildEmojiSettingsEntry> emojis = await listEmojis(guildId);
      return emojis.firstWhere(
        (GuildEmojiSettingsEntry entry) => entry.id == response.id,
        orElse: () => GuildEmojiSettingsEntry(
          id: response.id,
          name: response.name,
          animated: response.animated,
          uploader: const GuildExpressionUploader(id: '', username: 'Unknown'),
        ),
      );
    } on DioException catch (error) {
      throw ApiException.fromDio(error);
    }
  }

  Future<void> deleteEmoji({
    required String guildId,
    required String emojiId,
    bool purge = false,
  }) async {
    try {
      await _client.guilds.deleteGuildEmoji(
        guildId: guildId,
        emojiId: emojiId,
        purge: purge ? 'true' : null,
      );
    } on DioException catch (error) {
      throw ApiException.fromDio(error);
    }
  }

  Future<List<GuildStickerSettingsEntry>> listStickers(String guildId) async {
    try {
      final GuildStickerWithUserListResponse response = await _client.guilds
          .listGuildStickers(guildId: guildId);
      return response
          .map(GuildStickerSettingsEntry.fromResponse)
          .toList(growable: false);
    } on DioException catch (error) {
      throw ApiException.fromDio(error);
    }
  }

  Future<GuildStickerSettingsEntry> createSticker({
    required String guildId,
    required GuildStickerCreateRequest body,
  }) async {
    try {
      final GuildStickerResponse response = await _client.guilds
          .createGuildSticker(guildId: guildId, body: body);
      final List<GuildStickerSettingsEntry> stickers = await listStickers(
        guildId,
      );
      return stickers.firstWhere(
        (GuildStickerSettingsEntry entry) => entry.id == response.id,
        orElse: () => GuildStickerSettingsEntry(
          id: response.id,
          name: response.name,
          description: response.description,
          tags: List<String>.from(response.tags),
          uploader: const GuildExpressionUploader(id: '', username: 'Unknown'),
        ),
      );
    } on DioException catch (error) {
      throw ApiException.fromDio(error);
    }
  }

  Future<GuildStickerSettingsEntry> updateSticker({
    required String guildId,
    required String stickerId,
    required GuildStickerUpdateRequest body,
  }) async {
    try {
      final GuildStickerResponse response = await _client.guilds
          .updateGuildSticker(
            guildId: guildId,
            stickerId: stickerId,
            body: body,
          );
      final List<GuildStickerSettingsEntry> stickers = await listStickers(
        guildId,
      );
      return stickers.firstWhere(
        (GuildStickerSettingsEntry entry) => entry.id == response.id,
        orElse: () => GuildStickerSettingsEntry(
          id: response.id,
          name: response.name,
          description: response.description,
          tags: List<String>.from(response.tags),
          uploader: const GuildExpressionUploader(id: '', username: 'Unknown'),
        ),
      );
    } on DioException catch (error) {
      throw ApiException.fromDio(error);
    }
  }

  Future<void> deleteSticker({
    required String guildId,
    required String stickerId,
    bool purge = false,
  }) async {
    try {
      await _client.guilds.deleteGuildSticker(
        guildId: guildId,
        stickerId: stickerId,
        purge: purge ? 'true' : null,
      );
    } on DioException catch (error) {
      throw ApiException.fromDio(error);
    }
  }
}
