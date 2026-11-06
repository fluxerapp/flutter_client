import 'package:fluxer_app/material_ui.dart';

const double _kContextMenuEdgeInset = 8;

bool contextMenuOpensLeft(
  BuildContext context, {
  required double anchorX,
  required double menuWidth,
  required double overlayWidth,
}) {
  final bool overflowsRight =
      anchorX + menuWidth > overlayWidth - _kContextMenuEdgeInset;
  if (Directionality.of(context) != TextDirection.rtl) {
    return overflowsRight;
  }
  return overflowsRight || anchorX - menuWidth >= _kContextMenuEdgeInset;
}

bool contextSubmenuOpensRight(
  BuildContext context, {
  required double rightX,
  required double leftX,
  required double menuWidth,
  required double overlayWidth,
}) {
  final bool fitsRight =
      rightX + menuWidth < overlayWidth - _kContextMenuEdgeInset;
  if (Directionality.of(context) != TextDirection.rtl) {
    return fitsRight;
  }
  return fitsRight && leftX < _kContextMenuEdgeInset;
}
