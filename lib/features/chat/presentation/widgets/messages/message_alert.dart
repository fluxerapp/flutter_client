import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// > [!NOTE], > [!TIP], > [!IMPORTANT], > [!WARNING], > [!CAUTION]
enum AlertType {
  note(label: 'Note', icon: PhosphorIconsFill.info),
  tip(label: 'Tip', icon: PhosphorIconsFill.lightbulbFilament),
  important(label: 'Important', icon: PhosphorIconsFill.warning),
  warning(label: 'Warning', icon: PhosphorIconsFill.warningOctagon),
  caution(label: 'Caution', icon: PhosphorIconsFill.warningCircle);

  const AlertType({required this.label, required this.icon});

  final String label;
  final IconData icon;

  static AlertType? tryParse(String raw) {
    final key = raw.trim().toLowerCase();
    for (final t in values) {
      if (t.name == key) {
        return t;
      }
    }
    return null;
  }

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
                        type.label,
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
