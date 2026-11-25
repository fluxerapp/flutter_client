import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/voice/utils/audio/voice_state_audio.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_dart/gateway.dart';

class VoiceTouchTileNameplate extends StatelessWidget {
  const VoiceTouchTileNameplate({
    required this.voice,
    required this.display,
    super.key,
  });

  final VoiceState voice;
  final String display;

  static const double _kIconSize = 14;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool serverMuted = voice.mute || voice.suppress;
    final Color dangerColor = context.colors.statusDanger;
    return ExcludeSemantics(
      child: Align(
        alignment: AlignmentDirectional.bottomStart,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.colors.backgroundSecondary,
            borderRadius: context.layout.radiusLg,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.layout.s2,
              vertical: context.layout.s1_5,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: context.layout.s1,
              children: <Widget>[
                if (isVoiceStateMuted(voice))
                  _statusIcon(
                    icon: PhosphorIconsFill.microphoneSlash,
                    tooltip: serverMuted
                        ? l10n.voiceParticipantTooltipCommunityMuted
                        : l10n.voiceParticipantTooltipMuted,
                    color: serverMuted ? dangerColor : Colors.white,
                  ),
                if (voice.selfDeaf || voice.deaf)
                  _statusIcon(
                    icon: PhosphorIconsFill.speakerSlash,
                    tooltip: voice.deaf
                        ? l10n.voiceParticipantTooltipCommunityDeafened
                        : l10n.voiceParticipantTooltipDeafened,
                    color: voice.deaf ? dangerColor : Colors.white,
                  ),
                _statusIcon(
                  icon: voice.isMobile
                      ? PhosphorIconsFill.deviceMobile
                      : PhosphorIconsFill.desktop,
                  tooltip: voice.isMobile
                      ? l10n.voiceParticipantTooltipMobileDevice
                      : l10n.voiceParticipantTooltipDesktopDevice,
                  color: Colors.white,
                ),
                Flexible(child: _buildName(context, l10n)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildName(BuildContext context, FluxerLocalizations l10n) {
    final String? connectionId = voice.connectionId;
    final bool hasConnectionId =
        connectionId != null && connectionId.isNotEmpty;
    final TextStyle style = context.textStyles.bodySmall;
    return Tooltip(
      message: hasConnectionId
          ? l10n.voiceParticipantTooltipConnection(connectionId)
          : display,
      child: Text.rich(
        TextSpan(
          style: style.copyWith(
            color: context.colors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
          children: <InlineSpan>[
            TextSpan(text: display),
            if (hasConnectionId)
              TextSpan(
                text: ' ($connectionId)',
                style: style.copyWith(color: context.colors.textSecondary),
              ),
          ],
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _statusIcon({
    required PhosphorIconData icon,
    required String tooltip,
    required Color color,
  }) {
    return Tooltip(
      message: tooltip,
      child: PhosphorIcon(icon, size: _kIconSize, color: color),
    );
  }
}
