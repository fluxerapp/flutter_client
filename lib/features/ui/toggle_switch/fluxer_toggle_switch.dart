import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart'
    show isMobileLayout;
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/preview/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/features/ui/toggle_switch/fluxer_switch_control.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';

class FluxerToggleSwitch extends StatelessWidget {
  const FluxerToggleSwitch({
    required this.value,
    required this.onChanged,
    this.label,
    this.description,
    this.icon,
    this.enabled = true,
    super.key,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final String? label;
  final String? description;
  final IconData? icon;
  final bool enabled;

  String? _semanticsLabel() {
    if (label == null) {
      return description;
    }
    if (description == null) {
      return label;
    }
    return '$label. $description';
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;

    final hasContent = label != null || description != null || icon != null;

    if (label != null &&
        (isMobileLayout(context) || FluxerMenuGroup.isGrouped(context))) {
      return FluxerMenuGroup.ensureGrouped(
        context,
        FluxerBottomSheetMenuItem(
          label: label!,
          hint: description,
          icon: icon,
          enabled: enabled,
          toggled: value,
          onTap: () {
            FluxerHaptics.selection();
            onChanged(!value);
          },
          trailing: FluxerSwitchControl(value: value, enabled: enabled),
        ),
      );
    }

    if (usesDesktopPointerUi(context)) {
      return _buildDesktop(context, hasContent);
    }

    Widget buildLabelContent(BuildContext context, Set<WidgetState> _) {
      final foreground = enabled ? colors.textPrimary : colors.textTertiary;

      return Padding(
        padding: EdgeInsets.symmetric(vertical: layout.s1),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (icon != null) ...[
              Padding(
                padding: EdgeInsets.only(top: layout.s1 / 2),
                child: Icon(icon, size: 18, color: foreground),
              ),
              SizedBox(width: layout.s2),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (label != null)
                    Text(
                      label!,
                      style: textStyles.bodyMedium.copyWith(color: foreground),
                    ),
                  if (description != null) ...[
                    if (label != null) SizedBox(height: layout.s1 / 2),
                    Text(
                      description!,
                      style: textStyles.bodySmall.copyWith(
                        color: enabled
                            ? colors.textSecondary
                            : colors.textTertiary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      );
    }

    return FluxerTappable(
      enabled: enabled,
      minSize: Size(layout.touchTargetMin, layout.touchTargetMin),
      onTap: () {
        FluxerHaptics.selection();
        onChanged(!value);
      },
      semanticLabel: _semanticsLabel(),
      toggled: value,
      excludeChildSemantics: _semanticsLabel() != null,
      builder: (context, states) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (hasContent) ...[
              Expanded(child: buildLabelContent(context, states)),
              SizedBox(width: layout.s4),
            ],
            FluxerSwitchControl(value: value, enabled: enabled),
          ],
        );
      },
    );
  }

  Widget _buildDesktop(BuildContext context, bool hasContent) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final TextStyle base = textStyles.bodySmall.copyWith(
      fontSize: 14,
      height: 20 / 14,
    );
    return FluxerTappable(
      enabled: enabled,
      onTap: () {
        FluxerHaptics.selection();
        onChanged(!value);
      },
      semanticLabel: _semanticsLabel(),
      toggled: value,
      excludeChildSemantics: _semanticsLabel() != null,
      builder: (context, states) {
        return ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 44),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 16,
              children: [
                if (hasContent)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 4,
                      children: [
                        if (label != null || icon != null)
                          Row(
                            spacing: 8,
                            children: [
                              if (icon != null)
                                Icon(icon, size: 18, color: colors.textPrimary),
                              if (label != null)
                                Flexible(
                                  child: Text(
                                    label!,
                                    style: base.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: colors.textPrimary,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        if (description != null)
                          Padding(
                            padding: const EdgeInsetsDirectional.only(end: 16),
                            child: Text(
                              description!,
                              style: base.copyWith(
                                color: colors.textPrimaryMuted,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                FluxerSwitchControl(value: value, enabled: enabled),
              ],
            ),
          ),
        );
      },
    );
  }
}

@FluxerWidgetPreview(name: 'Off', group: 'FluxerToggleSwitch')
Widget fluxerToggleSwitchOffPreview() {
  return FluxerToggleSwitch(
    value: false,
    onChanged: (_) {},
    label: 'Compact mode',
    description: 'Use a denser layout in the sidebar.',
  );
}

@FluxerWidgetPreview(name: 'On', group: 'FluxerToggleSwitch')
Widget fluxerToggleSwitchOnPreview() {
  return FluxerToggleSwitch(
    value: true,
    onChanged: (_) {},
    label: 'Compact mode',
    description: 'Use a denser layout in the sidebar.',
  );
}
