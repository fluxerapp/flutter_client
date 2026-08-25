import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/features/ui/toggle_switch/fluxer_switch_control.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FluxerSettingsHeader extends StatelessWidget {
  const FluxerSettingsHeader({
    required this.title,
    super.key,
    this.description,
    this.onBack,
    this.trailing,
  });

  final String title;
  final String? description;
  final VoidCallback? onBack;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);

    return Padding(
      padding: EdgeInsets.all(layout.s4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              if (onBack != null)
                IconButton(
                  onPressed: onBack,
                  tooltip: l10n.back,
                  icon: PhosphorIcon(
                    PhosphorIconsBold.caretLeft,
                    size: 20,
                    color: colors.textPrimary,
                  ),
                ),
              Expanded(
                child: Text(
                  title,
                  style: context.textStyles.heading.copyWith(
                    color: colors.textPrimary,
                  ),
                ),
              ),
              if (trailing case final Widget trailingWidget) trailingWidget,
            ],
          ),
          if (description != null) ...[
            SizedBox(height: layout.s1),
            Text(
              description!,
              style: context.textStyles.bodySmall.copyWith(
                color: colors.textSecondary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class FluxerSettingsGroup extends StatelessWidget {
  const FluxerSettingsGroup({required this.children, super.key});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) {
      return const SizedBox.shrink();
    }

    final colors = context.colors;
    final layout = context.layout;

    return Material(
      color: colors.backgroundSecondaryAlt,
      surfaceTintColor: Colors.transparent,
      borderRadius: layout.radiusXl,
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: _intersperseSettingsDividers(children, colors),
      ),
    );
  }
}

class FluxerSettingsRow extends StatelessWidget {
  const FluxerSettingsRow({
    required this.title,
    super.key,
    this.description,
    this.leading,
    this.trailing,
    this.onTap,
    this.isDanger = false,
    this.enabled = true,
  });

  final String title;
  final String? description;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool isDanger;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final baseColor = isDanger ? colors.statusDanger : colors.textPrimary;

    Widget buildContent(BuildContext context, Set<WidgetState> states) {
      final isPressed = states.contains(WidgetState.pressed);

      return AnimatedContainer(
        duration: context.motion.fast,
        curve: context.motion.curve,
        color: isPressed
            ? colors.backgroundModifierHover.withValues(alpha: 0.5)
            : Colors.transparent,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 56),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: layout.s4,
              vertical: layout.s3,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (leading case final leadingWidget) ...[
                  Padding(
                    padding: EdgeInsets.only(top: layout.s1 / 2),
                    child: leadingWidget,
                  ),
                  SizedBox(width: layout.s3),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: context.textStyles.bodyMedium.copyWith(
                          color: enabled ? baseColor : colors.textTertiary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (description != null) ...[
                        SizedBox(height: layout.s1 / 2),
                        Text(
                          description!,
                          style: context.textStyles.bodySmall.copyWith(
                            color: colors.textSecondary,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                if (trailing != null) ...[
                  SizedBox(width: layout.s3),
                  trailing!,
                ],
              ],
            ),
          ),
        ),
      );
    }

    if (onTap == null) {
      return buildContent(context, <WidgetState>{});
    }

    return FluxerTappable(
      enabled: enabled,
      onTap: onTap,
      minSize: const Size(44, 56),
      semanticLabel: title,
      builder: buildContent,
    );
  }
}

class FluxerSettingsFormSection extends StatelessWidget {
  const FluxerSettingsFormSection({
    required this.children,
    super.key,
    this.title,
    this.description,
  });

  final String? title;
  final String? description;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

    return Padding(
      padding: EdgeInsets.all(layout.s4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null) ...[
            Text(
              title!,
              style: context.textStyles.heading.copyWith(
                color: colors.textPrimary,
              ),
            ),
            if (description != null) ...[
              SizedBox(height: layout.s1),
              Text(
                description!,
                style: context.textStyles.bodySmall.copyWith(
                  color: colors.textSecondary,
                ),
              ),
            ],
            SizedBox(height: layout.s3),
          ],
          for (var i = 0; i < children.length; i++) ...[
            children[i],
            if (i < children.length - 1) SizedBox(height: layout.s3),
          ],
        ],
      ),
    );
  }
}

class FluxerSettingsDangerZone extends StatelessWidget {
  const FluxerSettingsDangerZone({
    required this.child,
    super.key,
    this.title,
    this.description,
  });

  final String? title;
  final String? description;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

    return Padding(
      padding: EdgeInsets.all(layout.s4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null)
            Text(
              title!,
              style: context.textStyles.label.copyWith(
                color: colors.statusDanger,
              ),
            ),
          if (description != null) ...[
            SizedBox(height: layout.s1),
            Text(
              description!,
              style: context.textStyles.bodySmall.copyWith(
                color: colors.textSecondary,
              ),
            ),
          ],
          SizedBox(height: layout.s3),
          child,
        ],
      ),
    );
  }
}

List<Widget> _intersperseSettingsDividers(
  List<Widget> items,
  FluxerColorTheme colors,
) {
  final result = <Widget>[];
  for (var i = 0; i < items.length; i++) {
    result.add(items[i]);
    if (i < items.length - 1) {
      result.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Divider(
            height: 1,
            thickness: 1,
            color: colors.backgroundHeaderSecondary.withValues(alpha: 0.3),
          ),
        ),
      );
    }
  }
  return result;
}

@FluxerWidgetPreview(name: 'Header', group: 'FluxerSettings')
Widget fluxerSettingsHeaderPreview() {
  return const FluxerSettingsHeader(
    title: 'Notifications',
    description: 'Choose what you get notified about.',
  );
}

@FluxerWidgetPreview(name: 'Group + rows', group: 'FluxerSettings')
Widget fluxerSettingsGroupPreview() {
  return FluxerSettingsGroup(
    children: [
      const FluxerSettingsRow(
        title: 'Push notifications',
        description: 'Alerts on this device.',
        trailing: FluxerSwitchControl(value: true),
      ),
      FluxerSettingsRow(
        title: 'Email digest',
        onTap: () {},
        trailing: const PhosphorIcon(PhosphorIconsBold.caretRight, size: 18),
      ),
    ],
  );
}

@FluxerWidgetPreview(name: 'Form section', group: 'FluxerSettings')
Widget fluxerSettingsFormSectionPreview() {
  return const FluxerSettingsFormSection(
    title: 'Profile',
    description: 'This information is visible to others.',
    children: [FluxerInput(label: 'Display name', hint: 'Your name')],
  );
}

@FluxerWidgetPreview(name: 'Danger zone', group: 'FluxerSettings')
Widget fluxerSettingsDangerZonePreview() {
  return FluxerSettingsDangerZone(
    title: 'Danger zone',
    description: 'These actions are permanent.',
    child: FluxerButton.dangerSecondary(
      onPressed: () {},
      label: 'Delete account',
    ),
  );
}
