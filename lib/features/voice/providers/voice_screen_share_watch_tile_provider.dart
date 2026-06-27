import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_screen_share_watch_tile_provider.g.dart';

/// Watched screen-share tile id (`identity|screen`), or null.
/// Shared by the participant grid and control bar.
@Riverpod(keepAlive: true)
class VoiceScreenShareWatchTile extends _$VoiceScreenShareWatchTile {
  @override
  String? build() => null;

  // Keep the existing notifier call style used by voice UI call sites.
  // ignore: use_setters_to_change_properties
  void setActiveTileId(String? tileId) {
    state = tileId;
  }
}
