import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class DesktopSettingsStatusSlate extends StatelessWidget {
  const DesktopSettingsStatusSlate({
    required this.icon,
    required this.title,
    this.description,
    this.actions = const <Widget>[],
    this.fullHeight = false,
    super.key,
  });

  final IconData icon;
  final String title;
  final String? description;
  final List<Widget> actions;
  final bool fullHeight;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: fullHeight ? 320 : 120,
        minWidth: double.infinity,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            PhosphorIcon(icon, size: 44, color: colors.textPrimaryMuted),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: context.textStyles.heading.copyWith(
                fontSize: 18,
                height: 24 / 18,
                fontWeight: FontWeight.w600,
                color: colors.textPrimary,
              ),
            ),
            if (description != null) ...<Widget>[
              const SizedBox(height: 12),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 512),
                child: Text(
                  description!,
                  textAlign: TextAlign.center,
                  style: context.textStyles.bodyMedium.copyWith(
                    fontSize: 16,
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                    color: colors.textPrimaryMuted,
                  ),
                ),
              ),
            ],
            if (actions.isNotEmpty) ...<Widget>[
              const SizedBox(height: 20),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: actions,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class DesktopSettingsNotice extends StatelessWidget {
  const DesktopSettingsNotice({
    required this.text,
    this.icon,
    this.bordered = false,
    super.key,
  });

  final String text;
  final IconData? icon;
  final bool bordered;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: bordered
            ? colors.backgroundTertiary
            : colors.backgroundSecondaryAlt,
        borderRadius: BorderRadius.circular(bordered ? 6 : 12),
        border: bordered
            ? Border.all(color: colors.backgroundHeaderSecondary)
            : null,
      ),
      child: Text.rich(
        TextSpan(
          children: <InlineSpan>[
            if (icon != null)
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: PhosphorIcon(
                  icon!,
                  size: 32,
                  color: colors.textPrimaryMuted,
                ),
              ),
            TextSpan(text: text),
          ],
        ),
        textAlign: TextAlign.center,
        style: context.textStyles.bodyMedium.copyWith(
          fontSize: 16,
          height: 1.5,
          fontWeight: FontWeight.w400,
          color: colors.textPrimaryMuted,
        ),
      ),
    );
  }
}
