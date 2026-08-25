import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/limits/limit_context.dart';
import 'package:fluxer_app/core/limits/limit_defaults.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/limits/limit_resolver.dart';
import 'package:fluxer_app/core/limits/limit_types.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/gifts/utils/gift_duration_text.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class PremiumFeatureComparisonTable extends ConsumerWidget {
  const PremiumFeatureComparisonTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final AsyncValue<WellKnownFluxerResponse> wellKnown = ref.watch(
      wellKnownProvider,
    );
    final LimitMatchContext freeContext = buildUserLimitContext(traits: []);
    final LimitMatchContext premiumContext = buildUserLimitContext(
      traits: ['premium'],
    );

    int freeLimit(String key) => wellKnown.when(
      data: (WellKnownFluxerResponse response) => resolveInstanceLimit(
        limits: response.limits,
        key: key,
        context: freeContext,
        fallback: kDefaultFreeLimits[key] ?? -1,
      ),
      loading: () => kDefaultFreeLimits[key] ?? -1,
      error: (_, _) => kDefaultFreeLimits[key] ?? -1,
    );

    int premiumLimit(String key) => wellKnown.when(
      data: (WellKnownFluxerResponse response) => resolveInstanceLimit(
        limits: response.limits,
        key: key,
        context: premiumContext,
        fallback: kDefaultFreeLimits[key] ?? -1,
      ),
      loading: () => kDefaultFreeLimits[key] ?? -1,
      error: (_, _) => kDefaultFreeLimits[key] ?? -1,
    );

    final List<({String label, String free, String premium})> rows = [
      (
        label: l10n.premiumPerkMessageCharacterLimit,
        free: '${freeLimit(LimitKeys.maxMessageLength)}',
        premium: '${premiumLimit(LimitKeys.maxMessageLength)}',
      ),
      (
        label: l10n.premiumPerkFileUploadSize,
        free: _formatBytes(freeLimit(LimitKeys.maxAttachmentFileSize)),
        premium: _formatBytes(premiumLimit(LimitKeys.maxAttachmentFileSize)),
      ),
      (
        label: l10n.premiumPerkBookmarkedMessages,
        free: '${freeLimit(LimitKeys.maxBookmarks)}',
        premium: '${premiumLimit(LimitKeys.maxBookmarks)}',
      ),
      (
        label: l10n.premiumPerkCommunities,
        free: '${freeLimit(LimitKeys.maxGuilds)}',
        premium: '${premiumLimit(LimitKeys.maxGuilds)}',
      ),
      (
        label: l10n.premiumPerkUseAnimatedEmojis,
        free: _boolLabel(freeLimit(LimitKeys.featureGlobalExpressions)),
        premium: _boolLabel(premiumLimit(LimitKeys.featureGlobalExpressions)),
      ),
      (
        label: l10n.premiumPerkVideoQuality,
        free: l10n.premiumPerkVideoQualityRestricted,
        premium: l10n.premiumPerkVideoQualityStock,
      ),
      (
        label: l10n.premiumPerkAnimatedAvatarsBanners,
        free: _boolLabel(freeLimit(LimitKeys.featureAnimatedAvatar)),
        premium: _boolLabel(premiumLimit(LimitKeys.featureAnimatedAvatar)),
      ),
      (
        label: l10n.premiumPerkEarlyAccess,
        free: _boolLabel(freeLimit(LimitKeys.featureEarlyAccess)),
        premium: _boolLabel(premiumLimit(LimitKeys.featureEarlyAccess)),
      ),
    ];

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.backgroundSecondary,
        borderRadius: layout.radiusLg,
        border: Border.all(color: colors.backgroundHeaderSecondary),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: layout.s4,
              vertical: layout.s3,
            ),
            decoration: BoxDecoration(
              color: colors.backgroundTertiary,
              border: Border(
                bottom: BorderSide(
                  color: colors.backgroundHeaderSecondary,
                  width: 2,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    l10n.premiumComparisonFeatureColumn,
                    style: textStyles.bodySmall.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colors.textPrimary,
                    ),
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: Text(
                    l10n.premiumFreeColumn,
                    textAlign: TextAlign.center,
                    style: textStyles.bodySmall.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colors.textPrimary,
                    ),
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: Text(
                    kPremiumProductName,
                    textAlign: TextAlign.center,
                    style: textStyles.bodySmall.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colors.statusOnline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          for (final ({String label, String free, String premium}) row in rows)
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: layout.s4,
                vertical: layout.s3,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: colors.backgroundHeaderSecondary),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      row.label,
                      style: textStyles.bodySmall.copyWith(
                        color: colors.textPrimary,
                      ),
                    ),
                  ),
                  SizedBox(width: 80, child: _ComparisonCell(value: row.free)),
                  SizedBox(
                    width: 80,
                    child: _ComparisonCell(value: row.premium, highlight: true),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  String _boolLabel(int value) => value > 0 ? '✓' : '—';

  String _formatBytes(int bytes) {
    if (bytes >= 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(0)} MB';
    }
    return '${(bytes / 1024).toStringAsFixed(0)} KB';
  }
}

class _ComparisonCell extends StatelessWidget {
  const _ComparisonCell({required this.value, this.highlight = false});

  final String value;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    if (value == '✓') {
      return Center(
        child: PhosphorIcon(
          PhosphorIconsBold.check,
          size: 16,
          color: highlight ? colors.statusOnline : colors.textPrimaryMuted,
        ),
      );
    }
    return Text(
      value,
      textAlign: TextAlign.center,
      style: textStyles.bodySmall.copyWith(
        color: highlight ? colors.statusOnline : colors.textPrimaryMuted,
        fontWeight: highlight ? FontWeight.w600 : FontWeight.normal,
      ),
    );
  }
}
