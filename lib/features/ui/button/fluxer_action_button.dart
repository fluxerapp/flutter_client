import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum FluxerActionButtonVariant { defaultStyle, danger }

/// Stacked icon-and-label button used in sheet quick-action rows.
class FluxerActionButton extends StatelessWidget {
  const FluxerActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isActive = false,
    this.isDisabled = false,
    this.variant = FluxerActionButtonVariant.defaultStyle,
    super.key,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final bool isActive;
  final bool isDisabled;
  final FluxerActionButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isDanger = variant == FluxerActionButtonVariant.danger;

    final Color background;
    final Color foreground;
    final Color labelColor;
    if (isActive) {
      background = isDanger ? colors.statusDanger : colors.brandPrimary;
      foreground = Colors.white;
      labelColor = Colors.white;
    } else {
      background = colors.backgroundSecondaryAlt;
      foreground = isDanger ? colors.statusDanger : colors.textPrimary;
      labelColor = isDanger ? colors.statusDanger : colors.textSecondary;
    }

    return Opacity(
      opacity: isDisabled ? 0.5 : 1,
      child: FluxerTappable(
        onTap: isDisabled ? null : onTap,
        semanticLabel: label,
        builder: (context, states) => Container(
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PhosphorIcon(icon, size: 20, color: foreground),
              const SizedBox(height: 4),
              Text(
                label,
                style: context.textStyles.label.copyWith(color: labelColor),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

@FluxerWidgetPreview(name: 'Default', group: 'FluxerActionButton')
Widget fluxerActionButtonDefaultPreview() {
  return SizedBox(
    width: 96,
    child: FluxerActionButton(
      icon: PhosphorIconsBold.bellSlash,
      label: 'Mute',
      onTap: () {},
    ),
  );
}

@FluxerWidgetPreview(name: 'Active', group: 'FluxerActionButton')
Widget fluxerActionButtonActivePreview() {
  return SizedBox(
    width: 96,
    child: FluxerActionButton(
      icon: PhosphorIconsBold.bellSlash,
      label: 'Unmute',
      isActive: true,
      onTap: () {},
    ),
  );
}
