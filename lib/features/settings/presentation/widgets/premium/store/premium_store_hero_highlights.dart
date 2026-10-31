import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/premium/store/premium_store_panel.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/premium/store/premium_store_style.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class PremiumStoreHeroHighlights extends StatelessWidget {
  const PremiumStoreHeroHighlights({super.key});

  @override
  Widget build(BuildContext context) {
    final PremiumStoreStyle style = PremiumStoreStyle.of(context);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final textStyles = context.textStyles;
    return PremiumStorePanel(
      child: Column(
        children: [
          Text(
            l10n.storePlutoniumHighlightsLead,
            textAlign: TextAlign.center,
            style: textStyles.heading.copyWith(color: style.ink),
          ),
          const SizedBox(height: 16),
          _Highlight(
            icon: PhosphorIconsRegular.sticker,
            label: l10n.storePlutoniumHighlightEmoji,
            style: style,
          ),
          const SizedBox(height: 12),
          _Highlight(
            icon: PhosphorIconsRegular.identificationBadge,
            label: l10n.storePlutoniumHighlightProfile,
            style: style,
          ),
          const SizedBox(height: 12),
          _Highlight(
            icon: PhosphorIconsRegular.uploadSimple,
            label: l10n.storePlutoniumHighlightFiles,
            style: style,
          ),
          const SizedBox(height: 12),
          _Highlight(
            icon: PhosphorIconsRegular.textAa,
            label: l10n.storePlutoniumHighlightMessages,
            style: style,
          ),
          const SizedBox(height: 12),
          _Highlight(
            icon: PhosphorIconsRegular.userCircle,
            label: l10n.storePlutoniumHighlightCommunityProfile,
            style: style,
          ),
          const SizedBox(height: 14),
          Text(
            l10n.storePlutoniumHighlightsMore,
            textAlign: TextAlign.center,
            style: textStyles.bodySmall.copyWith(color: style.inkMuted),
          ),
        ],
      ),
    );
  }
}

class _Highlight extends StatelessWidget {
  const _Highlight({
    required this.icon,
    required this.label,
    required this.style,
  });

  final IconData icon;
  final String label;
  final PremiumStoreStyle style;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PhosphorIcon(icon, size: 22, color: style.accent),
        const SizedBox(width: 14),
        Expanded(
          child: Text(
            label,
            style: context.textStyles.label.copyWith(color: style.ink),
          ),
        ),
      ],
    );
  }
}
