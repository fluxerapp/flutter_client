import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/instance/active_instance_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/text_link/fluxer_text_link.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class InstanceLegalLinks extends ConsumerWidget {
  const InstanceLegalLinks({
    this.textAlign = TextAlign.center,
    this.baseStyle,
    this.linkStyle,
    super.key,
  });

  final TextAlign textAlign;
  final TextStyle? baseStyle;
  final TextStyle? linkStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? termsUrl = ref.watch(
      activeInstanceProvider.select((instance) => instance.termsUrl),
    );
    final String? privacyUrl = ref.watch(
      activeInstanceProvider.select((instance) => instance.privacyUrl),
    );
    if (termsUrl == null && privacyUrl == null) {
      return const SizedBox.shrink();
    }

    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final TextStyle muted =
        baseStyle ??
        context.textStyles.timestamp.copyWith(
          color: context.colors.textPrimaryMuted,
        );
    final TextStyle links =
        linkStyle ?? muted.copyWith(color: context.colors.textLink);

    return Text.rich(
      TextSpan(
        style: muted,
        children: _legalLinkSpans(
          l10n: l10n,
          termsUrl: termsUrl,
          privacyUrl: privacyUrl,
          linkStyle: links,
          termsLabel: l10n.premiumTermsOfService,
          privacyLabel: l10n.premiumPrivacyPolicy,
        ),
      ),
      textAlign: textAlign,
    );
  }
}

class InstanceLegalAgreementText extends ConsumerWidget {
  const InstanceLegalAgreementText({
    required this.prefix,
    this.textAlign = TextAlign.center,
    this.baseStyle,
    this.linkStyle,
    super.key,
  });

  final String prefix;
  final TextAlign textAlign;
  final TextStyle? baseStyle;
  final TextStyle? linkStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? termsUrl = ref.watch(
      activeInstanceProvider.select((instance) => instance.termsUrl),
    );
    final String? privacyUrl = ref.watch(
      activeInstanceProvider.select((instance) => instance.privacyUrl),
    );
    if (termsUrl == null && privacyUrl == null) {
      return const SizedBox.shrink();
    }

    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final TextStyle muted =
        baseStyle ??
        context.textStyles.timestamp.copyWith(
          fontSize: 12,
          color: context.colors.textPrimaryMuted,
          height: 1.5,
        );
    final TextStyle links =
        linkStyle ?? muted.copyWith(color: context.colors.textLink);

    return Text.rich(
      TextSpan(
        style: muted,
        children: [
          TextSpan(text: prefix),
          ..._legalLinkSpans(
            l10n: l10n,
            termsUrl: termsUrl,
            privacyUrl: privacyUrl,
            linkStyle: links,
            termsLabel: l10n.premiumTermsOfService,
            privacyLabel: l10n.premiumPrivacyPolicy,
          ),
          const TextSpan(text: '.'),
        ],
      ),
      textAlign: textAlign,
    );
  }
}

List<InlineSpan> _legalLinkSpans({
  required FluxerLocalizations l10n,
  required String? termsUrl,
  required String? privacyUrl,
  required TextStyle linkStyle,
  required String termsLabel,
  required String privacyLabel,
}) {
  return [
    if (termsUrl != null)
      WidgetSpan(
        alignment: PlaceholderAlignment.baseline,
        baseline: TextBaseline.alphabetic,
        child: MediaQuery.withNoTextScaling(
          child: FluxerTextLink(
            text: termsLabel,
            url: termsUrl,
            style: linkStyle,
          ),
        ),
      ),
    if (termsUrl != null && privacyUrl != null)
      TextSpan(text: l10n.premiumDisclaimerAgreementMiddle),
    if (privacyUrl != null)
      WidgetSpan(
        alignment: PlaceholderAlignment.baseline,
        baseline: TextBaseline.alphabetic,
        child: MediaQuery.withNoTextScaling(
          child: FluxerTextLink(
            text: privacyLabel,
            url: privacyUrl,
            style: linkStyle,
          ),
        ),
      ),
  ];
}
