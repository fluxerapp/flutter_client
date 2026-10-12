import 'package:cupertino_ui/cupertino_ui.dart' show CupertinoActivityIndicator;
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/preview/fluxer_widget_preview.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

enum FluxerLoadingSpinnerSize {
  small(20),
  medium(30),
  large(35);

  const FluxerLoadingSpinnerSize(this.diameter);

  final double diameter;
}

class FluxerLoadingSpinner extends StatelessWidget {
  const FluxerLoadingSpinner({
    super.key,
    this.color,
    this.size = FluxerLoadingSpinnerSize.large,
    this.revealProgress,
  });

  final Color? color;
  final FluxerLoadingSpinnerSize size;
  final double? revealProgress;

  @override
  Widget build(BuildContext context) {
    final Color spokeColor = color ?? context.colors.textTertiary;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool animating = !MediaQuery.disableAnimationsOf(context);
    final double? progress = revealProgress;

    return Semantics(
      label: l10n.uiLoading,
      child: ExcludeSemantics(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: progress != null
              ? CupertinoActivityIndicator.partiallyRevealed(
                  color: spokeColor,
                  radius: size.diameter / 2,
                  progress: progress,
                )
              : CupertinoActivityIndicator(
                  color: spokeColor,
                  radius: size.diameter / 2,
                  animating: animating,
                ),
        ),
      ),
    );
  }
}

@FluxerWidgetPreview(name: 'Default', group: 'FluxerLoadingSpinner')
Widget fluxerLoadingSpinnerPreview() {
  return const FluxerLoadingSpinner();
}

@FluxerWidgetPreview(name: 'Small', group: 'FluxerLoadingSpinner')
Widget fluxerLoadingSpinnerSmallPreview() {
  return const FluxerLoadingSpinner(size: FluxerLoadingSpinnerSize.small);
}
