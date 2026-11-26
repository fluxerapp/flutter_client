import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/desktop/permissions/mac_permissions_provider.dart';
import 'package:fluxer_app/core/desktop/permissions/mac_permissions_state.dart';
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/mac_permissions/mac_permission_actions.dart';
import 'package:fluxer_app/features/ui/mac_permissions/mac_permission_control.dart';
import 'package:fluxer_app/features/ui/mac_permissions/mac_permission_labels.dart';
import 'package:fluxer_app/features/ui/mac_permissions/mac_permission_purpose.dart';
import 'package:fluxer_app/features/ui/mac_permissions/mac_permission_tile.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_macos/fluxer_macos.dart';

const Duration kMacPermissionAllowedBeat = Duration(milliseconds: 900);

class MacPermissionPrompt extends ConsumerStatefulWidget {
  const MacPermissionPrompt({
    required this.kind,
    required this.onAllowed,
    required this.onNotNow,
    this.autofocus = false,
    super.key,
  });

  final bool autofocus;
  final MacPermissionKind kind;
  final VoidCallback onAllowed;
  final VoidCallback onNotNow;

  @override
  ConsumerState<MacPermissionPrompt> createState() =>
      _MacPermissionPromptState();
}

class _MacPermissionPromptState extends ConsumerState<MacPermissionPrompt> {
  Timer? _allowedTimer;

  @override
  void initState() {
    super.initState();
    ref.listenManual<MacPermissionsState>(
      macPermissionStatusesProvider,
      (_, MacPermissionsState next) => _syncAllowedTimer(next),
      fireImmediately: true,
    );
  }

  @override
  void didUpdateWidget(MacPermissionPrompt oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.kind != widget.kind) {
      _allowedTimer?.cancel();
      _allowedTimer = null;
      _syncAllowedTimer(ref.read(macPermissionStatusesProvider));
    }
  }

  @override
  void dispose() {
    _allowedTimer?.cancel();
    super.dispose();
  }

  void _syncAllowedTimer(MacPermissionsState state) {
    if (!state.isGranted(widget.kind)) {
      _allowedTimer?.cancel();
      _allowedTimer = null;
      return;
    }
    _allowedTimer ??= Timer(
      kMacPermissionAllowedBeat,
      () => widget.onAllowed(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MacPermissionKind kind = widget.kind;
    final String productName = ref.watch(
      instanceRuntimeConfigProvider.select((config) => config.productName),
    );
    return MacPermissionControlBuilder(
      kind: kind,
      builder: (BuildContext context, MacPermissionControl control) =>
          CallbackShortcuts(
            bindings: <ShortcutActivator, VoidCallback>{
              if (widget.autofocus && !control.allowed && !control.busy)
                const SingleActivator(LogicalKeyboardKey.enter):
                    control.runAction,
            },
            child: Focus(
              autofocus: widget.autofocus,
              canRequestFocus: widget.autofocus,
              child: _buildContent(context, control, productName: productName),
            ),
          ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    MacPermissionControl control, {
    required String productName,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final MacPermissionKind kind = widget.kind;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MacPermissionTile(kind: kind),
        SizedBox(height: layout.s4),
        Semantics(
          header: true,
          child: Text(
            macPermissionName(l10n, kind),
            textAlign: TextAlign.center,
            style: context.textStyles.heading.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              height: 1.25,
              color: context.colors.textPrimary,
            ),
          ),
        ),
        SizedBox(height: layout.s2),
        MacPermissionPurpose(
          purpose: macPermissionPurpose(l10n, kind),
          advice: kMacPermissionKindsWithQuitPrompt.contains(kind)
              ? l10n.macPermissionQuitPromptAdvice(productName)
              : null,
          showAdvice: control.quitPromptAdvice,
        ),
        SizedBox(height: layout.s6),
        MacPermissionActions(control: control, onNotNow: widget.onNotNow),
      ],
    );
  }
}
