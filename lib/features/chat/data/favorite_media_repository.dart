import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/domain/gif_selection.dart';
import 'package:fluxer_app/features/chat/utils/klipy_utils.dart';
import 'package:fluxer_dart/export.dart' as sdk;

class FavoriteMediaRepository {
  FavoriteMediaRepository({required this._db, required this._client});

  final FluxerDatabase _db;
  final sdk.FluxerClient _client;

  Future<FavoriteMeme> createFromGif(
    GifPickerGif gif, {
    bool saveAsSavedMedia = false,
  }) async {
    final shareId = gifShareId(gif);
    final title = gif.title.trim().isEmpty
        ? parseKlipyTitleFromUrl(gif.url)
        : gif.title.trim();
    final response = await _client.savedMedia.createMemeFromUrl(
      body: sdk.CreateFavoriteMemeFromUrlBodySchema(
        url: _bestStoredGifUrl(gif),
        name: title.isEmpty ? null : title,
        gifProvider: gif.provider.name,
        gifSlug: shareId,
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
    await _client.savedMedia.deleteFavoriteMeme(memeId: meme.id);
    await _db.favoriteMemesDao.deleteMeme(meme.id);
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
  if (gif.provider == GifProviderKind.klipy) {
    return extractKlipySlug(gif.url) ?? gif.id;
  }
  return gif.id;
}

String _bestStoredGifUrl(GifPickerGif gif) {
  if (gif.proxySrc.trim().isNotEmpty) {
    return gif.proxySrc;
  }
  if (gif.src.trim().isNotEmpty) {
    return gif.src;
  }
  return gif.url;
}

String? _blankToNull(String? value) {
  final trimmed = value?.trim();
  if (trimmed == null || trimmed.isEmpty) {
    return null;
  }
  return trimmed;
}
