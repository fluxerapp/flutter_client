import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_call_desktop_hud/voice_call_hud_pressable.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_call_desktop_hud/voice_call_hud_style.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class VoiceCallHudControlButton extends StatelessWidget {
  const VoiceCallHudControlButton({
    required this.icon,
    required this.tone,
    required this.tooltip,
    required this.onPressed,
    this.semanticLabel,
    this.toggled,
    this.onSecondaryPressed,
    this.settingsTooltip,
    this.onSettingsPressed,
    super.key,
  });

  final PhosphorIconData icon;
  final VoiceCallHudTone tone;
  final String tooltip;
  final ValueChanged<BuildContext>? onPressed;
  final String? semanticLabel;
  final bool? toggled;
  final ValueChanged<BuildContext>? onSecondaryPressed;
  final String? settingsTooltip;
  final ValueChanged<BuildContext>? onSettingsPressed;

  @override
  Widget build(BuildContext context) {
    final VoiceCallHudToneColors colors = voiceCallHudToneColors(tone);
    final Widget button = VoiceCallHudPressable(
      tooltip: tooltip,
      semanticLabel: semanticLabel,
      toggled: toggled,
      onPressed: onPressed,
      onSecondaryPressed: onSecondaryPressed,
      builder: (BuildContext context, Set<WidgetState> states) {
        final bool disabled = states.contains(WidgetState.disabled);
        return AnimatedContainer(
          duration: context.motion.normal,
          curve: context.motion.curve,
          width: kVoiceCallHudButtonSize,
          height: kVoiceCallHudButtonSize,
          transform: Matrix4.translationValues(
            0,
            states.contains(WidgetState.pressed) ? 1 : 0,
            0,
          ),
          decoration: BoxDecoration(
            color: states.contains(WidgetState.hovered)
                ? colors.hover
                : colors.background,
            borderRadius: BorderRadius.circular(kVoiceCallHudButtonRadius),
            border: states.contains(WidgetState.focused)
                ? Border.all(
                    color: kVoiceCallHudFocusBorder,
                    width: kVoiceCallHudFocusBorderWidth,
                  )
                : null,
          ),
          child: Center(
            child: Opacity(
              opacity: disabled ? kVoiceCallHudDisabledOpacity : 1,
              child: PhosphorIcon(
                icon,
                size: kVoiceCallHudIconSize,
                color: colors.foreground,
              ),
            ),
          ),
        );
      },
    );
    if (settingsTooltip == null) {
      return button;
    }
    return SizedBox.square(
      dimension: kVoiceCallHudButtonSize,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          button,
          PositionedDirectional(
            top: kVoiceCallHudCaretInset,
            end: kVoiceCallHudCaretInset,
            child: _VoiceCallHudSettingsCaret(
              tooltip: settingsTooltip!,
              onPressed: onSettingsPressed,
            ),
          ),
        ],
      ),
    );
  }
}

class _VoiceCallHudSettingsCaret extends StatelessWidget {
  const _VoiceCallHudSettingsCaret({
    required this.tooltip,
    required this.onPressed,
  });

  final String tooltip;
  final ValueChanged<BuildContext>? onPressed;

  @override
  Widget build(BuildContext context) {
    return VoiceCallHudPressable(
      tooltip: tooltip,
      onPressed: onPressed,
      builder: (BuildContext context, Set<WidgetState> states) {
        return Opacity(
          opacity: states.contains(WidgetState.disabled)
              ? kVoiceCallHudDisabledOpacity
              : 1,
          child: Container(
            width: kVoiceCallHudCaretSize,
            height: kVoiceCallHudCaretSize,
            decoration: BoxDecoration(
              color: kVoiceCallHudSurface,
              borderRadius: BorderRadius.circular(kVoiceCallHudCaretRadius),
              border: Border.all(
                color: states.contains(WidgetState.focused)
                    ? kVoiceCallHudFocusBorder
                    : kVoiceCallHudCaretBorder,
              ),
              boxShadow: kVoiceCallHudCaretShadow,
            ),
            child: Center(
              child: PhosphorIcon(
                PhosphorIconsBold.caretDown,
                size: kVoiceCallHudCaretIconSize,
                color: states.contains(WidgetState.hovered)
                    ? Colors.white
                    : kVoiceCallHudCaretIcon,
              ),
            ),
          ),
        );
      },
    );
  }
}

class VoiceCallHudSeparator extends StatelessWidget {
  const VoiceCallHudSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kVoiceCallHudSeparatorWidth,
      height: kVoiceCallHudSeparatorHeight,
      decoration: BoxDecoration(
        color: kVoiceCallHudSeparator,
        borderRadius: BorderRadius.circular(kVoiceCallHudSeparatorWidth),
      ),
    );
  }
}
