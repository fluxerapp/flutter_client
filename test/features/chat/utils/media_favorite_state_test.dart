import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/favorite_gif_entry.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/utils/favorite_media_utils.dart';
import 'package:fluxer_app/features/chat/utils/media_favorite_state.dart';

void main() {
  test('isGifFavoriteActive matches web behavior', () {
    expect(
      isGifFavoriteActive(
        hasUrlOnlyFavorite: true,
        hasSavedMediaFavorite: false,
        saveAsSavedMedia: false,
      ),
      isTrue,
    );
    expect(
      isGifFavoriteActive(
        hasUrlOnlyFavorite: false,
        hasSavedMediaFavorite: true,
        saveAsSavedMedia: true,
      ),
      isTrue,
    );
    expect(
      isGifFavoriteActive(
        hasUrlOnlyFavorite: false,
        hasSavedMediaFavorite: true,
        saveAsSavedMedia: false,
      ),
      isFalse,
    );
  });

  test('resolveMediaFavoriteState exposes dual GIF favorite state', () {
    const target = MessageMediaFavoriteTarget(
      defaultName: 'gif',
      gifInfo: MessageMediaGifInfo(
        url: 'https://example.com/cat.gif',
        proxyUrl: 'https://example.com/cat.gif',
      ),
    );

    final MediaFavoriteState state = resolveMediaFavoriteState(
      target: target,
      savedMedia: const <FavoriteMeme>[],
      urlFavorites: const <FavoriteGifEntry>[
        FavoriteGifEntry(
          url: 'https://example.com/cat.gif',
          proxyUrl: 'https://example.com/cat.gif',
          width: 1,
          height: 1,
        ),
      ],
      saveGifFavoritesAsSavedMedia: false,
      forMediaViewerToolbar: false,
    );

    expect(state.isGifFavoriteMedia, isTrue);
    expect(state.hasUrlOnlyGifFavorite, isTrue);
    expect(state.isToolbarFavorited, isTrue);
  });

  test('resolveMediaFavoriteState excludes audio from viewer toolbar', () {
    const target = MessageMediaFavoriteTarget(
      defaultName: 'audio',
      attachmentId: 'audio',
      isAudioOnly: true,
    );

    final MediaFavoriteState state = resolveMediaFavoriteState(
      target: target,
      savedMedia: const <FavoriteMeme>[],
      urlFavorites: const <FavoriteGifEntry>[],
      saveGifFavoritesAsSavedMedia: false,
      forMediaViewerToolbar: true,
    );

    expect(state.canFavorite, isFalse);
  });
}
