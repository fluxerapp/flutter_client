import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/plutonium/store/plutonium_store_panel.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/plutonium/store/plutonium_store_style.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class PremiumStoreHighlights extends StatelessWidget {
  const PremiumStoreHighlights({super.key});

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return PremiumStorePanel(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              l10n.storePlutoniumHighlightsLead,
              textAlign: TextAlign.center,
              style: context.textStyles.bodyMedium.copyWith(
                color: PremiumStoreStyle.ink,
              ),
            ),
            const SizedBox(height: 14),
            _Highlight(
              icon: PhosphorIconsRegular.sticker,
              label: l10n.storePlutoniumHighlightEmoji,
            ),
            const SizedBox(height: 8),
            _Highlight(
              icon: PhosphorIconsRegular.identificationBadge,
              label: l10n.storePlutoniumHighlightProfile,
            ),
            const SizedBox(height: 8),
            _Highlight(
              icon: PhosphorIconsRegular.uploadSimple,
              label: l10n.storePlutoniumHighlightFiles,
            ),
            const SizedBox(height: 8),
            _Highlight(
              icon: PhosphorIconsRegular.textAa,
              label: l10n.storePlutoniumHighlightMessages,
            ),
            const SizedBox(height: 8),
            _Highlight(
              icon: PhosphorIconsRegular.userCircle,
              label: l10n.storePlutoniumHighlightCommunityProfile,
            ),
            const SizedBox(height: 10),
            Text(
              l10n.storePlutoniumHighlightsMore,
              textAlign: TextAlign.center,
              style: context.textStyles.bodySmall.copyWith(
                color: PremiumStoreStyle.inkMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Highlight extends StatelessWidget {
  const _Highlight({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PhosphorIcon(icon, size: 20, color: PremiumStoreStyle.accent),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: context.textStyles.bodySmall.copyWith(
              color: PremiumStoreStyle.inkSoft,
            ),
          ),
        ),
      ],
    );
  }
}
