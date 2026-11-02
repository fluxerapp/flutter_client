import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/instance/instance_legal_links.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class PremiumPurchaseDisclaimer extends ConsumerWidget {
  const PremiumPurchaseDisclaimer({
    this.isPremium = false,
    this.alignCenter = true,
    this.showRefundNote = true,
    super.key,
  });

  final bool isPremium;
  final bool alignCenter;
  final bool showRefundNote;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final TextStyle mutedStyle = textStyles.timestamp.copyWith(
      fontSize: 12,
      color: colors.textPrimaryMuted,
      height: 1.5,
    );

    return Column(
      crossAxisAlignment: alignCenter
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        InstanceLegalAgreementText(
          prefix: isPremium
              ? l10n.premiumDisclaimerAgreementPastPrefix
              : l10n.premiumDisclaimerAgreementPrefix,
          textAlign: alignCenter ? TextAlign.center : TextAlign.start,
          baseStyle: mutedStyle,
          linkStyle: mutedStyle.copyWith(color: colors.textLink),
        ),
        if (showRefundNote) ...[
          SizedBox(height: layout.s2),
          Text(
            l10n.premiumDisclaimerRefund,
            style: mutedStyle,
            textAlign: alignCenter ? TextAlign.center : TextAlign.start,
          ),
        ],
      ],
    );
  }
}
