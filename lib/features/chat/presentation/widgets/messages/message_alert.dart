import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

enum AlertType {
  note(icon: PhosphorIconsFill.info),
  tip(icon: PhosphorIconsFill.lightbulbFilament),
  important(icon: PhosphorIconsFill.warning),
  warning(icon: PhosphorIconsFill.warningOctagon),
  caution(icon: PhosphorIconsFill.warningCircle);

  const AlertType({required this.icon});

  final IconData icon;

  Color accentColor(BuildContext context) {
    final colors = context.colors;
    return switch (this) {
      AlertType.note => colors.alertNote,
      AlertType.tip => colors.alertTip,
      AlertType.important => colors.alertImportant,
      AlertType.warning => colors.alertWarning,
      AlertType.caution => colors.alertCaution,
    };
  }
}

String alertTypeLabel(FluxerLocalizations l10n, AlertType type) {
  return switch (type) {
    AlertType.note => l10n.messageAlertNote,
    AlertType.tip => l10n.messageAlertTip,
    AlertType.important => l10n.messageAlertImportant,
    AlertType.warning => l10n.messageAlertWarning,
    AlertType.caution => l10n.messageAlertCaution,
  };
}

class MessageAlert extends StatelessWidget {
  const MessageAlert({
    required this.type,
    required this.bodyWidget,
    this.baseStyle,
    super.key,
  });

  final AlertType type;
  final Widget bodyWidget;
  final TextStyle? baseStyle;

  @override
  Widget build(BuildContext context) {
    final accent = type.accentColor(context);
    final style = baseStyle ?? context.textStyles.messageText;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 4,
              decoration: BoxDecoration(
                color: accent,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(type.icon, size: 16, color: accent),
                      const SizedBox(width: 6),
                      Text(
                        alertTypeLabel(FluxerLocalizations.of(context), type),
                        style: style.copyWith(
                          color: accent,
                          fontWeight: FontWeight.w600,
                          fontSize: (style.fontSize ?? 16) * 0.875,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  bodyWidget,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
