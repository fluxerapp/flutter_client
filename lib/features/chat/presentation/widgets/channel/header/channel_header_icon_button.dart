import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

class ChannelHeaderIconButton extends ConsumerWidget {
  const ChannelHeaderIconButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.isActive = false,
    this.showIndicator = false,
    super.key,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final bool isActive;
  final bool showIndicator;

  static const double _visualSize = 32;
  static const double _iconSize = 24;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (usesDesktopPointerUi(context)) {
      return _DesktopChannelHeaderIconButton(
        icon: icon,
        label: label,
        onPressed: onPressed,
        isActive: isActive,
        showIndicator: showIndicator,
      );
    }
    final bool touchPrimary = isTouchPrimaryInput(ref);
    final double hitSize = touchPrimary
        ? context.layout.touchTargetMin
        : _visualSize;
    final Color color = isActive
        ? context.colors.interactiveActive
        : context.colors.interactiveNormal;

    return Semantics(
      button: true,
      label: label,
      child: Tooltip(
        message: label,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(hitSize / 2),
            child: SizedBox(
              width: hitSize,
              height: hitSize,
              child: Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    PhosphorIcon(icon, size: _iconSize, color: color),
                    if (showIndicator)
                      PositionedDirectional(
                        end: -2,
                        top: -2,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: context.colors.statusDanger,
                            shape: BoxShape.circle,
                          ),
                          child: const SizedBox.square(dimension: 8),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DesktopChannelHeaderIconButton extends StatelessWidget {
  const _DesktopChannelHeaderIconButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.isActive,
    required this.showIndicator,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final bool isActive;
  final bool showIndicator;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return FluxerTooltip(
      message: label,
      position: FluxerTooltipPosition.below,
      child: FluxerTappable(
        onTap: onPressed,
        selected: isActive,
        toggled: isActive,
        semanticLabel: label,
        excludeChildSemantics: true,
        builder: (BuildContext context, Set<WidgetState> states) {
          final bool highlighted =
              isActive || states.contains(WidgetState.hovered);
          return SizedBox.square(
            dimension: ChannelHeaderIconButton._visualSize,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Center(
                  child: PhosphorIcon(
                    icon,
                    size: ChannelHeaderIconButton._iconSize,
                    color: highlighted
                        ? colors.textPrimary
                        : colors.textPrimaryMuted,
                  ),
                ),
                if (showIndicator)
                  PositionedDirectional(
                    end: 5.6,
                    bottom: 4.8,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: colors.statusDanger,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: colors.backgroundSecondaryLighter,
                          width: 1.28,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        ),
                      ),
                      child: const SizedBox.square(dimension: 8),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
