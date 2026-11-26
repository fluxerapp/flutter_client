import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/voice/fluxer_live_badge.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/hud_pressable.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/hud_style.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/focus_desktop_layout.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class VoiceDesktopMembersToggle extends StatelessWidget {
  const VoiceDesktopMembersToggle({
    required this.expanded,
    required this.onPressed,
    super.key,
  });

  final bool expanded;
  final VoidCallback onPressed;

  static const double _kPadding = 12;
  static const double _kGap = 6;
  static const double _kIconSize = 16;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return VoiceHudPressable(
      tooltip: expanded
          ? l10n.voiceFocusHideMembers
          : l10n.voiceFocusShowMembers,
      toggled: expanded,
      onPressed: (_) => onPressed(),
      builder: (BuildContext context, Set<WidgetState> states) {
        final bool highlighted =
            states.contains(WidgetState.hovered) ||
            states.contains(WidgetState.focused);
        return AnimatedContainer(
          duration: context.motion.fast,
          height: voiceFocusMembersToggleHeightPx,
          padding: const EdgeInsets.symmetric(horizontal: _kPadding),
          decoration: voiceTileHudChipDecoration(
            color: highlighted ? kVoiceHudSurfaceHover : kVoiceHudSurface,
            radius: voiceFocusMembersToggleHeightPx / 2,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: _kGap,
            children: <Widget>[
              const PhosphorIcon(
                PhosphorIconsBold.users,
                size: _kIconSize,
                color: Colors.white,
              ),
              PhosphorIcon(
                expanded
                    ? PhosphorIconsBold.caretDown
                    : PhosphorIconsBold.caretUp,
                size: _kIconSize,
                color: Colors.white,
              ),
            ],
          ),
        );
      },
    );
  }
}
