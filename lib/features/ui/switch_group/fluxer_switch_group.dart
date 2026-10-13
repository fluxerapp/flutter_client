import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart'
    show isMobileLayout;
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/preview/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/features/ui/toggle_switch/fluxer_switch_control.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';

class FluxerSwitchGroup extends StatelessWidget {
  const FluxerSwitchGroup({required this.children, super.key});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) => FluxerMenuGroup(children: children);
}

class FluxerSwitchGroupItem extends StatelessWidget {
  const FluxerSwitchGroupItem({
    required this.label,
    required this.value,
    required this.onChanged,
    this.description,
    this.enabled = true,
    super.key,
  });

  final String label;
  final String? description;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) => FluxerBottomSheetMenuItem(
    label: label,
    hint: description,
    enabled: enabled,
    toggled: value,
    onTap: () {
      FluxerHaptics.selection();
      onChanged(!value);
    },
    trailing: FluxerSwitchControl(value: value, enabled: enabled),
  );
}

class FluxerSettingsSwitchGroup extends StatelessWidget {
  const FluxerSettingsSwitchGroup({required this.children, super.key});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) {
      return const SizedBox.shrink();
    }
    if (isMobileLayout(context)) {
      return FluxerMenuGroup(children: children);
    }

    return Column(mainAxisSize: MainAxisSize.min, children: children);
  }
}

class FluxerSettingsSwitchItem extends StatelessWidget {
  const FluxerSettingsSwitchItem({
    required this.label,
    required this.value,
    required this.onChanged,
    this.description,
    this.enabled = true,
    super.key,
  }) : grouped = false;

  const FluxerSettingsSwitchItem.grouped({
    required this.label,
    required this.value,
    required this.onChanged,
    this.description,
    this.enabled = true,
    super.key,
  }) : grouped = true;

  final String label;
  final String? description;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool enabled;
  final bool grouped;

  @override
  Widget build(BuildContext context) {
    if (isMobileLayout(context)) {
      return FluxerMenuGroup.ensureGrouped(
        context,
        FluxerSwitchGroupItem(
          label: label,
          description: description,
          value: value,
          onChanged: onChanged,
          enabled: enabled,
        ),
      );
    }
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final minHeight = grouped
        ? layout.settingsSwitchGroupedRowMinHeight
        : layout.settingsSwitchRowMinHeight;

    return FluxerTappable(
      enabled: enabled,
      minSize: Size(layout.touchTargetMin, minHeight),
      onTap: () {
        FluxerHaptics.selection();
        onChanged(!value);
      },
      semanticLabel: description != null ? '$label. $description' : label,
      toggled: value,
      excludeChildSemantics: true,
      builder: (context, states) {
        final isPressed = states.contains(WidgetState.pressed);

        return AnimatedContainer(
          duration: context.motion.fast,
          curve: context.motion.curve,
          color: isPressed
              ? colors.backgroundModifierHover.withValues(alpha: 0.45)
              : Colors.transparent,
          constraints: BoxConstraints(minHeight: minHeight),
          padding: EdgeInsets.symmetric(vertical: layout.s1),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      label,
                      style: textStyles.bodySmall.copyWith(
                        color: enabled
                            ? colors.textPrimary
                            : colors.textTertiary,
                        fontWeight: FontWeight.w500,
                        height: 1.4,
                      ),
                    ),
                    if (description != null) ...[
                      SizedBox(height: layout.s1),
                      Text(
                        description!,
                        style: textStyles.bodySmall.copyWith(
                          color: colors.textPrimaryMuted,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              SizedBox(width: layout.s4),
              FluxerSwitchControl(value: value, enabled: enabled),
            ],
          ),
        );
      },
    );
  }
}

class FluxerSettingsAccessoryRow extends StatelessWidget {
  const FluxerSettingsAccessoryRow({
    required this.label,
    required this.trailing,
    required this.onTap,
    this.description,
    super.key,
  });

  final String label;
  final String? description;
  final Widget trailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    if (isMobileLayout(context)) {
      return FluxerMenuGroup.ensureGrouped(
        context,
        FluxerBottomSheetMenuItem(
          label: label,
          hint: description,
          onTap: onTap,
          trailing: trailing,
        ),
      );
    }
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final minHeight = layout.settingsSwitchRowMinHeight;

    return SizedBox(
      width: double.infinity,
      child: FluxerTappable(
        minSize: Size(layout.touchTargetMin, minHeight),
        onTap: onTap,
        semanticLabel: description != null ? '$label. $description' : label,
        excludeChildSemantics: true,
        builder: (context, states) {
          final isPressed = states.contains(WidgetState.pressed);

          return AnimatedContainer(
            duration: context.motion.fast,
            curve: context.motion.curve,
            color: isPressed
                ? colors.backgroundModifierHover.withValues(alpha: 0.45)
                : Colors.transparent,
            constraints: BoxConstraints(minHeight: minHeight),
            padding: EdgeInsets.symmetric(vertical: layout.s1),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        label,
                        style: textStyles.bodySmall.copyWith(
                          color: colors.textPrimary,
                          fontWeight: FontWeight.w500,
                          height: 1.4,
                        ),
                      ),
                      if (description != null) ...[
                        SizedBox(height: layout.s1),
                        Text(
                          description!,
                          style: textStyles.bodySmall.copyWith(
                            color: colors.textPrimaryMuted,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(width: layout.s4),
                trailing,
              ],
            ),
          );
        },
      ),
    );
  }
}

@FluxerWidgetPreview(name: 'Group', group: 'FluxerSwitchGroup')
Widget fluxerSwitchGroupPreview() {
  return FluxerSwitchGroup(
    children: [
      FluxerSwitchGroupItem(
        label: 'Message previews',
        description: 'Show a short excerpt under muted channels.',
        value: true,
        onChanged: (_) {},
      ),
      FluxerSwitchGroupItem(
        label: 'Link embeds',
        value: false,
        onChanged: (_) {},
      ),
    ],
  );
}
