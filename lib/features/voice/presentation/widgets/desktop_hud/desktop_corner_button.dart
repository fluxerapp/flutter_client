import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/hud_pressable.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/hud_style.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class VoiceDesktopCornerButton extends StatelessWidget {
  const VoiceDesktopCornerButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
    this.toggled = false,
    this.badge,
    super.key,
  });

  final PhosphorIconData icon;
  final String tooltip;
  final VoidCallback onPressed;
  final bool toggled;
  final Widget? badge;

  @override
  Widget build(BuildContext context) {
    return VoiceHudPressable(
      tooltip: tooltip,
      toggled: toggled,
      onPressed: (_) => onPressed(),
      builder: (BuildContext context, Set<WidgetState> states) {
        final bool focused = states.contains(WidgetState.focused);
        final bool highlighted =
            toggled || states.contains(WidgetState.hovered);
        return Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            AnimatedContainer(
              duration: context.motion.normal,
              curve: context.motion.curve,
              width: kVoiceHudCornerButtonSize,
              height: kVoiceHudCornerButtonSize,
              decoration: BoxDecoration(
                color: highlighted ? kVoiceHudSurfaceHover : kVoiceHudSurface,
                borderRadius: BorderRadius.circular(
                  kVoiceHudCornerButtonRadius,
                ),
                border: Border.all(
                  color: focused
                      ? kVoiceHudFocusBorder
                      : highlighted
                      ? kVoiceHudCornerBorderHover
                      : kVoiceHudCornerBorder,
                  width: focused ? kVoiceHudFocusBorderWidth : 1,
                ),
                boxShadow: kVoiceHudCornerShadow,
              ),
              child: Center(
                child: PhosphorIcon(
                  icon,
                  size: kVoiceHudCornerIconSize,
                  color: Colors.white,
                ),
              ),
            ),
            ?badge,
          ],
        );
      },
    );
  }
}
