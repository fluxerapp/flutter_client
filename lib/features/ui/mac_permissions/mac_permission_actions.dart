import 'dart:async';

import 'package:fluxer_app/core/desktop/tray/desktop_tray.dart';
import 'package:fluxer_app/core/desktop/window/desktop_relaunch.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/mac_permissions/mac_permission_allowed_label.dart';
import 'package:fluxer_app/features/ui/mac_permissions/mac_permission_control.dart';
import 'package:fluxer_app/features/ui/mac_permissions/mac_permission_labels.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class MacPermissionActions extends StatelessWidget {
  const MacPermissionActions({
    required this.control,
    required this.onNotNow,
    super.key,
  });

  final MacPermissionControl control;
  final VoidCallback onNotNow;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: control.allowed
          ? const Center(child: MacPermissionAllowedLabel())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: context.layout.s1,
              children: [
                Flexible(child: _buildPrimary(context)),
                Flexible(child: _buildNotNow(context)),
              ],
            ),
    );
  }

  Widget _buildPrimary(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String? action = macPermissionActionLabel(l10n, control.status);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: context.layout.s2,
      children: [
        if (action != null)
          Flexible(
            child: IntrinsicWidth(
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 176),
                child: FluxerButton.primary(
                  size: FluxerButtonSize.small,
                  label: action,
                  isLoading: control.busy,
                  onPressed: control.runAction,
                ),
              ),
            ),
          ),
        if (control.relaunchMayHelp)
          Flexible(
            child: IntrinsicWidth(
              child: FluxerButton.secondary(
                size: FluxerButtonSize.small,
                label: l10n.macPermissionRelaunchToApply,
                onPressed: () =>
                    unawaited(relaunchDesktopApp(quit: DesktopTray.quit)),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildNotNow(BuildContext context) {
    final String label = FluxerLocalizations.of(context).macPermissionNotNow;
    return IntrinsicWidth(
      child: FluxerButton.ghost(
        size: FluxerButtonSize.compact,
        semanticLabel: label,
        onPressed: onNotNow,
        child: Text(
          label,
          style: context.textStyles.label.copyWith(
            fontSize: 13,
            height: 18 / 13,
            color: context.colors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
