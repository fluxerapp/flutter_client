import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_call_desktop_hud/voice_call_hud_pressable.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_call_desktop_hud/voice_call_hud_style.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class VoiceCallDesktopCornerButton extends StatelessWidget {
  const VoiceCallDesktopCornerButton({
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
    return VoiceCallHudPressable(
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
              width: kVoiceCallHudCornerButtonSize,
              height: kVoiceCallHudCornerButtonSize,
              decoration: BoxDecoration(
                color: highlighted
                    ? kVoiceCallHudSurfaceHover
                    : kVoiceCallHudSurface,
                borderRadius: BorderRadius.circular(
                  kVoiceCallHudCornerButtonRadius,
                ),
                border: Border.all(
                  color: focused
                      ? kVoiceCallHudFocusBorder
                      : highlighted
                      ? kVoiceCallHudCornerBorderHover
                      : kVoiceCallHudCornerBorder,
                  width: focused ? kVoiceCallHudFocusBorderWidth : 1,
                ),
                boxShadow: kVoiceCallHudCornerShadow,
              ),
              child: Center(
                child: PhosphorIcon(
                  icon,
                  size: kVoiceCallHudCornerIconSize,
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
