import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/synced_preferences/fields/favorite_gifs_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/pickers.pb.dart'
    as pickers_pb;
import 'package:fluxer_app/features/chat/domain/favorite_gif_entry.dart';

FavoriteGifsSyncedField _field() {
  final container = ProviderContainer();
  addTearDown(container.dispose);
  return container.read(
    Provider<FavoriteGifsSyncedField>(FavoriteGifsSyncedField.new),
  );
}

void main() {
  group('FavoriteGifsSyncedField', () {
    test('toProtoMessageForPush roundtrips entries including media map', () {
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

      final proto =
          _field().toProtoMessageForPush(local)
              as pickers_pb.FavoriteGifSettings;
      final restored = FavoriteGifsSyncedField.decodeSettings(proto);

      expect(restored, local);
    });

    test('clearedRemoteValue is an empty GIF list', () {
      const FavoriteGifsSyncedLocalState empty =
          FavoriteGifsSyncedLocalState.empty;
      expect(empty.entries, isEmpty);
      expect(empty.saveAsSavedMedia, isFalse);
      expect(empty.seenFirstTimePrompt, isFalse);
    });

    test('toProtoMessageForPush preserves unknown media formats from wire', () {
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

      final pushed =
          _field().toProtoMessageForPush(local, wireSubMessage: wireBase)
              as pickers_pb.FavoriteGifSettings;

      expect(pushed.entries.single.media['large'], isNotNull);
      expect(pushed.entries.single.media['large']!.width, 640);
    });
  });
}
