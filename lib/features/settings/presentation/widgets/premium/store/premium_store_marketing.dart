import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/premium/store/premium_store_comparison.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/premium/store/premium_store_showcase.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/premium/store/premium_store_style.dart';
import 'package:fluxer_app/features/ui/text_link/fluxer_text_link.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

const String kPremiumVisionaryHelpUrl = 'https://fluxer.app/help/visionary';

class PremiumStoreMarketingSections extends StatelessWidget {
  const PremiumStoreMarketingSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const PremiumStoreShowcase(),
          const SizedBox(height: 56),
          const PremiumStoreComparison(),
          const SizedBox(height: 24),
          const _TagFootnote(),
          SizedBox(height: MediaQuery.paddingOf(context).bottom + 8),
        ],
      ),
    );
  }
}

class _TagFootnote extends StatelessWidget {
  const _TagFootnote();

  @override
  Widget build(BuildContext context) {
    final PremiumStoreStyle style = PremiumStoreStyle.of(context);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final TextStyle muted = context.textStyles.timestamp.copyWith(
      color: style.inkMuted,
    );
    return Text.rich(
      TextSpan(
        style: muted,
        children: [
          TextSpan(text: '${l10n.storePlutoniumTagFootnote} '),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: MediaQuery.withNoTextScaling(
              child: FluxerTextLink(
                text: l10n.storePlutoniumLearnVisionary,
                url: kPremiumVisionaryHelpUrl,
                style: muted.copyWith(color: style.accent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
