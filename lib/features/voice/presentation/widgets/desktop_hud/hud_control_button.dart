import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/hud_pressable.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/hud_style.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class VoiceHudControlButton extends StatelessWidget {
  const VoiceHudControlButton({
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
  final VoiceHudTone tone;
  final String tooltip;
  final ValueChanged<BuildContext>? onPressed;
  final String? semanticLabel;
  final bool? toggled;
  final ValueChanged<BuildContext>? onSecondaryPressed;
  final String? settingsTooltip;
  final ValueChanged<BuildContext>? onSettingsPressed;

  @override
  Widget build(BuildContext context) {
    final VoiceHudToneColors colors = voiceHudToneColors(tone);
    final Widget button = VoiceHudPressable(
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
          width: kVoiceHudButtonSize,
          height: kVoiceHudButtonSize,
          transform: Matrix4.translationValues(
            0,
            states.contains(WidgetState.pressed) ? 1 : 0,
            0,
          ),
          decoration: BoxDecoration(
            color: states.contains(WidgetState.hovered)
                ? colors.hover
                : colors.background,
            borderRadius: BorderRadius.circular(kVoiceHudButtonRadius),
            border: states.contains(WidgetState.focused)
                ? Border.all(
                    color: kVoiceHudFocusBorder,
                    width: kVoiceHudFocusBorderWidth,
                  )
                : null,
          ),
          child: Center(
            child: Opacity(
              opacity: disabled ? kVoiceHudDisabledOpacity : 1,
              child: PhosphorIcon(
                icon,
                size: kVoiceHudIconSize,
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
      dimension: kVoiceHudButtonSize,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          button,
          PositionedDirectional(
            top: kVoiceHudCaretInset,
            end: kVoiceHudCaretInset,
            child: _VoiceHudSettingsCaret(
              tooltip: settingsTooltip!,
              onPressed: onSettingsPressed,
            ),
          ),
        ],
      ),
    );
  }
}

class _VoiceHudSettingsCaret extends StatelessWidget {
  const _VoiceHudSettingsCaret({
    required this.tooltip,
    required this.onPressed,
  });

  final String tooltip;
  final ValueChanged<BuildContext>? onPressed;

  @override
  Widget build(BuildContext context) {
    return VoiceHudPressable(
      tooltip: tooltip,
      onPressed: onPressed,
      builder: (BuildContext context, Set<WidgetState> states) {
        return Opacity(
          opacity: states.contains(WidgetState.disabled)
              ? kVoiceHudDisabledOpacity
              : 1,
          child: Container(
            width: kVoiceHudCaretSize,
            height: kVoiceHudCaretSize,
            decoration: BoxDecoration(
              color: kVoiceHudSurface,
              borderRadius: BorderRadius.circular(kVoiceHudCaretRadius),
              border: Border.all(
                color: states.contains(WidgetState.focused)
                    ? kVoiceHudFocusBorder
                    : kVoiceHudCaretBorder,
              ),
              boxShadow: kVoiceHudCaretShadow,
            ),
            child: Center(
              child: PhosphorIcon(
                PhosphorIconsBold.caretDown,
                size: kVoiceHudCaretIconSize,
                color: states.contains(WidgetState.hovered)
                    ? Colors.white
                    : kVoiceHudCaretIcon,
              ),
            ),
          ),
        );
      },
    );
  }
}

class VoiceHudSeparator extends StatelessWidget {
  const VoiceHudSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kVoiceHudSeparatorWidth,
      height: kVoiceHudSeparatorHeight,
      decoration: BoxDecoration(
        color: kVoiceHudSeparator,
        borderRadius: BorderRadius.circular(kVoiceHudSeparatorWidth),
      ),
    );
  }
}
