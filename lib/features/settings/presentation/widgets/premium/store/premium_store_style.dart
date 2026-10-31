import 'package:fluxer_app/material_ui.dart';

enum PremiumStoreStyle {
  dark(
    page: Color(0xFF0F0D2D),
    heroTop: Color(0xFF4641D9),
    heroMid: Color(0xFF3D38C6),
    heroBottom: Color(0xFF282394),
    ink: Color(0xFFFFFFFF),
    inkMuted: Color(0xFFC9C7FF),
    inkSoft: Color(0xFFE3E2FF),
    inkFaint: Color(0x73FFFFFF),
    line: Color(0xFF282394),
    accent: Color(0xFFB0ADFF),
    accentInk: Color(0xFF4641D9),
    board: Color(0xFF1B1754),
    boardLedge: Color(0xFF0B0921),
    tile: Color(0xFF282394),
    tileLedge: Color(0xFF1F1B76),
    textLedge: Color(0xFF3530B4),
    imageLedge: Color(0xFF1F1B76),
    off: Color(0xFF848492),
    rowHover: Color(0xFF14123E),
    heroShape: Color(0x73B0ADFF),
    heroShapeSpark: Color(0xD9E3E2FF),
    btnPrimaryFace: Color(0xFFFFFFFF),
    btnPrimaryLedge: Color(0xFFC9C7FF),
    btnPrimaryInk: Color(0xFF282394),
    btnSecondaryFace: Color(0xFF282394),
    btnSecondaryLedge: Color(0xFF1F1B76),
    btnSecondaryInk: Color(0xFFFFFFFF),
  ),
  light(
    page: Color(0xFFFFFFFF),
    heroTop: Color(0xFF4641D9),
    heroMid: Color(0xFF3D38C6),
    heroBottom: Color(0xFF282394),
    ink: Color(0xFF0A0A0D),
    inkMuted: Color(0xFF41414F),
    inkSoft: Color(0xFF0A0A0D),
    inkFaint: Color(0x73121122),
    line: Color(0xFFC9C7FF),
    accent: Color(0xFF4641D9),
    accentInk: Color(0xFF4641D9),
    board: Color(0xFFE3E2FF),
    boardLedge: Color(0xFFB0ADFF),
    tile: Color(0xFFFFFFFF),
    tileLedge: Color(0xFFC9C7FF),
    textLedge: Color(0xFFC9C7FF),
    imageLedge: Color(0xFFC9C7FF),
    off: Color(0xFF767685),
    rowHover: Color(0xFFE3E2FF),
    heroShape: Color(0x734641D9),
    heroShapeSpark: Color(0xD9E3E2FF),
    btnPrimaryFace: Color(0xFF4641D9),
    btnPrimaryLedge: Color(0xFF3530B4),
    btnPrimaryInk: Color(0xFFFFFFFF),
    btnSecondaryFace: Color(0xFFFFFFFF),
    btnSecondaryLedge: Color(0xFFC9C7FF),
    btnSecondaryInk: Color(0xFF282394),
  );

  const PremiumStoreStyle({
    required this.page,
    required this.heroTop,
    required this.heroMid,
    required this.heroBottom,
    required this.ink,
    required this.inkMuted,
    required this.inkSoft,
    required this.inkFaint,
    required this.line,
    required this.accent,
    required this.accentInk,
    required this.board,
    required this.boardLedge,
    required this.tile,
    required this.tileLedge,
    required this.textLedge,
    required this.imageLedge,
    required this.off,
    required this.rowHover,
    required this.heroShape,
    required this.heroShapeSpark,
    required this.btnPrimaryFace,
    required this.btnPrimaryLedge,
    required this.btnPrimaryInk,
    required this.btnSecondaryFace,
    required this.btnSecondaryLedge,
    required this.btnSecondaryInk,
  });

  static PremiumStoreStyle of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? light : dark;
  }

  final Color page;
  final Color heroTop;
  final Color heroMid;
  final Color heroBottom;
  final Color ink;
  final Color inkMuted;
  final Color inkSoft;
  final Color inkFaint;
  final Color line;
  final Color accent;
  final Color accentInk;
  final Color board;
  final Color boardLedge;
  final Color tile;
  final Color tileLedge;
  final Color textLedge;
  final Color imageLedge;
  final Color off;
  final Color rowHover;
  final Color heroShape;
  final Color heroShapeSpark;
  final Color btnPrimaryFace;
  final Color btnPrimaryLedge;
  final Color btnPrimaryInk;
  final Color btnSecondaryFace;
  final Color btnSecondaryLedge;
  final Color btnSecondaryInk;

  static const BorderRadius boardRadius = BorderRadius.all(Radius.circular(24));
  static const BorderRadius tileRadius = BorderRadius.all(Radius.circular(16));

  BoxDecoration get boardDecoration => BoxDecoration(
    color: board,
    borderRadius: boardRadius,
    boxShadow: [BoxShadow(color: boardLedge, offset: const Offset(0, 10))],
  );
}
