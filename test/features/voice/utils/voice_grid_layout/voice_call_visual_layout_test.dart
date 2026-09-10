import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/voice_grid_layout/voice_call_visual_layout.dart';

void main() {
  group('resolveVoiceCallVisualLayout', () {
    test('uses packed grid for small calls', () {
      for (int count = 1; count <= 4; count++) {
        expect(
          resolveVoiceCallVisualLayout(
            isFocusMode: false,
            pinnedTileId: null,
            tileCount: count,
            visibleTileCount: 9,
          ),
          VoiceCallVisualLayout.packedGrid,
        );
      }
    });

    test('uses packed grid when 5 or more tiles fit', () {
      expect(
        resolveVoiceCallVisualLayout(
          isFocusMode: false,
          pinnedTileId: null,
          tileCount: 5,
          visibleTileCount: 9,
        ),
        VoiceCallVisualLayout.packedGrid,
      );
    });

    test('uses paginated grid on overflow', () {
      expect(
        resolveVoiceCallVisualLayout(
          isFocusMode: false,
          pinnedTileId: null,
          tileCount: 8,
          visibleTileCount: 6,
        ),
        VoiceCallVisualLayout.paginatedGrid,
      );
    });

    test('uses focus when mode is focus even with two tiles', () {
      expect(
        resolveVoiceCallVisualLayout(
          isFocusMode: true,
          pinnedTileId: null,
          tileCount: 2,
          visibleTileCount: 9,
        ),
        VoiceCallVisualLayout.focus,
      );
    });

    test('uses focus when a tile is pinned', () {
      expect(
        resolveVoiceCallVisualLayout(
          isFocusMode: false,
          pinnedTileId: 'tile-1',
          tileCount: 2,
          visibleTileCount: 9,
        ),
        VoiceCallVisualLayout.focus,
      );
    });

    test('does not use a watching id as a mode input', () {
      expect(
        resolveVoiceCallVisualLayout(
          isFocusMode: false,
          pinnedTileId: null,
          tileCount: 3,
          visibleTileCount: 9,
        ),
        VoiceCallVisualLayout.packedGrid,
      );
    });

    test('stale pin id is ignored so grid packing stays grid', () {
      expect(
        resolveVoiceCallVisualLayout(
          isFocusMode: false,
          pinnedTileId: null,
          tileCount: 3,
          visibleTileCount: 9,
        ),
        VoiceCallVisualLayout.packedGrid,
      );
    });

    test('focus mode with a missing pin stays in focus', () {
      expect(
        resolveVoiceCallVisualLayout(
          isFocusMode: true,
          pinnedTileId: null,
          tileCount: 3,
          visibleTileCount: 9,
        ),
        VoiceCallVisualLayout.focus,
      );
    });
  });

  group('resolveVoiceCallMainTileId', () {
    test('prefers a valid pin', () {
      expect(
        resolveVoiceCallMainTileId<String>(
          pinnedTileId: 'b',
          tiles: <String>['a', 'b', 'c'],
          tileId: (String tile) => tile,
          isScreenShare: (String tile) => tile == 'c',
        ),
        'b',
      );
    });

    test('falls back to the first non-screen-share tile', () {
      expect(
        resolveVoiceCallMainTileId<String>(
          pinnedTileId: 'gone',
          tiles: <String>['share', 'cam'],
          tileId: (String tile) => tile,
          isScreenShare: (String tile) => tile == 'share',
        ),
        'cam',
      );
    });
  });

  group('voiceCallTileIsFocused', () {
    test('matches the pinned tile', () {
      expect(
        voiceCallTileIsFocused(
          isFocusMode: true,
          pinnedTileId: 'a',
          tileId: 'a',
        ),
        isTrue,
      );
      expect(
        voiceCallTileIsFocused(
          isFocusMode: true,
          pinnedTileId: 'a',
          tileId: 'b',
        ),
        isFalse,
      );
    });

    test('matches auto-main when focus has no pin', () {
      expect(
        voiceCallTileIsFocused(
          isFocusMode: true,
          pinnedTileId: null,
          tileId: 'main',
          effectiveMainTileId: 'main',
        ),
        isTrue,
      );
    });
  });
}
