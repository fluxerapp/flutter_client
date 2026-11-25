import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceTouchTileDevicesChip extends StatelessWidget {
  const VoiceTouchTileDevicesChip({required this.count, super.key});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: FluxerLocalizations.of(
        context,
      ).voiceParticipantOtherDevicesLabel(count),
      excludeSemantics: true,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.colors.backgroundSecondary,
          borderRadius: context.layout.radiusFull,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.layout.s2,
            vertical: context.layout.s1,
          ),
          child: Text(
            '+$count',
            style: context.textStyles.smallText.copyWith(
              color: context.colors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
