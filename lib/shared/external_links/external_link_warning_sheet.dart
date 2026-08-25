import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/checkbox/fluxer_checkbox.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

typedef ExternalLinkContinueCallback =
    Future<void> Function({required bool trustDomain});

/// Bottom sheet warning the user before navigating to an external URL.
///
/// Replaces the previous `ExternalLinkWarningModal`. The "Cancel" button has
/// been dropped — the sheet's drag handle and backdrop are the cancel
/// affordance, matching the rest of the mobile sheet UX. The user can still
/// opt into trusting the destination domain via the checkbox.
class ExternalLinkWarningSheet extends StatefulWidget {
  const ExternalLinkWarningSheet({
    required this.url,
    required this.hostname,
    required this.onContinue,
    super.key,
  });

  final String url;
  final String hostname;
  final ExternalLinkContinueCallback onContinue;

  static Future<void> show(
    BuildContext context, {
    required String url,
    required String hostname,
    required ExternalLinkContinueCallback onContinue,
    bool useRootNavigator = false,
  }) {
    final l10n = FluxerLocalizations.of(context);

    return FluxerBottomSheet.show<void>(
      context,
      title: l10n.externalLinkWarningTitle,
      useRootNavigator: useRootNavigator,
      builder: (sheetContext, close) => ExternalLinkWarningSheet(
        url: url,
        hostname: hostname,
        onContinue: ({required bool trustDomain}) async {
          await onContinue(trustDomain: trustDomain);
          if (sheetContext.mounted) {
            close();
          }
        },
      ),
    );
  }

  @override
  State<ExternalLinkWarningSheet> createState() =>
      _ExternalLinkWarningSheetState();
}

class _ExternalLinkWarningSheetState extends State<ExternalLinkWarningSheet> {
  var trustDomain = false;
  var isSubmitting = false;

  Future<void> _handleContinue() async {
    if (isSubmitting) {
      return;
    }

    setState(() => isSubmitting = true);
    try {
      await widget.onContinue(trustDomain: trustDomain);
    } finally {
      if (mounted) {
        setState(() => isSubmitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: layout.s4),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: colors.backgroundModifierAccent,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const PhosphorIcon(
                    PhosphorIconsFill.warning,
                    size: 24,
                    color: Color(0xFFEAB308),
                  ),
                ),
                SizedBox(height: layout.s3),
                Text(
                  l10n.externalLinkWarningLeaving,
                  textAlign: TextAlign.center,
                  style: textStyles.channelName,
                ),
                SizedBox(height: layout.s1),
                Text(
                  l10n.externalLinkWarningDescription,
                  textAlign: TextAlign.center,
                  style: textStyles.bodySmall.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
              ],
            ),
            SizedBox(height: layout.s4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.externalLinkWarningDestinationUrl,
                  style: textStyles.bodySmall.copyWith(
                    color: colors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: layout.s2),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: colors.backgroundTertiary,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: colors.backgroundModifierAccent),
                  ),
                  child: Text(
                    widget.url,
                    style: textStyles.bodySmall.copyWith(
                      color: colors.textPrimary,
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: layout.s4),
            FluxerCheckbox(
              value: trustDomain,
              onChanged: (value) {
                setState(() => trustDomain = value ?? false);
              },
              child: Text.rich(
                TextSpan(
                  text: l10n.externalLinkWarningTrustPrefix,
                  children: [
                    TextSpan(
                      text: widget.hostname,
                      style: textStyles.bodySmall.copyWith(
                        fontWeight: FontWeight.w700,
                        color: colors.textPrimary,
                      ),
                    ),
                    TextSpan(text: l10n.externalLinkWarningTrustSuffix),
                  ],
                ),
                style: textStyles.bodySmall.copyWith(color: colors.textPrimary),
              ),
            ),
            SizedBox(height: layout.s4),
            FluxerButton.primary(
              onPressed: _handleContinue,
              isLoading: isSubmitting,
              label: l10n.externalLinkVisitSite,
              trailingIcon: PhosphorIconsBold.arrowRight,
            ),
          ],
        ),
      ),
    );
  }
}
