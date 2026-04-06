import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/checkbox/fluxer_checkbox.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ExternalLinkWarningModal extends StatefulWidget {
  const ExternalLinkWarningModal({
    required this.url,
    required this.hostname,
    required this.onContinue,
    super.key,
  });

  final String url;
  final String hostname;
  final Future<void> Function(bool trustDomain) onContinue;

  static Future<void> show(
    BuildContext context, {
    required String url,
    required String hostname,
    required Future<void> Function(bool trustDomain) onContinue,
  }) {
    final l10n = FluxerLocalizations.of(context);

    return FluxerModal.show<void>(
      context,
      title: l10n.externalLinkWarningTitle,
      centered: true,
      builder: (dialogContext, close) => ExternalLinkWarningModal(
        url: url,
        hostname: hostname,
        onContinue: (trustDomain) async {
          await onContinue(trustDomain);
          if (dialogContext.mounted) {
            close();
          }
        },
      ),
    );
  }

  @override
  State<ExternalLinkWarningModal> createState() =>
      _ExternalLinkWarningModalState();
}

class _ExternalLinkWarningModalState extends State<ExternalLinkWarningModal> {
  var trustDomain = false;
  var isSubmitting = false;

  Future<void> _handleContinue() async {
    if (isSubmitting) {
      return;
    }

    setState(() => isSubmitting = true);
    try {
      await widget.onContinue(trustDomain);
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
    final useStackedButtons = MediaQuery.sizeOf(context).width < 640;

    return Padding(
      padding: EdgeInsets.only(bottom: layout.s4),
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
                style: textStyles.bodyMedium.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: colors.textPrimary,
                ),
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
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                    text: l10n.externalLinkWarningTrustSuffix,
                  ),
                ],
              ),
              style: textStyles.bodySmall.copyWith(
                color: colors.textPrimary,
              ),
            ),
          ),
          SizedBox(height: layout.s4),
          if (useStackedButtons) ...[
            FluxerButton.secondary(
              onPressed: isSubmitting ? null : () => Navigator.of(context).pop(),
              label: l10n.cancel,
            ),
            const SizedBox(height: 8),
            FluxerButton.primary(
              onPressed: _handleContinue,
              isLoading: isSubmitting,
              label: l10n.externalLinkVisitSite,
              trailingIcon: PhosphorIconsRegular.arrowRight,
            ),
          ] else
            Row(
              children: [
                Expanded(
                  child: FluxerButton.secondary(
                    onPressed: isSubmitting
                        ? null
                        : () => Navigator.of(context).pop(),
                    label: l10n.cancel,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: FluxerButton.primary(
                    onPressed: _handleContinue,
                    isLoading: isSubmitting,
                    label: l10n.externalLinkVisitSite,
                    trailingIcon: PhosphorIconsRegular.arrowRight,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
