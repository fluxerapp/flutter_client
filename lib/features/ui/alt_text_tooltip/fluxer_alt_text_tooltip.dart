import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/tooltip/fluxer_tooltip.dart';
import 'package:fluxer_app/material_ui.dart';

class FluxerAltTextTooltip extends StatelessWidget {
  const FluxerAltTextTooltip({
    required this.altText,
    required this.child,
    this.position = FluxerTooltipPosition.above,
    super.key,
  });

  final String altText;
  final Widget child;
  final FluxerTooltipPosition position;

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;
    final colors = context.colors;

    return Semantics(
      label: altText,
      child: FluxerTooltip(
        position: position,
        richMessage: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 320),
          child: Text(
            altText,
            style: textStyles.bodySmall.copyWith(color: colors.textPrimary),
            softWrap: true,
          ),
        ),
        child: child,
      ),
    );
  }
}

@FluxerWidgetPreview(name: 'Default', group: 'FluxerAltTextTooltip')
Widget fluxerAltTextTooltipPreview() {
  return FluxerAltTextTooltip(
    altText: 'User avatar showing a mountain landscape at sunset.',
    child: Container(width: 48, height: 48, color: const Color(0xFF3C45A5)),
  );
}
