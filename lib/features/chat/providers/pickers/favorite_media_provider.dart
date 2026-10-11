import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/synced_preferences/usage_frecency.dart';
import 'package:fluxer_app/features/chat/data/favorite_media_repository.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_usage_provider.dart';
import 'package:riverpod/riverpod.dart' as rp;

enum FavoriteMemeMediaFilter { all, images, videos, audio, gifs }

final favoriteMemesProvider = rp.StreamProvider<List<FavoriteMeme>>((ref) {
  final db = ref.watch(fluxerDatabaseProvider);
  return db.favoriteMemesDao.watchAll().map(
    (rows) => sortFavoriteMemesByNewest(
      rows.map(FavoriteMeme.fromRow).toList(growable: false),
    ),
  );
});

final Provider<FavoriteMediaRepository> favoriteMediaRepositoryProvider =
    Provider<FavoriteMediaRepository>((ref) {
      return FavoriteMediaRepository(
        db: ref.watch(fluxerDatabaseProvider),
        client: ref.watch(fluxerClientProvider),
      );
    });

final favoriteMemeFrecencyScoresProvider =
    rp.FutureProvider<Map<String, double>>((ref) async {
      final Map<String, UsageEntry> usage = await ref.watch(
        expressionUsageProvider(ExpressionUsageKind.meme).future,
      );
      return usageScores(usage, DateTime.now().millisecondsSinceEpoch);
    });

List<FavoriteMeme> filterFavoriteMemes(
  Iterable<FavoriteMeme> memes, {
  required String query,
  required FavoriteMemeMediaFilter filter,
}) {
  final normalized = query.trim().toLowerCase();
  return memes
      .where((meme) {
        if (!_matchesFilter(meme, filter)) {
          return false;
        }
        if (normalized.isEmpty) {
          return true;
        }
        return meme.name.toLowerCase().contains(normalized) ||
            (meme.altText?.toLowerCase().contains(normalized) ?? false) ||
            meme.filename.toLowerCase().contains(normalized) ||
            meme.tags.any((tag) => tag.toLowerCase().contains(normalized));
      })
      .toList(growable: false);
}

List<FavoriteMeme> sortFavoriteMemesForSearchFrecency(
  Iterable<FavoriteMeme> memes,
  Map<String, double> frecencyScores,
) {
  final List<FavoriteMeme> sorted = [...memes];
  mergeSort(
    sorted,
    compare: (FavoriteMeme a, FavoriteMeme b) =>
        (frecencyScores[b.id] ?? 0).compareTo(frecencyScores[a.id] ?? 0),
  );
  return sorted;
}

List<FavoriteMeme> sortFavoriteMemesByNewest(Iterable<FavoriteMeme> memes) =>
    [...memes]..sort(_compareFavoriteMemeByNewestFirst);

bool _matchesFilter(FavoriteMeme meme, FavoriteMemeMediaFilter filter) =>
    switch (filter) {
      FavoriteMemeMediaFilter.all => true,
      FavoriteMemeMediaFilter.images =>
        meme.mediaType == FavoriteMemeMediaType.image,
      FavoriteMemeMediaFilter.videos =>
        meme.mediaType == FavoriteMemeMediaType.video,
      FavoriteMemeMediaFilter.audio =>
        meme.mediaType == FavoriteMemeMediaType.audio,
      FavoriteMemeMediaFilter.gifs =>
        meme.mediaType == FavoriteMemeMediaType.gif,
    };

int _compareFavoriteMemeByNewestFirst(FavoriteMeme a, FavoriteMeme b) =>
    _compareSnowflakeStrings(b.id, a.id);

int _compareSnowflakeStrings(String a, String b) {
  if (a == b) {
    return 0;
  }
  if (a.length != b.length) {
    return a.length.compareTo(b.length);
  }
  return a.compareTo(b);
}
