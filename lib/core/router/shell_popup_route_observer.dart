import 'package:flutter/scheduler.dart';
import 'package:fluxer_app/core/router/shell_popup_overlay_sync.dart';
import 'package:fluxer_app/material_ui.dart';

typedef ShellPopupOverlayChanged = void Function({required bool hasOverlay});

/// Tracks [PopupRoute]s (bottom sheets, dialogs) across shell navigators
class ShellPopupRouteObserver extends NavigatorObserver {
  ShellPopupRouteObserver(this._onOverlayChanged);

  final ShellPopupOverlayChanged _onOverlayChanged;

  bool _reconcileScheduled = false;

  /// The navigator flushes observer notifications synchronously, which can
  /// happen mid-build (e.g. a router redirect on logout). Mutating providers
  /// there is forbidden, so defer to a post-frame callback and re-read the
  /// navigator stacks once the frame settles.
  void reconcile() {
    if (SchedulerBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      if (_reconcileScheduled) {
        return;
      }
      _reconcileScheduled = true;
      SchedulerBinding.instance.addPostFrameCallback((_) {
        _reconcileScheduled = false;
        _reconcileNow();
      });
      return;
    }
    _reconcileNow();
  }

  void _reconcileNow() {
    final bool hasOverlay =
        navigatorHasPopupOverlay(navigator) ||
        shellNavigatorsHavePopupOverlay();
    _onOverlayChanged(hasOverlay: hasOverlay);
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    reconcile();
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    reconcile();
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    reconcile();
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    reconcile();
  }
}
