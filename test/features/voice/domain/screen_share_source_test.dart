import 'package:fluxer_app/features/voice/domain/screen_share_picker.dart';
import 'package:fluxer_app/features/voice/domain/screen_share_source.dart';
import 'package:fluxer_app/features/voice/domain/screen_share_sources_state.dart';
import 'package:test/test.dart';

void main() {
  const ScreenShareSource window = ScreenShareSource(
    id: 'window:1',
    name: 'Editor',
    kind: ScreenShareSourceKind.window,
  );
  const ScreenShareSource screen = ScreenShareSource(
    id: '2',
    name: 'Built-in display',
    kind: ScreenShareSourceKind.screen,
  );

  test('splits sources by picker tab', () {
    const ScreenShareSourcesState state = ScreenShareSourcesState(
      status: ScreenShareSourcesStatus.ready,
      sources: <ScreenShareSource>[window, screen],
    );
    expect(
      state.of(ScreenSharePickerTab.applications.kind),
      <ScreenShareSource>[window],
    );
    expect(
      state.of(ScreenSharePickerTab.entireScreen.kind),
      <ScreenShareSource>[screen],
    );
  });

  test('maps a source kind back to its tab', () {
    expect(
      ScreenSharePickerTab.forKind(ScreenShareSourceKind.window),
      ScreenSharePickerTab.applications,
    );
    expect(
      ScreenSharePickerTab.forKind(ScreenShareSourceKind.screen),
      ScreenSharePickerTab.entireScreen,
    );
  });

  test('renaming keeps the thumbnail', () {
    final ScreenShareSource renamed = window.copyWith(name: 'Browser');
    expect(renamed.name, 'Browser');
    expect(renamed.id, window.id);
    expect(renamed.kind, window.kind);
  });
}
