import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceP2pIndicator extends StatelessWidget {
  const VoiceP2pIndicator({this.includeTopPadding = true, super.key});

  final bool includeTopPadding;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final TextStyle style = context.textStyles.bodySmall.copyWith(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      height: 1.3,
      letterSpacing: 0.005 * 13,
      color: context.colors.statusOnline,
    );
    return Semantics(
      label:
          '${l10n.voiceP2pIndicatorLabel}. ${l10n.voiceP2pIndicatorDescription}',
      excludeSemantics: true,
      child: Padding(
        padding: EdgeInsets.only(top: includeTopPadding ? 12 : 0),
        child: Align(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: screenWidth < 512 ? screenWidth : 512,
            ),
            child: Text.rich(
              TextSpan(
                children: <InlineSpan>[
                  TextSpan(
                    text: l10n.voiceP2pIndicatorLabel,
                    style: style.copyWith(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(text: ' ${l10n.voiceP2pIndicatorDescription}'),
                ],
              ),
              textAlign: TextAlign.center,
              style: style,
            ),
          ),
        ),
      ),
    );
  }
}
