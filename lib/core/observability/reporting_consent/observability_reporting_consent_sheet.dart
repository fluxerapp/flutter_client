import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

Future<bool?> showObservabilityReportingConsentSheet(BuildContext context) {
  final l10n = FluxerLocalizations.of(context);
  final colors = context.colors;
  final textStyles = context.textStyles;

  return FluxerBottomSheet.show<bool>(
    context,
    useRootNavigator: true,
    isDismissible: false,
    enableDrag: false,
    title: l10n.observabilityReportingConsentTitle,
    subtitle: Text(
      l10n.observabilityReportingConsentSubtitle,
      style: textStyles.bodySmall.copyWith(color: colors.textSecondary),
    ),
    builder: (sheetContext, close) =>
        _ObservabilityReportingConsentSheetContent(
          onAgree: () =>
              Navigator.of(sheetContext, rootNavigator: true).pop(true),
          onDecline: () =>
              Navigator.of(sheetContext, rootNavigator: true).pop(false),
        ),
  );
}

class _ObservabilityReportingConsentSheetContent extends StatelessWidget {
  const _ObservabilityReportingConsentSheetContent({
    required this.onAgree,
    required this.onDecline,
  });

  final VoidCallback onAgree;
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

    return PopScope(
      canPop: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: layout.s4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l10n.observabilityReportingConsentBody, style: bodyStyle),
            SizedBox(height: layout.s3),
            Text(
              l10n.observabilityReportingConsentEnableLater(
                l10n.advancedPerformanceReportingLabel,
              ),
              style: bodyStyle,
            ),
            SizedBox(height: layout.s4),
            FluxerButton.primary(
              onPressed: onAgree,
              label: l10n.observabilityReportingConsentAgree,
            ),
            SizedBox(height: layout.s2),
            FluxerButton.secondary(
              onPressed: onDecline,
              label: l10n.observabilityReportingConsentDecline,
            ),
          ],
        ),
      ),
    );
  }
}
