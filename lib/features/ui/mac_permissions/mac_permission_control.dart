import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/desktop/permissions/mac_permissions_controller.dart';
import 'package:fluxer_app/core/desktop/permissions/mac_permissions_provider.dart';
import 'package:fluxer_app/core/desktop/permissions/mac_permissions_state.dart';
import 'package:fluxer_app/core/desktop/window/desktop_main_window.dart';
import 'package:fluxer_app/features/input/providers/global_shortcuts_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_macos/fluxer_macos.dart';

const Duration kMacPermissionPollInterval = Duration(seconds: 1);

class MacPermissionControl {
  const MacPermissionControl({
    required this.status,
    required this.busy,
    required this.relaunchMayHelp,
    required this.quitPromptAdvice,
    required this.runAction,
  });

  final MacPermissionStatus status;
  final bool busy;
  final bool relaunchMayHelp;
  final bool quitPromptAdvice;
  final VoidCallback runAction;

  bool get allowed => status == MacPermissionStatus.granted;
}

class MacPermissionControlBuilder extends ConsumerStatefulWidget {
  const MacPermissionControlBuilder({
    required this.kind,
    required this.builder,
    super.key,
  });

  final MacPermissionKind kind;
  final Widget Function(BuildContext context, MacPermissionControl control)
  builder;

  @override
  ConsumerState<MacPermissionControlBuilder> createState() =>
      _MacPermissionControlBuilderState();
}

class _MacPermissionControlBuilderState
    extends ConsumerState<MacPermissionControlBuilder> {
  late Timer _poll;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    unawaited(macPermissions.refreshKind(widget.kind));
    _poll = Timer.periodic(kMacPermissionPollInterval, (_) => _pollStatus());
  }

  @override
  void didUpdateWidget(MacPermissionControlBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.kind != widget.kind) {
      _busy = false;
      unawaited(macPermissions.refreshKind(widget.kind));
    }
  }

  @override
  void dispose() {
    _poll.cancel();
    super.dispose();
  }

  void _pollStatus() {
    final MacPermissionStatus status = macPermissions.state.statusOf(
      widget.kind,
    );
    final bool needsAction =
        status == MacPermissionStatus.notDetermined ||
        status == MacPermissionStatus.denied;
    if (needsAction && isDesktopMainWindowShown()) {
      unawaited(macPermissions.refreshKind(widget.kind));
    }
  }

  Future<void> _runAction() async {
    final MacPermissionKind kind = widget.kind;
    setState(() => _busy = true);
    try {
      if (macPermissions.state.statusOf(kind) ==
          MacPermissionStatus.notDetermined) {
        await macPermissions.request(kind);
      } else {
        await macPermissions.openSettings(kind);
      }
    } finally {
      if (mounted && widget.kind == kind) {
        setState(() => _busy = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final MacPermissionKind kind = widget.kind;
    final MacPermissionsState state = ref.watch(macPermissionStatusesProvider);
    final bool relaunchMayHelp = switch (kind) {
      MacPermissionKind.screen => state.screenStillBlockedAfterReturn,
      MacPermissionKind.inputMonitoring =>
        state.isGranted(kind) &&
            ref.watch(
              globalShortcutsProvider.select(
                (GlobalShortcutsState value) => value.startFailed,
              ),
            ),
      MacPermissionKind.microphone || MacPermissionKind.camera => false,
    };
    return widget.builder(
      context,
      MacPermissionControl(
        status: state.statusOf(kind),
        busy: _busy,
        relaunchMayHelp: relaunchMayHelp,
        quitPromptAdvice: state.showsQuitPromptAdvice(kind),
        runAction: () => unawaited(_runAction()),
      ),
    );
  }
}
