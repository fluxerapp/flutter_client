import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/voice/fluxer_live_badge.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_grid/desktop_tile_style.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/hud_pressable.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/hud_style.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_dart/gateway.dart';

class VoiceDesktopTileNameplate extends StatelessWidget {
  const VoiceDesktopTileNameplate({
    required this.voice,
    required this.display,
    required this.tileWidth,
    required this.showConnectionId,
    this.onOpenMenu,
    super.key,
  });

  final VoiceState voice;
  final String display;
  final double tileWidth;
  final bool showConnectionId;
  final ValueChanged<Offset>? onOpenMenu;

  static const double minTileWidth = 80;

  static const double _kMenuMinTileWidth = 220;
  static const double _kNameMinTileWidth = 170;
  static const double _kSmallNameTileWidth = 240;
  static const double _kConnectionMinTileWidth = 320;
  static const double _kNameMaxWidth = 260;
  static const double _kRadius = 9;
  static const double _kCompactRadius = 8;
  static const double _kPadding = 6;
  static const double _kCompactPadding = 5;
  static const double _kGap = 5;
  static const double _kIconSize = 14;
  static const double _kFontSize = 12;
  static const double _kSmallFontSize = 11;
  static const double _kMenuButtonRadius = 7;
  static const double _kHeight = 22;
  static const double _kCompactHeight = 19;
  static const double _kMenuButtonSize = 20;
  static const double _kMenuButtonCompactSize = 18;
  static const double _kMenuIconSize = 15;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool compact = tileWidth <= kVoiceDesktopTileCompactWidth;
    final bool serverMuted = voice.mute || voice.suppress;
    final bool muted = serverMuted || voice.selfMute;
    final bool deafened = voice.deaf || voice.selfDeaf;
    final Color statusColor = context.colors.textPrimaryMuted;
    final Color dangerColor = context.colors.statusDanger;
    final String? connectionId = voice.connectionId;
    return ExcludeSemantics(
      child: DecoratedBox(
        decoration: voiceTileHudChipDecoration(
          color: kVoiceHudSurface,
          radius: compact ? _kCompactRadius : _kRadius,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: compact ? _kCompactPadding : _kPadding,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: compact ? _kCompactHeight : _kHeight,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: _kGap,
              children: <Widget>[
                if (onOpenMenu != null && tileWidth > _kMenuMinTileWidth)
                  _menuButton(l10n, compact: compact),
                if (muted)
                  _statusIcon(
                    icon: PhosphorIconsFill.microphoneSlash,
                    tooltip: serverMuted
                        ? l10n.voiceParticipantTooltipCommunityMuted
                        : l10n.voiceParticipantTooltipMuted,
                    color: serverMuted ? dangerColor : statusColor,
                  ),
                if (deafened)
                  _statusIcon(
                    icon: PhosphorIconsFill.speakerSlash,
                    tooltip: voice.deaf
                        ? l10n.voiceParticipantTooltipCommunityDeafened
                        : l10n.voiceParticipantTooltipDeafened,
                    color: voice.deaf ? dangerColor : statusColor,
                  ),
                _statusIcon(
                  icon: voice.isMobile
                      ? PhosphorIconsRegular.deviceMobile
                      : PhosphorIconsRegular.desktop,
                  tooltip: voice.isMobile
                      ? l10n.voiceParticipantTooltipMobileDevice
                      : l10n.voiceParticipantTooltipDesktopDevice,
                  color: Colors.white,
                ),
                if (tileWidth > _kNameMinTileWidth)
                  Flexible(
                    flex: 2,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: _kNameMaxWidth,
                      ),
                      child: Tooltip(
                        message: display,
                        excludeFromSemantics: true,
                        child: Text(
                          display,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: voiceDesktopTileTextStyle(
                            context,
                            fontSize: tileWidth <= _kSmallNameTileWidth
                                ? _kSmallFontSize
                                : _kFontSize,
                          ),
                        ),
                      ),
                    ),
                  ),
                if (showConnectionId &&
                    connectionId != null &&
                    connectionId.isNotEmpty &&
                    tileWidth > _kConnectionMinTileWidth)
                  Flexible(
                    child: Tooltip(
                      message: l10n.voiceParticipantTooltipConnection(
                        connectionId,
                      ),
                      excludeFromSemantics: true,
                      child: Text(
                        '($connectionId)',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: voiceDesktopTileTextStyle(
                          context,
                          fontSize: _kSmallFontSize,
                          fontWeight: FontWeight.w400,
                          color: kVoiceDesktopTileMutedText,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _menuButton(FluxerLocalizations l10n, {required bool compact}) {
    final double size = compact ? _kMenuButtonCompactSize : _kMenuButtonSize;
    return VoiceHudPressable(
      tooltip: l10n.voiceParticipantOptionsFor(display),
      onPressed: (BuildContext buttonContext) {
        final RenderObject? box = buttonContext.findRenderObject();
        if (box is RenderBox && box.hasSize) {
          onOpenMenu!(box.localToGlobal(box.size.center(Offset.zero)));
        }
      },
      builder: (BuildContext context, Set<WidgetState> states) {
        final bool highlighted =
            states.contains(WidgetState.hovered) ||
            states.contains(WidgetState.focused);
        return AnimatedContainer(
          duration: context.motion.fast,
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: highlighted ? kVoiceHudSurfaceHover : kVoiceHudSurface,
            borderRadius: BorderRadius.circular(_kMenuButtonRadius),
          ),
          alignment: Alignment.center,
          child: PhosphorIcon(
            PhosphorIconsBold.dotsThree,
            size: _kMenuIconSize,
            color: highlighted ? Colors.white : kVoiceDesktopTileMutedText,
          ),
        );
      },
    );
  }

  Widget _statusIcon({
    required PhosphorIconData icon,
    required String tooltip,
    required Color color,
  }) {
    return Tooltip(
      message: tooltip,
      excludeFromSemantics: true,
      child: PhosphorIcon(icon, size: _kIconSize, color: color),
    );
  }
}
