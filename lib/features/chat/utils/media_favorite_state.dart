import 'package:fluxer_app/features/chat/domain/favorite_gif_entry.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/utils/favorite_media_utils.dart';

class MediaFavoriteState {
  const MediaFavoriteState({
    required this.canFavorite,
    required this.isGifFavoriteMedia,
    required this.hasUrlOnlyGifFavorite,
    required this.hasSavedMediaFavorite,
    required this.isToolbarFavorited,
    required this.saveGifFavoritesAsSavedMedia,
    this.savedMediaFavorite,
    this.target,
    this.gifInfo,
  });

  final bool canFavorite;
  final bool isGifFavoriteMedia;
  final bool hasUrlOnlyGifFavorite;
  final bool hasSavedMediaFavorite;
  final bool isToolbarFavorited;
  final bool saveGifFavoritesAsSavedMedia;
  final FavoriteMeme? savedMediaFavorite;
  final MessageMediaFavoriteTarget? target;
  final MessageMediaGifInfo? gifInfo;

  bool get useUrlOnlyGifFlow =>
      isGifFavoriteMedia && gifInfo != null && !saveGifFavoritesAsSavedMedia;
}

MediaFavoriteState resolveMediaFavoriteState({
  required MessageMediaFavoriteTarget? target,
  required Iterable<FavoriteMeme> savedMedia,
  required Iterable<FavoriteGifEntry> urlFavorites,
  required bool saveGifFavoritesAsSavedMedia,
  required bool forMediaViewerToolbar,
}) {
  if (target == null) {
    return const MediaFavoriteState(
      canFavorite: false,
      isGifFavoriteMedia: false,
      hasUrlOnlyGifFavorite: false,
      hasSavedMediaFavorite: false,
      isToolbarFavorited: false,
      saveGifFavoritesAsSavedMedia: false,
    );
  }

  if (forMediaViewerToolbar && target.isAudioOnly) {
    return MediaFavoriteState(
      canFavorite: false,
      isGifFavoriteMedia: false,
      hasUrlOnlyGifFavorite: false,
      hasSavedMediaFavorite: false,
      isToolbarFavorited: false,
      saveGifFavoritesAsSavedMedia: saveGifFavoritesAsSavedMedia,
      target: target,
      gifInfo: target.gifInfo,
    );
  }

  final FavoriteMeme? savedMediaFavorite = target.findExisting(savedMedia);
  final bool hasSavedMediaFavorite = savedMediaFavorite != null;
  final MessageMediaGifInfo? gifInfo = target.gifInfo;
  final bool isGifFavoriteMedia = gifInfo != null;
  final bool hasUrlOnlyGifFavorite =
      isGifFavoriteMedia &&
      urlFavorites.any((FavoriteGifEntry entry) => entry.url == gifInfo.url);
  final bool isToolbarFavorited = isGifFavoriteMedia
      ? isGifFavoriteActive(
          hasUrlOnlyFavorite: hasUrlOnlyGifFavorite,
          hasSavedMediaFavorite: hasSavedMediaFavorite,
          saveAsSavedMedia: saveGifFavoritesAsSavedMedia,
        )
      : hasSavedMediaFavorite;

  return MediaFavoriteState(
    canFavorite: true,
    isGifFavoriteMedia: isGifFavoriteMedia,
    hasUrlOnlyGifFavorite: hasUrlOnlyGifFavorite,
    hasSavedMediaFavorite: hasSavedMediaFavorite,
    isToolbarFavorited: isToolbarFavorited,
    saveGifFavoritesAsSavedMedia: saveGifFavoritesAsSavedMedia,
    savedMediaFavorite: savedMediaFavorite,
    target: target,
    gifInfo: gifInfo,
  );
}

bool isGifFavoriteActive({
  required bool hasUrlOnlyFavorite,
  required bool hasSavedMediaFavorite,
  required bool saveAsSavedMedia,
}) {
  return hasUrlOnlyFavorite || (saveAsSavedMedia && hasSavedMediaFavorite);
}
