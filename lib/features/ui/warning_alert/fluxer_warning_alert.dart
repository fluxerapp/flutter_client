import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum FluxerAlertVariant { info, warning, danger }

class FluxerWarningAlert extends StatelessWidget {
  const FluxerWarningAlert({
    required this.message,
    this.title,
    this.variant = FluxerAlertVariant.warning,
    super.key,
  });

  final String message;
  final String? title;
  final FluxerAlertVariant variant;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

    final Color borderColor;
    final IconData icon;

    switch (variant) {
      case FluxerAlertVariant.info:
        borderColor = colors.accentInfo;
        icon = PhosphorIconsBold.info;
      case FluxerAlertVariant.warning:
        borderColor = colors.accentWarning;
        icon = PhosphorIconsBold.warning;
      case FluxerAlertVariant.danger:
        borderColor = colors.accentDanger;
        icon = PhosphorIconsBold.warningCircle;
    }

    final String alertLabel = title != null ? '$title. $message' : message;

    return Semantics(
      liveRegion: true,
      label: alertLabel,
      child: Container(
        decoration: BoxDecoration(
          color: colors.backgroundSecondaryAlt,
          border: Border(left: BorderSide(color: borderColor, width: 4)),
          borderRadius: layout.radiusSm,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: layout.s3,
          vertical: layout.s2,
        ),
        child: Row(
          children: [
            ExcludeSemantics(child: Icon(icon, color: borderColor, size: 20)),
            SizedBox(width: layout.s2),
            Expanded(
              child: ExcludeSemantics(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title != null) ...[
                      Text(
                        title!,
                        style: context.textStyles.bodySmall.copyWith(
                          color: colors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: layout.s1),
                    ],
                    Text(
                      message,
                      style: context.textStyles.bodySmall.copyWith(
                        color: colors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

@FluxerWidgetPreview(name: 'Info', group: 'FluxerWarningAlert')
Widget fluxerWarningAlertInfoPreview() {
  return const FluxerWarningAlert(
    message: 'Here is some contextual information.',
    variant: FluxerAlertVariant.info,
  );
}

@FluxerWidgetPreview(name: 'Warning', group: 'FluxerWarningAlert')
Widget fluxerWarningAlertWarningPreview() {
  return const FluxerWarningAlert(
    message: 'This action may have unintended consequences.',
  );
}

@FluxerWidgetPreview(name: 'Danger', group: 'FluxerWarningAlert')
Widget fluxerWarningAlertDangerPreview() {
  return const FluxerWarningAlert(
    message: 'Something went wrong. Please try again or contact support.',
    variant: FluxerAlertVariant.danger,
  );
}
