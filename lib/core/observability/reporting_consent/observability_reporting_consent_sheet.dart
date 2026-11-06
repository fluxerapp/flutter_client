import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

Future<bool?> showObservabilityReportingConsentSheet(BuildContext context) {
  final l10n = FluxerLocalizations.of(context);

  return FluxerBottomSheet.show<bool>(
    context,
    useRootNavigator: true,
    title: l10n.observabilityReportingConsentTitle,
    subtitle: Builder(
      builder: (BuildContext subtitleContext) => Text(
        l10n.observabilityReportingConsentSubtitle,
        style: subtitleContext.textStyles.bodySmall.copyWith(
          color: subtitleContext.colors.textSecondary,
        ),
      ),
    ),
    builder: (sheetContext, close) =>
        _ObservabilityReportingConsentSheetContent(
          onAgree: () =>
              Navigator.of(sheetContext, rootNavigator: true).pop(true),
          onNotNow: () => Navigator.of(sheetContext, rootNavigator: true).pop(),
          onDecline: () =>
              Navigator.of(sheetContext, rootNavigator: true).pop(false),
        ),
  );
}

class _ObservabilityReportingConsentSheetContent extends StatelessWidget {
  const _ObservabilityReportingConsentSheetContent({
    required this.onAgree,
    required this.onNotNow,
    required this.onDecline,
  });

  final VoidCallback onAgree;
  final VoidCallback onNotNow;
  final VoidCallback onDecline;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);
    final TextStyle bodyStyle = textStyles.bodySmall.copyWith(
      color: colors.textSecondary,
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: layout.s4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _ObservabilityReportingConsentInfoRow(
            icon: PhosphorIconsFill.shieldCheck,
            iconColor: colors.textSecondary,
            text: l10n.observabilityReportingConsentBody,
            style: bodyStyle,
          ),
          SizedBox(height: layout.s3),
          _ObservabilityReportingConsentInfoRow(
            icon: PhosphorIconsFill.gear,
            iconColor: colors.textSecondary,
            text: l10n.observabilityReportingConsentEnableLater(
              l10n.advancedPerformanceReportingLabel,
            ),
            style: bodyStyle,
          ),
          SizedBox(height: layout.s4),
          FluxerButton.primary(
            onPressed: onAgree,
            icon: PhosphorIconsBold.paperPlaneTilt,
            label: l10n.observabilityReportingConsentAgree,
          ),
          SizedBox(height: layout.s2),
          FluxerButton.secondary(
            onPressed: onNotNow,
            label: l10n.observabilityReportingConsentNotNow,
          ),
          SizedBox(height: layout.s2),
          FluxerButton.ghost(
            onPressed: onDecline,
            label: l10n.observabilityReportingConsentDecline,
          ),
        ],
      ),
    );
  }
}

class _ObservabilityReportingConsentInfoRow extends StatelessWidget {
  const _ObservabilityReportingConsentInfoRow({
    required this.icon,
    required this.iconColor,
    required this.text,
    required this.style,
  });

  final IconData icon;
  final Color iconColor;
  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 1),
          child: PhosphorIcon(icon, size: 18, color: iconColor),
        ),
        SizedBox(width: layout.s3),
        Expanded(child: Text(text, style: style)),
      ],
    );
  }
}
