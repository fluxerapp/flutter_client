import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/gifts/presentation/widgets/gift_icon_circle.dart';
import 'package:fluxer_app/features/gifts/providers/gift_embed_provider.dart';
import 'package:fluxer_app/features/gifts/services/gift_redeem_service.dart';
import 'package:fluxer_app/features/gifts/utils/gift_code_utils.dart';
import 'package:fluxer_app/features/gifts/utils/gift_duration_text.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/claim_account_sheet.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';

class EmbedGift extends ConsumerWidget {
  const EmbedGift({required this.code, super.key});

  final String code;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    final normalizedCode = extractGiftCode(code);
    final async = ref.watch(giftEmbedProvider(normalizedCode));

    return async.when(
      loading: () => _GiftLoadingCard(l10n: l10n),
      error: (_, _) => _GiftNotFound(l10n: l10n),
      data: (state) => switch (state) {
        GiftEmbedNotFound() => _GiftNotFound(l10n: l10n),
        GiftEmbedLoaded(:final gift) => _GiftCard(
          gift: gift,
          code: normalizedCode,
          l10n: l10n,
          ref: ref,
        ),
      },
    );
  }
}

class _GiftCard extends StatelessWidget {
  const _GiftCard({
    required this.gift,
    required this.code,
    required this.l10n,
    required this.ref,
  });

  final GiftCodeResponse gift;
  final String code;
  final FluxerLocalizations l10n;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final isUnclaimed = ref.watch(
      userSettingsViewModelProvider.select((s) => s.isKnownUnclaimed),
    );
    final creator = gift.createdBy;
    final titleColor = gift.redeemed
        ? context.colors.textTertiary
        : context.colors.textPrimary;
    final helpText = gift.redeemed
        ? l10n.embedGiftAlreadyRedeemed
        : isUnclaimed
        ? l10n.embedGiftClaimAccountHelp
        : l10n.embedGiftClaimHelp;

    final titleStyle = context.textStyles.embedTitle.copyWith(
      color: titleColor,
      height: 1.25,
    );
    final subtitleStyle = context.textStyles.embedFooter.copyWith(
      color: context.colors.textSecondary,
      height: 1.25,
    );
    final helpStyle = context.textStyles.embedFooter.copyWith(
      color: context.colors.textTertiary,
      height: 1.25,
    );

    return _EmbedCard(
      icon: GiftIconCircle(size: 44, redeemed: gift.redeemed),
      title: Text(
        giftDurationText(l10n, gift),
        style: titleStyle,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      subtitle: creator == null
          ? null
          : Text(
              l10n.embedGiftFrom(giftCreatorDisplayName(creator)),
              style: subtitleStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
      body: Text(helpText, style: helpStyle),
      footer: FluxerButton.primary(
        onPressed: gift.redeemed
            ? null
            : () {
                if (isUnclaimed) {
                  unawaited(ClaimAccountSheet.show(context, ref));
                  return;
                }
                unawaited(
                  redeemGiftCode(context: context, ref: ref, code: code),
                );
              },
        label: gift.redeemed
            ? l10n.embedGiftClaimed
            : isUnclaimed
            ? l10n.embedGiftClaimAccount
            : l10n.embedGiftClaim,
      ),
    );
  }
}

class _GiftLoadingCard extends StatelessWidget {
  const _GiftLoadingCard({required this.l10n});

  final FluxerLocalizations l10n;

  @override
  Widget build(BuildContext context) => _EmbedCard(
    icon: const _SkeletonCircle(),
    title: const _SkeletonBar(width: 140),
    body: const _SkeletonBar(width: 160),
    footer: FluxerButton.primary(label: l10n.embedGiftClaim),
  );
}

class _GiftNotFound extends StatelessWidget {
  const _GiftNotFound({required this.l10n});

  final FluxerLocalizations l10n;

  @override
  Widget build(BuildContext context) => _EmbedCard(
    icon: const GiftIconCircle(size: 44, error: true),
    title: Text(
      l10n.embedGiftUnknownTitle,
      style: context.textStyles.embedTitle.copyWith(
        color: context.colors.statusDanger,
        height: 1.25,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    ),
    body: Text(
      l10n.embedGiftUnknownSubtitle,
      style: context.textStyles.embedFooter.copyWith(
        color: context.colors.textTertiary,
        height: 1.25,
      ),
    ),
    footer: FluxerButton.primary(label: l10n.embedGiftUnavailable),
  );
}

class _EmbedCard extends StatelessWidget {
  const _EmbedCard({
    required this.icon,
    required this.title,
    required this.footer,
    this.subtitle,
    this.body,
  });

  final Widget icon;
  final Widget title;
  final Widget? subtitle;
  final Widget? body;
  final Widget footer;

  @override
  Widget build(BuildContext context) => Container(
    constraints: const BoxConstraints(maxWidth: 360),
    decoration: BoxDecoration(
      color: context.colors.backgroundSecondary,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: context.colors.borderColor),
    ),
    clipBehavior: Clip.hardEdge,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              SizedBox(width: 48, child: Center(child: icon)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    title,
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      subtitle!,
                    ],
                    if (body != null) ...[const SizedBox(height: 3), body!],
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(height: 1, thickness: 1, color: context.colors.borderColor),
        Padding(padding: const EdgeInsets.all(12), child: footer),
      ],
    ),
  );
}

class _SkeletonCircle extends StatelessWidget {
  const _SkeletonCircle();

  @override
  Widget build(BuildContext context) => Container(
    width: 44,
    height: 44,
    decoration: BoxDecoration(
      color: context.colors.backgroundTertiary,
      shape: BoxShape.circle,
    ),
  );
}

class _SkeletonBar extends StatelessWidget {
  const _SkeletonBar({required this.width});

  final double width;

  @override
  Widget build(BuildContext context) => Container(
    width: width,
    height: 12,
    decoration: BoxDecoration(
      color: context.colors.backgroundTertiary,
      borderRadius: BorderRadius.circular(4),
    ),
  );
}
