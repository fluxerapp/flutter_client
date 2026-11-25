import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/voice/fluxer_live_badge.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_grid/desktop_tile_style.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/hud_pressable.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/hud_style.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceDesktopTileDevicePill extends StatelessWidget {
  const VoiceDesktopTileDevicePill({
    required this.label,
    required this.tooltip,
    required this.compact,
    required this.onPressed,
    super.key,
  });

  final String label;
  final String tooltip;
  final bool compact;
  final VoidCallback onPressed;

  static const double _kSize = 24;
  static const double _kCompactSize = 22;
  static const double _kRadius = 8;
  static const double _kCompactRadius = 7;
  static const double _kFontSize = 10;

  @override
  Widget build(BuildContext context) {
    final double size = compact ? _kCompactSize : _kSize;
    return VoiceHudPressable(
      tooltip: tooltip,
      onPressed: (_) => onPressed(),
      builder: (BuildContext context, Set<WidgetState> states) {
        final bool highlighted =
            states.contains(WidgetState.hovered) ||
            states.contains(WidgetState.focused);
        return AnimatedContainer(
          duration: context.motion.fast,
          height: size,
          constraints: BoxConstraints(minWidth: size),
          padding: EdgeInsets.symmetric(horizontal: context.layout.s1),
          decoration: voiceTileHudChipDecoration(
            color: highlighted ? kVoiceHudSurfaceHover : kVoiceHudSurface,
            radius: compact ? _kCompactRadius : _kRadius,
          ),
          child: Center(
            widthFactor: 1,
            child: Text(
              label,
              style: voiceDesktopTileTextStyle(
                context,
                fontSize: _kFontSize,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        );
      },
    );
  }
}
