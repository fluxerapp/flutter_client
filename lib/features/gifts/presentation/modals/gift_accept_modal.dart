import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/gifts/presentation/widgets/gift_icon_circle.dart';
import 'package:fluxer_app/features/gifts/providers/gift_embed_provider.dart';
import 'package:fluxer_app/features/gifts/services/gift_redeem_service.dart';
import 'package:fluxer_app/features/gifts/utils/gift_code_utils.dart';
import 'package:fluxer_app/features/gifts/utils/gift_duration_text.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/claim_account_sheet.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/features/ui/overlay/fluxer_overlay_back_handler.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_dart/export.dart';

Future<void> showGiftAcceptModal(BuildContext context, {required String code}) {
  if (usesDesktopPointerUi(context)) {
    return FluxerBottomSheet.show<void>(
      context,
      title: FluxerLocalizations.of(context).premiumGiftBadge,
      useRootNavigator: true,
      desktop: const FluxerDesktopPresentation(
        surface: FluxerDesktopSurface.modal,
        width: 440,
      ),
      builder: (BuildContext sheetContext, VoidCallback close) =>
          _GiftAcceptDesktopBody(code: extractGiftCode(code), onClose: close),
    );
  }
  return showDialog<void>(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.35),
    builder: (BuildContext dialogContext) {
      return _GiftAcceptModalDialog(code: extractGiftCode(code));
    },
  );
}

class _GiftAcceptModalDialog extends ConsumerWidget {
  const _GiftAcceptModalDialog({required this.code});

  final String code;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return wrapFluxerOverlayBackHandler(
      canDismiss: true,
      onBack: null,
      onDismiss: () => Navigator.of(context).pop(),
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _GiftAcceptModalBody(code: code),
            ),
          ),
        ),
      ),
    );
  }
}

class _GiftAcceptModalBody extends ConsumerWidget {
  const _GiftAcceptModalBody({required this.code});

  final String code;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    final async = ref.watch(giftEmbedProvider(code));
    final isUnclaimed = ref.watch(
      userSettingsViewModelProvider.select((s) => s.isKnownUnclaimed),
    );

    return Container(
      decoration: BoxDecoration(
        color: context.colors.backgroundPrimary,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.colors.borderColor),
      ),
      clipBehavior: Clip.hardEdge,
      child: async.when(
        loading: () => const Padding(
          padding: EdgeInsets.all(48),
          child: Center(child: FluxerLoadingSpinner()),
        ),
        error: (_, _) => _ErrorContent(
          l10n: l10n,
          onClose: () => Navigator.of(context).pop(),
        ),
        data: (state) => switch (state) {
          GiftEmbedNotFound() => _ErrorContent(
            l10n: l10n,
            onClose: () => Navigator.of(context).pop(),
          ),
          GiftEmbedLoaded(:final gift) => _GiftContent(
            gift: gift,
            code: code,
            l10n: l10n,
            isUnclaimed: isUnclaimed,
            ref: ref,
          ),
        },
      ),
    );
  }
}

class _GiftContent extends StatelessWidget {
  const _GiftContent({
    required this.gift,
    required this.code,
    required this.l10n,
    required this.isUnclaimed,
    required this.ref,
  });

  final GiftCodeResponse gift;
  final String code;
  final FluxerLocalizations l10n;
  final bool isUnclaimed;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final creator = gift.createdBy;
    final bool blocked = giftClaimBlockedInApp(gift);
    final helpText = gift.redeemed
        ? l10n.giftAcceptAlreadyClaimed
        : blocked
        ? l10n.giftAcceptLifetimeNotInApp
        : isUnclaimed
        ? l10n.embedGiftClaimAccountHelp
        : l10n.giftAcceptClaimSubscription(kPremiumProductName);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GiftIconCircle(size: 48, redeemed: gift.redeemed),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      giftDurationText(l10n, gift),
                      style: context.textStyles.heading.copyWith(
                        color: gift.redeemed
                            ? context.colors.textTertiary
                            : context.colors.textPrimary,
                      ),
                    ),
                    if (creator != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        l10n.embedGiftFrom(giftCreatorDisplayName(creator)),
                        style: context.textStyles.embedFooter.copyWith(
                          color: context.colors.textSecondary,
                          height: 1.25,
                        ),
                      ),
                    ],
                    const SizedBox(height: 8),
                    Text(
                      helpText,
                      style: context.textStyles.bodySmall.copyWith(
                        color: context.colors.textTertiary,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(height: 1, thickness: 1, color: context.colors.borderColor),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: FluxerButton.secondary(
                  onPressed: () => Navigator.of(context).pop(),
                  label: gift.redeemed || isUnclaimed || blocked
                      ? l10n.uiClose
                      : l10n.giftAcceptMaybeLater,
                ),
              ),
              if (!gift.redeemed && !blocked) ...[
                const SizedBox(width: 12),
                Expanded(
                  child: FluxerButton.primary(
                    onPressed: () {
                      if (isUnclaimed) {
                        unawaited(ClaimAccountSheet.show(context, ref));
                        return;
                      }
                      unawaited(
                        redeemGiftCode(
                          context: context,
                          ref: ref,
                          code: code,
                          onSuccess: () {
                            if (context.mounted) {
                              Navigator.of(context).pop();
                            }
                          },
                        ),
                      );
                    },
                    label: isUnclaimed
                        ? l10n.embedGiftClaimAccount
                        : l10n.embedGiftClaim,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _ErrorContent extends StatelessWidget {
  const _ErrorContent({required this.l10n, required this.onClose});

  final FluxerLocalizations l10n;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GiftIconCircle(size: 48, error: true),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.embedGiftUnknownTitle,
                      style: context.textStyles.heading.copyWith(
                        color: context.colors.statusDanger,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.embedGiftUnknownSubtitle,
                      style: context.textStyles.bodySmall.copyWith(
                        color: context.colors.textTertiary,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(height: 1, thickness: 1, color: context.colors.borderColor),
        Padding(
          padding: const EdgeInsets.all(16),
          child: FluxerButton.secondary(
            onPressed: onClose,
            label: l10n.uiClose,
          ),
        ),
      ],
    );
  }
}

class _GiftAcceptDesktopBody extends ConsumerWidget {
  const _GiftAcceptDesktopBody({required this.code, required this.onClose});

  final String code;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final async = ref.watch(giftEmbedProvider(code));
    final isUnclaimed = ref.watch(
      userSettingsViewModelProvider.select((s) => s.isKnownUnclaimed),
    );
    return async.when(
      loading: () => const Padding(
        padding: EdgeInsets.all(32),
        child: Center(child: FluxerLoadingSpinner()),
      ),
      error: (_, _) => _errorCard(context, l10n),
      data: (state) => switch (state) {
        GiftEmbedNotFound() => _errorCard(context, l10n),
        GiftEmbedLoaded(:final gift) => _giftContent(
          context,
          ref,
          l10n,
          colors,
          gift,
          isUnclaimed,
        ),
      },
    );
  }

  Widget _errorCard(BuildContext context, FluxerLocalizations l10n) {
    return _GiftDesktopCard(
      icon: const GiftIconCircle(size: 48, error: true),
      title: l10n.embedGiftUnknownTitle,
      titleColor: context.colors.statusDanger,
      help: l10n.embedGiftUnknownSubtitle,
    );
  }

  Widget _giftContent(
    BuildContext context,
    WidgetRef ref,
    FluxerLocalizations l10n,
    FluxerColorTheme colors,
    GiftCodeResponse gift,
    bool isUnclaimed,
  ) {
    final creator = gift.createdBy;
    final bool blocked = giftClaimBlockedInApp(gift);
    final String helpText = gift.redeemed
        ? l10n.giftAcceptAlreadyClaimed
        : blocked
        ? l10n.giftAcceptLifetimeNotInApp
        : isUnclaimed
        ? l10n.embedGiftClaimAccountHelp
        : l10n.giftAcceptClaimSubscription(kPremiumProductName);
    final Widget card = _GiftDesktopCard(
      icon: GiftIconCircle(size: 48, redeemed: gift.redeemed),
      title: giftDurationText(l10n, gift),
      titleColor: gift.redeemed ? colors.textTertiary : colors.textPrimary,
      subtitle: creator == null
          ? null
          : l10n.embedGiftFrom(giftCreatorDisplayName(creator)),
      help: helpText,
    );
    if (gift.redeemed) {
      return card;
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        card,
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: colors.borderColor)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 8,
              children: <Widget>[
                FluxerButton.secondary(
                  onPressed: onClose,
                  fitContent: true,
                  label: isUnclaimed || blocked
                      ? l10n.uiClose
                      : l10n.giftAcceptMaybeLater,
                ),
                if (!blocked)
                  FluxerButton.primary(
                    fitContent: true,
                    onPressed: () {
                      if (isUnclaimed) {
                        unawaited(ClaimAccountSheet.show(context, ref));
                        return;
                      }
                      unawaited(
                        redeemGiftCode(
                          context: context,
                          ref: ref,
                          code: code,
                          onSuccess: onClose,
                        ),
                      );
                    },
                    label: isUnclaimed
                        ? l10n.embedGiftClaimAccount
                        : l10n.embedGiftClaim,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _GiftDesktopCard extends StatelessWidget {
  const _GiftDesktopCard({
    required this.icon,
    required this.title,
    required this.titleColor,
    required this.help,
    this.subtitle,
  });

  final Widget icon;
  final String title;
  final Color titleColor;
  final String help;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Row(
        spacing: 12,
        children: <Widget>[
          icon,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textStyles.channelName.copyWith(color: titleColor),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: textStyles.bodySmall.copyWith(
                      fontSize: 12.8,
                      height: 1.25,
                      color: colors.textSecondary,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    help,
                    style: textStyles.bodySmall.copyWith(
                      fontSize: 12.8,
                      color: colors.textTertiary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
