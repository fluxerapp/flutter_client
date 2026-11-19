import 'dart:async';
import 'dart:ui' show ImageFilter;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/wallpaper/chat_wallpaper_text_theme.dart';
import 'package:fluxer_app/features/gifts/providers/gift_embed_provider.dart';
import 'package:fluxer_app/features/gifts/services/gift_redeem_service.dart';
import 'package:fluxer_app/features/gifts/utils/gift_code_utils.dart';
import 'package:fluxer_app/features/gifts/utils/gift_duration_text.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/claim_account_sheet.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/icons/plutonium_product_icon.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_dart/export.dart';

const double _kCardHeight = 72;
const double _kTileSize = 48;
const double _kTileRadius = 10;
const double _kActionHeight = 34;

class EmbedGift extends ConsumerWidget {
  const EmbedGift({required this.code, super.key});

  final String code;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final normalizedCode = extractGiftCode(code);
    final async = ref.watch(giftEmbedProvider(normalizedCode));

    return ChatSurfaceTheme(
      builder: (BuildContext context) => async.when(
        loading: () => const _GiftLoadingCard(),
        error: (_, _) => const _GiftNotFound(),
        data: (state) => switch (state) {
          GiftEmbedNotFound() => const _GiftNotFound(),
          GiftEmbedLoaded(:final gift) => _GiftLoaded(
            gift: gift,
            code: normalizedCode,
          ),
        },
      ),
    );
  }
}

class _GiftLoaded extends ConsumerWidget {
  const _GiftLoaded({required this.gift, required this.code});

  final GiftCodeResponse gift;
  final String code;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    final isUnclaimed = ref.watch(
      userSettingsViewModelProvider.select((s) => s.isKnownUnclaimed),
    );
    final creator = gift.createdBy;
    final blocked = giftClaimBlockedInApp(gift);
    final redeemed = gift.redeemed;

    final meta = redeemed
        ? l10n.embedGiftAlreadyRedeemed
        : blocked
        ? l10n.giftAcceptLifetimeNotInApp
        : isUnclaimed
        ? l10n.embedGiftClaimAccountHelp
        : creator != null
        ? l10n.embedGiftFrom(giftCreatorDisplayName(creator))
        : l10n.embedGiftClaimHelp;

    return _GiftCard(
      muted: redeemed,
      icon: kPlutoniumProductIcon,
      title: giftDurationText(l10n, gift),
      meta: meta,
      metaMaxLines: blocked && !redeemed ? 2 : 1,
      action: redeemed || blocked
          ? null
          : FluxerButton.primary(
              size: FluxerButtonSize.compact,
              fitContent: true,
              onPressed: isUnclaimed
                  ? () => unawaited(ClaimAccountSheet.show(context, ref))
                  : null,
              onPressedAsync: isUnclaimed
                  ? null
                  : () =>
                        redeemGiftCode(context: context, ref: ref, code: code),
              label: isUnclaimed
                  ? l10n.embedGiftClaimAccount
                  : l10n.embedGiftClaim,
            ),
    );
  }
}

class _GiftNotFound extends StatelessWidget {
  const _GiftNotFound();

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    return _GiftCard(
      muted: true,
      icon: PhosphorIconsBold.question,
      title: l10n.embedGiftUnknownTitle,
      meta: l10n.embedGiftUnknownSubtitle,
    );
  }
}

class _GiftCard extends StatelessWidget {
  const _GiftCard({
    required this.muted,
    required this.icon,
    required this.title,
    required this.meta,
    this.metaMaxLines = 1,
    this.action,
  });

  final bool muted;
  final IconData icon;
  final String title;
  final String meta;
  final int metaMaxLines;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final baseStyle = context.textStyles.embedTitle;
    return _GiftCardFrame(
      tile: _GiftTile(icon: icon, muted: muted),
      text: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: baseStyle.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              height: 20 / 15,
              color: muted ? colors.textPrimaryMuted : colors.textPrimary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            meta,
            maxLines: metaMaxLines,
            overflow: TextOverflow.ellipsis,
            style: baseStyle.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              height: 18 / 13,
              color: colors.textPrimaryMuted,
            ),
          ),
        ],
      ),
      action: action,
    );
  }
}

class _GiftCardFrame extends StatelessWidget {
  const _GiftCardFrame({required this.tile, required this.text, this.action});

  final Widget tile;
  final Widget text;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final background = colors.backgroundSecondary;
    return Container(
      constraints: const BoxConstraints(maxWidth: 416, minHeight: _kCardHeight),
      padding: const EdgeInsets.fromLTRB(12, 10, 14, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.backgroundModifierAccent),
        gradient: LinearGradient(
          colors: [
            Color.alphaBlend(
              colors.brandPrimary.withValues(alpha: 0.2),
              background,
            ),
            background,
          ],
          stops: const [0, 0.74],
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          tile,
          const SizedBox(width: 12),
          Expanded(child: text),
          if (action != null) ...[
            const SizedBox(width: 12),
            SizedBox(
              height: _kActionHeight,
              child: Center(child: action),
            ),
          ],
        ],
      ),
    );
  }
}

class _GiftTile extends StatelessWidget {
  const _GiftTile({required this.icon, required this.muted});

  final IconData icon;
  final bool muted;

  static Color _shift(
    Color color, {
    required double saturation,
    required double lightness,
  }) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withSaturation((hsl.saturation + saturation).clamp(0, 1))
        .withLightness((hsl.lightness + lightness).clamp(0, 1))
        .toColor();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    if (muted) {
      return Container(
        width: _kTileSize,
        height: _kTileSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_kTileRadius),
          color: colors.backgroundModifierAccent,
        ),
        child: Center(
          child: PhosphorIcon(icon, size: 28, color: colors.textPrimaryMuted),
        ),
      );
    }
    final brand = colors.brandPrimary;
    final onBrand = colors.textOnBrandPrimary;
    final tile = Container(
      width: _kTileSize,
      height: _kTileSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_kTileRadius),
        gradient: LinearGradient(
          begin: const Alignment(-0.64, -0.77),
          end: const Alignment(0.64, 0.77),
          colors: [
            _shift(brand, saturation: 0.08, lightness: 0.07),
            brand,
            _shift(brand, saturation: -0.08, lightness: -0.15),
          ],
        ),
      ),
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_kTileRadius),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            onBrand.withValues(alpha: 0.18),
            onBrand.withValues(alpha: 0),
          ],
          stops: const [0, 0.04],
        ),
      ),
      child: Center(child: PhosphorIcon(icon, size: 28, color: onBrand)),
    );
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(
          top: 4,
          bottom: -4,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: 6,
              sigmaY: 6,
              tileMode: TileMode.decal,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: brand.withValues(alpha: 0.35),
                borderRadius: BorderRadius.circular(_kTileRadius),
              ),
            ),
          ),
        ),
        tile,
      ],
    );
  }
}

class _GiftLoadingCard extends StatelessWidget {
  const _GiftLoadingCard();

  @override
  Widget build(BuildContext context) => const _GiftCardFrame(
    tile: _Skeleton(
      width: _kTileSize,
      height: _kTileSize,
      radius: _kTileRadius,
    ),
    text: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 20,
          child: Align(
            alignment: Alignment.centerLeft,
            child: _Skeleton(width: 144, height: 14, radius: 4),
          ),
        ),
        SizedBox(height: 2),
        SizedBox(
          height: 18,
          child: Align(
            alignment: Alignment.centerLeft,
            child: _Skeleton(width: 96, height: 12, radius: 4),
          ),
        ),
      ],
    ),
    action: _Skeleton(width: 88, height: _kActionHeight, radius: 8),
  );
}

class _Skeleton extends StatelessWidget {
  const _Skeleton({
    required this.width,
    required this.height,
    required this.radius,
  });

  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) => Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: context.colors.backgroundModifierAccent,
      borderRadius: BorderRadius.circular(radius),
    ),
  );
}
