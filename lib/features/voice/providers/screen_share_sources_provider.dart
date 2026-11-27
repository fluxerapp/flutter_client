import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_webrtc/flutter_webrtc.dart'
    show DesktopCapturerSource, SourceType, ThumbnailSize, desktopCapturer;
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/voice/domain/screen_share_source.dart';
import 'package:fluxer_app/features/voice/domain/screen_share_sources_state.dart';
import 'package:fluxer_app/features/voice/utils/screen_share/screen_share_thumbnail.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screen_share_sources_provider.g.dart';

const Duration _kSourcePollInterval = Duration(seconds: 1);
const Duration _kThumbnailRefreshInterval = Duration(milliseconds: 2500);
const List<SourceType> _kSourceTypes = <SourceType>[
  SourceType.Window,
  SourceType.Screen,
];

@riverpod
class ScreenShareSources extends _$ScreenShareSources {
  final List<StreamSubscription<DesktopCapturerSource>> _subscriptions =
      <StreamSubscription<DesktopCapturerSource>>[];
  final Map<String, DateTime> _thumbnailAcceptedAt = <String, DateTime>{};
  Timer? _poll;
  bool _polling = false;
  int _generation = 0;

  @override
  ScreenShareSourcesState build() {
    ref.onDispose(_stop);
    _subscriptions.addAll(<StreamSubscription<DesktopCapturerSource>>[
      desktopCapturer.onAdded.stream.listen(_onAdded),
      desktopCapturer.onRemoved.stream.listen(_onRemoved),
      desktopCapturer.onNameChanged.stream.listen(_onNameChanged),
      desktopCapturer.onThumbnailChanged.stream.listen(_onThumbnailChanged),
    ]);
    unawaited(Future<void>.microtask(reload));
    return const ScreenShareSourcesState();
  }

  Future<void> reload() async {
    final int generation = ++_generation;
    _poll?.cancel();
    _thumbnailAcceptedAt.clear();
    state = state.copyWith(status: ScreenShareSourcesStatus.loading);
    try {
      final List<DesktopCapturerSource> raw = await desktopCapturer.getSources(
        types: _kSourceTypes,
        thumbnailSize: ThumbnailSize(960, 540),
      );
      if (!ref.mounted || generation != _generation) {
        return;
      }
      state = ScreenShareSourcesState(
        status: ScreenShareSourcesStatus.ready,
        sources: <ScreenShareSource>[
          for (final DesktopCapturerSource source in raw) _toSource(source),
        ],
      );
      for (final DesktopCapturerSource source in raw) {
        unawaited(_applyThumbnail(source.id, source.thumbnail, force: true));
      }
      _poll = Timer.periodic(_kSourcePollInterval, (_) => _tick());
    } on Object catch (error, stackTrace) {
      talker.warning(
        '[Voice] Listing screen share sources failed',
        error,
        stackTrace,
      );
      if (ref.mounted && generation == _generation) {
        state = state.copyWith(status: ScreenShareSourcesStatus.failed);
      }
    }
  }

  Future<void> _tick() async {
    if (_polling || !ref.mounted) {
      return;
    }
    _polling = true;
    try {
      await desktopCapturer.updateSources(types: _kSourceTypes);
    } on Object catch (error) {
      talker.debug('[Voice] Updating screen share sources failed: $error');
    } finally {
      _polling = false;
    }
  }

  ScreenShareSource _toSource(DesktopCapturerSource source) {
    return ScreenShareSource(
      id: source.id,
      name: source.name.trim(),
      kind: source.type == SourceType.Window
          ? ScreenShareSourceKind.window
          : ScreenShareSourceKind.screen,
    );
  }

  void _onAdded(DesktopCapturerSource source) {
    if (!ref.mounted || state.status != ScreenShareSourcesStatus.ready) {
      return;
    }
    if (state.sources.any((ScreenShareSource s) => s.id == source.id)) {
      return;
    }
    state = state.copyWith(
      sources: <ScreenShareSource>[...state.sources, _toSource(source)],
    );
    unawaited(_applyThumbnail(source.id, source.thumbnail, force: true));
  }

  void _onRemoved(DesktopCapturerSource source) {
    if (!ref.mounted) {
      return;
    }
    _thumbnailAcceptedAt.remove(source.id);
    state = state.copyWith(
      sources: <ScreenShareSource>[
        for (final ScreenShareSource s in state.sources)
          if (s.id != source.id) s,
      ],
    );
  }

  void _onNameChanged(DesktopCapturerSource source) {
    _update(source.id, (ScreenShareSource s) {
      return s.copyWith(name: source.name.trim());
    });
  }

  void _onThumbnailChanged(DesktopCapturerSource source) {
    unawaited(_applyThumbnail(source.id, source.thumbnail));
  }

  Future<void> _applyThumbnail(
    String id,
    Uint8List? bytes, {
    bool force = false,
  }) async {
    if (bytes == null || bytes.isEmpty) {
      return;
    }
    final DateTime now = DateTime.now();
    final DateTime? last = _thumbnailAcceptedAt[id];
    if (!force &&
        last != null &&
        now.difference(last) < _kThumbnailRefreshInterval) {
      return;
    }
    _thumbnailAcceptedAt[id] = now;
    final int generation = _generation;
    final Uint8List? decoded;
    try {
      decoded = await decodeScreenShareThumbnail(bytes);
    } on Object catch (error) {
      talker.debug('[Voice] Decoding screen share thumbnail failed: $error');
      return;
    }
    if (decoded == null || generation != _generation) {
      return;
    }
    _update(id, (ScreenShareSource s) => s.copyWith(thumbnail: decoded));
  }

  void _update(String id, ScreenShareSource Function(ScreenShareSource) patch) {
    if (!ref.mounted) {
      return;
    }
    final int index = state.sources.indexWhere(
      (ScreenShareSource s) => s.id == id,
    );
    if (index < 0) {
      return;
    }
    final List<ScreenShareSource> next = List<ScreenShareSource>.of(
      state.sources,
    );
    next[index] = patch(next[index]);
    state = state.copyWith(sources: next);
  }

  void _stop() {
    _generation++;
    _poll?.cancel();
    _poll = null;
    for (final StreamSubscription<DesktopCapturerSource> sub
        in _subscriptions) {
      unawaited(sub.cancel());
    }
    _subscriptions.clear();
  }
}
