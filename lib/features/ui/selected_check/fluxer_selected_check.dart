import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FluxerSelectedCheck extends StatelessWidget {
  const FluxerSelectedCheck({this.size = 22, this.borderColor, super.key});

  final double size;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final Color? ring = borderColor;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colors.brandPrimary,
        border: ring == null ? null : Border.all(color: ring, width: 2),
      ),
      alignment: Alignment.center,
      child: PhosphorIcon(
        PhosphorIconsBold.check,
        size: size * 0.58,
        color: colors.brandPrimaryFill,
      ),
    );
  }
}
