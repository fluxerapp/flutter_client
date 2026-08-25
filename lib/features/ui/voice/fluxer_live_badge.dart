import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class FluxerLiveBadge extends StatelessWidget {
  const FluxerLiveBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFFDC2626),
        borderRadius: BorderRadius.circular(9999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        child: Text(
          l10n.voiceLiveBadge.toUpperCase(),
          style: context.textStyles.smallText.copyWith(
            color: context.colors.textPrimary,
            fontSize: 10,
            height: 1,
          ),
        ),
      ),
    );
  }
}
