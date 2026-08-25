import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/material_ui.dart';

class FluxerHintText extends StatelessWidget {
  const FluxerHintText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textStyles.bodySmall.copyWith(
        color: context.colors.textPrimaryMuted,
      ),
    );
  }
}

@FluxerWidgetPreview(name: 'Default', group: 'FluxerHintText')
Widget fluxerHintTextPreview() {
  return const FluxerHintText('Optional. Shown on your profile and mentions.');
}
