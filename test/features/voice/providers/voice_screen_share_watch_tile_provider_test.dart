import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/providers/voice_screen_share_watch_tile_provider.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  Set<String> state() => container.read(voiceScreenShareWatchTileProvider);
  VoiceScreenShareWatchTile notifier() =>
      container.read(voiceScreenShareWatchTileProvider.notifier);

  test('watch adds tiles without replacing existing watches', () {
    notifier().watch('a|screen');
    notifier().watch('b|screen');
    expect(state(), <String>{'a|screen', 'b|screen'});
    expect(notifier().primaryTileId, 'a|screen');
  });

  test('watch is a no-op at the stream cap', () {
    for (int i = 0; i < kVoiceMaxWatchedStreams; i++) {
      notifier().watch('user-$i|screen');
    }
    notifier().watch('overflow|screen');
    expect(state().length, kVoiceMaxWatchedStreams);
    expect(state().contains('overflow|screen'), isFalse);
  });

  test('unwatch removes one tile and keeps the rest', () {
    notifier().watch('a|screen');
    notifier().watch('b|screen');
    notifier().unwatch('a|screen');
    expect(state(), <String>{'b|screen'});
  });

  test('retainTileIds drops ended streams', () {
    notifier().watch('a|screen');
    notifier().watch('b|screen');
    notifier().retainTileIds(<String>{'b|screen'});
    expect(state(), <String>{'b|screen'});
  });

  test('setActiveTileId null clears every watch', () {
    notifier().watch('a|screen');
    notifier().watch('b|screen');
    notifier().setActiveTileId(null);
    expect(state(), isEmpty);
  });

  test('viewer keys follow watched tiles and the stream cap', () {
    expect(
      voiceViewerStreamKeysForWatchedTiles(
        watchedTileIds: <String>{'a|screen', 'b|screen', 'missing|screen'},
        streamKeyForTile: (String tileId) {
          if (tileId == 'missing|screen') {
            return null;
          }
          return 'key:$tileId';
        },
      ),
      <String>['key:a|screen', 'key:b|screen'],
    );
    expect(
      voiceViewerStreamKeysForWatchedTiles(
        watchedTileIds: <String>{'a|screen', 'b|screen'},
        streamKeyForTile: (String tileId) => 'key:$tileId',
        maxKeys: 1,
      ),
      <String>['key:a|screen'],
    );
  });
}
