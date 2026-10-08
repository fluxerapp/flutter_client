import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_variant.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FluxerCircleFab extends StatelessWidget {
  const FluxerCircleFab({
    required this.icon,
    required this.semanticLabel,
    required this.onTap,
    super.key,
  });

  final IconData icon;
  final String semanticLabel;
  final VoidCallback onTap;

  static const double size = 56;

  @override
  Widget build(BuildContext context) {
    return FluxerTappable(
      onTap: onTap,
      semanticLabel: semanticLabel,
      builder: (BuildContext context, Set<WidgetState> states) {
        final colors = context.colors;
        final motion = context.motion;
        final bool isHovered = states.contains(WidgetState.hovered);

        return AnimatedContainer(
          duration: motion.fast,
          curve: motion.curve,
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: isHovered ? colors.brandSecondary : colors.brandPrimary,
            shape: BoxShape.circle,
            border: Border.all(
              color: FluxerButtonVariant.primary.borderColor(
                colors,
                hovered: isHovered,
              )!,
            ),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Color(0x33000000),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: PhosphorIcon(icon, size: 24, color: colors.textOnBrandPrimary),
        );
      },
    );
  }
}
