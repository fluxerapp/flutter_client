import 'dart:async';

import 'package:fluxer_app/core/desktop/tray/desktop_tray.dart';
import 'package:fluxer_app/core/desktop/window/desktop_relaunch.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/mac_permissions/mac_permission_control.dart';
import 'package:fluxer_app/features/ui/mac_permissions/mac_permission_labels.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_macos/fluxer_macos.dart';

class MacPermissionSettingsLine extends StatelessWidget {
  const MacPermissionSettingsLine({required this.kind, super.key});

  final MacPermissionKind kind;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final colors = context.colors;
    final String name = macPermissionName(l10n, kind);
    return MacPermissionControlBuilder(
      kind: kind,
      builder: (BuildContext context, MacPermissionControl control) {
        final String? action = macPermissionActionLabel(l10n, control.status);
        return ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 44),
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              start: layout.s4,
              end: layout.s2,
            ),
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: switch (control.status) {
                      MacPermissionStatus.granted => colors.accentSuccess,
                      MacPermissionStatus.denied => colors.statusWarning,
                      MacPermissionStatus.notDetermined ||
                      MacPermissionStatus.unsupported => colors.textTertiary,
                    },
                  ),
                ),
                SizedBox(width: layout.s3),
                Expanded(
                  child: Text(
                    name,
                    semanticsLabel: control.allowed
                        ? name
                        : '$name, ${l10n.macPermissionNotAllowed}',
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyles.label.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 20 / 14,
                      color: colors.textPrimary,
                    ),
                  ),
                ),
                SizedBox(width: layout.s3),
                if (control.relaunchMayHelp)
                  _LineAction(
                    label: l10n.macPermissionRelaunchToApply,
                    permissionName: name,
                    onPressed: () =>
                        unawaited(relaunchDesktopApp(quit: DesktopTray.quit)),
                  ),
                if (control.relaunchMayHelp) SizedBox(width: layout.s1),
                if (action != null)
                  _LineAction(
                    label: action,
                    permissionName: name,
                    busy: control.busy,
                    onPressed: control.runAction,
                  )
                else if (control.allowed)
                  const _LineAllowed(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _LineAction extends StatelessWidget {
  const _LineAction({
    required this.label,
    required this.permissionName,
    required this.onPressed,
    this.busy = false,
  });

  final String label;
  final String permissionName;
  final VoidCallback onPressed;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    return FluxerButton.ghost(
      size: FluxerButtonSize.compact,
      fitContent: true,
      isLoading: busy,
      semanticLabel: '$label, $permissionName',
      onPressed: onPressed,
      child: Text(
        label,
        style: context.textStyles.label.copyWith(
          fontSize: 13,
          height: 18 / 13,
          color: context.colors.textLink,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _LineAllowed extends StatelessWidget {
  const _LineAllowed();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: EdgeInsetsDirectional.only(end: context.layout.s2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 6,
        children: [
          PhosphorIcon(
            PhosphorIconsBold.check,
            size: 14,
            color: colors.accentSuccess,
          ),
          Text(
            FluxerLocalizations.of(context).macPermissionAllowed,
            style: context.textStyles.bodySmall.copyWith(
              fontSize: 14,
              height: 20 / 14,
              color: colors.textPrimaryMuted,
            ),
          ),
        ],
      ),
    );
  }
}
