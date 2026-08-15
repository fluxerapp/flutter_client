import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel_permission_overwrite_update.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double _kPermissionStateButtonSize = 32;
const double _kActiveStatusMixRatio = 0.88;

class PermissionStateButtons extends StatelessWidget {
  const PermissionStateButtons({
    required this.currentState,
    required this.onStateChange,
    this.disabled = false,
    super.key,
  });

  final ChannelPermissionState currentState;
  final ValueChanged<ChannelPermissionState> onStateChange;
  final bool disabled;

  Color _mixedStatusColor({
    required Color statusColor,
    required Color surfaceColor,
  }) {
    return Color.lerp(surfaceColor, statusColor, _kActiveStatusMixRatio)!;
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Color surfaceColor = context.colors.backgroundSecondary;
    final Color borderColor = context.colors.backgroundModifierAccent;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: surfaceColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _StateButton(
            isActive: currentState == ChannelPermissionState.deny,
            activeBackgroundColor: _mixedStatusColor(
              statusColor: context.colors.statusDanger,
              surfaceColor: surfaceColor,
            ),
            activeForegroundColor: context.colors.buttonDangerText,
            inactiveForegroundColor: context.colors.textPrimary,
            hoverBackgroundColor: context.colors.surfaceInteractiveHoverBg,
            icon: PhosphorIconsBold.x,
            semanticLabel: l10n.permissionOverwriteDeny,
            disabled: disabled,
            onPressed: () => onStateChange(ChannelPermissionState.deny),
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(7),
            ),
          ),
          Container(
            width: 1,
            height: _kPermissionStateButtonSize,
            color: borderColor,
          ),
          _StateButton(
            isActive: currentState == ChannelPermissionState.inherit,
            activeBackgroundColor: context.colors.surfaceInteractiveSelectedBg,
            activeForegroundColor: context.colors.textPrimary,
            inactiveForegroundColor: context.colors.textPrimary,
            hoverBackgroundColor: context.colors.surfaceInteractiveHoverBg,
            icon: PhosphorIconsBold.minus,
            semanticLabel: l10n.permissionOverwriteInherit,
            disabled: disabled,
            onPressed: () => onStateChange(ChannelPermissionState.inherit),
          ),
          Container(
            width: 1,
            height: _kPermissionStateButtonSize,
            color: borderColor,
          ),
          _StateButton(
            isActive: currentState == ChannelPermissionState.allow,
            activeBackgroundColor: _mixedStatusColor(
              statusColor: context.colors.statusOnline,
              surfaceColor: surfaceColor,
            ),
            activeForegroundColor: Colors.white,
            inactiveForegroundColor: context.colors.textPrimary,
            hoverBackgroundColor: context.colors.surfaceInteractiveHoverBg,
            icon: PhosphorIconsBold.check,
            semanticLabel: l10n.permissionOverwriteAllow,
            disabled: disabled,
            onPressed: () => onStateChange(ChannelPermissionState.allow),
            borderRadius: const BorderRadius.horizontal(
              right: Radius.circular(7),
            ),
          ),
        ],
      ),
    );
  }
}

class _StateButton extends StatelessWidget {
  const _StateButton({
    required this.isActive,
    required this.activeBackgroundColor,
    required this.activeForegroundColor,
    required this.inactiveForegroundColor,
    required this.hoverBackgroundColor,
    required this.icon,
    required this.semanticLabel,
    required this.disabled,
    required this.onPressed,
    this.borderRadius,
  });

  final bool isActive;
  final Color activeBackgroundColor;
  final Color activeForegroundColor;
  final Color inactiveForegroundColor;
  final Color hoverBackgroundColor;
  final IconData icon;
  final String semanticLabel;
  final bool disabled;
  final VoidCallback onPressed;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final Color foreground = isActive
        ? activeForegroundColor
        : inactiveForegroundColor;
    final Color background = isActive
        ? activeBackgroundColor
        : Colors.transparent;
    return Semantics(
      button: true,
      enabled: !disabled,
      label: semanticLabel,
      child: Material(
        color: background,
        borderRadius: borderRadius,
        child: InkWell(
          onTap: disabled ? null : onPressed,
          borderRadius: borderRadius,
          hoverColor: isActive ? null : hoverBackgroundColor,
          child: SizedBox(
            width: _kPermissionStateButtonSize,
            height: _kPermissionStateButtonSize,
            child: Center(
              child: Opacity(
                opacity: disabled ? 0.5 : 1,
                child: PhosphorIcon(icon, size: 16, color: foreground),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
