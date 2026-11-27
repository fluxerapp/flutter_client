import 'package:fluxer_app/features/voice/domain/screen_share_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'active_screen_share_source_provider.g.dart';

@Riverpod(keepAlive: true)
class ActiveScreenShareSource extends _$ActiveScreenShareSource {
  @override
  ScreenShareSource? build() => null;

  void set(ScreenShareSource? source) {
    state = source == null
        ? null
        : ScreenShareSource(
            id: source.id,
            name: source.name,
            kind: source.kind,
          );
  }
}
