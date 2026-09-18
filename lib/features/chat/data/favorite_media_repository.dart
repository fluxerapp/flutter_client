import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/domain/gif_selection.dart';
import 'package:fluxer_app/features/chat/utils/media/gif_media_selection.dart';
import 'package:fluxer_app/features/chat/utils/media/klipy_utils.dart';
import 'package:fluxer_dart/export.dart' as sdk;

class FavoriteMediaRepository {
  FavoriteMediaRepository({required this._db, required this._client});

  final FluxerDatabase _db;
  final sdk.FluxerClient _client;

  Future<FavoriteMeme> createFromMessage({
    required String channelId,
    required String messageId,
    required String name,
    String? altText,
    List<String> tags = const [],
    String? attachmentId,
    int? embedIndex,
  }) async {
    final response = await _client.savedMedia.createMemeFromMessage(
      channelId: channelId,
      messageId: messageId,
      body: sdk.CreateFavoriteMemeBodySchema(
        name: name.trim(),
        altText: _blankToNull(altText),
        tags: tags.isEmpty ? null : tags,
        attachmentId: _blankToNull(attachmentId),
        embedIndex: embedIndex,
      ),
    );
    return _upsertResponse(response);
  }

  Future<FavoriteMeme> createFromGif(GifPickerGif gif) async {
    final shareId = gifShareId(gif);
    final title = gif.title.trim().isEmpty
        ? parseKlipyTitleFromUrl(gif.url)
        : gif.title.trim();
    final response = await _client.savedMedia.createMemeFromUrl(
      body: sdk.CreateFavoriteMemeFromUrlBodySchema(
        url: bestStoredGifUrl(
          url: gif.url,
          src: gif.src,
          proxySrc: gif.proxySrc,
          media: gif.media,
        ),
        name: title.isEmpty ? null : title,
        gifProvider: gif.provider.name,
        gifSlug: shareId,
        media: gif.media,
      ),
    );
    return _upsertResponse(response);
  }

  Future<FavoriteMeme> updateFavoriteMeme({
    required FavoriteMeme meme,
    required String name,
    required String? altText,
    required List<String> tags,
  }) async {
    final trimmedName = name.trim();
    final response = await _client.savedMedia.updateFavoriteMeme(
      memeId: meme.id,
      body: sdk.UpdateFavoriteMemeBodySchema(
        name: trimmedName.isEmpty ? meme.name : trimmedName,
        altText: _blankToNull(altText),
        tags: tags,
      ),
    );
    return _upsertResponse(response);
  }

  Future<void> deleteFavoriteMeme(FavoriteMeme meme) async {
    final id = meme.id.trim();
    await _client.savedMedia.deleteFavoriteMeme(memeId: id);
    await _db.favoriteMemesDao.deleteMeme(id);
    if (id != meme.id) {
      await _db.favoriteMemesDao.deleteMeme(meme.id);
    }
  }

  Future<FavoriteMeme> _upsertResponse(
    sdk.FavoriteMemeResponse response,
  ) async {
    final meme = FavoriteMeme.fromSdk(response);
    await _db.favoriteMemesDao.upsert(
      FavoriteMemesTableCompanion(
        id: Value(meme.id),
        data: Value(jsonEncode(meme.toJson())),
      ),
    );
    return meme;
  }
}

String gifShareId(GifPickerGif gif) {
  final slug = gif.slug.trim();
  if (slug.isNotEmpty) {
    return slug;
  }
  return switch (gif.provider) {
    GifProviderKind.klipy => extractKlipySlug(gif.url) ?? gif.id,
    GifProviderKind.tenor => extractTenorSlugId(gif.url) ?? gif.id,
  };
}

String? _blankToNull(String? value) {
  final trimmed = value?.trim();
  if (trimmed == null || trimmed.isEmpty) {
    return null;
  }
  return trimmed;
}
