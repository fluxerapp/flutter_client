import 'package:flutter/material.dart';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/features/ui/toggle_switch/fluxer_switch_control.dart';

/// A themed toggle switch with an optional tappable label on the left.
///
/// Visual styling is handled by the existing [SwitchTheme]
/// in `buildFluxerTheme()`.
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
