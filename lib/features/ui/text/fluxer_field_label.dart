import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:material_ui/material_ui.dart';

class FluxerFieldLabel extends StatelessWidget {
  const FluxerFieldLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      header: true,
      child: Text(
        text,
        style: context.textStyles.bodySmall.copyWith(
          color: context.colors.textPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

@FluxerWidgetPreview(name: 'Default', group: 'FluxerFieldLabel')
Widget fluxerFieldLabelPreview() {
  return const FluxerFieldLabel('Display name');
}
