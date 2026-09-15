import 'package:fluxer_app/features/ui/preview/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_typing_dots.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class FluxerLoadingSpinner extends StatelessWidget {
  const FluxerLoadingSpinner({super.key, this.color, this.inverted = false});

  final Color? color;
  final bool inverted;

  @override
  Widget build(BuildContext context) {
    final Color dotColor = color ?? (inverted ? Colors.black : Colors.white);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);

    return Semantics(
      label: l10n.uiLoading,
      child: ExcludeSemantics(child: FluxerTypingDots(color: dotColor)),
    );
  }
}

@FluxerWidgetPreview(name: 'Default', group: 'FluxerLoadingSpinner')
Widget fluxerLoadingSpinnerPreview() {
  return const FluxerLoadingSpinner();
}

@FluxerWidgetPreview(name: 'Inverted', group: 'FluxerLoadingSpinner')
Widget fluxerLoadingSpinnerInvertedPreview() {
  return const ColoredBox(
    color: Color(0xFF5865F2),
    child: Padding(
      padding: EdgeInsets.all(16),
      child: FluxerLoadingSpinner(inverted: true),
    ),
  );
}
