import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/stream_quality_items.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/stream_quality_submenu.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class VoiceActiveShareMenu extends StatelessWidget {
  const VoiceActiveShareMenu({
    required this.onClose,
    required this.onStop,
    required this.onChangeSource,
    required this.onOpenSettings,
    super.key,
  });

  final VoidCallback onClose;
  final VoidCallback onStop;
  final VoidCallback onChangeSource;
  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        FluxerMenuItem(
          label: l10n.voiceParticipantMenuStopStreaming,
          icon: PhosphorIconsFill.stopCircle,
          isDanger: true,
          onPressed: () {
            onClose();
            onStop();
          },
        ),
        FluxerMenuItem(
          label: l10n.voiceScreenShareChangeStream,
          icon: PhosphorIconsFill.monitorPlay,
          onPressed: () {
            onClose();
            onChangeSource();
          },
        ),
        VoiceStreamQualitySubmenu(
          label: l10n.voiceScreenShareStreamQuality,
          builder: (BuildContext _) =>
              VoiceStreamQualityItems(onClose: onClose),
        ),
        const FluxerMenuDivider(),
        FluxerMenuItem(
          label: l10n.voiceControlScreenShareSettings,
          icon: PhosphorIconsFill.gear,
          onPressed: () {
            onClose();
            onOpenSettings();
          },
        ),
      ],
    );
  }
}
