import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_grid/desktop_tile_style.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class VoiceDesktopTileWatchOverlay extends StatelessWidget {
  const VoiceDesktopTileWatchOverlay({required this.onWatch, super.key});

  final VoidCallback onWatch;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return ColoredBox(
      color: kVoiceDesktopTileOverlay,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: FluxerButton.primary(
              size: FluxerButtonSize.compact,
              fitContent: true,
              icon: PhosphorIconsFill.monitorPlay,
              label: l10n.voiceWatchStream,
              onPressed: onWatch,
            ),
          ),
        ),
      ),
    );
  }
}
