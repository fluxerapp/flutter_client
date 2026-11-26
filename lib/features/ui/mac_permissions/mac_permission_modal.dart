import 'package:fluxer_app/core/router/shell_navigator_keys.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/mac_permissions/mac_permission_labels.dart';
import 'package:fluxer_app/features/ui/mac_permissions/mac_permission_prompt.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal_slot.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_macos/fluxer_macos.dart';

final FluxerModalSlot _modalSlot = FluxerModalSlot();

Future<void> showMacPermissionModal(
  MacPermissionKind kind, {
  BuildContext? context,
}) {
  final BuildContext? target = context != null && context.mounted
      ? context
      : rootNavigatorKey.currentContext;
  if (target == null || !target.mounted) {
    return Future<void>.value();
  }
  return _modalSlot.show(
    () => FluxerModal.showBare<void>(
      target,
      useRootNavigator: true,
      semanticLabel: macPermissionName(FluxerLocalizations.of(target), kind),
      builder: (BuildContext dialogContext, VoidCallback close) =>
          FluxerModalSlotScope(
            slot: _modalSlot,
            child: _MacPermissionModalBody(kind: kind),
          ),
    ),
  );
}

class _MacPermissionModalBody extends StatefulWidget {
  const _MacPermissionModalBody({required this.kind});

  final MacPermissionKind kind;

  @override
  State<_MacPermissionModalBody> createState() =>
      _MacPermissionModalBodyState();
}

class _MacPermissionModalBodyState extends State<_MacPermissionModalBody> {
  bool _closed = false;

  void _close() {
    if (_closed || !mounted) {
      return;
    }
    _closed = true;
    final ModalRoute<Object?>? route = ModalRoute.of(context);
    if (route == null || !route.isActive) {
      return;
    }
    final NavigatorState navigator = Navigator.of(context);
    if (route.isCurrent) {
      navigator.pop();
    } else {
      navigator.removeRoute(route);
    }
  }

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    return SizedBox(
      width: 440,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          layout.s6,
          layout.s6,
          layout.s6,
          layout.s4,
        ),
        child: MacPermissionPrompt(
          kind: widget.kind,
          autofocus: true,
          onAllowed: _close,
          onNotNow: _close,
        ),
      ),
    );
  }
}
