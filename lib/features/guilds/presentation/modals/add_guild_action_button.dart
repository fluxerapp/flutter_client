import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_variant.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AddGuildActionButton extends StatelessWidget {
  const AddGuildActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isDisabled = false,
    this.layout = AddGuildActionButtonLayout.column,
    super.key,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final bool isDisabled;
  final AddGuildActionButtonLayout layout;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final bool isRowLayout = layout == AddGuildActionButtonLayout.row;
    return IgnorePointer(
      ignoring: isDisabled,
      child: FluxerTappable(
        enabled: !isDisabled,
        onTap: onTap,
        semanticLabel: label,
        builder: (BuildContext context, Set<WidgetState> states) {
          final bool isHovered =
              !isDisabled && states.contains(WidgetState.hovered);
          final bool isPressed =
              !isDisabled && states.contains(WidgetState.pressed);
          final Border? border = FluxerButtonVariant.secondary.border(
            colors,
            hovered: isHovered,
          );
          final Color cardColor = FluxerBottomSheet.cardColorOf(context);
          final Color fill = border != null
              ? (isHovered
                    ? colors.backgroundSecondaryAlt
                    : colors.backgroundSecondary)
              : isPressed
              ? Color.alphaBlend(colors.backgroundModifierHover, cardColor)
              : cardColor;
          return AnimatedContainer(
            duration: context.motion.hover,
            curve: context.motion.curve,
            padding: EdgeInsets.symmetric(
              vertical: isRowLayout ? 16 : 24,
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: fill,
              borderRadius: border != null
                  ? BorderRadius.circular(8)
                  : context.layout.radiusXxl,
              border: border,
            ),
            child: isRowLayout
                ? Row(
                    children: <Widget>[
                      _ActionIcon(icon: icon, colors: colors),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          label,
                          style: textStyles.label.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: colors.textPrimary,
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      _ActionIcon(icon: icon, colors: colors),
                      const SizedBox(height: 12),
                      Text(
                        label,
                        textAlign: TextAlign.center,
                        style: textStyles.label.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: colors.textPrimary,
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

enum AddGuildActionButtonLayout { column, row }

class _ActionIcon extends StatelessWidget {
  const _ActionIcon({required this.icon, required this.colors});

  final IconData icon;
  final FluxerColorTheme colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: colors.brandPrimary,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: PhosphorIcon(icon, size: 24, color: colors.brandPrimaryFill),
      ),
    );
  }
}
