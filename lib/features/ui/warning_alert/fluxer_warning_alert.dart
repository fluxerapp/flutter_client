import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/preview/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

enum FluxerAlertVariant { info, warning, danger }

class FluxerWarningAlert extends StatelessWidget {
  const FluxerWarningAlert({
    required this.message,
    this.title,
    this.variant = FluxerAlertVariant.warning,
    this.onDismiss,
    this.dismissLabel,
    super.key,
  });

  final String message;
  final String? title;
  final FluxerAlertVariant variant;
  final VoidCallback? onDismiss;
  final String? dismissLabel;

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

    if (usesDesktopPointerUi(context)) {
      return _buildDesktop(context, alertLabel);
    }

    return Semantics(
      liveRegion: true,
      label: alertLabel,
      child: Container(
        decoration: BoxDecoration(
          color: FluxerBottomSheet.cardColorOf(context),
          border: BorderDirectional(
            start: BorderSide(color: borderColor, width: 4),
          ),
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
            if (onDismiss != null)
              Semantics(
                container: true,
                button: true,
                label: dismissLabel,
                onTap: onDismiss,
                excludeSemantics: true,
                child: IconButton(
                  onPressed: onDismiss,
                  tooltip: dismissLabel,
                  icon: Icon(
                    PhosphorIconsBold.x,
                    size: 16,
                    color: colors.textSecondary,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktop(BuildContext context, String alertLabel) {
    final colors = context.colors;
    final Color accent;
    final IconData icon;
    switch (variant) {
      case FluxerAlertVariant.info:
        accent = colors.accentInfo;
        icon = PhosphorIconsFill.info;
      case FluxerAlertVariant.warning:
        accent = colors.alertWarning;
        icon = PhosphorIconsFill.warning;
      case FluxerAlertVariant.danger:
        accent = colors.accentDanger;
        icon = PhosphorIconsFill.warningCircle;
    }
    final TextStyle textStyle = context.textStyles.bodySmall.copyWith(
      fontSize: 13,
      height: 1.4,
      color: colors.textPrimary,
    );
    return Semantics(
      liveRegion: true,
      label: alertLabel,
      child: ClipRRect(
        borderRadius: context.layout.radiusMd,
        child: Stack(
          children: [
            PositionedDirectional(
              start: 0,
              top: 0,
              bottom: 0,
              width: 4,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: accent,
                  borderRadius: context.layout.radiusSm,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 6, 12, 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  ExcludeSemantics(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: PhosphorIcon(icon, color: accent, size: 16),
                    ),
                  ),
                  Expanded(
                    child: ExcludeSemantics(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 2,
                        children: [
                          if (title != null)
                            Text(
                              title!,
                              style: textStyle.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          Text(message, style: textStyle),
                        ],
                      ),
                    ),
                  ),
                  if (onDismiss != null)
                    Semantics(
                      container: true,
                      button: true,
                      label: dismissLabel,
                      onTap: onDismiss,
                      excludeSemantics: true,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: FluxerGestureDetector(
                          onTap: onDismiss,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: PhosphorIcon(
                              PhosphorIconsBold.x,
                              size: 16,
                              color: colors.textSecondary,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
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
