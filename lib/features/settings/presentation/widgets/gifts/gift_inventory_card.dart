import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/premium/current_user_entitlements_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/gifts/services/gift_redeem_service.dart';
import 'package:fluxer_app/features/gifts/utils/gift_code_utils.dart';
import 'package:fluxer_app/features/settings/utils/premium_formatting.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GiftInventoryCard extends ConsumerWidget {
  const GiftInventoryCard({
    required this.gift,
    required this.isExpanded,
    required this.onToggle,
    required this.onRedeemSuccess,
    super.key,
  });

  final GiftCodeMetadataResponse gift;
  final bool isExpanded;
  final VoidCallback onToggle;
  final VoidCallback onRedeemSuccess;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final bool isRedeemed = gift.redeemedAt != null;
    final String giftUrl = giftShareUrl(
      giftBaseUrl: ref.read(instanceGiftBaseUrlProvider),
      code: gift.code,
    );
    final String durationText = formatGiftMetadataDuration(gift, l10n);
    final String dateText = isRedeemed
        ? l10n.giftSettingsRedeemedDate(
            formatPremiumShortDate(gift.redeemedAt!, l10n.localeName),
          )
        : l10n.giftSettingsPurchasedDate(
            formatPremiumShortDate(gift.createdAt, l10n.localeName),
          );
    final bool isLifetime =
        ref.watch(currentUserEntitlementsProvider).premiumType ==
        UserPremiumTypes.lifetime.json;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.backgroundSecondary,
        borderRadius: layout.radiusLg,
        border: Border.all(color: colors.backgroundHeaderSecondary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onToggle,
              borderRadius: layout.radiusLg,
              child: Padding(
                padding: EdgeInsets.all(layout.s4),
                child: Row(
                  children: [
                    _GiftIconCircle(isRedeemed: isRedeemed),
                    SizedBox(width: layout.s3),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            durationText,
                            style: textStyles.bodySmall.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: colors.textPrimary,
                            ),
                          ),
                          Text(
                            dateText,
                            style: textStyles.timestamp.copyWith(
                              fontSize: 12,
                              color: colors.textPrimaryMuted,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Transform.rotate(
                      angle: isExpanded ? 3.14159 : 0,
                      child: PhosphorIcon(
                        PhosphorIconsBold.caretDown,
                        size: 20,
                        color: colors.textPrimaryMuted,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (isExpanded)
            Container(
              padding: EdgeInsets.all(layout.s4),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: colors.backgroundHeaderSecondary),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    l10n.giftSettingsGiftUrl,
                    style: textStyles.bodySmall.copyWith(
                      color: colors.textPrimaryMuted,
                    ),
                  ),
                  SizedBox(height: layout.s2),
                  Row(
                    children: [
                      Expanded(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: colors.backgroundTertiary,
                            borderRadius: layout.radiusMd,
                            border: Border.all(color: colors.borderColor),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: layout.s3,
                              vertical: layout.s2 + 2,
                            ),
                            child: SelectableText(
                              giftUrl,
                              style: textStyles.bodySmall.copyWith(
                                color: colors.textPrimary,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: layout.s2),
                      _CopyGiftUrlButton(giftUrl: giftUrl),
                    ],
                  ),
                  if (isRedeemed) ...[
                    SizedBox(height: layout.s4),
                    Container(
                      padding: EdgeInsets.all(layout.s3),
                      decoration: BoxDecoration(
                        color: colors.backgroundTertiary,
                        borderRadius: layout.radiusMd,
                      ),
                      child: Text(
                        gift.redeemedBy != null
                            ? l10n.giftSettingsRedeemedBy(
                                resolveDisplayName(
                                  username: gift.redeemedBy!.username,
                                  globalName: gift.redeemedBy!.globalName,
                                ),
                              )
                            : l10n.giftSettingsAlreadyRedeemed,
                        style: textStyles.bodySmall.copyWith(
                          fontSize: 14,
                          color: colors.textPrimaryMuted,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ] else ...[
                    SizedBox(height: layout.s4),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final bool stackButtons = constraints.maxWidth <= 480;
                        final Widget redeemButton = !isLifetime
                            ? FluxerButton.primary(
                                label: l10n.giftSettingsRedeemForYourself,
                                fitContent: true,
                                onPressedAsync: () async {
                                  await redeemGiftCode(
                                    context: context,
                                    ref: ref,
                                    code: gift.code,
                                    onSuccess: onRedeemSuccess,
                                  );
                                },
                              )
                            : const SizedBox.shrink();
                        final Widget shareButton = FluxerButton.secondary(
                          label: l10n.giftSettingsShareWithFriend,
                          icon: PhosphorIconsBold.shareNetwork,
                          fitContent: true,
                          onPressed: () => unawaited(
                            copyToClipboard(context: context, value: giftUrl),
                          ),
                        );
                        if (stackButtons) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              if (!isLifetime) redeemButton,
                              if (!isLifetime) SizedBox(height: layout.s2),
                              shareButton,
                            ],
                          );
                        }
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (!isLifetime) ...[
                              Flexible(child: redeemButton),
                              SizedBox(width: layout.s2),
                            ],
                            Flexible(child: shareButton),
                          ],
                        );
                      },
                    ),
                  ],
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _GiftIconCircle extends StatelessWidget {
  const _GiftIconCircle({required this.isRedeemed});

  final bool isRedeemed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isRedeemed ? context.colors.backgroundTertiary : null,
        gradient: isRedeemed
            ? null
            : const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFA855F7), Color(0xFFEC4899)],
              ),
      ),
      child: Center(
        child: PhosphorIcon(
          PhosphorIconsFill.gift,
          size: 20,
          color: isRedeemed ? context.colors.textTertiary : Colors.white,
        ),
      ),
    );
  }
}

class _CopyGiftUrlButton extends StatefulWidget {
  const _CopyGiftUrlButton({required this.giftUrl});

  final String giftUrl;

  @override
  State<_CopyGiftUrlButton> createState() => _CopyGiftUrlButtonState();
}

class _CopyGiftUrlButtonState extends State<_CopyGiftUrlButton> {
  bool _copied = false;

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    return FluxerButton.secondary(
      label: _copied ? l10n.giftSettingsCopied : l10n.giftSettingsCopy,
      icon: _copied ? PhosphorIconsBold.check : PhosphorIconsBold.copy,
      fitContent: true,
      onPressed: () async {
        await copyToClipboard(context: context, value: widget.giftUrl);
        setState(() => _copied = true);
        unawaited(
          Future<void>.delayed(const Duration(seconds: 2), () {
            if (mounted) {
              setState(() => _copied = false);
            }
          }),
        );
      },
    );
  }
}
