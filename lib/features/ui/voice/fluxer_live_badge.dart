import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

enum FluxerLiveBadgeTone { standard, voiceTile }

const double kVoiceTileHudChipHeight = 20;
const double kVoiceTileHudChipRadius = 7;
const Color kVoiceLiveBadgeRed = Color(0xFFDC2626);
const Color kVoiceTileHudChipBorder = Color(0x1AFFFFFF);
const List<BoxShadow> kVoiceTileHudChipShadows = <BoxShadow>[
  BoxShadow(color: Color(0x3D000000), blurRadius: 6, offset: Offset(0, 2)),
];

BoxDecoration voiceTileHudChipDecoration({required Color color}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(kVoiceTileHudChipRadius),
    border: Border.all(color: kVoiceTileHudChipBorder),
    boxShadow: kVoiceTileHudChipShadows,
  );
}

class FluxerLiveBadge extends StatelessWidget {
  const FluxerLiveBadge({this.tone = FluxerLiveBadgeTone.standard, super.key});

  final FluxerLiveBadgeTone tone;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool onTile = tone == FluxerLiveBadgeTone.voiceTile;
    final TextStyle textStyle = TextStyle(
      color: const Color(0xFFFFFFFF),
      fontSize: 10,
      fontWeight: FontWeight.w600,
      height: onTile ? 1.2 : 1,
    );
    return DecoratedBox(
      decoration: onTile
          ? voiceTileHudChipDecoration(color: kVoiceLiveBadgeRed)
          : BoxDecoration(
              color: kVoiceLiveBadgeRed,
              borderRadius: BorderRadius.circular(9999),
            ),
      child: SizedBox(
        height: onTile ? kVoiceTileHudChipHeight : null,
        child: Padding(
          padding: onTile
              ? const EdgeInsets.symmetric(horizontal: 6)
              : const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          child: Center(
            child: Text(l10n.voiceLiveBadge.toUpperCase(), style: textStyle),
          ),
        ),
      ),
    );
  }
}
