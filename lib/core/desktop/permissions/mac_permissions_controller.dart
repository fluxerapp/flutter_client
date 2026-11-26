import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/desktop/permissions/mac_permissions_state.dart';
import 'package:fluxer_app/core/desktop/window/desktop_main_window.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_macos/fluxer_macos.dart';

bool get supportsMacPermissions =>
    defaultTargetPlatform == TargetPlatform.macOS && !kIsWeb;

MacPermissionsController macPermissions = MacPermissionsController();

class MacPermissionsController extends ChangeNotifier {
  MacPermissionsController({MacPermissions? platform, this._isSupported})
    : _platform = platform ?? MacPermissions();

  final MacPermissions _platform;
  final bool? _isSupported;

  MacPermissionsState _state = const MacPermissionsState();
  bool _attached = false;
  bool _windowFocused = false;

  MacPermissionsState get state => _state;
  bool get isSupported => _isSupported ?? supportsMacPermissions;

  Future<void> attach() async {
    if (_attached || !isSupported) {
      return;
    }
    _attached = true;
    _windowFocused = desktopMainWindow.isFocused;
    desktopMainWindow.addListener(_handleWindowChanged);
    await refreshAll();
  }

  void _handleWindowChanged() {
    final bool focused = desktopMainWindow.isFocused;
    if (focused == _windowFocused) {
      return;
    }
    _windowFocused = focused;
    if (focused) {
      unawaited(refreshAfterReturn());
    }
  }

  Future<void> refreshAll() async {
    await Future.wait(MacPermissionKind.values.map(refreshKind));
  }

  Future<MacPermissionStatus> refreshKind(
    MacPermissionKind kind, {
    bool liveProbe = false,
  }) async {
    if (!isSupported) {
      return MacPermissionStatus.unsupported;
    }
    try {
      final MacPermissionStatus status = await _platform.status(
        kind,
        liveProbe: liveProbe,
      );
      _emit(_state.withStatus(kind, status));
      return status;
    } on Object catch (error, stackTrace) {
      talker.warning(
        '[MacPermissions] Status of $kind failed',
        error,
        stackTrace,
      );
      return _state.statusOf(kind);
    }
  }

  Future<void> refreshAfterReturn() async {
    if (_state.allGranted) {
      return;
    }
    await refreshAll();
    _emit(
      _state.copyWith(
        screenStillBlockedAfterReturn:
            _state.changeRequested.contains(MacPermissionKind.screen) &&
            !_state.isGranted(MacPermissionKind.screen),
      ),
    );
  }

  Future<MacPermissionStatus> request(MacPermissionKind kind) async {
    if (!isSupported) {
      return MacPermissionStatus.unsupported;
    }
    try {
      final MacPermissionStatus status = await _platform.request(kind);
      _markChangeRequested(kind);
      _emit(_state.withStatus(kind, status));
      return status;
    } on Object catch (error, stackTrace) {
      talker.warning(
        '[MacPermissions] Request of $kind failed',
        error,
        stackTrace,
      );
      return _state.statusOf(kind);
    }
  }

  Future<void> openSettings(MacPermissionKind kind) async {
    await openPrivacyPane(switch (kind) {
      MacPermissionKind.microphone => MacPrivacyPane.microphone,
      MacPermissionKind.camera => MacPrivacyPane.camera,
      MacPermissionKind.screen => MacPrivacyPane.screen,
      MacPermissionKind.inputMonitoring => MacPrivacyPane.inputMonitoring,
    });
    if (!_state.isGranted(kind)) {
      _markChangeRequested(kind);
    }
  }

  Future<void> openPrivacyPane(MacPrivacyPane pane) async {
    if (!isSupported) {
      return;
    }
    try {
      await _platform.openSettings(pane);
    } on Object catch (error, stackTrace) {
      talker.warning(
        '[MacPermissions] Opening $pane settings failed',
        error,
        stackTrace,
      );
    }
  }

  Future<MacPermissionStatus> ensure(
    MacPermissionKind kind, {
    bool liveProbe = false,
  }) async {
    final MacPermissionStatus status = await refreshKind(
      kind,
      liveProbe: liveProbe,
    );
    if (status != MacPermissionStatus.notDetermined) {
      return status;
    }
    return await request(kind);
  }

  void _markChangeRequested(MacPermissionKind kind) {
    _emit(
      _state.copyWith(
        changeRequested: <MacPermissionKind>{..._state.changeRequested, kind},
      ),
    );
  }

  void _emit(MacPermissionsState next) {
    if (next == _state) {
      return;
    }
    _state = next;
    notifyListeners();
  }

  @override
  void dispose() {
    if (_attached) {
      desktopMainWindow.removeListener(_handleWindowChanged);
    }
    super.dispose();
  }
}
