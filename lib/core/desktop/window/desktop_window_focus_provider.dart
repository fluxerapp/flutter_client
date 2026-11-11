import 'package:fluxer_app/core/desktop/window/desktop_main_window.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:nativeapi/nativeapi.dart'
    show Application, ApplicationActivatedEvent, ApplicationDeactivatedEvent;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:window_manager/window_manager.dart'
    show
        ListenerId,
        Window,
        WindowBlurredEvent,
        WindowEvent,
        WindowFocusedEvent,
        WindowMinimizedEvent,
        WindowRestoredEvent;

part 'desktop_window_focus_provider.g.dart';

@Riverpod(keepAlive: true)
class DesktopWindowFocused extends _$DesktopWindowFocused {
  @override
  bool build() {
    if (!isFluxerDesktopOs) {
      return false;
    }
    final Window? window = desktopMainWindow;
    if (window != null) {
      final ListenerId windowListener = window.addListener(_onWindowEvent);
      ref.onDispose(() => window.removeListener(windowListener));
    }
    final ListenerId appListener = Application.instance.addListener((event) {
      if (event is ApplicationActivatedEvent ||
          event is ApplicationDeactivatedEvent) {
        _sync();
      }
    });
    ref.onDispose(() => Application.instance.removeListener(appListener));
    return isDesktopMainWindowFocused();
  }

  void _onWindowEvent(WindowEvent event) {
    switch (event) {
      case WindowFocusedEvent() ||
          WindowBlurredEvent() ||
          WindowMinimizedEvent() ||
          WindowRestoredEvent():
        _sync();
      default:
        break;
    }
  }

  void _sync() {
    if (!ref.mounted) {
      return;
    }
    state = isDesktopMainWindowFocused();
  }
}
