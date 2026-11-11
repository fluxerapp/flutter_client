import 'package:fluxer_app/core/desktop/window/desktop_main_window.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'desktop_window_focus_provider.g.dart';

@Riverpod(keepAlive: true)
class DesktopWindowFocused extends _$DesktopWindowFocused {
  @override
  bool build() {
    if (!isFluxerDesktopOs) {
      return false;
    }
    desktopMainWindow.addListener(_sync);
    ref.onDispose(() => desktopMainWindow.removeListener(_sync));
    return isDesktopMainWindowFocused();
  }

  void _sync() {
    if (!ref.mounted) {
      return;
    }
    state = isDesktopMainWindowFocused();
  }
}
