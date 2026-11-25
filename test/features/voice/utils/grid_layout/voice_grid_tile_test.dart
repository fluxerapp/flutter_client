import 'dart:ui' show Rect, Size;

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/domain/participant_tile_source.dart';
import 'package:fluxer_app/features/voice/domain/voice_media_participant.dart';
import 'package:fluxer_app/features/voice/providers/voice_active_speakers_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_layout_config.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_main_tile.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_pinned_layout.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_speaking_order.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_tile.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_tile_builder.dart';
import 'package:fluxer_dart/gateway.dart';

const String _me = 'me';

VoiceChannelParticipantData _participant(
  String userId, {
  String? connectionId,
  bool selfVideo = false,
  bool selfStream = false,
}) {
  return VoiceChannelParticipantData(
    userId: userId,
    voice: VoiceState(
      userId: userId,
      channelId: 'voice-1',
      connectionId: connectionId ?? userId,
      selfVideo: selfVideo,
      selfStream: selfStream,
    ),
  );
}

VoiceGridTile _camera(String userId, {bool selfVideo = false}) => VoiceGridTile(
  data: _participant(userId, selfVideo: selfVideo),
  source: VoiceParticipantTileSource.camera,
);

VoiceGridTile _share(String userId) => VoiceGridTile(
  data: _participant(userId, selfStream: true),
  source: VoiceParticipantTileSource.screenShare,
);

class _FakeParticipant extends Fake implements VoiceMediaParticipant {
  _FakeParticipant(this.identity);

  @override
  final String identity;
}

List<String> _ids(List<VoiceGridTile> tiles) => <String>[
  for (final VoiceGridTile tile in tiles) tile.tileId,
];

List<VoiceGridTile> _build(
  List<VoiceChannelParticipantData> participants, {
  bool onlyShowVideos = false,
  bool showOwnCamera = true,
  Set<String> expandedUserIds = const <String>{},
  String? forceShowUserId,
}) {
  return buildVoiceGridTiles(
    participants: participants,
    media: null,
    currentUserId: _me,
    localConnectionId: _me,
    onlyShowVideos: onlyShowVideos,
    showOwnCamera: showOwnCamera,
    expandedUserIds: expandedUserIds,
    forceShowUserId: forceShowUserId,
  );
}

void main() {
  group('buildVoiceGridTiles', () {
    test('adds a screen share tile after the cameras', () {
      expect(
        _ids(
          _build(<VoiceChannelParticipantData>[
            _participant(_me, selfStream: true),
            _participant('a'),
          ]),
        ),
        <String>['me|camera', 'a|camera', 'me|screen'],
      );
    });

    test('hides cameras by preference but keeps forced participants', () {
      final List<VoiceChannelParticipantData> participants =
          <VoiceChannelParticipantData>[
            _participant(_me, selfVideo: true),
            _participant('a', selfVideo: true),
            _participant('b'),
          ];
      expect(_ids(_build(participants, showOwnCamera: false)), <String>[
        'a|camera',
        'b|camera',
      ]);
      expect(_ids(_build(participants, onlyShowVideos: true)), <String>[
        'me|camera',
        'a|camera',
      ]);
      expect(
        _ids(_build(participants, onlyShowVideos: true, forceShowUserId: 'b')),
        <String>['me|camera', 'a|camera', 'b|camera'],
      );
    });

    test('groups devices of one user until expanded', () {
      final List<VoiceChannelParticipantData> participants =
          <VoiceChannelParticipantData>[
            _participant('a', connectionId: 'a1'),
            _participant('a', connectionId: 'a2'),
          ];
      final VoiceGridTile grouped = _build(participants).single;
      expect(grouped.extraDeviceCount, 1);

      final List<VoiceGridTile> expanded = _build(
        participants,
        expandedUserIds: <String>{'a'},
      );
      expect(_ids(expanded), <String>['a1|camera', 'a2|camera']);
      expect(expanded.first.expandedDeviceCount, 2);
    });
  });

  test('orderVoiceGridTilesBySpeaking puts shares and speakers first', () {
    final List<VoiceGridTile> ordered = orderVoiceGridTilesBySpeaking(
      tiles: <VoiceGridTile>[
        _camera('quiet'),
        _camera('recent'),
        _camera('speaking'),
        _camera('idle'),
        _share('quiet'),
      ],
      speakers: const VoiceActiveSpeakersState(
        speakingKeys: <String>{'speaking'},
        recentlySpokeKeys: <String>{'recent'},
      ),
      participantOf: (VoiceGridTile tile) => _FakeParticipant(tile.data.userId),
    );
    expect(_ids(ordered), <String>[
      'quiet|screen',
      'speaking|camera',
      'recent|camera',
      'quiet|camera',
      'idle|camera',
    ]);
  });

  group('autoMainVoiceGridTile', () {
    String main(
      List<VoiceGridTile> tiles, {
      Set<String> watchedTileIds = const <String>{},
    }) => autoMainVoiceGridTile(
      tiles,
      watchedTileIds: watchedTileIds,
      currentUserId: _me,
    ).tileId;

    test('prefers watched shares, then shares, then other people', () {
      final List<VoiceGridTile> tiles = <VoiceGridTile>[
        _camera(_me),
        _camera('a'),
        _share('a'),
        _share('b'),
      ];
      expect(main(tiles, watchedTileIds: <String>{'b|screen'}), 'b|screen');
      expect(main(tiles), 'a|screen');
      expect(main(<VoiceGridTile>[_camera(_me), _camera('a')]), 'a|camera');
      expect(main(<VoiceGridTile>[_camera(_me)]), 'me|camera');
    });
  });

  group('fullscreenVoiceGridTile', () {
    String? fullscreen(
      List<VoiceGridTile> tiles, {
      Set<String> watchedTileIds = const <String>{},
      String? expandedTileId,
      String? pinnedTileId,
      bool focusMode = false,
    }) => fullscreenVoiceGridTile(
      tiles,
      watchedTileIds: watchedTileIds,
      currentUserId: _me,
      expandedTileId: expandedTileId,
      pinnedTileId: pinnedTileId,
      focusMode: focusMode,
    )?.tileId;

    final List<VoiceGridTile> tiles = <VoiceGridTile>[
      _camera(_me),
      _camera('a', selfVideo: true),
      _share('b'),
    ];

    test('uses the expanded tile even without video', () {
      expect(fullscreen(tiles, expandedTileId: 'me|camera'), 'me|camera');
    });

    test('uses a pinned tile only when it shows video', () {
      expect(fullscreen(tiles, pinnedTileId: 'a|camera'), 'a|camera');
      expect(fullscreen(tiles, pinnedTileId: 'me|camera'), isNull);
    });

    test('falls back to a watched share', () {
      expect(
        fullscreen(
          tiles,
          pinnedTileId: 'me|camera',
          watchedTileIds: <String>{'b|screen'},
        ),
        'b|screen',
      );
      expect(fullscreen(tiles, focusMode: true), isNull);
      expect(fullscreen(const <VoiceGridTile>[]), isNull);
    });
  });

  group('resolveVoiceGridPinnedLayout', () {
    test('places the pinned tile above the rest without overlap', () {
      final VoiceGridPinnedLayout layout = resolveVoiceGridPinnedLayout(
        container: const Size(800, 1100),
        pinned: _share('a'),
        secondary: <VoiceGridTile>[_camera('b'), _camera('c')],
        compact: false,
      );
      expect(layout.rects, hasLength(3));
      for (final Rect rect in layout.rects.skip(1)) {
        expect(rect.top, greaterThanOrEqualTo(layout.pinnedRect.bottom));
        expect(rect.bottom, lessThanOrEqualTo(1100));
      }
      expect(
        layout.rects.first.width / layout.rects.first.height,
        moreOrLessEquals(voiceGridTileAspectRatio, epsilon: 0.01),
      );
    });
  });
}
