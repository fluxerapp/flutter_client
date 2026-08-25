import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/text_link/fluxer_text_link.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

const String _kTermsUrl = 'https://fluxer.app/terms';
const String _kPrivacyUrl = 'https://fluxer.app/privacy';

class PremiumPurchaseDisclaimer extends StatelessWidget {
  const PremiumPurchaseDisclaimer({
    this.isPremium = false,
    this.alignCenter = true,
    super.key,
  });

  final bool isPremium;
  final bool alignCenter;

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final TextStyle mutedStyle = textStyles.timestamp.copyWith(
      fontSize: 12,
      color: colors.textPrimaryMuted,
      height: 1.5,
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: layout.s2),
      child: Column(
        crossAxisAlignment: alignCenter
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              style: mutedStyle,
              children: [
                TextSpan(
                  text: isPremium
                      ? l10n.premiumDisclaimerAgreementPastPrefix
                      : l10n.premiumDisclaimerAgreementPrefix,
                ),
                WidgetSpan(
                  alignment: PlaceholderAlignment.baseline,
                  baseline: TextBaseline.alphabetic,
                  child: FluxerTextLink(
                    text: l10n.premiumTermsOfService,
                    url: _kTermsUrl,
                    style: mutedStyle.copyWith(color: colors.textLink),
                  ),
                ),
                TextSpan(text: l10n.premiumDisclaimerAgreementMiddle),
                WidgetSpan(
                  alignment: PlaceholderAlignment.baseline,
                  baseline: TextBaseline.alphabetic,
                  child: FluxerTextLink(
                    text: l10n.premiumPrivacyPolicy,
                    url: _kPrivacyUrl,
                    style: mutedStyle.copyWith(color: colors.textLink),
                  ),
                ),
                const TextSpan(text: '.'),
              ],
            ),
            textAlign: alignCenter ? TextAlign.center : TextAlign.start,
          ),
          SizedBox(height: layout.s2),
          Text(
            l10n.premiumDisclaimerRefund,
            style: mutedStyle,
            textAlign: alignCenter ? TextAlign.center : TextAlign.start,
          ),
        ],
      ),
    );
  }
}
