import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/synced_preferences/fields/favorite_gifs_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/pickers.pb.dart'
    as pickers_pb;
import 'package:fluxer_app/features/chat/domain/favorite_gif_entry.dart';

void main() {
  group('FavoriteGifsSyncedField', () {
    test('toProtoForPush roundtrips entries including media map', () {
      const local = FavoriteGifsSyncedLocalState(
        entries: [
          FavoriteGifEntry(
            url: 'https://example.com/a.gif',
            proxyUrl: 'https://proxy.example/a.gif',
            width: 320,
            height: 240,
            contentType: 'image/gif',
            placeholder: 'abc',
            media: {
              'tiny': FavoriteGifMediaFormat(
                src: 'https://example.com/tiny.gif',
                proxySrc: 'https://proxy.example/tiny.gif',
                width: 80,
                height: 60,
              ),
            },
          ),
        ],
        saveAsSavedMedia: true,
        seenFirstTimePrompt: true,
      );

      final proto = FavoriteGifsSyncedField.toProtoForPush(local: local);
      final restored = FavoriteGifsSyncedField.decodeSettings(proto);

      expect(restored, local);
    });

    test('toProtoForPush preserves unknown media formats from wire', () {
      const local = FavoriteGifsSyncedLocalState(
        entries: [
          FavoriteGifEntry(
            url: 'https://example.com/a.gif',
            proxyUrl: 'https://proxy.example/a.gif',
            width: 320,
            height: 240,
          ),
        ],
        saveAsSavedMedia: false,
      );
      final wireEntry =
          pickers_pb.FavoriteGifEntry(
              url: 'https://example.com/a.gif',
              proxyUrl: 'https://proxy.example/a.gif',
              width: 320,
              height: 240,
            )
            ..media['large'] = pickers_pb.FavoriteGifMediaFormat(
              src: 'https://example.com/large.gif',
              proxySrc: 'https://proxy.example/large.gif',
              width: 640,
              height: 480,
            );
      final wireBase = pickers_pb.FavoriteGifSettings(entries: [wireEntry]);

      final pushed = FavoriteGifsSyncedField.toProtoForPush(
        local: local,
        wireBase: wireBase,
      );

      expect(pushed.entries.single.media['large'], isNotNull);
      expect(pushed.entries.single.media['large']!.width, 640);
    });
  });
}
