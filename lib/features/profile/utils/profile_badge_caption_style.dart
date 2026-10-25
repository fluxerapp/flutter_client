import 'package:fluxer_app/core/theme/fluxer_fonts.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';

TextStyle profileBadgeCaptionTextStyle(
  BuildContext context, {
  required double fontSize,
}) {
  final colors = context.colors;
  final bool isLight = Theme.of(context).brightness == Brightness.light;
  return TextStyle(
    fontFamily: FluxerFonts.sans,
    color: isLight ? colors.textLink : colors.brandPrimaryLight,
    fontSize: fontSize,
    fontWeight: FontWeight.w700,
    height: 1,
    fontFeatures: const <FontFeature>[FontFeature.tabularFigures()],
  );
}
