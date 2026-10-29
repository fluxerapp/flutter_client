import 'package:fluxer_app/features/shell/hosted_ui/iphone_duo_hosted_ui.dart';
import 'package:fluxer_app/material_ui.dart';

Widget hostedUiMaterialWrap(
  BuildContext context, {
  required Widget child,
  Color? color,
}) {
  if (!hasIphoneDuoSideStrip(context)) {
    return child;
  }
  if (color == null) {
    return Material(type: MaterialType.transparency, child: child);
  }
  return Material(color: color, child: child);
}
