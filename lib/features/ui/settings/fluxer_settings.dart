import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/preview/fluxer_widget_preview.dart';
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

@FluxerWidgetPreview(name: 'Header', group: 'FluxerSettings')
Widget fluxerSettingsHeaderPreview() {
  return const FluxerSettingsHeader(
    title: 'Notifications',
    description: 'Choose what you get notified about.',
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
