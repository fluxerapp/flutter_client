import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/gifts/providers/gift_inventory_provider.dart';
import 'package:fluxer_app/features/gifts/services/gift_redeem_service.dart';
import 'package:fluxer_app/features/settings/domain/user_settings_section.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/claim_account_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/gifts/gift_inventory_card.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/settings/utils/open_user_billing_settings.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserGiftInventory extends ConsumerStatefulWidget {
  const UserGiftInventory({
    this.scrollController,
    this.onOpenPlutonium,
    super.key,
  });

  final ScrollController? scrollController;
  final VoidCallback? onOpenPlutonium;

  @override
  ConsumerState<UserGiftInventory> createState() => _UserGiftInventoryState();
}

class _UserGiftInventoryState extends ConsumerState<UserGiftInventory> {
  final TextEditingController _codeController = TextEditingController();
  bool _redeeming = false;
  String? _expandedGiftCode;

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final settings = ref.watch(userSettingsViewModelProvider);
    if (settings.isKnownUnclaimed) {
      return _buildUnclaimed(context, l10n);
    }

    final giftsAsync = ref.watch(giftInventoryProvider);
    return SingleChildScrollView(
      controller: widget.scrollController,
      padding: settingsScrollPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildRedeemSection(context, l10n),
          SizedBox(height: context.layout.s8),
          _buildPurchasedSection(context, l10n, giftsAsync),
        ],
      ),
    );
  }

  Widget _buildUnclaimed(BuildContext context, FluxerLocalizations l10n) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    return SingleChildScrollView(
      controller: widget.scrollController,
      padding: settingsScrollPadding(context),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(layout.s6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l10n.giftSettingsClaimAccountTitle,
                style: textStyles.heading.copyWith(color: colors.textPrimary),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: layout.s2),
              Text(
                l10n.giftSettingsClaimAccountDescription,
                style: textStyles.bodyMedium.copyWith(
                  color: colors.textPrimaryMuted,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: layout.s4),
              FluxerButton.primary(
                label: l10n.claimAccount,
                onPressed: () =>
                    unawaited(ClaimAccountSheet.show(context, ref)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRedeemSection(BuildContext context, FluxerLocalizations l10n) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.giftSettingsRedeemTitle,
          style: textStyles.heading.copyWith(color: colors.textPrimary),
        ),
        SizedBox(height: layout.s2),
        Text(
          l10n.giftSettingsRedeemDescription,
          style: textStyles.bodySmall.copyWith(color: colors.textPrimaryMuted),
        ),
        SizedBox(height: layout.s4),
        Row(
          children: [
            Expanded(
              child: FluxerInput(
                controller: _codeController,
                hint: l10n.giftSettingsRedeemPlaceholder,
              ),
            ),
            SizedBox(width: layout.s2),
            FluxerButton.primary(
              label: l10n.giftSettingsRedeemButton,
              isLoading: _redeeming,
              fitContent: true,
              onPressed: _redeeming ? null : () => unawaited(_redeemCode()),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPurchasedSection(
    BuildContext context,
    FluxerLocalizations l10n,
    AsyncValue<List<GiftCodeMetadataResponse>> giftsAsync,
  ) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.giftSettingsPurchasedTitle,
          style: textStyles.heading.copyWith(color: colors.textPrimary),
        ),
        SizedBox(height: layout.s2),
        Text(
          l10n.giftSettingsPurchasedDescription,
          style: textStyles.bodySmall.copyWith(color: colors.textPrimaryMuted),
        ),
        SizedBox(height: layout.s4),
        giftsAsync.when(
          loading: () => Padding(
            padding: EdgeInsets.symmetric(vertical: layout.s8),
            child: const Center(child: FluxerLoadingSpinner()),
          ),
          error: (_, _) => _buildErrorState(context, l10n),
          data: (gifts) {
            if (gifts.isEmpty) {
              return _buildEmptyState(context, l10n);
            }
            return Column(
              children: [
                for (final gift in gifts)
                  Padding(
                    padding: EdgeInsets.only(bottom: layout.s3),
                    child: GiftInventoryCard(
                      gift: gift,
                      isExpanded: _expandedGiftCode == gift.code,
                      onToggle: () {
                        setState(() {
                          _expandedGiftCode = _expandedGiftCode == gift.code
                              ? null
                              : gift.code;
                        });
                      },
                      onRedeemSuccess: () =>
                          ref.read(giftInventoryProvider.notifier).refresh(),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildEmptyState(BuildContext context, FluxerLocalizations l10n) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: layout.s3),
      child: Column(
        children: [
          PhosphorIcon(
            PhosphorIconsFill.gift,
            size: 48,
            color: colors.textTertiary,
          ),
          SizedBox(height: layout.s3),
          Text(
            l10n.giftSettingsEmptyTitle,
            style: textStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
              color: colors.textPrimary,
            ),
          ),
          SizedBox(height: layout.s2),
          Text(
            l10n.giftSettingsEmptyDescription,
            style: textStyles.bodySmall.copyWith(
              color: colors.textPrimaryMuted,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: layout.s4),
          FluxerButton.secondary(
            label: l10n.giftSettingsGoToPlutonium,
            onPressed:
                widget.onOpenPlutonium ??
                () => openUserBillingSettings(
                  context,
                  UserSettingsSection.fluxerPlutonium,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, FluxerLocalizations l10n) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    return Container(
      padding: EdgeInsets.all(layout.s6),
      decoration: BoxDecoration(
        color: colors.backgroundTertiary,
        borderRadius: layout.radiusMd,
        border: Border.all(color: colors.backgroundHeaderSecondary),
      ),
      child: Column(
        children: [
          Text(
            l10n.giftSettingsLoadFailedTitle,
            style: textStyles.bodyMedium.copyWith(
              color: colors.textPrimaryMuted,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: layout.s2),
          Text(
            l10n.giftSettingsLoadFailedDescription,
            style: textStyles.bodySmall.copyWith(
              color: colors.textPrimaryMuted,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: layout.s4),
          FluxerButton.secondary(
            label: l10n.giftSettingsTryAgain,
            onPressed: () => ref.read(giftInventoryProvider.notifier).refresh(),
          ),
        ],
      ),
    );
  }

  Future<void> _redeemCode() async {
    final code = _codeController.text.trim();
    if (code.isEmpty) {
      return;
    }
    setState(() => _redeeming = true);
    final l10n = FluxerLocalizations.of(context);
    await redeemGiftCode(
      context: context,
      ref: ref,
      code: code,
      onSuccess: () {
        ref.read(giftInventoryProvider.notifier).refresh();
        _codeController.clear();
        ref
            .read(toastProvider.notifier)
            .show(
              FluxerToast(
                message: l10n.giftSettingsRedeemSuccess,
                variant: FluxerToastVariant.success,
              ),
            );
      },
    );
    if (mounted) {
      setState(() => _redeeming = false);
    }
  }
}
