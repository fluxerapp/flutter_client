import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/synced_preferences/fields/favorite_gifs_synced_field.dart';
import 'package:fluxer_app/features/chat/domain/favorite_gif_entry.dart';
import 'package:fluxer_app/features/chat/domain/gif_selection.dart';

void main() {
  group('FavoriteGifsSyncedField', () {
    test('roundtrips URL-only favorite entries', () {
      const local = FavoriteGifsSyncedLocalState(
        entries: [
          FavoriteGifEntry(
            url: 'https://tenor.com/view/test-gif-1',
            proxyUrl: 'https://cdn.example/test.gif',
            width: 220,
            height: 180,
          ),
        ],
        saveAsSavedMedia: false,
      );

      final proto = FavoriteGifsSyncedField.toProtoForPush(local: local);

      expect(proto.entries, hasLength(1));
      expect(proto.entries.first.url, local.entries.first.url);
      expect(proto.entries.first.proxyUrl, local.entries.first.proxyUrl);
      expect(proto.saveAsSavedMedia, isFalse);
    });

    test('roundtrips seenFirstTimePrompt', () {
      const local = FavoriteGifsSyncedLocalState(
        entries: [],
        saveAsSavedMedia: true,
        seenFirstTimePrompt: true,
      );

      final proto = FavoriteGifsSyncedField.toProtoForPush(local: local);

      expect(proto.seenFirstTimePrompt, isTrue);
    });
  });

  group('favoriteGifEntryFromPickerGif', () {
    test('uses proxy preview URL when available', () {
      const gif = GifPickerGif(
        provider: GifProviderKind.tenor,
        id: 'gif-1',
        title: 'Test',
        url: 'https://tenor.com/view/test-gif-1',
        src: 'https://media.tenor.com/test.gif',
        proxySrc: 'https://cdn.example/test.gif',
        width: 220,
        height: 180,
      );

      final entry = favoriteGifEntryFromPickerGif(gif);

      expect(entry.url, gif.url);
      expect(entry.proxyUrl, gif.proxySrc);
      expect(entry.width, gif.width);
      expect(entry.height, gif.height);
    });
  });
}
